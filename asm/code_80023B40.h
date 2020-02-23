#include <ultra64.h>
#include "../src/object.h"

// sizeof == 192
struct f2b7cstruct {
    s8 pad[108];
    void *unk108;
    s8 pad112[12];
    void *unk124;
    s8 pad2[64];
};

extern struct f2b7cstruct *D_800F2B7C;

extern void func_8002456C(s16);
extern void func_80025AD4(s16);
extern f32 func_80025D18(s16);
extern f32 func_80025D40(s16);
extern void func_80026040(s16);
extern void func_800264F8(s16, s16, f32, void *, void *, s32);
extern void func_80028E8C(s32, void *);
