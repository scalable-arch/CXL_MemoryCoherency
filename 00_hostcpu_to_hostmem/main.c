#define _GNU_SOURCE
#include <stdio.h>
#include <pthread.h>
#include <sched.h>
#include <stdint.h>
#include <stdlib.h>


#define false 0
#define true 1
typedef int bool;


volatile bool wantp = false;
volatile bool wantq = false;
volatile int turn = 1;

pthread_t t1, t2;

// will be Host
void p(void* arg) {
    uintptr_t accessed_address = *(uintptr_t*)arg;
    volatile int* target_address = (volatile int*)accessed_address;

    wantp = true;

    __asm__ volatile("mfence" ::: "memory");

    while(wantq) {
        if(turn == 2) {
        wantp = false;

        while(turn != 1) {
            sched_yield();
        }
        wantp = true;
        __asm__ volatile("mfence" ::: "memory");
        }
    }
    *target_address = *target_address + 1;
    turn = 2;
    wantp = false;
}

//will be Device
void q(void* arg) {
    uintptr_t accessed_address = *(uintptr_t*)arg;
    volatile int* target_address = (volatile int*)accessed_address;

    wantq = true;
    __asm__ volatile("mfence" ::: "memory");

    while(wantp) {
        if(turn == 1) {
        wantq = false;
        while(turn != 2) {
            sched_yield();
        }
        wantq = true;
        __asm__ volatile("mfence" ::: "memory");
        }
    }
    *target_address = *target_address + 1;
    turn = 1;
    wantq = false;
}

void* worker(void* arg) {
    uintptr_t accessed_address = *(uintptr_t*)arg;
    printf("Accessed address: 0x%lX\n", accessed_address);

    for (int i = 0; i < 1000000; i++) {

        pthread_t id = pthread_self();
        if(pthread_equal(id,t1)){
        p(arg);
        } else if(pthread_equal(id, t2)) {
        q(arg);
        }
    }

    return 0;
}

int main() {

    // memory allocation
    int* safe_memory = (int*)malloc(sizeof(int));
    *safe_memory = 0;

    uintptr_t allocated_address = (uintptr_t)safe_memory;

    printf("Allocated Address: 0x%lX\n", allocated_address);
    printf("Initialized value: %d\n\n", *safe_memory);

    // thread init, excuting
    pthread_create(&t1, NULL, worker, &allocated_address);
    pthread_create(&t2, NULL, worker, &allocated_address);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("\nFinal value(0x%lX): %d\n", allocated_address, *(volatile int*)allocated_address);

    free(safe_memory);
    return 0;
}