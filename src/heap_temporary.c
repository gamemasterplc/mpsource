#include <ultra64.h>
#include "heap.h"

/*
 * Temporary heap. Reset occasionally during gameplay.
 */

extern struct heap_node *temp_heap_addr; // 800D6040

/*
 * Creates the "temporary" heap.
 * 8003B750
 */
struct heap_node *MakeTempHeap(void *ptr, u32 size)
{
    temp_heap_addr = (struct heap_node *)MakeHeap(ptr, size);
}

/*
 * Allocates memory in the temporary heap.
 * 8003B774
 */
void *MallocTemp(u32 size)
{
    Malloc(temp_heap_addr, size);
}

/*
 * Frees a memory pointer in the temporary heap.
 * 8003B798
 */
void FreeTemp(void *ptr)
{
    Free(ptr);
}

/*
 * Resizes a previously allocated temporary heap buffer.
 */
void *ReallocTemp(void *mem, u32 new_size)
{
    return (void *)Realloc(temp_heap_addr, mem, new_size);
}

/*
 * Returns the total size of allocated buffers in the temporary heap.
 */
u32 GetAllocatedTempHeapSize(void)
{
    return GetAllocatedHeapSize(temp_heap_addr);
}

u32 func_8003B800(void)
{
    return GetUsedMemoryBlockCount(temp_heap_addr);
}
