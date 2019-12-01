#ifndef _PROCESS_H
#define _PROCESS_H

#include <ultra64.h>

typedef void (*process_func)();

typedef struct jump_buf
{
    void *sp;
    process_func func;
    u32 regs[21];
} jmp_buf;

struct process
{
    struct process *next;
    struct process *youngest_child;
    struct process *oldest_child;
    struct process *relative;
    struct process *parent_oldest_child;
    struct process *new_process;
    void *heap;
    u16 exec_mode;
    u16 stat;
    u16 priority;
    s16 dtor_idx;
    s32 sleep_time;
    void *base_sp;
    jmp_buf prc_jump;
    process_func destructor;
    void *user_data;
};

// This might be CreateProcess
extern struct process *InitProcess(process_func func, u16 priority, s32 stack_size, s32 extra_data_size);
extern void LinkChildProcess(void *parent, void *child);
extern void WaitForChildProcess();
extern struct process *GetCurrProcess();
extern void EndProcess(struct process *proc);
extern void SleepProcess(s32 frames);
extern void SleepVProcess();

#endif /* _PROCESS_H */
