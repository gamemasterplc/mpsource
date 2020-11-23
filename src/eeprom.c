#include <ultra64.h>
#include "eeprom.h"

//#define EEPROM_NONMATCHING

extern s16 D_800ED5DE;
extern s8 D_800ED100;
extern s16 D_800ED102;
extern u8 D_800ED112;
extern u8 D_800ED119;
extern u32 D_800ED120;
extern s32 D_800ED140;
extern s16 D_800ED144;
extern s8 D_800ED146;
extern s8 D_800ED147;
extern u8 D_800ED148;

extern u16 D_800ED5C2[];

extern void *D_800F37B8;

s32 func_80059400 (s16 arg0);

void func_8005963C(s16 index, u16 param_2);
void func_80059768(s16 index, s16 param_2);

void func_80059280() {
    s8 *ed100;

    ed100 = &D_800ED100;
    bzero(ed100, 148);
    ed100[0] = 18;
    D_800ED140 = 0;
    D_800ED144 = 0;
    D_800ED146 = -1;
    D_800ED147 = 0;

    SetBoardFeatureFlag(16);

    {
        s32 i;
        for (i = 0; i < 8; i++) {
            func_80059768(i, 0);
            if (i < 6) {
                func_8005963C(i, 0x8000);
            }
        }
    }

    D_800ED5C2[0] = 0;
    D_800ED5C2[14] = 0;
    bzero(&D_800F37B8, 15);
}

void func_80059348(s16 param_1) {
    D_800ED5DE = param_1;
}

#ifdef EEPROM_NONMATCHING
void func_80059354(s16 param_1, s16 *param_2, s16 *param_3) {
    s16 iVar1;

    if (param_1 < 0) {
        param_1 = D_800ED5DE;
    }

    iVar1 = param_1;
    if (iVar1 < 0) {
        iVar1 += 7;
    }
    *param_2 = iVar1 >> 3;

    iVar1 = param_1;
    if (iVar1 < 0) {
        iVar1 += 7;
    }

    *param_3 = param_1 + iVar1;
}
#else
asm(".include \"asm/non_matchings/eeprom/func_80059354.s\"");
#endif

#ifdef EEPROM_NONMATCHING
void func_800593AC(s16 param_1) {
    s16 local_10;
    s16 local_e;

    func_80059354(param_1, &local_10, local_e);
    (&D_800ED112)[local_10] |= 1 << (local_e & 0x1F);
}
#else
asm(".include \"asm/non_matchings/eeprom/func_800593AC.s\"");
#endif

s32 func_80059400 (s16 arg0) {
    s16 var0;
    s16 var1;

    func_80059354(arg0, &var0, &var1);
    return ((&D_800ED112)[var0] & (1 << var1));
}

s8 func_80059448(s16 arg0) {
    s16 var0;
    s16 var1;

    func_80059354(arg0, &var0, &var1);
    (&D_800ED119)[var0] = ((&D_800ED119)[var0] | (1 << var1));
}

//asm(".include \"asm/non_matchings/eeprom/func_8005949C.s\"");
s16 func_8005949C(s16 arg0) {
    s16 var0;
    s16 var1;

    func_80059354(arg0, &var0, &var1);
    return (&D_800ED119)[var0] & (var1 << 1);
}

void func_800594E4(s16 index, u16 value) {
    (&D_800ED102)[index] = value;
}

u16 func_800594FC(s16 index) {
    return (&D_800ED102)[index];
}

void func_80059514(u16 value) {
    D_800ED5C2[0] = value;
}

u32 *func_80059520(s16 index) {
    if (index < 0) {
        index = D_800ED5C2[0];
    }
    return &D_800ED120 + index;
}

u16 func_80059550(s16 index) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    return *ptr & 0x3FF;
}

void func_80059578(s16 index) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    if (index < 0) {
        index = D_800ED5C2[0];
    }
    if (index < 8) {
        {
            u16 uVar;
            u16 uVarAnd;

            uVarAnd = *ptr & 0xFC00;
            uVar = *ptr & 0x3FF;

            if (++uVar > 999) {
                uVar = 999;
            }
            *ptr = uVar | uVarAnd;
        }
    }
}

u16 func_80059600(s16 index, u16 param_2) {
    u16 *ptr;
    u16 ret;
    u32 andr;

    ptr = (u16 *)func_80059520(index);
    ret = *ptr & 0xFC00;
    return ret & (andr = param_2); // What.
}

void func_8005963C(s16 index, u16 param_2) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    *ptr |= param_2 & 0xFC00;
}

void func_80059678(s16 index, u16 param_2) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    *ptr &= ~(param_2 & 0xFC00);
}

u16 func_800596B8(s16 index) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    return ptr[1];
}

void func_800596DC(s16 index, s16 param_2) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    if (index < 0) {
        index = D_800ED5C2[0];
    }
    if (index < 8) {
        ptr[1] = param_2 + ptr[1];
        if (ptr[1] > 9999) {
            ptr[1] = 9999;
        }
    }
}

void func_80059768(s16 index, s16 param_2) {
    u16 *ptr;

    ptr = (u16 *)func_80059520(index);
    ptr[1] = param_2;
}

s32 IsBoardFeatureFlagSet(s32 feature) {
    s32 a, b;
    s32 ret;

    a = feature;
    if (feature < 0) {
        a += 7;
    }
    a >>= 3;

    ret = (&D_800ED148)[a];

    if (feature >= 0) {
        b = feature;
    }
    else {
        b = feature + 7;
    }

    b >>= 3;
    b <<= 3;
    b = feature - b;

    return ret & (1 << b);
}

#ifdef EEPROM_NONMATCHING
void SetBoardFeatureFlag(s32 feature) {
    s32 a, b;

    a = feature;
    if (feature < 0) {
        a += 7;
    }
    a >>= 3;

    if (feature >= 0) {
        b = feature;
    }
    else {
        b = feature + 7;
    }

    b >>= 3;
    b <<= 3;
    b = feature - b;

    (&D_800ED148)[a] |= (1 << b);
}
#else
asm(".include \"asm/non_matchings/eeprom/SetBoardFeatureFlag.s\"");
#endif

#ifdef EEPROM_NONMATCHING
void ClearBoardFeatureFlag(s16 feature) {
    s32 a, b;

    a = feature;
    if (feature < 0) {
        a += 7;
    }
    a >>= 3;

    if (feature >= 0) {
        b = feature;
    }
    else {
        b = feature + 7;
    }

    b >>= 3;
    b <<= 3;
    b = feature - b;

    (&D_800ED148)[a] &= ~(1 << b);
}
#else
asm(".include \"asm/non_matchings/eeprom/ClearBoardFeatureFlag.s\"");
#endif
