//
// Created by os on 1/3/24.
//

#ifndef PROJECT_BASE_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_MEMORYALLOCATOR_HPP
#include "../lib/hw.h"

struct FragmentHeader{ //16 bajtova zauzima
    FragmentHeader* next;
    size_t size_in_blocks;
};

class MemoryAllocator {
private:
    static FragmentHeader* freeMemHead; //pokazivac na pocetak liste slobodnih fragmenata
    static FragmentHeader* allocatedMemHead;
    static int tryToJoin(FragmentHeader* cur);
    static void deleteAllocatedFragment(char* addr);
//    static size_t NUMBER_OF_BLOCKS;
//    static MemoryAllocator* instancePtr;


public:
    static void getInstance();
    static void* mem_alloc( size_t numOfBlocks);
    static int mem_free(void* ptr);
    static FragmentHeader* getAllocatedFragment(char* addr);
    static void printAllocated();
    static void printFree();
};


#endif //PROJECT_BASE_MEMORYALLOCATOR_HPP
