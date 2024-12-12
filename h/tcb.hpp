//
// Created by os on 1/13/24.
//

#ifndef PROJECT_BASE_TCB_HPP
#define PROJECT_BASE_TCB_HPP

#include "../lib/hw.h"
#include "Scheduler.hpp"
#include "list.hpp"
#include "syscall_c.hpp"
#include "MemoryAllocator.hpp"

class TCB {
public:
    using Body = void (*)(void *);

    bool isFinished() const { return finished; }

    void setFinished(bool finished) { TCB::finished = finished; }

    bool isJoined() const { return joined; }

    void setJoined(bool joined) { TCB::joined = joined; }

    static TCB* createThread(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack);

    static void yield();

    static void threadExit();

    static void join(thread_t handle);

    static TCB *running;

    void *operator new(size_t size) {
        size_t sizeInBlocks;
        if (size % MEM_BLOCK_SIZE != 0) {
            sizeInBlocks = (size / MEM_BLOCK_SIZE) + 1;
        } else {
            sizeInBlocks = (size / MEM_BLOCK_SIZE);
        }
        return MemoryAllocator::mem_alloc(sizeInBlocks);
    }

    void operator delete(void *pointer) { MemoryAllocator::mem_free(pointer); }

    void *operator new[](size_t size) {
        size_t sizeInBlocks;
        if (size % MEM_BLOCK_SIZE != 0) {
            sizeInBlocks = (size / MEM_BLOCK_SIZE) + 1;
        } else {
            sizeInBlocks = (size / MEM_BLOCK_SIZE);
        }
        return MemoryAllocator::mem_alloc(sizeInBlocks); }

    void operator delete[](void *pointer) { MemoryAllocator::mem_free(pointer); }


private:
    struct Context {
        uint64 ra;
        uint64 sp;
//        uint64 lele[1023];
    };

    TCB(Body body, void *arg, void *stack);

    Body body;
    void *arg;
    void *stack;
    Context context;
    bool finished;
    bool joined;
    bool is_main;

    List<TCB> joined_list;

    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static void dispatch();

    void startJoined();

    static uint64 constexpr STACK_SIZE = 1024;

};

#endif //PROJECT_BASE_TCB_HPP
