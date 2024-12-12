//
// Created by os on 12/11/23.
//

#ifndef PROJECT_BASE_LIST_HPP
#define PROJECT_BASE_LIST_HPP

//#include "tcb.hpp"
#include "MemoryAllocator.hpp"


//class TCB;
template<typename T>
class List {
private:
    struct Elem {
        T *data;
        Elem *next;

        Elem(T *data, Elem *next) : data(data), next(next) {

        }

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
            return MemoryAllocator::mem_alloc(sizeInBlocks);
        }

        void operator delete[](void *pointer) { MemoryAllocator::mem_free(pointer); }

    };

    Elem *head, *tail;
public:
    List() : head(0), tail(0) {}

    List(const List &) = delete;

    List &operator=(const List &) = delete;

    void init(){
        List();
    }

//    void addFirst(TCB *data){
////        Elem *elem = new Elem(data, head);
////        head = elem;
//        if(!tail){ tail = head; }
//    }

    void addLast(T *data) {
//        print_String("addlast");
        Elem *elem = new Elem(data,nullptr);
//        printInteger((uint64)elem);
        if (tail) {
            tail->next = elem;
            tail = elem;
        } else {
            head = tail = elem;
        }
    }

    T *removeFirst() {
//        print_String("removeFirst");
        if (!head) { return 0; }
        Elem *elem = head;
        head = head->next;
        if (!head) { tail = 0; }
        T *ret = elem->data;
//        printInteger((uint64)elem);
        delete elem;
        return ret;
    }

    int count(){
        Elem *cur = head;
        int cnt = 0;
        while(cur){
            cnt = cnt +1;
            cur = cur->next;
        }
        return cnt;
    }
    T *peekFirst(){
        if(!head){return 0;}
        return head->data;
    }
//
//    TCB *removeLast(){
//        if(!head){return 0;}
//        Elem *prev = 0;
//        for(Elem *curr = head; curr && curr != tail; curr = curr->next){
//            prev = curr;
//        }
//        Elem *elem = tail;
//        if(prev) {prev->next = 0;}
//        else {head = 0;}
//        tail = prev;
//
//        TCB* ret = elem->data;
//        delete elem;
//        return ret;
//    }
//    TCB *peekLast(){
//        if(!tail){return 0;}
//        return tail->data;
//    }

};

#endif //PROJECT_BASE_LIST_HPP
