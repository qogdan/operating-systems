//
// Created by os on 1/3/24.
//
#include "../h/syscall_c.hpp"
extern "C" void pushRegisters();
extern "C" void popRegisters();

void *mem_alloc(size_t size) {
    size_t sizeInBlocks;
    if (size % MEM_BLOCK_SIZE != 0) {
        sizeInBlocks = (size / MEM_BLOCK_SIZE) + 1;
    } else {
        sizeInBlocks = (size / MEM_BLOCK_SIZE);
    }
    __asm__ volatile("mv a1, %0" : : "r"(sizeInBlocks));
    __asm__ volatile("li a0, 0x01");
    __asm__ volatile("ecall");

    void *ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return ret;
}

int mem_free(void *ptr) {
    __asm__ volatile ("mv a1, %0" : : "r"(ptr));
    __asm__ volatile("li a0, 0x02");
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

int thread_create(
        thread_t *handle,
        void(*start_routine)(void *),
        void *arg
){
    void* stack = nullptr;
//    uint64 rar;
//    __asm__ volatile("mv %0, ra" : "=r"(rar));
    if(start_routine){

        stack = mem_alloc(DEFAULT_STACK_SIZE);

    }
    __asm__ volatile("mv a7, %[stack]" : : [stack]"r"(stack));
    __asm__ volatile("mv a6, %0" : : "r"(arg));
    __asm__ volatile("mv a2, %0" : : "r"(start_routine));
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x11");
    __asm__ volatile("ecall");

    uint64 ret;

    __asm__ volatile("mv %0, a1" : "=r"(handle));
    __asm__ volatile("mv %0, a0" : "=r"(ret));
//    __asm__ volatile("mv ra, %0" : : "r"(rar));
    return ret;
}
int thread_exit() {
    __asm__ volatile("li a0, 0x12");
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

void thread_dispatch() {
    __asm__ volatile("li a0, 0x13");
    __asm__ volatile("ecall");
}

void thread_join(
        thread_t handle
) {
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x14");
    __asm__ volatile("ecall");
}

int sem_open(
        sem_t *handle,
        unsigned init
) {
    __asm__ volatile("mv a2, %0" : : "r"(init));
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("li a0, 0x21");
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

int sem_close(sem_t handle) {
    __asm__ volatile("li a0, 0x22");
    __asm__ volatile("mv a1, %0" : : "r"(handle));
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

int sem_wait(sem_t id) {
    __asm__ volatile("li a0, 0x23");
    __asm__ volatile("mv a1, %0" : : "r"(id));
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

int sem_signal(sem_t id) {
    __asm__ volatile("li a0, 0x24");
    __asm__ volatile("mv a1, %0" : : "r"(id));
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

int time_sleep(time_t time) {
    __asm__ volatile("li a0, 0x31");
    __asm__ volatile("mv a1, %0" : : "r"(time));
    __asm__ volatile("ecall");

    uint64 ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return (int) ret;
}

char getc() {
    __asm__ volatile("li a0, 0x41");
    __asm__ volatile("ecall");

    char ret;
    __asm__ volatile("mv %0, a0" : "=r"(ret));
    return ret;
}

void putc(char c) {
    __asm__ volatile("mv a1, %0" : : "r"(c));
    __asm__ volatile("li a0, 0x42");
    __asm__ volatile("ecall");
}