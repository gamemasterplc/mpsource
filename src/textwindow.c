#include <ultra64.h>
#include "../src/process.h"
#include "../src/player.h"
#include "../src/mainfs.h"
#include "../asm/libs/libs.h"
#include "../asm/code_8000AD80.h"
#include "../asm/code_800174C0.h"
#include "../asm/code_8001DE70.h"
#include "../asm/code_80023B40.h"
#include "../asm/code_80037CE0.h"
#include "../asm/code_8003D2B0.h"
#include "../asm/code_8003D960.h"
#include "../asm/code_80048190.h"
#include "../asm/code_80053520.h"
#include "../asm/code_8005C1B0.h"
#include "../asm/code_80064B70.h"
#include "../asm/code_8006C8E0.h"

//#define TEXTWINDOW_NONMATCHING

extern u32 D_800C5210;
extern u32 D_800C5214;
extern struct object_indirect *D_800C5248;
extern s32 D_800C524C;
extern s32 D_800C5250[];
extern s32 D_800C526C;

extern u8 D_800CB0EC[4];

extern u32 D_800CB110;
extern u32 D_800CB11C;
extern f64 D_800CB128;
extern f64 D_800CB130;

struct D_800D8160_struct {
    s16 unk0;
    u16 unk2;
    struct object *unk4;
    struct object *unk8;
};
extern struct D_800D8160_struct D_800D8160[16];

struct D_800D8220_struct {
    s16 unk0;
    s16 unk2;
};
extern struct D_800D8220_struct D_800D8220[16];

struct D_800D8260_struct {
    struct object_indirect *unk0;
    void *unk4;
};
extern struct D_800D8260_struct D_800D8260[16];

struct D_800D82E0_struct {
    void *unk0;
    s16 unk4;
};
extern struct D_800D82E0_struct D_800D82E0[16];

extern s8 D_800D8360;
extern f32 D_800D8364;
extern f32 D_800D8368;

extern s8 D_800ED146;

extern u16 D_800F5460[];

typedef void (*unk_800F50C0_func)();
struct unk_800F50C0 {
    /*0x00*/ u16 unk0;
    s16 pad2;
    s32 pad4;
    s32 pad8;
    s32 pad12;
    s32 pad16;
    /*0x14*/ unk_800F50C0_func unkfunc;
    s32 pad24;
    s32 pad28;
    s32 pad32;
    s32 pad36;
    s32 pad40;
    s32 pad44;
    s32 pad48;
    s32 pad52;
    s32 pad56;
    s32 pad60;
    s32 pad64;
    s32 pad68;
    s32 pad72;
    s32 pad76;
    void *unk80;
};

extern struct unk_800F50C0 *D_800F50C0[32];

void func_8004DBC8(u32 unk);
void func_80050338();

extern void func_8004E248();
extern void func_8004E564();
extern void func_8004EC44();

// 8004D930
s32 CreateTextWindow(s16 x, s16 y, s32 w, s32 h) {
    s32 win_id = func_8006D010(x, y, (w * 11) + 8, (h * 14) + 6, 0, 0);
    func_8006E154(win_id, 200);
    func_800717C0(win_id);
    func_8006DA1C(win_id, 0x40, 0x40);
    return win_id;
}

// 8004D9D8
void ShowTextWindow(s32 win_id) {
    s32 i;

    PlaySound(0x36);

    func_80071740(win_id, 1);

    func_8006DEC8(win_id, 0, 0);
    func_8006E01C(win_id, 180.0f);
    func_8006DE20(win_id, 0, 0);

    for (i = 0; i < 181; i += 20) {
        SleepVProcess();
        func_8006E01C(win_id, 180.0f - (f32)i);
        func_8006DE20(win_id, (f32)i / 180.0f, (f32)i / 180.0f);
    }

    func_80071740(win_id, 0);
}

// 8004DAD0
void HideTextWindow(s32 win_id) {
    s32 i;

    PlaySound(0x37);

    for (i = 180; i >= 0; i -= 20) {
        SleepVProcess();
        func_8006E01C(win_id, (f32)((180 - i) * 2));
        func_8006DE20(win_id, (f32)i / 180.0f, (f32)i / 180.0f);
    }

    func_80070D90(win_id);

    SleepVProcess();
}

void func_8004DB9C(u32 unk) {
    D_800C5214 = unk;
    func_8004DBC8(unk);
}

u32 func_8004DBBC() {
    return D_800C5214;
}

void func_8004DBC8(u32 unk) {
    D_800C5210 = unk;
}

#ifdef TEXTWINDOW_NONMATCHING
// Wait for confirmation from specific player
void func_8004DBD4(s32 win_id, s32 player_id) {
    s16 controllers[4];
    u8 D_800CB0EC_copy[4];
    s32 i;
    s32 currentIsCPU;

    currentIsCPU = FALSE;

    // FIXME: This isn't right, what structure is used here, that causes lwl and lwr?
    *((u32 *)D_800CB0EC_copy) = (u32)D_800CB0EC;

    for (i = 0; i < 4; i++) {
        if (i == player_id) {
            if ((gPlayers[i].flags & 1) != 0) { // Check CPU flag
                currentIsCPU = TRUE;
                controllers[gPlayers[i].controller] = -0x8000;
            }
            else {
                func_8007155C(win_id, D_800CB0EC_copy[gPlayers[i].controller]);
                controllers[gPlayers[i].controller] = -1;
            }
        }
        else {
            controllers[gPlayers[i].controller] = 0;
        }
    }

    if (currentIsCPU) {
        func_8006DA1C(win_id, 2, 2);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        func_80070FF8(controllers[0], controllers[1], controllers[2], controllers[3], (u8)D_800C5210);
        D_800C5210 = D_800C5214;
    }
    else {
        func_800710A4(controllers[0], controllers[1], controllers[2], controllers[3]);
    }

    while (func_8006FCC0(win_id)) {
        SleepVProcess();
    }

    func_80071264();
}
#else
asm(".include \"asm/non_matchings/textwindow/func_8004DBD4.s\"");
#endif

#ifdef TEXTWINDOW_NONMATCHING
// Waits for text confirmation from all players.
// 8004DE64
void WaitForTextConfirmation(s32 win_id) {
    s32 i;
    s16 controllers[4];
    u8 D_800CB0EC_copy[4];
    u32 controllerflags;

    *((u32 *)D_800CB0EC_copy) = (u32)D_800CB0EC;

    for (i = 0; i < 4; i++) {
        if ((gPlayers[i].flags & 1) == 0) { // Check CPU flag
            break;
        }
    }

    if (i == 4) { // All CPUs
        func_8006DA1C(win_id, 2, 2);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        func_80070FF8(-0x8000, -0x8000, -0x8000, -0x8000, (u8)D_800C5210);
        D_800C5210 = D_800C5214;

        while (func_8006FCC0(win_id)) {
            SleepVProcess();
        }

        func_80071264();
    }
    else {
        for (i = 0; i < 4; i++) {
            if ((gPlayers[i].flags & 1) != 0) { // Check CPU flag
                controllers[gPlayers[i].controller] = 0;
            }
            else {
                controllerflags = D_800CB0EC_copy[gPlayers[i].controller] | controllerflags;
                controllers[gPlayers[i].controller] = -1;
            }
        }
        func_8007155C(win_id, controllerflags);
        func_800710A4(controllers[0], controllers[1], controllers[2], controllers[3]);

        while (func_8006FCC0(win_id)) {
            SleepVProcess();
        }
    }
}
#else
asm(".include \"asm/non_matchings/textwindow/WaitForTextConfirmation.s\"");
#endif

void func_8004E0E8(s32 win_id) {
    func_8007155C(win_id, 0xF);
    func_800710A4(-1, -1, -1, -1);

    while (func_8006FCC0(win_id)) {
        SleepVProcess();
    }
}

void func_8004E154() {
    s32 i;
    for (i = 0; i < 32; i++) {
        D_800F50C0[i] = NULL;
    }
}

void func_8004E184() {
    s32 i;
    for (i = 0; i < 32; i++) {
        if (D_800F50C0[i] != NULL) {
            if (D_800F50C0[i]->unkfunc == func_8004E248
                || D_800F50C0[i]->unkfunc == func_8004E564
                || D_800F50C0[i]->unkfunc == func_8004EC44) {
                if ((D_800F50C0[i]->unk0 & 4) != 0) {
                    D_800F50C0[i]->unk80 = NULL;
                    func_8005D718(D_800F50C0[i]);
                }
            }
        }
    }
}

asm(".include \"asm/non_matchings/textwindow/func_8004E248.s\"");

asm(".include \"asm/non_matchings/textwindow/func_8004E3E0.s\"");

asm(".include \"asm/non_matchings/textwindow/func_8004E564.s\"");

asm(".include \"asm/non_matchings/textwindow/func_8004EA8C.s\"");

asm(".include \"asm/non_matchings/textwindow/func_8004EC44.s\"");

asm(".include \"asm/non_matchings/textwindow/func_8004EE14.s\"");

void func_8004F00C(struct object *obj, f32 a, f32 b) {
    obj->funk52 = a;
    obj->funk56 = b;
}

u32 func_8004F018(struct object *obj) {
    u32 ONE = 1;
    return obj->funk56 ? ONE : 0;
}

void func_8004F044(struct object *obj) {
    while (func_8004F018(obj)) {
        SleepVProcess();
    }
}

void func_8004F084(struct object_indirect *objind) {
    f32 f;
    f32 ftemp;

    f = sinf(objind->rot1 * D_800CB128);
    ftemp = (f / 2.0f) + 0.5f;
    func_800264F8(objind->unk60, objind->unk68, ftemp, &D_800CB110, &D_800CB11C, 0);
    f = objind->rot1 + 20.0f;
    objind->rot1 = f;
    if (f >= 360.0f) {
        objind->rot1 = f - 360.0f;
    }
}

void func_8004F140(s32 a) {
    D_800C524C = LoadFormFile(0x000A0076, 0x2AD);

    func_80026040(a);
    D_800C5248 = func_8005D384(0x1000, 0, 0, -1, func_8004F084);
    D_800C5248->rot1 = 0;
    D_800C5248->unk60 = a;
    D_800C5248->unk68 = D_800C524C;
    func_8005D8B8(D_800C5248, 0xA0);
}

void func_8004F1D0() {
    if (D_800C5248 != NULL) {
        func_8005D718(D_800C5248);
        D_800C5248 = NULL;
    }
    if (D_800C524C != -1) {
        func_8002456C(D_800C524C);
        D_800C524C = -1;
    }
}

u16 func_8004F234() {
    return LoadFormFile(0x000A0089, 0x2B9);
}

u16 func_8004F25C() {
    return LoadFormFile(0x001F0001, 0x2B9);
}

void func_8004F284() {
}

void func_8004F28C(void *a, s16 b) {
    func_8005699C(b);
}

void func_8004F2AC() {
    s32 i;
    for (i = 0; i < 16; i++) {
        D_800D8160[i].unk4 = NULL;
        D_800D8160[i].unk8 = 0;
    }
}

void func_8004F2EC() {
    s32 i;
    struct D_800D8160_struct *cur;

    i = 0;
    cur = D_800D8160;
    while (i < 16) {
        if (cur[i].unk8 != NULL) {
            func_8005D718(cur[i].unk8);
            cur[i].unk8 = NULL;
        }
        i++;
    }
}

void func_8004F358(struct object_indirect *objind) {
    f32 fVar2;
    f32 fVar3;
    struct D_800D8160_struct *cur;

    cur = &D_800D8160[objind->unk76];
    fVar2 = func_80025D18(cur->unk4->unk60->unk64->unk0);
    fVar3 = func_80025D40(cur->unk4->unk60->unk64->unk0);
    if (fVar2 == fVar3) {
        func_8003E8B8(cur->unk4, cur->unk0, 0, 10, cur->unk2);
        cur->unk4 = NULL;
        cur->unk8 = NULL;
        func_8005D718(objind);
    }
}

s32 func_8004F40C(struct object *obj, s16 param_2, u16 param_3) {
    struct object_indirect *objind;
    struct D_800D8160_struct *cur;
    s32 i;
    for (i = 0; i < 16; i++) {
        cur = &D_800D8160[i];
        if (cur->unk8 == NULL) {
            break;
        }
    }
    if (i == 16) {
        return -1;
    }

    objind = func_8005D384(0x2000, 0, 0, -1, func_8004F358);
    cur->unk8 = (struct object *)objind;
    objind->unk76 = i;
    cur->unk4 = obj;
    cur->unk0 = param_2;
    cur->unk2 = param_3;
    return i;
}

void func_8004F4D4(struct object *obj, s16 param_2, u16 param_3) {
    func_8003E8B8(obj, param_2, 0, 10, param_3);
}

void func_8004F504(struct object *obj) {
    while ((func_8003E940(obj) & 1) == 0) {
        SleepVProcess();
    }
}

void func_8004F548() {
    s32 i;
    for (i = 0; i < 16; i++) {
        D_800D8220[i].unk0 = -1;
        D_800D8220[i].unk2 = -1;
    }
}

void func_8004F584(s32 i) {
    struct D_800D8220_struct *cur;

    cur = &D_800D8220[i];
    if (cur->unk0 != -1) {
        func_80064D38(cur->unk0);
        cur->unk0 = -1;
    }
    if (cur->unk2 != -1) {
        func_80067704(cur->unk2);
        cur->unk2 = -1;
    }
}

void func_8004F5F0() {
    s32 i;
    for (i = 0; i < 16; i++) {
        func_8004F584(i);
    }
}

s32 func_8004F628(u32 param_1, s16 param_2, u16 param_3, u16 param_4) {
    struct D_800D8220_struct *cur;
    s32 i;
    for (i = 0; i < 16; i++) {
        cur = &D_800D8220[i];
        if (cur->unk0 == -1) {
            break;
        }
    }
    if (i == 16) {
        return -1;
    }

    {
        void *file;
        s16 x;

        cur->unk0 = func_80064EF4(1, 5);
        file = ReadMainFS(param_1);
        x = func_800678A4(file);
        cur->unk2 = x;
        FreeMainFS(file);
        func_80067208(cur->unk0, 0, cur->unk2, 0);
        func_800672B0(cur->unk0, 0, 1);
        func_80067384(cur->unk0, 0, param_2);
        func_800674BC(cur->unk0, 0, 0x1000);
        func_80066DC4(cur->unk0, 0, param_3, param_4);
    }

    return i;
}

void func_8004F754(s32 i, u16 param_2, u16 param_3) {
    func_80066DC4(D_800D8220[i].unk0, 0, param_2, param_3);
}

void func_8004F790(s32 i, u16 param_2, u16 param_3) {
    func_8006752C(D_800D8220[i].unk0, 0, param_2);
}

void func_8004F7C0(s32 i, f32 param_2, f32 param_3) {
    func_80067354(D_800D8220[i].unk0, 0, param_2, param_3);
}

void func_8004F800(s32 i, s32 param_2) {
    func_800674BC(D_800D8220[i].unk0, 0, param_2);
}

void func_8004F830(s32 i, s32 param_2) {
    func_80067480(D_800D8220[i].unk0, 0, param_2);
}

void func_8004F860(s32 i, f32 param_2) {
    func_80067284(D_800D8220[i].unk0, 0, param_2);
}

void func_8004F898(s32 i, s32 param_2, s32 param_3, s32 param_4) {
    func_800674F4(D_800D8220[i].unk0, 0, param_2, param_3, param_4);
}

void func_8004F8DC() {
    s32 i;

    func_8001DE70(32);
    for (i = 0; i < 16; i++) {
        D_800D8260[i].unk4 = NULL;
        D_800D8260[i].unk0 = NULL;
    }
}

void func_8004F928(struct object_indirect *objind) {
    func_800214FC(D_800D8260[objind->unk76].unk4);
}

s32 func_8004F954(s32 param_1, s16 param_2) {
    struct D_800D8260_struct *cur;
    s32 i;
    for (i = 0; i < 16; i++) {
        cur = &D_800D8260[i];
        if (cur->unk4 == NULL) {
            break;
        }
    }
    if (i == 16) {
        return -1;
    }

    {
        struct object_indirect *objind;

        cur->unk4 = func_80021308(param_1, param_2);
        objind = func_8005D384(0x3000, 0, 0, -1, func_8004F928);
        cur->unk0 = objind;
        objind->unk76 = i;
    }

    return i;
}

void func_8004F9F4(s32 i, f32 param_2, f32 param_3, f32 param_4, s16 param_5) {
    func_80021794(D_800D8260[i].unk4, 0, param_2, param_3, param_4, param_5);
}

void func_8004FA48(s32 i, s16 param_2, f32 param_3, f32 param_4, f32 param_5, s16 param_6) {
    func_80021794(D_800D8260[i].unk4, param_2, param_3, param_4, param_5, param_6);
}

void func_8004FA90(s32 i) {
    func_80021AF4(D_800D8260[i].unk4);
}

void func_8004FAB8(s32 i) {
    struct D_800D8260_struct *cur;

    cur = &D_800D8260[i];
    if (cur->unk4 != NULL) {
        func_80021474(cur->unk4);
        cur->unk4 = NULL;
    }
    if (cur->unk0 != NULL) {
        func_8005D718(cur->unk0);
        cur->unk0 = NULL;
    }
}

void func_8004FB14() {
    s32 i;
    for (i = 0; i < 16; i++) {
        D_800D82E0[i].unk0 = NULL;
        D_800D82E0[i].unk4 = -1;
    }
}

void func_8004FB50(s32 i) {
    struct D_800D82E0_struct *cur;

    cur = &D_800D82E0[i];
    if (cur->unk4 != -1) {
        func_80039ACC(cur->unk4);
        cur->unk4 = -1;
    }
    if (cur->unk0 != NULL) {
        FreeMainFS(cur->unk0);
        cur->unk0 = NULL;
    }
}

void func_8004FBB4() {
    s32 i;
    for (i = 0; i < 16; i++) {
        func_8004FB50(i);
    }
}

s32 func_8004FBEC(u32 param_1, s32 param_2, s32 param_3) {
    struct D_800D82E0_struct *cur;
    s32 i;
    for (i = 0; i < 16; i++) {
        cur = &D_800D82E0[i];
        if (cur->unk0 == NULL) {
            break;
        }
    }
    if (i == 16) {
        return -1;
    }

    {
        void *file;
        s16 x;

        file = ReadMainFS(param_1);
        cur->unk0 = file;
        x = func_80038A9C(D_800F2B7C[param_2].unk108, file, 0, param_3);
        cur->unk4 = x;
        func_80025AD4(param_2);
    }

    return i;
}

void func_8004FCB0(struct object_indirect *obj) {
    struct coords_3d triple;

    if (obj->unk60 == 0) {
        obj->rot1 = obj->unk36;
        obj->rot2 = obj->unk40;
        obj->rot3 = obj->unk44;
    }
    else {
        obj->rot1 += obj->unk48;
        obj->rot2 += obj->funk52;
        obj->rot3 += obj->funk56;
    }

    triple.x = obj->rot1;
    triple.y = obj->rot2;
    triple.z = obj->rot3;
    func_8004B5DC(&triple);

    if (obj->unk60 == 0) {
        func_8005D718(obj);
    }
    obj->unk60--;
}

s32 func_8004FD68(struct coords_3d *param_1, struct coords_3d *param_2, f32 param_3) {
    struct coords_3d local_40;
    struct coords_3d local_30;
    f32 fVar2;
    f32 fVar1;

    local_40.x = param_2->x - param_1->x;
    local_40.y = param_2->y - param_1->y;
    local_40.z = param_2->z - param_1->z;

    fVar2 = func_8003D2B0(&local_40) * D_800CB130;

    local_30.x = sinf(fVar2) * param_3;
    local_30.y = 0;
    local_30.z = cosf(fVar2) * param_3;

    fVar1 = local_40.x / local_30.x;

    {
        struct object_indirect *objind;
        s32 ret;

        objind = func_8005D384(0x5000, 0, 0, -1, func_8004FCB0);
        objind->rot1 = param_1->x;
        objind->rot2 = param_1->y;
        objind->rot3 = param_1->z;

        objind->unk48 = local_30.x;
        objind->funk52 = local_30.y;
        objind->funk56 = local_30.z;

        objind->unk36 = param_2->x;
        objind->unk40 = param_2->y;
        objind->unk44 = param_2->z;

        ret = (s32)fVar1;
        objind->unk60 = ret;
        return ret;
    }
}

void func_8004FEA0(struct coords_3d *param_1, struct coords_3d *param_2) {
    func_8004FD68(param_1, param_2, 30.0f);
}

s32 func_8004FEBC(s32 param_1) {
    s32 i;
    s32 locals[4];
    s32 iVar1;

    for (i = 0; i < 4; i++) {
        locals[i] = gPlayers[i].stars * 1000 + gPlayers[i].coins;
    }

    for (i = 0, iVar1 = 0; i < 4; i++) {
        if (i != param_1) {
            iVar1 = iVar1 + (locals[param_1] < locals[i]);
        }
    }
    return iVar1;
}

s32 func_8004FF68(s32 player_index) {
    return gPlayers[player_index].stars * 1000 + gPlayers[player_index].coins;
}

void func_8004FFA8() {
    s32 i;

    SleepProcess(2);

    for (i = 0; i < 4; i++) {
        if ((gPlayers[i].flags & 1) == 0) {
            break;
        }
    }

    if (i == 4) {
        SleepProcess(30);
        return;
    }

    while (TRUE) {
        for (i = 0; i < 4; i++) {
            if ((gPlayers[i].flags & 1) == 0
                && (D_800F5460[gPlayers[i].controller] & 0xC000) != 0
            ) {
                break;
            }
        }
        if (i != 4) {
            return;
        }
        SleepVProcess();
    }
}

void func_800500A4() {
    D_800D8360 = func_8000C4A0();
    D_800D8364 = (f32)(s32)D_800D8360;
    D_800D8368 = D_800D8364 / 15.0f;

    while (TRUE) {
        D_800D8364 = D_800D8364 - D_800D8368;
        if (D_800D8364 <= 0.0f) {
            break;
        }

        func_80060214(D_800D8364);
        SleepVProcess();
    }

    func_80060214(0);
}

void func_80050160() {
    D_800D8364 = 0.0f;
    D_800D8368 = (f32)(s32)D_800D8360 / 75.0f;

    while (TRUE) {
        D_800D8364 = D_800D8364 + D_800D8368;
        if (D_800D8360 <= D_800D8364) {
            break;
        }

        func_80060214(D_800D8364);
        SleepVProcess();
    }

    func_80060214(D_800D8360);
}

#ifdef TEXTWINDOW_NONMATCHING
// FIXME: Some fiddly issue with registers here.
s32 func_8005021C(f32 param_1) {
    s32 byte1;
    u8 byte2;
    byte1 = GetRandomByte();
    byte2 = GetRandomByte();
    return ((byte2 | (byte1 << 8)) / 65536.0f) * param_1;
}
#else
asm(".include \"asm/non_matchings/textwindow/func_8005021C.s\"");
#endif

s32 func_80050288() {
    s32 edval;

    edval = D_800ED146;
    if (D_800ED146 == -1) {
        edval = 6;
    }
    func_8004F548();
    if (D_800C526C != -1) {
        func_80050338();
    }
    D_800C526C = func_8004F628(D_800C5250[edval], 10, 0xA0, 0x78);
    func_800674BC(D_800D8220[D_800C526C].unk0, 0, 0x4000);
    return D_800D8220[D_800C526C].unk0;
}

void func_80050338() {
    func_8004F584(D_800C526C);
    D_800C526C = -1;
    func_8004F5F0();
}

void func_80050368() {
    func_8004F800(D_800C526C, 0x8000);
}

void func_8005038C() {
    func_8004F830(D_800C526C, 0x8000);
}

#ifdef TEXTWINDOW_NONMATCHING
// This has a switch statement, need rodata decomp.
void func_800503B0(s32 player_index, s32 param_2) {
    if (gPlayers[player_index].flags & 1 != 0) {
        return;
    }

    switch (param_2) {
        case 6:
            func_80060F04(player_index, 5, 0, 5);
            break;

        case 7:
            func_80060F04(player_index, 2, 3, 10);
            break;

        case 8:
            func_80060F04(player_index, 10, 0, 10);
            break;

        case 9:
            func_80060F04(player_index, 20, 0, 20);
            break;

        case 10:
            func_80060F04(player_index, 2, 2, 20);
            break;

        case 11:
            func_80060F04(player_index, 30, 0, 20);
            break;
    }
}
#else
asm(".include \"asm/non_matchings/textwindow/func_800503B0.s\"");
#endif

asm(".include \"asm/non_matchings/textwindow/func_8005049C.s\"");
