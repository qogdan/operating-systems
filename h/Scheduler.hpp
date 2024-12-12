//
// Created by os on 1/9/24.
//

#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP


#include "list.hpp"

class TCB;
class Scheduler {
private:
    static List<TCB> readyQueue;

public:
    static  TCB* get(){
        return readyQueue.removeFirst();
    }
    static  void put(TCB *tcb){
        readyQueue.addLast(tcb);
    }
    static int count(){
        return readyQueue.count();
    }
};

#endif //PROJECT_BASE_SCHEDULER_HPP
