//
// Created by os on 12/11/23.
//
#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/tcb.hpp"
#include "../test/printing.hpp"
#include "../lib/mem.h"
#include "../h/MemoryAllocator.hpp"


void Riscv::popSppSpie() {
    __asm__ volatile("csrw sepc, ra"); //ra je lokacija sa koje je staticka metoda pozvana
    __asm__ volatile ("sret"); //izlazimo iz prekidne rutine ovim sret umesto onim iz supervisorTrap
}

void Riscv::handleSupervisorTrap() {
//    print_String("handlesuptrap()");
    uint64 scause = r_scause();
    if (scause == 0x0000000000000009UL || scause == 0x0000000000000008UL) {
        //interrupt: NO, cause code : environment call from S-mode (9)
        uint64 sepc = r_sepc() +
                      4; //sacuvan sepc na steku prve niti // povecavamo za jednu adresu da bismo se vratili na jednu instrukciju iza ecall-a
        uint64 sstatus = r_sstatus();
        uint64 a0reg;
        __asm__ volatile("mv %0, a0" : "=r"(a0reg));
        int ret;
        int retval;
        switch (a0reg) {
            case 0x01: //mem_alloc(size)
//                print_String("hej");
                size_t size;
                void *ptr;
                __asm__ volatile("mv %0, a1" : "=r"(size));
//                ptr = __mem_alloc(size);
//                MemoryAllocator::mem_alloc(size);
                ptr = MemoryAllocator::mem_alloc(size);
                __asm__ volatile("mv t0, %0" : : "r"(ptr));
                __asm__ volatile("sw t0, 80(fp)");
                break;
            case 0x02: //mem_free(void*)
                void* addr;
                __asm__ volatile("mv %0, a1" : "=r"(addr));
//                MemoryAllocator::mem_free(addr);
                ret = MemoryAllocator::mem_free(addr);
                __asm__ volatile("mv t0, %0" : : "r"(ret));
                __asm__ volatile ("sw t0, 80(fp)");
                break;
            case 0x11: //thread_create(thread_t* handle, void(*body)(void*), void* arg)
//                uint64 handle, body, arg, stack;
                thread_t* handle;
                void(*body)(void*);
                void* arg;
                void *stack;
                __asm__ volatile("mv %0, a1" : "=r"(handle));
                __asm__ volatile("mv %0, a2" : "=r"(body));
                __asm__ volatile("mv %0, a6" : "=r"(arg));
                __asm__ volatile("mv %0, a7" : "=r"(stack));
                *handle = TCB::createThread(handle, body,arg, stack);
//                __asm__ volatile("mv t0, %0" : : "r"(ret));
                __asm__ volatile("li t0, 0");
                __asm__ volatile ("sw t0, 80(fp)");
                break;
            case 0x12: //thread_exit()
                TCB::threadExit();
                break;
            case 0x13: //thread_dispatch()
                TCB::yield();
                break;
            case 0x14: //thread_join()
                thread_t handle_join;
                __asm__ volatile("mv %0, a1" : "=r"(handle_join));
                TCB::join(handle_join);

                break;
            case 0x21: //sem_open(sem_t* handle, unsigned init)
                break;
            case 0x22: //sem_close(sem_t handle)
                break;
            case 0x23: //sem_wait(semt id)
                break;
            case 0x24: //sem_signal(semt id)
                break;
            case 0x31: //time_sleep(time_t)
                break;
            case 0x41: //getc
                 retval = __getc();
                __asm__ volatile ("mv t0, %0" : : "r"(retval));
                __asm__ volatile("sw t0, 80(fp)");
                break;
            case 0x42: //putc
                char c;
                __asm__ volatile("mv %0, a1" : "=r"(c));
                __putc(c);
                break;
            default:
                break;
        }
        //TCB::timesliceCounter = 0; //ova nit ce biti novi running
        //TCB::dispatch();
        w_sstatus(sstatus);
        w_sepc(sepc); //sepc je ovde sepc druge niti iz dispatcha (koja je prvobitno u sepc uradila r_sepc)
    } else {
        //unexpected trap cause
        //print(scause) sta se desilo
        //print(sepc) gde se desio problem
        //print(stval) trap value, koji je scause
        printString("Cause: ");
        printInt(r_scause());
        printString("\nPC: ");
        printInt(r_sepc());
        printString("\nTrapVal: ");
        printInt(r_stval());

        while(1);

    }

}

void Riscv::timerInterruptHandler() {
    mc_sip(SIP_SSIP);
    /*
     * // interrupt: yes, cause code: supervisor software interrupt (timer)
        TCB::timesliceCounter++; //ovo se odnosi na running nit
        if(TCB::timesliceCounter >= TCB::running->getTimeslice()){
            uint64 sepc = r_sepc(); //sacuvan sepc na steku prve niti
            uint64 sstatus = r_sstatus();
            TCB::timesliceCounter = 0; //ova nit ce biti novi running
            TCB::dispatch();
            w_sstatus(sstatus);
            w_sepc(sepc); //sepc je ovde sepc druge niti iz dispatcha (koja je prvobitno u sepc uradila r_sepc)

        }
        mc_sip(SIP_SSIP);

     */
}


void Riscv::consoleInterruptHandler() {
    console_handler();
}