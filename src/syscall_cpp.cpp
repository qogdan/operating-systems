//
// Created by os on 1/3/24.
//
#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"


void* operator new (size_t size){
    return mem_alloc(size);
}
void operator delete (void* ptr){
    mem_free(ptr);
}

void *operator new[](uint64 n){
    return mem_alloc(n);
}

void operator delete[](void* ptr) noexcept{
    mem_free(ptr);
}

Thread::Thread(void (*body)(void *), void *arg) {
    this->body = body;
    this->arg = arg;
}
Thread::Thread() {
    this->body = nullptr;
    this->arg = nullptr;
}

Thread::~Thread() {

}

int Thread::start() {
    return thread_create(&myHandle, &bodyWrapper, this);
}

void Thread::join() {
    thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t) {
    return 0;
}

void Thread::bodyWrapper(void *arg) {
    Thread* thread = (Thread*) arg;
    if(thread->body)
        thread->body(thread->arg);
    else
        thread->run();
}

