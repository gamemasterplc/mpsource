#include <ultra64.h>

/*
 * Heap wrapper APIs.
 * Abstractions on top of the low level malloc and free that
 * higher level code uses.
 */

extern void *perm_heap_addr; // 800D6030
extern void *temp_heap_addr; // 800D6040

void* MakeHeap(void *ptr, u32 size);
void Malloc(void **out, u32 size);
void Free(void *ptr);
u32 func_800599DC(void *ptr, u32 unk1, u32 unk2);
u32 func_80059AA4(void **ptr);
u32 func_80059AD8(void **ptr);

/*
 * Creates the "permanent" heap that is never reset.
 * Called once during startup.
 */
void* MakePermHeap(void *ptr, u32 size)
{
    perm_heap_addr = MakeHeap(ptr, size);
}

/*
 * Allocates memory in the permanent heap.
 */
void* MallocPerm(u32 size)
{
    Malloc(perm_heap_addr, size);
}

/*
 * Frees a memory pointer in the permanent heap.
 */
void FreePerm(void *ptr)
{
    Free(ptr);
}

u32 func_8003B6E4(u32 unk1, u32 unk2)
{
    return func_800599DC(perm_heap_addr, unk1, unk2);
}

u32 func_8003B710(void)
{
    return func_80059AA4(perm_heap_addr);
}

u32 func_8003B730(void)
{
    return func_80059AD8(perm_heap_addr);
}

/*
 * Creates the "temporary" heap that occasionally is purged.
 */
void* MakeTempHeap(void *ptr, u32 size)
{
    temp_heap_addr = MakeHeap(ptr, size);
}

/*
 * Allocates memory in the temporary heap.
 */
void* MallocTemp(u32 size)
{
    Malloc(temp_heap_addr, size);
}

/*
 * Frees a memory pointer in the temporary heap.
 */
void FreeTemp(void *ptr)
{
    Free(ptr);
}

u32 func_8003B7B4(u32 unk1, u32 unk2)
{
    return func_800599DC(temp_heap_addr, unk1, unk2);
}

u32 func_8003B7E0(void)
{
    return func_80059AA4(temp_heap_addr);
}

u32 func_8003B800(void)
{
    return func_80059AD8(temp_heap_addr);
}
