//
// Created by os on 1/13/24.
//

#include "../h/tcb.hpp"

#include "../h/riscv.hpp"

extern "C" void pushRegisters();
extern "C" void popRegisters();

TCB *TCB::running = nullptr;
typedef TCB *thread_t;
extern thread_t idle_handle;
TCB::TCB(TCB::Body body, void *arg, void *stack)
        : body(body), arg(arg), stack(stack),
          context({
                          (uint64) &threadWrapper,
                          (uint64) stack + DEFAULT_STACK_SIZE - 1
                  }), finished(false), joined(false), is_main(body == nullptr), joined_list() {

}


TCB *TCB::createThread(thread_t *handle, void(*start_routine)(void *), void *arg, void *stack) {
    *handle = new TCB(start_routine, arg, stack);
//    print_String("12");

    if (start_routine){
        Scheduler::put(*handle);
//        printInteger(Scheduler::count());
    }

    return *handle;
}

void TCB::yield() {
    pushRegisters();

    TCB::dispatch();

    popRegisters();
}

void TCB::dispatch() {
    TCB *old = running;
    if (!old->isFinished() && old != idle_handle && !old->isJoined()) {
        Scheduler::put(old);
//        printInteger(Scheduler::count());
    }else if(old->isFinished()){
        MemoryAllocator::mem_free(old->stack);
    }
    if(Scheduler::count() == 0)
        running = idle_handle;
    else
        running = Scheduler::get();
//    printInteger(Scheduler::count());
    if(running->is_main)
        Riscv::ms_sstatus(Riscv::SSTATUS_SPP);
    else
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);


    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadExit(){
    running->setFinished(true);
    TCB::yield();
}

void TCB::join(thread_t handle){
    if(handle->isFinished())
        return;
    running->setJoined(true);
    handle->joined_list.addLast(running);
    TCB::yield();
}

void TCB::threadWrapper() {
    Riscv::popSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    running->startJoined();
    thread_exit();
}

void TCB::startJoined() {
    while(this->joined_list.peekFirst()){
        thread_t to_start = this->joined_list.removeFirst();
        to_start->setJoined(false);
        Scheduler::put(to_start);
    }
}

