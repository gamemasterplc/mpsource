#include "../src/process.h"
#include "../src/object.h"

extern struct process *InitProcess(process_func func, u16 priority, s32 stack_size, s32 extra_data_size);
extern void EndProcess(struct process *proc);
extern s32 PlaySound(s32 sound_index);

extern struct object_indirect *func_8005D384(u16, s32, s32, s32, void *);
extern void func_8005D718(void *unk);
extern void func_8005D8B8(struct object_indirect *, u16);
extern void func_80060214(s8);
extern void func_80060F04(s32, s32, s32, s32);
