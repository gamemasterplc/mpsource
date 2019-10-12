#include <ultra64.h>

/**
 * DK Jungle Adventure board logic.
 */

// Several non-matchings, uncomment to see them.
//#define OV054_NONMATCHING 1

// Diff in ROM: 0x2418A0 - 0x244B60

extern s16 D_800ED154[];
extern s16 D_800ED172;

struct ed192struct {
    u16 times_passed_start;
};
extern struct ed192struct D_800ED192;

struct ed5c0struct {
    s16 unk0;
    s16 unk1;
    s8 pad[6];
    s16 unka;
    s16 unkc[7];
    s16 unk1a;
};
extern struct ed5c0struct D_800ED5C0;

extern s16 D_800ED5D8;
extern s16 D_800EE320;

// sizeof == 192
struct f2b7cstruct {
    s8 pad[124];
    void *unk124;
    s8 pad2[64];
};

extern struct f2b7cstruct *D_800F2B7C;

extern s16 D_800F98C0[]; // data_screen_dimensions
extern s16 D_800F98D0[]; // func_800F663C_data0
extern s16 D_800F98E0[]; // func_800F663C_data1
extern s16 D_800F98F0[]; // data_mystery_40s_list
extern s16 D_800F9900[]; // star_space_indices
extern s16 D_800F9910[]; // toad_space_indices
extern s16 D_800F9920[]; // data_star_related_800F9920
extern s16 D_800F9928[]; // toad_space_indices_repeat
extern s16 D_800F992A[];
extern s16 D_800F9938[];
extern s16 D_800F9948[];
//extern s16 D_800F994A[];
extern s16 D_800F9964[];
extern s16 D_800F996C[];
extern s16 D_800F9974[];
extern s16 D_800F997C[]; // thwomp_event_space_indices
extern s16 D_800F9984;
extern s16 D_800F998C[]; // boo
extern s16 D_800F9990[]; // gate_20_coins_space_indices
extern s16 D_800F9994[]; // gate_20_coins_player_space_indices
extern void *D_800F9ADC;
extern void *D_800F9C74;
extern void *D_800F9D7C;
extern void *D_800F9E30; // ov054_Event20CoinDoor_4D_57 ai
extern void *D_800F9F38; // ov054_Event20CoinDoor_2A_2E ai
extern s16 D_800F9F5C;
extern s16 D_800F9F7C;
extern s16 D_800F9F9C;
extern s16 D_800F9FCC[]; // boulder_space_indices
extern s16 D_800F9FEC[]; // arrow dir ov054_Event20CoinDoor_4D_57
extern s16 D_800FA004;
extern void *D_800FA0CC;
extern void *D_800FA1FC;
extern void *D_800FA20C;
extern void *D_800FA224;

// bss
extern struct object_type *D_800FA300; // bss_bowser_model
extern void *D_800FA304; // bss_koopa_model
extern struct object_type *D_800FA308; // bss_toad_model
extern struct object_type *D_800FA310[]; // bss_toad_instances
extern struct object_type *D_800FA318; // bss_toad_boulder
extern struct object_type *D_800FA320; // bss_toad_boulder_2
extern void *D_800FA32C; // bss_thwomp_model
extern void *D_800FA330[]; // thwomp_instances
extern void *D_800FA33C; // bss_boo_model
extern void *D_800FA340[]; // bss_boo_2
extern void *D_800FA348; // bss_coin_gate_model
extern void *D_800FA34C[]; // bss_20_coin_gate_2
extern void *D_800FA354; // coin gate
extern void *D_800FA358; // coin gate
extern void *D_800FA35C; // coin gate
extern void *D_800FA360; // coin gate
f32 D_800FA364; // boulder float
f32 D_800FA368; // boulder float
extern s16 D_800FA36C; // bss_boulder_800FA36C
extern struct object_type *D_800FA370; // bss_boulder_800FA370

struct ov054_unk_event_user_data {
    struct object_type *unk0;
    struct object_type *unk4;
    void *unk8;
    s8 pad[28];
    f32 unk;
};

extern s16 GetCurrentPlayerIndex();
extern s16 GetChainSpaceIndexFromAbsSpaceIndex(s16 a, s16 b);
extern s16 GetAbsSpaceIndexFromChainSpaceIndex(u16 chain_index, u16 space_index);
extern void SetPlayerOntoChain(u16 player, s16 chain_index, s16 space_index);

struct space_data {
    s8 pad[4];
    void *unk4;
    s8 pad2[16];
    void *unk24;
};

extern struct space_data *GetSpaceData(s16 index);

extern void func_80023504(s32 a, f32 b, f32 c, f32 d);
extern void *func_8003C314(s32 a, void *ptr, s32 c, s32 d);

struct object_type {
    s8 pad[4];
    void *unk4;
    s8 pad1[2];
    u16 unka;
    s16 unkc; // pointed to, not sure what this is.
    s8 pad2[10];
    s16 unk24;
    s8 pad3[10];
    s8 unk36; // pointed to, not sure what this is.
    s8 pad4[8];
    f32 unk48;
    f32 funk52;
    f32 funk56;
    struct object_type_indirect *unk60;
    s8 pad5[6];
    s16 unk70;
};

struct object_type_indirect {
    s8 pad[64];
    struct object_type_indirect2 *unk64;
};

struct object_type_indirect2 {
    s16 unk0;
};

extern struct object_type *func_8003DBE0(s32 model_id, s32 unk);
extern void *func_8003E174(struct object_type *ptr);
extern struct object_type *func_8003E320(void *unk);
extern u16 func_8003E940(struct object_type *a0);

struct mystery_struct_ret_func_80048224 {
    struct object_type *unk0;
    s8 pad[4];
    s16 unk8; // window id
};

extern void *func_80042728(struct object_type *ptr, s32 num);
extern void func_8004B5C4(f32 unk);
extern void func_8004B838(f32 unk);
extern f32 func_8004B844();
extern f32 func_8004B5D0();
extern void *func_8004CDCC(struct object_type *unk);
extern struct process *func_8004D1EC(void *a, void *b, void *c, s32 d);
extern struct process *func_8004D3F4(void *a, void *b, void *c, s32 d);
extern struct process *func_8004D648(void *a, void *b, void *c, f32 d);
extern void func_80056E30(s16 unk);
extern void func_8005CF30(u16 a, u16 b);
extern void func_8005E044(u16 a, u16 b, u16 c);
extern void func_80060BC8(s16 a, s16 b);
extern struct process *func_800633A8();
extern void *func_80045D84(s32 a, s32 b, s32 c);
extern void func_800A0D00(void *ptr, f32 x, f32 y, f32 z);
extern void func_800A0D50(void *ptr, void *ptr2);
extern f32 func_800A13C0(void *ptr, void *ptr2);
extern void func_800A40D0(void *ptr, f32 unk);
extern u32 IsCameraMoving();
extern struct player *GetPlayerStruct(s32 player_index);
extern s16 GetCurrentSpaceIndex();
extern u8 GetRandomByte();
extern u32 PlayerHasCoins(s16 player, s16 coins);
extern s32 CreateTextWindow(s16 x, s16 y, s16 w, s16 h);
extern void func_8004DBD4(int window, int player);
extern s32 DirectionPrompt(void *arrow_obj);
extern void *SpawnDirArrows(int player, short *dir);
extern void InitDirArrows(void *arrow_obj, s32 player, s16 new_flags);
extern s16 RunDecisionTree(void *tree);
extern void LinkChildProcess(void *parent, void *child);
extern void WaitForChildProcess();
extern void *GetCurrProcess();

struct player
{
    s8 unk0;
    s8 cpu_difficulty_1;
    s8 cpu_difficulty_2;
    s8 pad2;
    // 4:
    s8 character;
    s8 pad3[3];
    // 8:
    s16 coins;
    // 10:
    s16 minigame_coins;
    // 12:
    s16 stars;
    // 14:
    u16 cur_chain_index;
    // 16:
    u16 cur_space_index;
    // 18:
    u16 next_chain_index;
    // 20:
    u16 next_space_index;
    // 22:
    u8 poisoned;
    u8 turn_status;
    // 24:
    u8 id;
    u8 pad4;
    u8 pad5;
    u8 pad6;
    // 28:
    u32 pad7;
    // 32:
    struct object_type *obj;
    s8 pad8[14];
};

// Process types, should be eventually consolidated.
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

#define ov054_DK_STAR_COUNT 7
#define ov054_DK_BOO_COUNT 2
#define ov054_DK_COIN_GATE_COUNT 2
#define ov054_DK_THWOMP_COUNT 3

// 0x800F6610
s16 ov054_GetNextToadIndex() {
    s16 *unkaa;
    s16 *unkcc;

    // FIXME: Seems like it should be something like this, but what???
    // return D_800F9910[ed5c0->unkc[ed5c0->unka]];

    unkaa = (void *)&D_800ED5C0 + 10;
    unkcc = (void *)unkaa + 2;

    return D_800F9910[*(unkcc + *unkaa)];
}

void ov054_func_800F663C() {
    s32 s1;
    s32 rand1;
    s32 rand2;
    s32 swap1;
    struct ed5c0struct *ed5c0;

    ed5c0 = &D_800ED5C0;
    for (s1 = 0; s1 < 30; s1++) {
        rand1 = GetRandomByte() % 7;
        rand2 = GetRandomByte() % 7;
        if (rand1 == rand2) {
            continue;
        }

        if (rand1 < D_800F98E0[rand2]) {
            continue;
        }

        if (rand2 < D_800F98E0[rand1]) {
            continue;
        }

        swap1 = D_800F98D0[rand1];
        D_800F98D0[rand1] = D_800F98D0[rand2];
        D_800F98D0[rand2] = swap1;

        swap1 = D_800F98E0[rand1];
        D_800F98E0[rand1] = D_800F98E0[rand2];
        D_800F98E0[rand2] = swap1;
    }

    for (s1 = 0; s1 < ov054_DK_STAR_COUNT; s1++) {
        ed5c0->unkc[s1] = D_800F98D0[s1];
    }
}

void ov054_func_800F67A4() {
    s32 temp;
    struct ed5c0struct *ed5c0;

    ed5c0 = &D_800ED5C0;

    if (++ed5c0->unka < ov054_DK_STAR_COUNT) {
        return;
    }

    temp = D_800ED5D8;
    ed5c0->unka = 0;

    SetBoardFeatureEnabled(0x44);
    ov054_func_800F663C();

    if (temp != ed5c0->unkc[0]) {
        return;
    }

    temp = ed5c0->unkc[0];
    ed5c0->unkc[0] = D_800ED5D8;
    D_800ED5D8 = temp;
}

void ov054_func_800F6830() {
    s32 s0;
    s32 s1;
    struct ed5c0struct *ed5c0;

    ed5c0 = &D_800ED5C0;
    for (s1 = 0; s1 < ov054_DK_STAR_COUNT; s1++) {
        SetSpaceType(D_800F9900[s1], 1);
        SetBoardFeatureEnabled(D_800F98F0[s1]);
    }

    if (IsBoardFeatureDisabled(0x44)) {
        s0 = 7;
    }
    else {
        s0 = ed5c0->unka;
    }

    for (s1 = 0; s1 < s0; s1++) {
        SetSpaceType(D_800F9900[ed5c0->unkc[s1]], 6);
    }

    SetSpaceType(D_800F9900[ed5c0->unkc[ed5c0->unka]], 5);

    SetBoardFeatureDisabled(D_800F98F0[ed5c0->unkc[ed5c0->unka]]);
}

// 0x800F6958
s32 ov054_StarSpaceEventInner(s32 current_space_index) {
    s32 i;
    s32 j;
    s16 *D_800F9900ptr;
    struct ed5c0struct *ed5c0;

    ed5c0 = &D_800ED5C0;

    i = 0;

    D_800F9900ptr = &D_800F9900;

    // This feels a bit odd, but the match was difficult.
    current_space_index <<= 16;
    current_space_index >>= 16;

    while (i < ov054_DK_STAR_COUNT) {
        if (current_space_index == D_800F9900ptr[i]) {
            if (i == ed5c0->unkc[ed5c0->unka]) {
                ed5c0->unk1a = D_800F98F0[i];
                return 1;
            }

            if (IsBoardFeatureDisabled(68)) {
                current_space_index = 7;
            }
            else {
                current_space_index = ed5c0->unka;
            }

            for (j = 0; j < current_space_index; j++) {
                if (i == ed5c0->unkc[j]) {
                  return 2;
                }
            }

            return 0;
        }

        i++;
    }

    return 0;
}

void ov054_ShowNextStarSpotProcess() {
    struct ov054_unk_event_user_data *some_struct;
    struct object_type *ptr;
    struct f2b7cstruct *f2bstr;
    void *ret;
    s32 s0;
    f32 ftemp;
    f32 ftt;
    f32 const20;

    some_struct = (func_800633A8())->user_data;

    PlaySound(109);
    ptr = func_8003DBE0(64, 0);
    ptr->unka |= 4;
    func_8004CDCC(ptr);
    func_800A0D50(&ptr->unkc, &some_struct->unk4);

    ptr->unk48 = 500.0f;

    ret = func_80042728(ptr, 0);

    ftemp = 0.0f;
    for (s0 = 0; s0 < 6; s0++) {
        func_800A0D00(&ptr->unk36, ftemp, ftemp, ftemp);
        ftemp += 0.4f;
        SleepVProcess();
    }

    for (s0 = 0; s0 < 3; s0++) {
        func_800A0D00(&ptr->unk36, ftemp, ftemp, ftemp);
        ftemp -= 0.4f;
        SleepVProcess();
    }

    SleepProcess(30);
    PlaySound(68);

    ftt = 0.0f;
    const20 = 20.0f;
    while (TRUE) {
        f2bstr = &D_800F2B7C[ptr->unk60->unk64->unk0];
        func_800A40D0(&f2bstr->unk124, ftt);
        ftemp -= 0.02f;

        ftt += const20;
        if (ftemp < 0) {
            break;
        }

        func_800A0D00(&ptr->unk36, ftemp, ftemp, ftemp);
        ptr->unk48 -= 6.0f;
        SleepVProcess();
    }

    func_800427D4(ret);
    SleepProcess(30);
    func_8003E694(ptr);
    EndProcess(NULL);
}

void ov054_ShowNextStarSpotInner(struct mystery_struct_ret_func_80048224 *a0) {
    struct object_type *unk0ptr;

    unk0ptr = a0->unk0;
    unk0ptr->funk52 = 20.0f;
    unk0ptr->funk56 = -3.0f;

    func_8003E81C(a0->unk0, 0, 0);
    SleepProcess(3);

    while (func_8003E940(a0->unk0) == 0) {
        SleepVProcess();
    }

    func_8003E81C(a0->unk0, -1, 2);
}

void ov054_ShowNextStarSpot() {
    struct ed5c0struct *ed5c0;
    struct mystery_struct_ret_func_80048224 *str;
    struct space_data *spacedata;
    struct process *proc_struct;
    s32 string_id;

    ed5c0 = &D_800ED5C0;

    func_80060128(43);
    str = func_80048224(D_800F9920);
    func_80072644(2, 16);

    while (func_80072718() != 0) {
        SleepVProcess();
    }

    func_8004A520();
    func_8004B5C4(3.0f);
    ov054_ShowNextStarSpotInner(str);

    if (ed5c0->unka == 0 && !IsBoardFeatureDisabled(68)) {
        string_id = 1256;
    }
    else {
        string_id = 1258;
    }
    LoadStringIntoWindow(str->unk8, string_id, -1, -1);
    func_80071C8C(str->unk8, 1);
    PlaySound(1125);
    WaitForTextConfirmation(str->unk8);
    func_80071E80(str->unk8, 1);
    func_8006EB40(str->unk8);

    spacedata = GetSpaceData(D_800F9910[ed5c0->unkc[ed5c0->unka]]);
    func_8004B5DC(&spacedata->unk4);
    func_8004B838(5.0f);
    SleepProcess(5);

    while (func_8004B850() != 0) {
        SleepVProcess();
    }
    SleepProcess(5);

    proc_struct = InitProcess(ov054_ShowNextStarSpotProcess, 18432, 0, 0);
    proc_struct->user_data = spacedata;

    SleepProcess(30);

    if (ed5c0->unka == 0 && !IsBoardFeatureDisabled(68)) {
        string_id = 1257;
    }
    else {
        string_id = 1259;
    }
    LoadStringIntoWindow(str->unk8, string_id, -1, -1);
    func_80071C8C(str->unk8, 1);
    WaitForTextConfirmation(str->unk8);
    func_80071E80(str->unk8, 1);
    func_800601D4(90);
    SleepProcess(30);
    func_800726AC(2, 16);
    SleepProcess(17);
    func_8004847C(str);
    func_80056AF4();
    func_8005DFB8(1);
    func_8005E3A8();
    SleepVProcess();
}

void ov054_Entrypoint0() {
    struct ed5c0struct *ed5c0;
    ed5c0 = &D_800ED5C0;

    ed5c0->unk1 = 0;
    func_8005CF30(10, 0); // InitObjectSystem
    func_8005E044(53, 0, 146);
}

void ov054_Entrypoint1() {
    struct ed5c0struct *ed5c0;
    ed5c0 = &D_800ED5C0;

    func_8005CF30(10, 0); // InitObjectSystem

    SetPlayerOntoChain(0, 0, 0);
    SetPlayerOntoChain(1, 0, 0);
    SetPlayerOntoChain(2, 0, 0);
    SetPlayerOntoChain(3, 0, 0);

    switch (ed5c0->unk0) {
        case 0:
            SetBoardFeatureEnabled(0x46);
            SetBoardFeatureEnabled(0x47);
            SetBoardFeatureEnabled(0x49);
            SetBoardFeatureEnabled(0x4B);
            break;

        case 1:
            SetBoardFeatureEnabled(0x47);
            SetBoardFeatureEnabled(0x49);
            break;
    }

    SetBoardFeatureEnabled(0x43);

    ov054_func_800F663C();

    D_800ED154[0] = 0;
    D_800ED154[1] = 0;
    D_800ED154[2] = 0;

    func_8005DFB8(1);
}

// 0x800F7024
void ov054_SetupRoutine() {
    s32 player_index;
    struct player *player_struct;

    func_8005CF30(80, 40); // InitObjectSystem
    func_80060088();
    func_80023448(1);
    func_800234B8(0, 0x78, 0x78, 0x78);
    func_800234B8(1, 0x40, 0x40, 0x60);
    func_80023504(1, -100.0f, 100.0f, 300.0f);
    SetupBoard(0, 0x45, 4, 0);

    // Reset animations for characters?
    func_80052E84(0);
    func_80052E84(1);
    func_80052E84(2);
    func_80052E84(3);

    for (player_index = 0; player_index < 4; player_index++) {
        player_struct = GetPlayerStruct(player_index);
        func_8003E174(player_struct->obj);
        player_struct->obj->unka |= 2;
    }

    if (IsBoardFeatureDisabled(0x4e)) {
        SetBoardFeatureDisabled(0x4e);
        ov054_func_800F67A4();
    }

    ov054_func_800F6830();
    ov054_DrawToadsOuter();
    ov054_DrawThwompsOuter();
    ov054_Draw20CoinGateOuter();

    if (!IsBoardFeatureDisabled(0xe)) {
        ov054_DrawKoopaOuter();
    }

    if (!IsBoardFeatureDisabled(0xf)) {
        ov054_DrawBooOuter();
    }

    if (!IsBoardFeatureDisabled(0xd)) {
        ov054_DrawBowserOuter();
    }
}

void ov054_Entrypoint2() {
    func_80060128(8);
    InitCameras(2);
    ov054_SetupRoutine();

    EventTableHydrate(&D_800FA0CC);

    if (!IsBoardFeatureDisabled(0xe)) {
        EventTableHydrate(&D_800FA1FC);
    }

    if (!IsBoardFeatureDisabled(0xf)) {
        EventTableHydrate(&D_800FA20C);
    }

    if (!IsBoardFeatureDisabled(0xd)) {
        EventTableHydrate(&D_800FA224);
    }

    func_800584F0(0);
}

void ov054_Entrypoint3() {
    InitCameras(1);
    ov054_SetupRoutine();
    func_800584F0(1);
}

void ov054_DrawBowserInner() {
    struct object_type *ptr;

    if (D_800FA300 != NULL) {
        return;
    }

    ptr = func_8003DBE0(0x3B, 0);
    func_8003E174(ptr);
    D_800FA300 = ptr;

    ptr->unka |= 0x2;

    func_800A0D50(&ptr->unkc, &GetSpaceData(0x70)->unk4);
    func_8003C314(7, ptr, -2, 0);
}

void ov054_DrawBowserOuter() {
    D_800FA300 = 0;
    ov054_DrawBowserInner();
}

void ov054_DrawKoopaInner() {
    struct object_type *ptr;

    if (D_800FA304 != NULL) {
        return;
    }

    ptr = func_8003DBE0(0x39, 0);
    func_8003E174(ptr);
    D_800FA304 = ptr;

    ptr->unka |= 0x2;

    func_800A0D50(&ptr->unkc, &GetSpaceData(0x5D)->unk4);
    func_8003C314(9, ptr, -1, -3);
}

void ov054_DrawKoopaOuter() {
    D_800FA304 = 0;
    ov054_DrawKoopaInner();
}

// not matching, it's just the stack size???
#ifdef OV054_NONMATCHING
void ov054_DrawToadsInner(s16 index) {
    struct object_type *ptr;
    struct space_data *spacedata;

    if (D_800FA310[index] != NULL) {
        return;
    }

    if (D_800FA308 == NULL) {
        ptr = func_8003DBE0(0x3A, 0);
        func_8003E174(ptr);
        D_800FA308 = ptr;
    }
    else {
        ptr = func_8003E320(D_800FA308);
    }

    D_800FA310[index] = ptr;
    ptr->unka = ptr->unka | 0x2;
    func_8004CDCC(ptr);
    spacedata = GetSpaceData(D_800F9928[index]);
    func_800A0D50(&ptr->unkc, &spacedata->unk4);
    func_8003C314(6, ptr, D_800F9948[index * 2], D_800F9948[(index * 2) + 1]);
}
#else
void __attribute__ ((naked)) ov054_DrawToadsInner(s16 index) {
  asm(".set noreorder\n\
    .set noat\n\
     \n\
    addiu $sp, $sp, -0x20\n\
  sw    $ra, 0x1c($sp)\n\
  sw    $s2, 0x18($sp)\n\
  sw    $s1, 0x14($sp)\n\
  sw    $s0, 0x10($sp)\n\
  addu  $s0, $a0, $zero\n\
  sll   $a0, $a0, 0x10\n\
  sra   $a0, $a0, 0xe\n\
  lui   $v0, 0x8010\n\
  addu  $v0, $v0, $a0\n\
  lw    $v0, -0x5cf0($v0)\n\
  bnez  $v0, .ov054_L800F7474\n\
   nop   \n\
  lui   $v0, 0x8010\n\
  lw    $v0, -0x5cf8($v0)\n\
  bnez  $v0, .ov054_L800F73F4\n\
   nop   \n\
  addiu $a0, $zero, 0x3a\n\
  jal   func_8003DBE0\n\
   addu  $a1, $zero, $zero\n\
  addu  $s2, $v0, $zero\n\
  jal   func_8003E174\n\
   addu  $a0, $s2, $zero\n\
  lui   $at, 0x8010\n\
  sw    $s2, -0x5cf8($at)\n\
  j     ov054_func_800F7408\n\
   sll   $s0, $s0, 0x10\n\
.ov054_L800F73F4:\n\
  lui   $a0, 0x8010\n\
  lw    $a0, -0x5cf8($a0)\n\
  jal   func_8003E320\n\
   sll   $s0, $s0, 0x10\n\
  addu  $s2, $v0, $zero\n\
ov054_func_800F7408:\n\
  sra   $s0, $s0, 0x10\n\
  sll   $s1, $s0, 2\n\
  lui   $at, 0x8010\n\
  addu  $at, $at, $s1\n\
  sw    $s2, -0x5cf0($at)\n\
  lhu   $v0, 0xa($s2)\n\
  ori   $v0, $v0, 2\n\
  sh    $v0, 0xa($s2)\n\
  jal   func_8004CDCC\n\
   addu  $a0, $s2, $zero\n\
  sll   $s0, $s0, 1\n\
  lui   $a0, 0x8010\n\
  addu  $a0, $a0, $s0\n\
  jal   GetSpaceData\n\
   lh    $a0, -0x66d8($a0)\n\
  addiu $a0, $s2, 0xc\n\
  jal   func_800A0D50\n\
   addiu $a1, $v0, 4\n\
  addiu $a0, $zero, 6\n\
  lui   $a2, 0x8010\n\
  addu  $a2, $a2, $s1\n\
  lh    $a2, -0x66b8($a2)\n\
  lui   $a3, 0x8010\n\
  addu  $a3, $a3, $s1\n\
  lh    $a3, -0x66b6($a3)\n\
  jal   func_8003C314\n\
   addu  $a1, $s2, $zero\n\
.ov054_L800F7474:\n\
  lw    $ra, 0x1c($sp)\n\
  lw    $s2, 0x18($sp)\n\
  lw    $s1, 0x14($sp)\n\
  lw    $s0, 0x10($sp)\n\
  jr    $ra\n\
   addiu $sp, $sp, 0x20\n\
   .set reorder\n\
   .set at");
}
#endif

// draw_toads_outer
void ov054_DrawToadsOuter() {
    s32 i;

    D_800FA308 = NULL;
    for (i = 0; i < ov054_DK_STAR_COUNT; i++) {
        D_800FA310[i] = 0;
        if (!IsBoardFeatureDisabled(D_800F9938[i])) {
            ov054_DrawToadsInner(i);
        }
    }
}

void ov054_DrawThwompsInner(s16 index) {
    struct object_type *ptr;
    struct space_data *spacedata_temp;

    if (D_800FA330[index] != NULL) {
        return;
    }

    if (D_800FA32C == NULL) {
        ptr = func_8003DBE0(0xA, &D_800F9984);
        func_8003E174(ptr);
        D_800FA32C = ptr;
    }
    else {
        ptr = func_8003E320(D_800FA32C);
    }

    D_800FA330[index] = ptr;
    func_800A0D00(&ptr->unk36, 0.8f, 0.8f, 0.8f);
    ptr->unka |= 0x2;

    if (D_800ED154[D_800F9964[index]] == 0) {
        spacedata_temp = GetSpaceData(D_800F996C[index]);
    }
    else {
        spacedata_temp = GetSpaceData(D_800F9974[index]);
    }
    func_800A0D50(&ptr->unkc, &spacedata_temp->unk4);
    func_800A0E80(&ptr->unk24, &GetSpaceData(D_800F997C[index])->unk4, &ptr->unkc);
}

// draw_thwomps_outer
void ov054_DrawThwompsOuter() {
    s32 i;

    D_800FA32C = NULL;
    for (i = 0; i < ov054_DK_THWOMP_COUNT; i++) {
        ov054_DrawThwompsInner(i);
    }
}

// Feels like this is right, why is sp+16 being used?
#ifdef OV054_NONMATCHING
void ov054_DrawBooInner(s16 index) {
    struct object_type *ptr;

    if (D_800FA340[index] != NULL) {
        return;
    }

    if (D_800FA33C == NULL) {
        ptr = func_8003DBE0(106, 0);
        func_8003E174(ptr);
        D_800FA33C = ptr;
    }
    else {
        ptr = func_8003E320(D_800FA33C);
    }

    D_800FA340[index] = ptr;
    ptr->unka |= 0x2;
    func_800A0D00(&ptr->unk36, 0.6f, 0.6f, 0.6f);
    ptr->unk48 = 100.0f;

    func_800A0D50(&ptr->unkc, &GetSpaceData(D_800F998C[index])->unk4);
    func_8003C314(8, &ptr, 0, 0);
}
#else
void __attribute__ ((naked)) ov054_DrawBooInner(s16 index) {
  asm(".set noreorder\n\
    .set noat\n\
     \n\
    addiu $sp, $sp, -0x20\n\
  sw    $ra, 0x18($sp)\n\
  sw    $s1, 0x14($sp)\n\
  sw    $s0, 0x10($sp)\n\
  addu  $s0, $a0, $zero\n\
  sll   $a0, $a0, 0x10\n\
  sra   $a0, $a0, 0xe\n\
  lui   $v0, 0x8010\n\
  addu  $v0, $v0, $a0\n\
  lw    $v0, -0x5cc0($v0)\n\
  bnez  $v0, .ov054_L800F77A4\n\
   nop   \n\
  lui   $v0, 0x8010\n\
  lw    $v0, -0x5cc4($v0)\n\
  bnez  $v0, .ov054_L800F7714\n\
   addiu $a0, $zero, 0x6a\n\
  jal   func_8003DBE0\n\
   addu  $a1, $zero, $zero\n\
  addu  $s1, $v0, $zero\n\
  jal   func_8003E174\n\
   addu  $a0, $s1, $zero\n\
  lui   $at, 0x8010\n\
  sw    $s1, -0x5cc4($at)\n\
  j     ov054_func_800F7728\n\
   sll   $s0, $s0, 0x10\n\
.ov054_L800F7714:\n\
  lui   $a0, 0x8010\n\
  lw    $a0, -0x5cc4($a0)\n\
  jal   func_8003E320\n\
   sll   $s0, $s0, 0x10\n\
  addu  $s1, $v0, $zero\n\
ov054_func_800F7728:\n\
  sra   $s0, $s0, 0x10\n\
  sll   $v0, $s0, 2\n\
  lui   $at, 0x8010\n\
  addu  $at, $at, $v0\n\
  sw    $s1, -0x5cc0($at)\n\
  lhu   $v0, 0xa($s1)\n\
  ori   $v0, $v0, 2\n\
  sh    $v0, 0xa($s1)\n\
  addiu $a0, $s1, 0x24\n\
  lui   $a1, 0x3f19\n\
  ori   $a1, $a1, 0x999a\n\
  addu  $a2, $a1, $zero\n\
  jal   func_800A0D00\n\
   addu  $a3, $a1, $zero\n\
  lui   $at, 0x42c8\n\
  mtc1  $at, $f0\n\
  nop   \n\
  swc1  $f0, 0x30($s1)\n\
  sll   $s0, $s0, 1\n\
  lui   $a0, 0x8010\n\
  addu  $a0, $a0, $s0\n\
  jal   GetSpaceData\n\
   lh    $a0, -0x6674($a0)\n\
  addiu $a0, $s1, 0xc\n\
  jal   func_800A0D50\n\
   addiu $a1, $v0, 4\n\
  addiu $a0, $zero, 8\n\
  addu  $a1, $s1, $zero\n\
  addu  $a2, $zero, $zero\n\
  jal   func_8003C314\n\
   addu  $a3, $zero, $zero\n\
.ov054_L800F77A4:\n\
  lw    $ra, 0x18($sp)\n\
  lw    $s1, 0x14($sp)\n\
  lw    $s0, 0x10($sp)\n\
  jr    $ra\n\
   addiu $sp, $sp, 0x20\n\
   .set reorder\n\
   .set at");
}
#endif

// boo_draw_outer
void ov054_DrawBooOuter() {
    s32 i;

    D_800FA33C = 0;
    for (i = 0; i < ov054_DK_BOO_COUNT; i++) {
        ov054_DrawBooInner(i);
    }
}

void ov054_Draw20CoinGateInner(s16 index) {
    struct object_type *ptr;

    if (D_800FA34C[index] != NULL) {
        return;
    }

    if (D_800FA348 == NULL) {
        ptr = func_8003DBE0(41, 0);
        func_8003E174(ptr);
        D_800FA348 = ptr;
    }
    else {
        ptr = func_8003E320(D_800FA348);
    }

    ptr->unka |= 0x2;
    D_800FA34C[index] = ptr;
    func_800A0D50(&ptr->unkc, &GetSpaceData(D_800F9990[index])->unk4);
    func_8004CD48(ptr, D_800F9994[index]);
}

void ov054_Draw20CoinGateOuter() {
    s32 i;

    D_800FA348 = NULL;
    for (i = 0; i < ov054_DK_COIN_GATE_COUNT; i++) {
        ov054_Draw20CoinGateInner(i);
    }
}

void ov054_AllGatesArrowSetup() {
    while (func_8004B850()) {
        SleepVProcess();
    }
    SleepVProcess();

    D_800FA354 = func_80045D84(0, 0x92, 1);
    D_800FA358 = func_80045D84(1, 0xA0, 1);
    D_800FA35C = func_80045D84(3, 0xAE, 1);
    D_800FA360 = func_80045D84(0xB, 0xBC, 1);

    SleepProcess(3);

    D_800EE320 = 1;
}

// 0x800F79D0
void ov054_AllGatesArrowTeardown() {
    D_800EE320 = 0;
    func_80045E6C(D_800FA354);
    func_80045E6C(D_800FA358);
    func_80045E6C(D_800FA35C);
    func_80045E6C(D_800FA360);
}

// 800F7A1C
void ov054_ThwompSplit_74_PassingEvent() {
    void *arrowsObj;

    SetAnimation(-1, -1, 2);
    SleepVProcess();
    if (PlayerHasCoins(-1, 10)) {
        ov054_AllGatesArrowSetup();
        arrowsObj = SpawnDirArrows(-1, &D_800F9F5C);
        InitDirArrows(arrowsObj, -1, 0);
        if (PlayerIsCPU(-1)) {
            {
                s32 i;
                s32 decision = RunDecisionTree(&D_800F9ADC);
                for (i = 0; i < decision; i++) {
                    func_8003BE84(arrowsObj, -2);
                }
            }
            func_8003BE84(arrowsObj, -4);
        }

        {
            u32 decision2 = DirectionPrompt(arrowsObj);
            FreeObject(arrowsObj);
            ov054_AllGatesArrowTeardown();

            if (D_800ED154[0] == 0 & decision2 != 0) {
                SetNextChainAndSpace(-1, 3, 0);
            }
            else if (D_800ED154[0] != 0 & decision2 == 0) {
                SetNextChainAndSpace(-1, 1, 0);
            }
            else {
                D_800ED172 = 0;
                func_800587EC(0x47, 0, 1);
                func_8004CB20(1);
            }
        }
    }
    else {
        while (IsCameraMoving()) {
            SleepVProcess();
        }
        SleepVProcess();
        {
            s16 win_id = CreateTextWindow(0x32, 0x3C, 12, 2);
            LoadStringIntoWindow(win_id, 0x18B, -1, -1);
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            PlaySound(0x8F);
            func_8004DBD4(win_id, GetCurrentPlayerIndex());
            HideTextWindow(win_id);
        }

        if (D_800ED154[0] == 0) {
            SetNextChainAndSpace(-1, 3, 0);
        }
        else {
            SetNextChainAndSpace(-1, 1, 0);
        }
    }

    EndProcess(NULL);
}

void ov054_ThwompSplit_74_2_Event() {
  if (D_800ED154[0] != 0) {
      SetNextChainAndSpace(-1, 1, 0);
  }
  else {
      SetNextChainAndSpace(-1, 3, 0);
  }
}

void ov054_ThwompSplit_7E_PassingEvent() {
    void *arrowsObj;

    SetAnimation(-1, -1, 2);
    SleepVProcess();
    if (PlayerHasCoins(-1, 10)) {
        ov054_AllGatesArrowSetup();
        arrowsObj = SpawnDirArrows(-1, &D_800F9F7C);
        InitDirArrows(arrowsObj, -1, 0);
        if (PlayerIsCPU(-1)) {
            {
                s32 i = 0;
                s32 decision = RunDecisionTree(&D_800F9C74);
                for (i = 0; i < decision; i++) {
                    func_8003BE84(arrowsObj, -2);
                }
            }
            func_8003BE84(arrowsObj, -4);
        }

        {
            u32 decision2 = DirectionPrompt(arrowsObj);
            FreeObject(arrowsObj);
            ov054_AllGatesArrowTeardown();

            if (D_800ED154[1] == 0 & decision2 != 0) {
                SetNextChainAndSpace(-1, 0xF, 0);
            }
            else if (D_800ED154[1] != 0 & decision2 == 0) {
                SetNextChainAndSpace(-1, 0xE, 0);
            }
            else {
                D_800ED172 = 1;
                func_800587EC(0x47, 0, 1);
                func_8004CB20(1);
            }
        }
    }
    else {
        while (IsCameraMoving()) {
            SleepVProcess();
        }
        SleepVProcess();
        {
            s16 win_id = CreateTextWindow(0x32, 0x3C, 12, 2);
            LoadStringIntoWindow(win_id, 0x18B, -1, -1);
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            PlaySound(0x8F);
            func_8004DBD4(win_id, GetCurrentPlayerIndex());
            HideTextWindow(win_id);
        }

        if (D_800ED154[1] == 0) {
            SetNextChainAndSpace(-1, 0xF, 0);
        }
        else {
            SetNextChainAndSpace(-1, 0xE, 0);
        }
    }

    EndProcess(NULL);
}

void ov054_ThwompSplit_7E_2_Event() {
    if (D_800ED154[1] != 0) {
        SetNextChainAndSpace(-1, 0xE, 0);
    }
    else {
        SetNextChainAndSpace(-1, 0xF, 0);
    }
}

void ov054_ThwompSplit_85_PassingEvent() {
    void *arrowsObj;

    SetAnimation(-1, -1, 2);
    SleepVProcess();
    if (PlayerHasCoins(-1, 10)) {
      ov054_AllGatesArrowSetup();
      arrowsObj = SpawnDirArrows(-1, &D_800F9F9C);
      InitDirArrows(arrowsObj, -1, 0);
      if (PlayerIsCPU(-1)) {
          {
              s32 i;
              s32 decision = RunDecisionTree(&D_800F9D7C);
              for (i = 0; i < decision; i++) {
                 func_8003BE84(arrowsObj, -2);
              }
          }
          func_8003BE84(arrowsObj, -4);
      }

      {
          u32 decision2 = DirectionPrompt(arrowsObj);
          FreeObject(arrowsObj);
          ov054_AllGatesArrowTeardown();

          if (D_800ED154[2] == 0 & decision2 == 0) {
              SetNextChainAndSpace(-1, 0x6, 0);
          }
          else if (D_800ED154[2] != 0 & decision2 != 0) {
              SetNextChainAndSpace(-1, 0x5, 0);
          }
          else {
              D_800ED172 = 2;
              func_800587EC(0x47, 0, 1);
              func_8004CB20(1);
          }
      }
    }
    else {
        while (IsCameraMoving()) {
            SleepVProcess();
        }
        SleepVProcess();
        {
            s16 win_id = CreateTextWindow(0x32, 0x3C, 12, 2);
            LoadStringIntoWindow(win_id, 0x18B, -1, -1);
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            PlaySound(0x8F);
            func_8004DBD4(win_id, GetCurrentPlayerIndex());
            HideTextWindow(win_id);
        }

        if (D_800ED154[2] == 0) {
            SetNextChainAndSpace(-1, 0x6, 0);
        }
        else {
            SetNextChainAndSpace(-1, 0x5, 0);
        }
    }

    EndProcess(NULL);
}

void ov054_ThwompSplit_85_2_Event() {
    if (D_800ED154[2] != 0) {
        SetNextChainAndSpace(-1, 0x5, 0);
    }
    else {
        SetNextChainAndSpace(-1, 0x6, 0);
    }
}

struct ov054_16byte_struct {
    s8 pad[16];
};

// 800F8114
void ov054_PostThwompIntersectionEventProcess() {
    struct process *some_struct1;
    struct ov054_unk_event_user_data *user_data;
    struct object_type *user_data_unk0cache;
    struct object_type *user_data_unk4cache;
    struct process *fromret;
    struct ov054_16byte_struct unkcptr;
    void *unkccache;
    void *unk24cache;

    some_struct1 = func_800633A8();
    user_data = some_struct1->user_data;

    user_data_unk0cache = user_data->unk0;
    user_data_unk4cache = user_data->unk4;

    func_8003E81C(user_data_unk0cache, 0, 2);
    user_data_unk4cache = (struct object_type *)&user_data_unk4cache->unk4;
    unkccache = &user_data_unk0cache->unkc;
    func_800A0E80(&unkcptr, user_data_unk4cache, unkccache);
    unk24cache = &user_data_unk0cache->unk24;
    fromret = func_8004D1EC(unk24cache, &unkcptr, unk24cache, 10);
    func_80063270(some_struct1, fromret);
    func_80063358();
    func_800A0D50(&unkcptr, unkccache);
    fromret = func_8004D3F4(&unkcptr, user_data_unk4cache, unkccache, 25);
    func_80063270(some_struct1, fromret);
    func_80063358();
    user_data_unk4cache = user_data->unk8;
    func_800A0E80(&unkcptr, &user_data_unk4cache->unk4, unkccache);
    fromret = func_8004D1EC(unk24cache, &unkcptr, unk24cache, 10);
    func_80063270(some_struct1, fromret);
    func_80063358();
    func_8003E81C(user_data_unk0cache, -1, 2);
    EndProcess(NULL);
}

struct post_thwomp_proc_args {
    void *unkptr;
    struct space_data *unkspacedata1;
    struct space_data *unkspacedata2;
};

// 800F8248
#ifdef OV054_NONMATCHING
// This is totally matching, but it has a jump table.
// Seems we'd need to figure out the float assembler issue first,
// to use rodata in any partial manner.
void ov054_PostThwompIntersectionEvent() {
    s16 idx;
    s16 a0;
    s16 s2;
    struct process *some_struct;
    struct post_thwomp_proc_args *proc_args;

    idx = GetCurrentSpaceIndex();

    a0 = -1;
    s2 = 0;

    switch (idx) {
        case 69:
            a0 = 101;
            D_800ED154[0] = 1;
            s2 = 0;
            break;

        case 72:
            a0 = 104;
            D_800ED154[0] = 0;
            s2 = 0;
            break;

        case 56:
            s2 = 1;
            D_800ED154[1] = 1;
            a0 = 108;
            break;

        case 66:
            a0 = 102;
            D_800ED154[1] = 0;
            s2 = 1;
            break;

        case 26:
            a0 = 94;
            D_800ED154[2] = 1;
            s2 = 2;
            break;

        case 37:
            a0 = 103;
            s2 = 2;
            D_800ED154[2] = 0;
            break;
    }

    if (a0 != 0) {
        some_struct = InitProcess(ov054_PostThwompIntersectionEventProcess, 18432, 0, 64);
        proc_args = (struct post_thwomp_proc_args *)Malloc(some_struct->heap, 12);
        some_struct->user_data = proc_args;

        proc_args->unkptr = D_800FA330[s2]; // bss_thwomp_2
        proc_args->unkspacedata1 = GetSpaceData(a0);
        proc_args->unkspacedata2 = GetSpaceData(D_800F997C[s2]);
    }

    EndProcess(NULL);
}
#else
void __attribute__ ((naked)) ov054_PostThwompIntersectionEvent() {
  asm(".set noreorder\n\
    .set noat\n\
     \n\
      addiu $sp, $sp, -0x28\n\
    sw    $ra, 0x20($sp)\n\
    sw    $s3, 0x1c($sp)\n\
    sw    $s2, 0x18($sp)\n\
    sw    $s1, 0x14($sp)\n\
    jal   GetCurrentSpaceIndex\n\
     sw    $s0, 0x10($sp)\n\
    addiu $a0, $zero, -1\n\
    addiu $v0, $v0, -0x1a\n\
    sll   $v0, $v0, 0x10\n\
    sra   $v1, $v0, 0x10\n\
    sltiu $v0, $v1, 0x2f\n\
    beqz  $v0, .ov054_L800F8314\n\
     addu  $s2, $zero, $zero\n\
    sll   $v0, $v1, 2\n\
    lui   $at, 0x8010\n\
    addu  $at, $at, $v0\n\
    lw    $v0, -0x5dc0($at)\n\
    jr    $v0\n\
     nop   \n\
    addiu $a0, $zero, 0x65\n\
    addiu $v0, $zero, 1\n\
    lui   $at, 0x800f\n\
    sh    $v0, -0x2eac($at)\n\
    j     .ov054_L800F8314\n\
     addu  $s2, $zero, $zero\n\
    addiu $a0, $zero, 0x68\n\
    lui   $at, 0x800f\n\
    sh    $zero, -0x2eac($at)\n\
    j     .ov054_L800F8314\n\
     addu  $s2, $zero, $zero\n\
    addiu $s2, $zero, 1\n\
    lui   $at, 0x800f\n\
    sh    $s2, -0x2eaa($at)\n\
    j     .ov054_L800F8314\n\
     addiu $a0, $zero, 0x6c\n\
    addiu $a0, $zero, 0x66\n\
    lui   $at, 0x800f\n\
    sh    $zero, -0x2eaa($at)\n\
    j     .ov054_L800F8314\n\
     addiu $s2, $zero, 1\n\
    addiu $a0, $zero, 0x5e\n\
    addiu $v0, $zero, 1\n\
    lui   $at, 0x800f\n\
    sh    $v0, -0x2ea8($at)\n\
    j     .ov054_L800F8314\n\
     addiu $s2, $zero, 2\n\
    addiu $a0, $zero, 0x67\n\
    addiu $s2, $zero, 2\n\
    lui   $at, 0x800f\n\
    sh    $zero, -0x2ea8($at)\n\
  .ov054_L800F8314:\n\
    sll   $v0, $a0, 0x10\n\
    sra   $s3, $v0, 0x10\n\
    beqz  $s3, .ov054_L800F838C\n\
     addiu $a1, $zero, 0x4800\n\
    lui   $a0, 0x8010\n\
    addiu $a0, $a0, -0x7eec\n\
    addu  $a2, $zero, $zero\n\
    jal   InitProcess\n\
     addiu $a3, $zero, 0x40\n\
    addu  $s0, $v0, $zero\n\
    lw    $a0, 0x18($s0)\n\
    jal   Malloc\n\
     addiu $a1, $zero, 0xc\n\
    addu  $s1, $v0, $zero\n\
    sw    $s1, 0x8c($s0)\n\
    addu  $s0, $s2, $zero\n\
    sll   $v0, $s0, 2\n\
    lui   $at, 0x8010\n\
    addu  $at, $at, $v0\n\
    lw    $v0, -0x5cd0($at)\n\
    sw    $v0, ($s1)\n\
    jal   GetSpaceData\n\
     addu  $a0, $s3, $zero\n\
    sw    $v0, 4($s1)\n\
    sll   $s0, $s0, 1\n\
    lui   $a0, 0x8010\n\
    addu  $a0, $a0, $s0\n\
    jal   GetSpaceData\n\
     lh    $a0, -0x6684($a0)\n\
    sw    $v0, 8($s1)\n\
  .ov054_L800F838C:\n\
    jal   EndProcess\n\
     addu  $a0, $zero, $zero\n\
    lw    $ra, 0x20($sp)\n\
    lw    $s3, 0x1c($sp)\n\
    lw    $s2, 0x18($sp)\n\
    lw    $s1, 0x14($sp)\n\
    lw    $s0, 0x10($sp)\n\
    jr    $ra\n\
     addiu $sp, $sp, 0x28\n\
    .set at\n\
    .set reorder");
}
#endif

void ov054_MoveModelsForBoulder() {
    struct space_data *spacedata;

    if (!IsBoardFeatureDisabled(13)) {
        spacedata = GetSpaceData(106); // Bowser's alternate location space
        func_800A0D50(&D_800FA300->unkc, &spacedata->unk4);
    }

    if (!IsBoardFeatureDisabled(72)) {
        spacedata = GetSpaceData(105);
        func_800A0D50(&D_800FA318->unkc, &spacedata->unk4);
    }

    if (!IsBoardFeatureDisabled(74)) {
        spacedata = GetSpaceData(107);
        func_800A0D50(&D_800FA320->unkc, &spacedata->unk4);
    }
}

void ov054_RestoreModelsAfterBoulder() {
    struct space_data *spacedata;

    if (!IsBoardFeatureDisabled(13)) {
        spacedata = GetSpaceData(112); // Bowser's regular space
        func_800A0D50(&D_800FA300->unkc, &spacedata->unk4);
    }

    if (!IsBoardFeatureDisabled(72)) {
        spacedata = GetSpaceData(109);
        func_800A0D50(&D_800FA318->unkc, &spacedata->unk4);
    }

    if (!IsBoardFeatureDisabled(74)) {
        spacedata = GetSpaceData(113);
        func_800A0D50(&D_800FA320->unkc, &spacedata->unk4);
    }
}

void ov054_BoulderFunc_800F84E0() {
    func_800726AC(4, 16);
    SleepProcess(16);
    ov054_MoveModelsForBoulder();
    func_8004A7DC();
    func_8004A7A4();

    D_800FA364 = func_8004B844();
    func_8004B838(-1.0f); // NOMATCHING: Reads from rodata, bad delay slot

    D_800FA368 = func_8004B5D0();
    func_8004B5C4(1.0f); // NOMATCHING: Bad delay slot

    func_8004A510();

    // Space index 0 is start of boulder path.
    func_8004B5DC(&GetSpaceData(0)->unk4);

    SleepVProcess();

    func_8004A520();

    func_8004B5C4(D_800FA368);
    func_8004B838(D_800FA364);

    func_800421E0();
    func_80072644(4, 16);
    SleepProcess(16);
}

void ov054_BoulderEventProcess2Inner() {
    func_800726AC(4, 16);
    SleepProcess(16);
    ov054_RestoreModelsAfterBoulder();
    func_8004A7DC();
    func_8004A7A4();

    D_800FA364 = func_8004B844();
    func_8004B838(-1.0f); // NONMATCHING: Reads from rodata, bad delay slot

    D_800FA368 = func_8004B5D0();
    func_8004B5C4(1.0f); // NONMATCHING: Bad delay slot

    func_8004A510();

    func_8004B5DC(&GetPlayerStruct(-1)->obj->unkc);

    SleepVProcess();
    func_8004A520();

    func_8004B5C4(D_800FA368);
    func_8004B838(D_800FA364);
    func_8004220C();
    func_80072644(4, 16);
    SleepProcess(16);
}

// 800F869C
void ov054_BoulderEventProcess() {
    s16 s3;
    struct player *args_player;
    struct object_type *player_obj;
    struct process *proc_struct;
    struct object_type *boulder_obj;
    void *boulder_unkc_cached;
    struct ov054_16byte_struct sp10; // maybe
    void *sp24;

    s3 = 0;
    args_player = (func_800633A8())->user_data;
    player_obj = args_player->obj;

    boulder_obj = D_800FA370;
    boulder_unkc_cached = &boulder_obj->unkc;

    proc_struct = func_800633A8();

    sp24 = func_80058A4C(args_player->id, 0, 10);

    while (TRUE) {
        {
            s16 abs_index;
            struct space_data *spacedata;
            f32 fret;

            abs_index = GetAbsSpaceIndexFromChainSpaceIndex(args_player->cur_chain_index, args_player->cur_space_index);
            spacedata = GetSpaceData(abs_index);
            fret = func_800A13C0(&spacedata->unk4, boulder_unkc_cached);

            if (fret < 310.0f) {
                break;
            }

            func_8004CCD0(&player_obj->unkc, boulder_unkc_cached, &player_obj->unk24);
            SleepVProcess();
        }
    }

    func_80060618(1119, args_player->id);

    {
        s16 chain_len;
        s16 spaces_left;
        void *unkccache;
        void *unk24cache;

        chain_len = GetChainLength(args_player->cur_chain_index);
        spaces_left = chain_len - args_player->cur_space_index;

        func_80052BE8(args_player->id, 1, 2);

        while (spaces_left > 0) {
          {
              struct process *fromret;
              s32 ONE = 1;

              unk24cache = &player_obj->unk24;
              unkccache = &player_obj->unkc;

              if (spaces_left == ONE) {
                  SetNextChainAndSpace(args_player->id, 9, 1);
              }

              if (s3 == 124) {
                  player_obj->funk52 = 40.0f;
                  player_obj->funk56 = -5.0f;
                  func_80052BE8(args_player->id, 2, 0);
              }
              if (s3 == 36) {
                  func_80052BE8(args_player->id, -1, 2);
                  func_800A0E80(&sp10, &boulder_obj->unkc, &player_obj->unkc);
                  func_8004D1EC(unk24cache, &sp10, unk24cache, 8);
                  SleepProcess(30);
                  func_80052BE8(args_player->id, 1, 2);
              }

              if (args_player->obj->funk56 == 0.0f && args_player->obj->unk70 != ONE) {
                  func_80052BE8(args_player->id, 1, 2);
              }

              s3 = GetAbsSpaceIndexFromChainSpaceIndex(args_player->next_chain_index, args_player->next_space_index);
              func_8004CB70(args_player->id, s3, &sp10);
              func_8004CCD0(unkccache, &sp10, &player_obj->unk24);
              fromret = func_8004D648(unkccache, &sp10, unkccache, 20.0f);
              func_80063270(proc_struct, fromret);
              func_80063358();
              SetPlayerOntoChain(args_player->id, args_player->next_chain_index, args_player->next_space_index);
          }

          spaces_left--;
        }
    }

    func_80052BE8(args_player->id, -1, 2);
    func_80058AD0(sp24);
    EndProcess(NULL);
}

// 800F8978
void ov054_BoulderEventProcess_2() {
    s32 value;

    value = func_80056E3C();

    func_80056E30(0);
    ov054_BoulderFunc_800F84E0();

    while (D_800FA370 != NULL) {
        func_8004B5DC(&D_800FA370->unkc);
        SleepVProcess();
    }

    ov054_BoulderEventProcess2Inner();
    func_80056E30(value);
    EndProcess(NULL);
}

// The boulder event appears to use a struct on the stack...
// Or at least, something ends up on sp+16.
struct boulder_unk_struct {
  s8 pad[8];
};

#ifdef OV054_NONMATCHING
// This is a decent effort, but it still has "solvable" non-matchings.
// The float issues make it hard to iron out the rest of the problems.
void ov054_BoulderEvent() {
    s32 cur_player_index;
    s32 num_players_in_boulders_path;
    struct process *proc_struct;
    struct boulder_unk_struct boulder_unk;

    proc_struct = func_800633A8();

    num_players_in_boulders_path = 0;

    for (cur_player_index = 0; cur_player_index < 4; cur_player_index++) {
        {
            s16 cur_abs;
            s16 chspcidx;
            struct process *some_struct;
            struct player *plstr;

            plstr = GetPlayerStruct(cur_player_index);
            cur_abs = GetAbsSpaceIndexFromChainSpaceIndex(plstr->cur_chain_index, plstr->cur_space_index);
            chspcidx = GetChainSpaceIndexFromAbsSpaceIndex(cur_abs, 17);

            if (chspcidx >= 0) {
                {
                    s16 next = chspcidx + 1;

                    plstr->cur_chain_index = 17;
                    plstr->cur_space_index = chspcidx;
                    plstr->next_chain_index = 17;
                    plstr->next_space_index = next;
                }

                some_struct = InitProcess(ov054_BoulderEventProcess, 18432, 0, 0);
                some_struct->user_data = plstr;

                num_players_in_boulders_path++;
            }
        }
    }

    if (num_players_in_boulders_path == 0) {
        {
            struct player *plstr;
            struct object_type *player_obj;
            s16 win_id;
            struct process *fromret;

            plstr = GetPlayerStruct(-1);
            player_obj = plstr->obj;
            func_8004CD84(&boulder_unk);
            func_8003D514(&boulder_unk, 0);
            fromret = func_8004D1EC(&player_obj->unk24, &boulder_unk, &player_obj->unk24, 6);
            func_80063270(proc_struct, fromret);
            func_80063358();

            win_id = CreateTextWindow(75, 64, 14, 1);
            LoadStringIntoWindow(win_id, 404, -1, -1); // "Huh? Nothing happened!?!"
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            func_8004DBD4(win_id, GetCurrentPlayerIndex());
            HideTextWindow(win_id);
            EndProcess(NULL);
        }
    }

    D_800FA36C = 0;
    D_800FA370 = NULL;

    {
        struct object_type *obj;
        s32 s7;
        s16 **boulder_indices_ptr;

        InitProcess(ov054_BoulderEventProcess_2, 4099, 0, 0);
        obj = func_8003DBE0(38, 0);
        D_800FA370 = obj;

        func_800A0D50(&obj->unkc, &GetSpaceData(0)->unk4);
        func_800A0D00(&obj->unk36, 0.8f, 0.8f, 0.8f);
        SleepProcess(30);
        s7 = PlaySound(139);

        boulder_indices_ptr = D_800F9FCC;
        while (*boulder_indices_ptr[0] >= 0) {
            {
                void *unkccache;
                void *unk24cache;
                struct space_data *spacedata;
                void *spacedataunk4;
                struct process *fromret;

                unkccache = &obj->unkc;
                unk24cache = &obj->unk24;

                spacedataunk4 = &GetSpaceData(*boulder_indices_ptr[0])->unk4;
                func_8004CCD0(unkccache, spacedataunk4, unk24cache);
                fromret = func_8004D648(unkccache, spacedataunk4, unkccache, 20.0f);
                func_80063270(proc_struct, fromret);
                func_80063358();

                if (*boulder_indices_ptr[0] == 6) {
                    func_800A0E80(&boulder_unk, &GetSpaceData(*boulder_indices_ptr[1])->unk4, unkccache);
                    func_8004D1EC(unk24cache, &boulder_unk, unk24cache, 20);

                    obj->funk52 = 38.0f;
                    obj->funk56 = -2.0f;

                    PlaySound(141);
                    func_80060758(139);

                    while (obj->funk56 != 0.0) { // unintentional double math
                        SleepVProcess();
                    }

                    PlaySound(141);
                    s7 = PlaySound(139);
                }
            }
            *boulder_indices_ptr++;
        }

        func_80060BC8(s7, 30);
        func_8003E694(obj);
    }

    D_800FA370 = NULL;
    SleepProcess(30);
    D_800FA36C = 1;
    EndProcess(NULL);
}
#else
void __attribute__ ((naked)) ov054_BoulderEvent() {
  asm(".set noreorder\n\
  .set noat\n\
     \n\
    addiu $sp, $sp, -0x50\n\
  sw    $ra, 0x44($sp)\n\
  sw    $fp, 0x40($sp)\n\
  sw    $s7, 0x3c($sp)\n\
  sw    $s6, 0x38($sp)\n\
  sw    $s5, 0x34($sp)\n\
  sw    $s4, 0x30($sp)\n\
  sw    $s3, 0x2c($sp)\n\
  sw    $s2, 0x28($sp)\n\
  sw    $s1, 0x24($sp)\n\
  sw    $s0, 0x20($sp)\n\
  sdc1  $f20, 0x48($sp)\n\
  jal   func_800633A8\n\
   addu  $s3, $zero, $zero\n\
  addu  $fp, $v0, $zero\n\
  addu  $s1, $zero, $zero\n\
  addiu $s2, $zero, 0x11\n\
 .ov054_L800F8A44:\n\
  jal   GetPlayerStruct\n\
   addu  $a0, $s3, $zero\n\
  addu  $s0, $v0, $zero\n\
  lhu   $a0, 0xe($s0)\n\
  jal   GetAbsSpaceIndexFromChainSpaceIndex\n\
   lhu   $a1, 0x10($s0)\n\
  sll   $v0, $v0, 0x10\n\
  sra   $a0, $v0, 0x10\n\
  jal   GetChainSpaceIndexFromAbsSpaceIndex\n\
   addiu $a1, $zero, 0x11\n\
  addu  $v1, $v0, $zero\n\
  sll   $v0, $v1, 0x10\n\
  bltz  $v0, .ov054_L800F8AAC\n\
   addiu $v0, $v1, 1\n\
  sh    $s2, 0xe($s0)\n\
  sh    $v1, 0x10($s0)\n\
  sh    $s2, 0x12($s0)\n\
  sh    $v0, 0x14($s0)\n\
  lui   $a0, 0x8010\n\
  addiu $a0, $a0, -0x7964\n\
  addiu $a1, $zero, 0x4800\n\
  addu  $a2, $zero, $zero\n\
  jal   InitProcess\n\
   addu  $a3, $zero, $zero\n\
  sw    $s0, 0x8c($v0)\n\
  addiu $s1, $s1, 1\n\
 .ov054_L800F8AAC:\n\
  addiu $s3, $s3, 1\n\
  slti  $v0, $s3, 4\n\
  bnez  $v0, .ov054_L800F8A44\n\
   nop   \n\
  bnez  $s1, .ov054_L800F8B78\n\
   nop   \n\
  jal   GetPlayerStruct\n\
   addiu $a0, $zero, -1\n\
  lw    $s2, 0x20($v0)\n\
  jal   func_8004CD84\n\
   addiu $a0, $sp, 0x10\n\
  addiu $a0, $sp, 0x10\n\
  jal   func_8003D514\n\
   addu  $a1, $zero, $zero\n\
  addiu $a2, $s2, 0x18\n\
  addu  $a0, $a2, $zero\n\
  addiu $a1, $sp, 0x10\n\
  jal   func_8004D1EC\n\
   addiu $a3, $zero, 6\n\
  addu  $a0, $fp, $zero\n\
  jal   func_80063270\n\
   addu  $a1, $v0, $zero\n\
  jal   func_80063358\n\
   nop   \n\
  addiu $a0, $zero, 0x4b\n\
  addiu $a1, $zero, 0x40\n\
  addiu $a2, $zero, 0xe\n\
  jal   CreateTextWindow\n\
   addiu $a3, $zero, 1\n\
  sll   $s0, $v0, 0x10\n\
  sra   $s0, $s0, 0x10\n\
  addu  $a0, $s0, $zero\n\
  addiu $a1, $zero, 0x194\n\
  addiu $a2, $zero, -1\n\
  jal   LoadStringIntoWindow\n\
   addiu $a3, $zero, -1\n\
  addu  $a0, $s0, $zero\n\
  jal   SetTextCharsPerFrame\n\
   addu  $a1, $zero, $zero\n\
  jal   ShowTextWindow\n\
   addu  $a0, $s0, $zero\n\
  jal   GetCurrentPlayerIndex\n\
   nop   \n\
  sll   $v0, $v0, 0x10\n\
  addu  $a0, $s0, $zero\n\
  jal   func_8004DBD4\n\
   sra   $a1, $v0, 0x10\n\
  jal   HideTextWindow\n\
   addu  $a0, $s0, $zero\n\
  jal   EndProcess\n\
   addu  $a0, $zero, $zero\n\
 .ov054_L800F8B78:\n\
  lui   $at, 0x8010\n\
  sh    $zero, -0x5c94($at)\n\
  lui   $at, 0x8010\n\
  sw    $zero, -0x5c90($at)\n\
  lui   $a0, 0x8010\n\
  addiu $a0, $a0, -0x7688\n\
  addiu $a1, $zero, 0x1003\n\
  addu  $a2, $zero, $zero\n\
  jal   InitProcess\n\
   addu  $a3, $zero, $zero\n\
  addiu $a0, $zero, 0x26\n\
  jal   func_8003DBE0\n\
   addu  $a1, $zero, $zero\n\
  addu  $s2, $v0, $zero\n\
  lui   $at, 0x8010\n\
  sw    $s2, -0x5c90($at)\n\
  jal   GetSpaceData\n\
   addu  $a0, $zero, $zero\n\
  addiu $a0, $s2, 0xc\n\
  jal   func_800A0D50\n\
   addiu $a1, $v0, 4\n\
  addiu $a0, $s2, 0x24\n\
  lui   $a1, 0x3f4c\n\
  ori   $a1, $a1, 0xcccd\n\
  addu  $a2, $a1, $zero\n\
  jal   func_800A0D00\n\
   addu  $a3, $a1, $zero\n\
  jal   SleepProcess\n\
   addiu $a0, $zero, 0x1e\n\
  jal   PlaySound\n\
   addiu $a0, $zero, 0x8b\n\
  addu  $s7, $v0, $zero\n\
  lui   $v0, 0x8010\n\
  lh    $v0, -0x6034($v0)\n\
  bltz  $v0, .ov054_L800F8D58\n\
   addu  $s3, $zero, $zero\n\
  addiu $s5, $s2, 0xc\n\
  addiu $s6, $s2, 0x18\n\
  sll   $s4, $s3, 1\n\
 .ov054_L800F8C14:\n\
  lui   $t0, 0x8010\n\
  addiu $t0, $t0, -0x6034\n\
  addu  $s1, $s4, $t0\n\
  jal   GetSpaceData\n\
   lh    $a0, ($s1)\n\
  addiu $s0, $v0, 4\n\
  addu  $a0, $s5, $zero\n\
  addu  $a1, $s0, $zero\n\
  jal   func_8004CCD0\n\
   addu  $a2, $s6, $zero\n\
  addu  $a0, $s5, $zero\n\
  addu  $a1, $s0, $zero\n\
  lui   $a3, 0x41a0\n\
  jal   func_8004D648\n\
   addu  $a2, $s5, $zero\n\
  addu  $a0, $fp, $zero\n\
  jal   func_80063270\n\
   addu  $a1, $v0, $zero\n\
  jal   func_80063358\n\
   nop   \n\
  lh    $v1, ($s1)\n\
  addiu $v0, $zero, 6\n\
  bnel  $v1, $v0, .ov054_L800F8D40\n\
   addiu $s3, $s3, 1\n\
  lui   $t0, 0x8010\n\
  addiu $t0, $t0, -0x6032\n\
  addu  $v0, $s4, $t0\n\
  jal   GetSpaceData\n\
   lh    $a0, ($v0)\n\
  addiu $a0, $sp, 0x10\n\
  addiu $a1, $v0, 4\n\
  jal   func_800A0E80\n\
   addu  $a2, $s5, $zero\n\
  addu  $a0, $s6, $zero\n\
  addiu $a1, $sp, 0x10\n\
  addu  $a2, $s6, $zero\n\
  jal   func_8004D1EC\n\
   addiu $a3, $zero, 0x14\n\
  lui   $at, 0x4218\n\
  mtc1  $at, $f0\n\
  nop   \n\
  swc1  $f0, 0x34($s2)\n\
  lui   $at, 0xc000\n\
  mtc1  $at, $f0\n\
  nop   \n\
  swc1  $f0, 0x38($s2)\n\
  jal   PlaySound\n\
   addiu $a0, $zero, 0x8d\n\
  jal   func_80060758\n\
   addiu $a0, $zero, 0x8b\n\
  lwc1  $f0, 0x38($s2)\n\
  cvt.d.s $f0, $f0\n\
  mtc1  $zero, $f2\n\
  mtc1  $zero, $f3\n\
  nop   \n\
  c.eq.d $f0, $f2\n\
  nop   \n\
  bc1t  .ov054_L800F8D28\n\
   nop   \n\
  mtc1  $zero, $f20\n\
  mtc1  $zero, $f21\n\
 .ov054_L800F8D08:\n\
  jal   SleepVProcess\n\
   nop   \n\
  lwc1  $f0, 0x38($s2)\n\
  cvt.d.s $f0, $f0\n\
  c.eq.d $f0, $f20\n\
  nop   \n\
  bc1f  .ov054_L800F8D08\n\
   nop   \n\
 .ov054_L800F8D28:\n\
  jal   PlaySound\n\
   addiu $a0, $zero, 0x8d\n\
  jal   PlaySound\n\
   addiu $a0, $zero, 0x8b\n\
  addu  $s7, $v0, $zero\n\
  addiu $s3, $s3, 1\n\
 .ov054_L800F8D40:\n\
  sll   $v0, $s3, 1\n\
  lui   $at, 0x8010\n\
  addu  $at, $at, $v0\n\
  lh    $v0, -0x6034($at)\n\
  bgez  $v0, .ov054_L800F8C14\n\
   sll   $s4, $s3, 1\n\
 .ov054_L800F8D58:\n\
  sll   $a0, $s7, 0x10\n\
  sra   $a0, $a0, 0x10\n\
  jal   func_80060BC8\n\
   addiu $a1, $zero, 0x1e\n\
  jal   func_8003E694\n\
   addu  $a0, $s2, $zero\n\
  lui   $at, 0x8010\n\
  sw    $zero, -0x5c90($at)\n\
  jal   SleepProcess\n\
   addiu $a0, $zero, 0x1e\n\
  addiu $v0, $zero, 1\n\
  lui   $at, 0x8010\n\
  sh    $v0, -0x5c94($at)\n\
  jal   EndProcess\n\
   addu  $a0, $zero, $zero\n\
  lw    $ra, 0x44($sp)\n\
  lw    $fp, 0x40($sp)\n\
  lw    $s7, 0x3c($sp)\n\
  lw    $s6, 0x38($sp)\n\
  lw    $s5, 0x34($sp)\n\
  lw    $s4, 0x30($sp)\n\
  lw    $s3, 0x2c($sp)\n\
  lw    $s2, 0x28($sp)\n\
  lw    $s1, 0x24($sp)\n\
  lw    $s0, 0x20($sp)\n\
  ldc1  $f20, 0x48($sp)\n\
  jr    $ra\n\
   addiu $sp, $sp, 0x50\n\
   .set reorder\n\
  .set at");
}
#endif

// 800F8DC8
void ov054_Event20CoinDoorEndInnerProcess() {
    struct ov054_unk_event_user_data *some_struct;

    some_struct = (func_800633A8())->user_data;
    SleepProcess(5);
    PlaySound(0x92);

    while (some_struct->unk < 1.0f) {
        SleepVProcess();
        some_struct->unk += 0.05f;
    }

    some_struct->unk = 1.0f;
    PlaySound(0x93);
    EndProcess(NULL);
}

// Raises a 20 coin gate after the player goes through.
// 0x800F8E80
void ov054_Event20CoinDoorEndInner(struct ov054_unk_event_user_data *arg) {
    struct process *some_struct;

    some_struct = InitProcess(ov054_Event20CoinDoorEndInnerProcess, 18432, 0, 0);
    some_struct->user_data = arg;
}

// 0x800F8EBC
void ov054_Event20CoinDoorProcess() {
    struct ov054_unk_event_user_data *some_struct;
    void *value;

    some_struct = (func_800633A8())->user_data;
    SleepProcess(5);
    value = func_80058A4C(-1, 0, 10);

    PlaySound(146);

    while (some_struct->unk > 0) {
        SleepVProcess();
        some_struct->unk -= 0.05f;
    }
    some_struct->unk = 0;

    PlaySound(147);
    func_80058AD0(value);
    EndProcess(NULL);
}

// 0x800F8F88
struct process *ov054_Event20CoinDoorInner(struct ov054_unk_event_user_data *arg) {
    struct process *some_struct;

    some_struct = InitProcess(ov054_Event20CoinDoorProcess, 18432, 0, 0);
    some_struct->user_data = arg;
    return some_struct;
}

// 0x800F8FC4
void ov054_Event20CoinDoor_4D_57() {
    struct player *curr_player = GetPlayerStruct(-1);
    SetAnimation(-1, -1, 2);
    if (curr_player->coins < 20) {
        while (IsCameraMoving()) {
            SleepVProcess();
        }
        SleepVProcess();
        {
            s16 win_id = CreateTextWindow(60, 60, 17, 2);
            LoadStringIntoWindow(win_id, 390, -1, -1);
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            func_8004DBD4(win_id, curr_player->id);
            HideTextWindow(win_id);
        }
        SetNextChainAndSpace(curr_player->id, 10, 0);
    }
    else {
        {
            void *curr_process = GetCurrProcess();
            void *lower_process = ov054_Event20CoinDoorInner(D_800FA34C[0]);
            LinkChildProcess(curr_process, lower_process);
        }
        WaitForChildProcess();
        ov054_AllGatesArrowSetup();
        {
            void *arrow_obj = SpawnDirArrows(-1, D_800F9FEC);
            InitDirArrows(arrow_obj, -1, 0);
            if (PlayerIsCPU(-1)) {
                {
                    s32 i;
                    s32 num_decisions = RunDecisionTree(&D_800F9E30);
                    for(i=0; i<num_decisions; i++)
                    {
                        func_8003BE84(arrow_obj, -2);
                    }
                    func_8003BE84(arrow_obj, -4);
                }
            }
            {
                s32 decision = DirectionPrompt(arrow_obj);
                FreeObject(arrow_obj);
                ov054_AllGatesArrowTeardown();
                if (decision == 0) {
                    SetNextChainAndSpace(curr_player->id, 11, 0);
                }
                else {
                    SetNextChainAndSpace(curr_player->id, 10, 0);
                }
            }
        }
        ov054_Event20CoinDoorEndInner(D_800FA34C[0]);
    }
    EndProcess(NULL);
}

// 800F91B4
void ov054_Event20CoinDoor_2A_2E() {
    struct player *curr_player = GetPlayerStruct(-1);
    SetAnimation(-1, -1, 2);
    if (curr_player->coins < 20) {
        while (IsCameraMoving()) {
            SleepVProcess();
        }
        SleepVProcess();
        {
            s16 win_id = CreateTextWindow(60, 60, 17, 2);
            LoadStringIntoWindow(win_id, 390, -1, -1);
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            func_8004DBD4(win_id, curr_player->id);
            HideTextWindow(win_id);
        }
        SetNextChainAndSpace(-1, 16, 0);
    }
    else {
        {
            void *curr_process = GetCurrProcess();
            void *lower_process = ov054_Event20CoinDoorInner(D_800FA34C[1]);
            LinkChildProcess(curr_process, lower_process);
        }
        WaitForChildProcess();
        ov054_AllGatesArrowSetup();
        {
            void *arrow_obj = SpawnDirArrows(-1, &D_800FA004);
            InitDirArrows(arrow_obj, -1, 0);
            if (PlayerIsCPU(-1)) {
                {
                    s32 i;
                    s32 num_decisions = RunDecisionTree(&D_800F9F38);
                    for (i = 0; i < num_decisions; i++)
                    {
                        func_8003BE84(arrow_obj, -2);
                    }
                    func_8003BE84(arrow_obj, -4);
                }
            }
            {
                s32 decision = DirectionPrompt(arrow_obj);
                FreeObject(arrow_obj);
                ov054_AllGatesArrowTeardown();
                if (decision == 0) {
                    SetNextChainAndSpace(-1, 8, 0);
                }
                else {
                    SetNextChainAndSpace(-1, 16, 0);
                }
            }
        }
        ov054_Event20CoinDoorEndInner(D_800FA34C[1]);
    }
    EndProcess(NULL);
}

// 800F9398
void ov054_ChainEvent_5B() {
    SetNextChainAndSpace(-1, 9, 1);
}

// 800F93BC
void ov054_ChainEvent_56_34() {
    SetNextChainAndSpace(-1, 2, 0);
}

// 800F93E0
void ov054_ChainEvent_3A_30() {
    SetNextChainAndSpace(-1, 4, 0);
}

// 800F9404
void ov054_ChainEvent_54_1C() {
    SetNextChainAndSpace(-1, 9, 0);
}

// 800F9428
void ov054_ChainEvent_9_15() {
    SetNextChainAndSpace(-1, 7, 0);
}

// 800F944C
void ov054_KoopaStartSpaceChainEvent() {
    SetNextChainAndSpace(-1, 0, 1);
}

// ov054_func_800F9470
void ov054_ReceiveKoopaBonus() {
    s16 coins_received;
    s16 win_id;
    s16 current_player_index;

    current_player_index = GetCurrentPlayerIndex();

    func_800405DC(current_player_index);
    SetAnimation(-1, -1, 2);

    if (!IsBoardFeatureDisabled(0x42)) {
        win_id = CreateTextWindow(72, 60, 16, 3);
        LoadStringIntoWindow(win_id, 569, -1, -1);
        coins_received = 10;
    }
    else {
        win_id = CreateTextWindow(65, 60, 17, 3);
        LoadStringIntoWindow(win_id, 570, -1, -1);
        coins_received = 20;
    }
    SetTextCharsPerFrame(win_id, 0);
    ShowTextWindow(win_id);
    PlaySound(0x432);
    func_8004DBD4(win_id, current_player_index);
    HideTextWindow(win_id);

    AdjustPlayerCoinsGradual(current_player_index, coins_received);
    ShowPlayerCoinChange(current_player_index, coins_received);

    SleepProcess(30);

    func_8003FEFC(current_player_index);
}

// ov054_func_800F95A4
void ov054_KoopaStartSpaceEventInner() {
    u16 val;
    struct ed192struct *ed192;

    ed192 = &D_800ED192;
    val = ed192->times_passed_start;
    val++;
    ed192->times_passed_start = val;

    if (IsBoardFeatureDisabled(66) != 0) {
        goto ov054_KoopaStartSpaceEventInner_doreceive;
    }

    // Every 10th person to pass start receives a special bonus.
    if (((s16)ed192->times_passed_start % (s16)10) != 0 && IsBoardFeatureDisabled(77) != 0) {
        goto ov054_KoopaStartSpaceEventInner_doreceive;
    }

    if (IsBoardFeatureDisabled(77) != 0) {
        func_80058910(-1, 1);
    }

    SetBoardFeatureEnabled(77);
    func_800587EC(95, 0, 1);
    return;

// FIXME: Presumably they didn't use a goto...
ov054_KoopaStartSpaceEventInner_doreceive:
    ov054_ReceiveKoopaBonus();
}

// 800F9674
void ov054_KoopaStartSpaceEvent() {
    func_8004D2A4(-1, 8, 93);
    ov054_KoopaStartSpaceEventInner();
    EndProcess(NULL);
}

// 800F96A8
void ov054_StarSpacePassingEvent() {
    s16 result;

    result = ov054_StarSpaceEventInner(GetCurrentSpaceIndex());

    if (result == 1) { // Test if player bought star?
        func_800587EC(68, 0, 2);
        result = ov054_GetNextToadIndex();
        func_8004D2A4(-1, 8, result);
    }
}

void ov054_StarSpaceChanceLandonEvent() {
    s16 result;
    s32 i;
    struct player *cur_player;

    result = ov054_StarSpaceEventInner(GetCurrentSpaceIndex());

    if (result == 2) {
        i = 0;
        while (i < 4) {
            cur_player = GetPlayerStruct(i);
            result = GetCurrentPlayerIndex();
            cur_player->unk0 = ((u32)(i ^ result)) > 0; // Unlikely...
            i++;
        }
        func_800587BC(1, 0, 5, 1);
    }
}

// 800F9798
void ov054_BooSpaceEvent() {
    s16 current_space_index;

    current_space_index = GetCurrentSpaceIndex();
    switch (current_space_index) {
        case 0x81:
            func_8004D2A4(-1, 8, 0x6F);
            break;

        case 0xA:
            func_8004D2A4(-1, 8, 0x62);
            break;
    }

    func_800587EC(0x65, 0, 1);
}

// 800F9804
void ov054_BowserSpaceEvent() {
    func_8004D2A4(-1, 8, 0x70);
    func_800587BC(0x48, 0, 3, 1);
}

// 800F983C
void ov054_Entrypoint4() {
    InitCameras(2);
    func_8001D4D4(1, D_800F98C0);
    ov054_SetupRoutine();
    func_800584F0(2);
    InitProcess(ov054_ShowNextStarSpot, 4101, 0, 0);
}
