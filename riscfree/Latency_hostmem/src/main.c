#include <stdint.h>
#include <stdbool.h>

/*
 * Host-side shared memory must already be created and mapped so that
 * the HPS can access it at 0x81000000.
 *
 * This version is intentionally minimized to produce the lowest possible
 * measured value from software:
 * - no fence around the measured load
 * - same address is measured repeatedly
 * - warm-up reads are performed before measurement
 *
 * Therefore, this measures a best-case visible latency for one 32-bit load,
 * not necessarily a full uncached end-to-end host-memory round-trip latency.
 */

#define TARGET_ADDR         ((uintptr_t)0x80000000u)
#define READ_COUNT          (100u)
#define WARMUP_COUNT        (32u)

#if defined(__riscv) && !defined(CPU_FREQ_HZ)
#define CPU_FREQ_HZ         (0ull)
#endif

/* Measurement results: inspect these in RiscFree after execution */
volatile uintptr_t g_test_addr[READ_COUNT]      = {0};
volatile uint32_t  g_read_value[READ_COUNT]     = {0};
volatile uint64_t  g_latency_raw[READ_COUNT]    = {0};
volatile uint64_t  g_latency_cycles[READ_COUNT] = {0};
volatile uint64_t  g_latency_ns[READ_COUNT]     = {0};

volatile uint64_t  g_timer_freq_hz   = 0;
volatile uint64_t  g_timer_overhead  = 0;
volatile uint64_t  g_min_cycles      = 0;
volatile uint64_t  g_max_cycles      = 0;
volatile uint64_t  g_avg_cycles      = 0;
volatile uint64_t  g_min_ns          = 0;
volatile uint64_t  g_max_ns          = 0;
volatile uint64_t  g_avg_ns          = 0;

/* Prevent compiler from optimizing away the measured load */
volatile uint32_t  g_sink = 0;

/* Read the current hardware counter */
static inline uint64_t read_counter(void)
{
#if defined(__riscv)
    uint64_t v;
    __asm__ __volatile__("rdcycle %0" : "=r"(v));
    return v;

#elif defined(__aarch64__)
    uint64_t v;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(v));
    return v;

#elif defined(__arm__)
    uint64_t v;
    __asm__ __volatile__("mrrc p15, 1, %Q0, %R0, c14" : "=r"(v));
    return v;

#else
    return 0;
#endif
}

/* Read timer frequency for ns conversion if available */
static inline uint64_t read_counter_freq(void)
{
#if defined(__riscv)
    return CPU_FREQ_HZ;

#elif defined(__aarch64__)
    uint64_t v;
    __asm__ __volatile__("mrs %0, cntfrq_el0" : "=r"(v));
    return v;

#elif defined(__arm__)
    uint32_t v;
    __asm__ __volatile__("mrc p15, 0, %0, c14, c0, 0" : "=r"(v));
    return (uint64_t)v;

#else
    return 0;
#endif
}

static uint64_t measure_overhead(void)
{
    uint64_t min_delta = ~0ull;

    for (uint32_t i = 0; i < 64u; ++i) {
        uint64_t t0 = read_counter();
        uint64_t t1 = read_counter();

        uint64_t delta = t1 - t0;
        if (delta < min_delta) {
            min_delta = delta;
        }
    }

    return min_delta;
}

static void warmup_reads(uintptr_t addr)
{
    volatile const uint32_t * const p = (volatile const uint32_t *)addr;
    uint32_t sum = 0;

    for (uint32_t i = 0; i < WARMUP_COUNT; ++i) {
        sum += *p;
    }

    g_sink += sum;
}

static uint64_t measure_read_once_cycles(uintptr_t addr, uint32_t *value_out)
{
    volatile const uint32_t * const p = (volatile const uint32_t *)addr;

    uint64_t t0 = read_counter();
    uint32_t v = *p;
    uint64_t t1 = read_counter();

    g_sink += v;
    if (value_out) {
        *value_out = v;
    }

    return (t1 - t0);
}

int main(void)
{
    int end = 0;

    const uintptr_t addr = TARGET_ADDR;

    g_timer_freq_hz  = read_counter_freq();
    g_timer_overhead = measure_overhead();

    warmup_reads(addr);

    uint64_t sum_cycles = 0;
    g_min_cycles = ~0ull;
    g_max_cycles = 0;

    for (uint32_t i = 0; i < READ_COUNT; ++i) {
        g_test_addr[i] = addr;

        uint32_t value = 0u;
        uint64_t raw = measure_read_once_cycles(addr, &value);

        g_read_value[i]  = value;
        g_latency_raw[i] = raw;

        uint64_t adj = raw;
        if (adj > g_timer_overhead) {
            adj -= g_timer_overhead;
        } else {
            adj = 0;
        }

        g_latency_cycles[i] = adj;
        sum_cycles += adj;

        if (adj < g_min_cycles) g_min_cycles = adj;
        if (adj > g_max_cycles) g_max_cycles = adj;

        if (g_timer_freq_hz != 0ull) {
            g_latency_ns[i] = (adj * 1000000000ull) / g_timer_freq_hz;
        } else {
            g_latency_ns[i] = 0ull;
        }
    }

    g_avg_cycles = sum_cycles / READ_COUNT;

    if (g_timer_freq_hz != 0ull) {
        g_min_ns = (g_min_cycles * 1000000000ull) / g_timer_freq_hz;
        g_max_ns = (g_max_cycles * 1000000000ull) / g_timer_freq_hz;
        g_avg_ns = (g_avg_cycles * 1000000000ull) / g_timer_freq_hz;
    } else {
        g_min_ns = 0ull;
        g_max_ns = 0ull;
        g_avg_ns = 0ull;
    }

    end = 1;
    return 0;
}
