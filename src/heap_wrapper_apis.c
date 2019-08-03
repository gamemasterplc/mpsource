/*
 * Heap wrapper APIs.
 * Abstractions on top of the low level malloc and free that
 * higher level code uses.
 */

extern void *perm_heap_addr; // 800D6030
extern void *temp_heap_addr; // 800D6040

void* MakeHeap(void *ptr, unsigned int size);
void Malloc(void **out, unsigned int size);
void Free(void *ptr);
unsigned int func_800599DC(void *ptr, unsigned int unk1, unsigned int unk2);
unsigned int func_80059AA4(void **ptr);
unsigned int func_80059AD8(void **ptr);

/*
 * Creates the "permanent" heap that is never reset.
 * Called once during startup.
 */
void* MakePermHeap(void *ptr, unsigned int size)
{
    perm_heap_addr = MakeHeap(ptr, size);
}

/*
 * Allocates memory in the permanent heap.
 */
void* MallocPerm(unsigned int size)
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

unsigned int func_8003B6E4(unsigned int unk1, unsigned int unk2)
{
    return func_800599DC(perm_heap_addr, unk1, unk2);
}

unsigned int func_8003B710()
{
    return func_80059AA4(perm_heap_addr);
}

unsigned int func_8003B730()
{
    return func_80059AD8(perm_heap_addr);
}

/*
 * Creates the "temporary" heap that occasionally is purged.
 */
void* MakeTempHeap(void *ptr, unsigned int size)
{
    temp_heap_addr = MakeHeap(ptr, size);
}

/*
 * Allocates memory in the temporary heap.
 */
void* MallocTemp(unsigned int size)
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

unsigned int func_8003B7B4(unsigned int unk1, unsigned int unk2)
{
    return func_800599DC(temp_heap_addr, unk1, unk2);
}

unsigned int func_8003B7E0()
{
    return func_80059AA4(temp_heap_addr);
}

unsigned int func_8003B800()
{
    return func_80059AD8(temp_heap_addr);
}
