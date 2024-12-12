//
// Created by os on 12/11/23.
//
#include "../test/printing.hpp"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_cpp.hpp"
#include "../h/tcb.hpp"


extern "C" void supervisorTrap();
extern "C" void vectorTable();
//extern void userMain();

void idleThread(void *){
    while(true){

//        print_String("idle");
        thread_dispatch();
    }
}
thread_t idle_handle = nullptr;

//int userMain();
extern void userMain();
void userMainWrapper(void *){
    userMain();
}

int main(){

    Riscv::w_stvec((uint64) &vectorTable | 0b01);

    MemoryAllocator::getInstance();
//    List();
    thread_t mainHandle;
    thread_create(&mainHandle, nullptr, nullptr);
    TCB::running = mainHandle;
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE); //supervisor interrupt enable
//    thread_create(&idle_handle, &idleThread, nullptr);

    thread_t userMainHandle;
//    int ret;
    thread_create(&userMainHandle, userMainWrapper, nullptr);
    thread_join(userMainHandle);

//    printInteger(ret);
    printString("FINISHED\n");
//    return ret;
    return 0;
}
