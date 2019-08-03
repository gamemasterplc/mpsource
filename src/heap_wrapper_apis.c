/*
 * Heap wrapper APIs.
 * Abstractions on top of the low level malloc and free that
 * higher level code uses.
 */

extern void *D_800D6030; // perm_heap_addr
extern void *D_800D6040; // temp_heap_addr

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
    D_800D6030 = MakeHeap(ptr, size);
}

/*
 * Allocates memory in the permanent heap.
 */
void* MallocPerm(unsigned int size)
{
    Malloc(D_800D6030, size);
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
    return func_800599DC(D_800D6030, unk1, unk2);
}

unsigned int func_8003B710()
{
    return func_80059AA4(D_800D6030);
}

unsigned int func_8003B730()
{
    return func_80059AD8(D_800D6030);
}


void* MakeTempHeap(void *ptr, unsigned int size)
{
    D_800D6040 = MakeHeap(ptr, size);
}

void* MallocTemp(unsigned int size)
{
    Malloc(D_800D6040, size);
}

void FreeTemp(void *ptr)
{
    Free(ptr);
}

unsigned int func_8003B7B4(unsigned int unk1, unsigned int unk2)
{
    return func_800599DC(D_800D6040, unk1, unk2);
}

unsigned int func_8003B7E0()
{
    return func_80059AA4(D_800D6040);
}

unsigned int func_8003B800()
{
    return func_80059AD8(D_800D6040);
}
