//
// Created by os on 1/3/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../test/printing.hpp"

//MemoryAllocator *MemoryAllocator::instancePtr = nullptr;
FragmentHeader *MemoryAllocator::freeMemHead = nullptr;
FragmentHeader *MemoryAllocator::allocatedMemHead = nullptr;
//size_t MemoryAllocator::NUMBER_OF_BLOCKS =
//size_t MemoryAllocator::NUMBER_OF_BLOCKS = 500;



void MemoryAllocator::getInstance() {
    MemoryAllocator::freeMemHead = (FragmentHeader *) ((char *) HEAP_START_ADDR);
    freeMemHead->next = nullptr;
    freeMemHead->size_in_blocks = ((size_t) HEAP_END_ADDR - (size_t) HEAP_START_ADDR) / 64;
    MemoryAllocator::allocatedMemHead = nullptr;
}

void *MemoryAllocator::mem_alloc(size_t numOfBlocksToAlloc) {
//    printFree();

    FragmentHeader *fragment = freeMemHead, *prev = nullptr;
    for (; fragment != nullptr; prev = fragment, fragment = fragment->next)
        if (fragment->size_in_blocks >= numOfBlocksToAlloc)
            break;
    if (fragment == nullptr) {
        printString("Memory allocator error: no free fragments!");
    }
    size_t remainingBlocks = fragment->size_in_blocks - numOfBlocksToAlloc;//minus jedan jer jedan blok rezervisemo za fragment header
//    printAllocated();
    if (remainingBlocks >= 2) {// minimalna velicina fragmenta su dva bloka
        // pravimo novi fragment od ostatka blokova
        fragment->size_in_blocks = numOfBlocksToAlloc;
        FragmentHeader *newFragment = (FragmentHeader *) ((char *) fragment +
                                                          (1 + numOfBlocksToAlloc) * MEM_BLOCK_SIZE);
        if (prev) prev->next = newFragment;
        else freeMemHead = newFragment;
        newFragment->next = fragment->next;
        newFragment->size_in_blocks = remainingBlocks-1;
    } else {
        //premalo blokova, spajaju se u jedan fragment
        if (prev) prev->next = fragment->next;
        else freeMemHead = fragment->next;
    }
    fragment->next = nullptr;

    //dodavanje u listu alociranih
//    print_String("**********");
    FragmentHeader *last = allocatedMemHead;
    if (allocatedMemHead == nullptr) {
        allocatedMemHead = fragment;

    } else {
        while (last->next) {
//            printInteger((uint64)last);
            last = last->next;
        }

        last->next = fragment;

    }
//    print_String("**********");

//    print_String("Allocated fragment:");
//    printInteger((uint64)fragment);
//    printAllocated();
//    printFree();
    return (void *)( (char*)fragment + sizeof(FragmentHeader));
}

int MemoryAllocator::mem_free(void *ptr) {
    FragmentHeader* toFree = getAllocatedFragment((char*)ptr);
//    size_t toFreeSizeInBlocks = toFree->size_in_blocks;
//    printInteger((uint64)toFreeSizeInBlocks);
//    printAllocated();
//    printFree();
    deleteAllocatedFragment((char*)toFree);
    if(!toFree){
        printString("MemFree error : nije alociran segment sa tom adresom");
        return -1; // nije alociran segment sa tom adresom
    }
    FragmentHeader* cur = nullptr;
    if(!freeMemHead || (char*)toFree < (char*)freeMemHead)
        cur = nullptr;
    else
        for(cur = freeMemHead; cur->next != nullptr && (char*)toFree > (char*)(cur->next); cur = cur->next);

//    FragmentHeader* newSeg = toFree;
//    newSeg->size_in_blocks = toFree->size_in_blocks + 1;
    if(cur) toFree->next = cur->next;
    else toFree->next = freeMemHead;
    if(cur) cur->next = toFree;
    else freeMemHead = toFree;
//    print_String("Deallocated fragment:");
//    printInteger((uint64)toFree);
//    printAllocated();
//printFree();
    tryToJoin(toFree);
    tryToJoin(cur);
//    printFree();

    return 0;
}

FragmentHeader* MemoryAllocator::getAllocatedFragment(char* addr){
    FragmentHeader* cur = allocatedMemHead;
    while(cur){
        if((char*)cur == addr - sizeof(FragmentHeader)) {
            return cur;
        }
        cur = cur->next;
    }
    return nullptr;
}
//void MemoryAllocator::printAllocated() {
//    print_String("+++++++++ALLOC++++++++++++");
//    FragmentHeader* cur = allocatedMemHead;
//    while(cur){
//        printInteger((uint64)cur);
//        cur = cur->next;
//    }
//    print_String("+++++++++++++++++++++");
//
//}void MemoryAllocator::printFree() {
//    print_String("+++++++++FREE++++++++++++");
//    FragmentHeader* cur = freeMemHead;
//    while(cur){
//        print_String("-");
//        printInteger((uint64)cur);
//        printInteger(cur->size_in_blocks);
//        print_String("-");
//
//        cur = cur->next;
//    }
//    print_String("+++++++++++++++++++++");
//
//}
void MemoryAllocator::deleteAllocatedFragment(char* addr){
    if(allocatedMemHead == nullptr) return;
    if(allocatedMemHead == (FragmentHeader*) addr) {
        allocatedMemHead = allocatedMemHead->next;
    }
    FragmentHeader* temp = allocatedMemHead;
    FragmentHeader* prev = nullptr;
    while(temp!=nullptr){
        if(temp==(FragmentHeader*)addr){
            prev->next = temp->next;
            temp = temp->next;
        }else{
            prev = temp;
            temp = temp->next;
        }
    }
    return;
}


int MemoryAllocator::tryToJoin(FragmentHeader *cur) {
    if (!cur) return 0;
    if (cur->next && (char *) cur + (cur->size_in_blocks + 1)* MEM_BLOCK_SIZE == (char *) (cur->next)) {
        cur->size_in_blocks += cur->next->size_in_blocks + 1;
        cur->next = cur->next->next;
        deleteAllocatedFragment((char*)cur->next);
        return 1;
    } else
        return 0;
}