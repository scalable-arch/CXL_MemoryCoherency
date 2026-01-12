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

volatile int shared_cnt = 0;

pthread_t t1, t2;

// will be Host
void p(volatile int* shared_ptr) {
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
    //*shared_ptr = *shared_ptr + 1;
    shared_cnt++;
    turn = 2;
    wantp = false;
}

//will be Device
void q(volatile int* shared_ptr) {
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
    //*shared_ptr = *shared_ptr + 1;
    shared_cnt++;
    turn = 1;
    wantq = false;
}

void* worker(volatile void* shared_ptr) {
    //uintptr_t accessed_address = (uintptr_t)arg;
    //printf("Accessed address: 0x%lX\n", accessed_address);
    pthread_t id = pthread_self();

    if(pthread_equal(id,t1)){
         for (int i = 0; i < 1000000; i++) {
            p(shared_ptr);
         }
    } else if(pthread_equal(id, t2)) {
         for (int i = 0; i < 1000000; i++) {
            q(shared_ptr);
         }
    }

    return 0;
}

int main() {
    printf("Allocated Address: 0x%p\n", &shared_cnt);
    printf("Initialized value: %d\n\n", shared_cnt);

    // thread init, excuting
    pthread_create(&t1, NULL, worker, (volatile void *) &shared_cnt);
    pthread_create(&t2, NULL, worker, (volatile void *) &shared_cnt);

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    printf("\nFinal value(0x%p): %d\n", &shared_cnt, shared_cnt);

    return 0;
}
