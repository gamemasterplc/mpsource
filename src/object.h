#ifndef _OBJECT_H
#define _OBJECT_H

#include <ultra64.h>

struct coords_3d {
    f32 x;
    f32 y;
    f32 z;
};

struct object {
    void *unk0;
    void *unk4;
    s8 pad1[2];
    u16 unka;
    struct coords_3d coords;
    void *unk24;
    s8 pad3[8];
    s8 unk36; // pointed to, not sure what this is.
    f32 unk40;
    s8 pad4[4];
    f32 unk48;
    f32 funk52;
    f32 funk56;
    struct object_indirect *unk60;
    s8 pad5[6];
    s16 unk70;
};

struct object_indirect {
    s8 pad[64];
    struct object_indirect2 *unk64;
};

struct object_indirect2 {
    s16 unk0;
};


#endif /* _OBJECT_H */
