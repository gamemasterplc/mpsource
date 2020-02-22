#include "../src/process.h"

extern struct process *InitProcess(process_func func, u16 priority, s32 stack_size, s32 extra_data_size);
extern void EndProcess(struct process *proc);
