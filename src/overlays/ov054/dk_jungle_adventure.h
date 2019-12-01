#include "../../heap.h"
#include "../../object.h"
#include "../../process.h"
#include "../../player.h"
#include "../../../asm/code_8003D960.h"
#include "../../../asm/code_80059280.h"
#include "../../../asm/libs/libs.h"

void ov054_DrawBowserOuter();
void ov054_DrawKoopaOuter();
void ov054_DrawToadsOuter();
void ov054_DrawThwompsOuter();
void ov054_DrawBooOuter();
void ov054_Draw20CoinGateOuter();

void ov054_ThwompSplit_74_PassingEvent();
void ov054_ThwompSplit_74_2_Event();
void ov054_ThwompSplit_7E_PassingEvent();
void ov054_ThwompSplit_7E_2_Event();
void ov054_ThwompSplit_85_PassingEvent();
void ov054_ThwompSplit_85_2_Event();
void ov054_PostThwompIntersectionEvent();
void ov054_BoulderEvent();
void ov054_Event20CoinDoor_4D_57();
void ov054_Event20CoinDoor_2A_2E();
void ov054_ChainEvent_5B();
void ov054_ChainEvent_56_34();
void ov054_ChainEvent_3A_30();
void ov054_ChainEvent_54_1C();
void ov054_ChainEvent_9_15();
void ov054_KoopaStartSpaceChainEvent();
void ov054_KoopaStartSpaceEvent();
void ov054_StarSpacePassingEvent();
void ov054_StarSpaceChanceLandonEvent();
void ov054_BooSpaceEvent();
void ov054_BowserSpaceEvent();


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

struct ov054_dimens {
    f32 x_upper;
    f32 y_upper;
    f32 x_lower;
    f32 y_lower;
};

struct event_list_entry {
    s16 activation_type;
    s16 execution_type;
    void *event_fn;
};

struct event_table_entry {
    s16 space_index;
    struct event_list_entry *event_list;
};

union ai_next {
    struct ai_node *ptr;
    u32 decision;
};

struct ai_node {
    u8 type;
    u32 data;
    union ai_next next;
};

struct space_data {
    s8 pad[4];
    struct coords_3d coords;
    s8 pad2[8];
    void *unk24;
};

struct ov054_16byte_struct {
    s8 pad[16];
};

struct mystery_struct_ret_func_80048224 {
    struct object *unk0;
    s8 pad[4];
    s16 unk8; // window id
};

extern void func_8001D4D4(s32 i, struct ov054_dimens *dimens);
extern void func_80023448(s32 a);
extern void func_800234B8(s32 a, s32 b, s32 c, s32 d);
extern void func_80023504(s32 a, f32 b, f32 c, f32 d);
extern void func_8003BE84(struct object *unk, s32 b);
extern void func_8003C314(s8 a, void *ptr, s32 c, s32 d);
extern void func_8003D514(struct ov054_16byte_struct *obj, s32 unk);
extern void func_8003FEFC(s16 i);
extern void func_800405DC(s16 index);
extern void func_800421E0();
extern void func_8004220C();
extern void *func_80042728(struct object *ptr, s32 num);
extern void func_800427D4(void *);
extern void *func_80045D84(s32 a, s32 b, s32 c);
extern void func_80045E6C(void *);
extern struct mystery_struct_ret_func_80048224 *func_80048224(s16 *ptr);
extern void func_8004847C(struct mystery_struct_ret_func_80048224 *);
extern void func_8004A510();
extern void func_8004A520();
extern void func_8004A7A4();
extern void func_8004A7DC();
extern void func_8004B5C4(f32 unk);
extern void func_8004B838(f32 unk);
extern f32 func_8004B5D0();
extern f32 func_8004B5DC(struct coords_3d *);
extern f32 func_8004B844();
extern s32 func_8004B850();
extern void func_8004CB20(s32 a);
extern void func_8004CB70(u8 player, s16 b, struct ov054_16byte_struct *unk);
extern void func_8004CCD0(void *a, void *b, void *c);
extern void func_8004CD48(struct object *unk, s16 space_index);
extern void func_8004CD84(struct ov054_16byte_struct *unk);
extern void func_8004CDCC(struct object *unk);
extern struct process *func_8004D1EC(void *a, struct ov054_16byte_struct *b, void *c, s32 d);
extern void func_8004D2A4(s32 a, s32 b, s32 c);
extern struct process *func_8004D3F4(void *a, void *b, void *c, s32 d);
extern struct process *func_8004D648(void *a, void *b, void *c, f32 d);
extern void func_8004DBD4(s16 win_id, s32 player);
extern void func_80052E84(s16 unk);
extern void func_80056AF4();
extern void func_80056E30(s16 unk);
extern s32 func_80056E3C();
extern void func_800584F0(s32 unk);
extern void func_80058AD0(void *unk);
extern void func_800587BC(s32 a, s32 b, s32 c, s32 d);
extern void func_800587EC(s32 a, s32 b, s32 c);
extern void func_80058910(s32 a, s32 b);
extern void *func_80058A4C(s16 player, s32 a, s32 b);
extern void func_8005CF30(u16 a, u16 b);
extern void func_8005DFB8(s32 a);
extern void func_8005E044(u16 a, u16 b, u16 c);
extern void func_8005E3A8();
extern void func_80060088();
extern void func_80060128(s32 a);
extern void func_800601D4(s32 a);
extern void func_80060618(s32 a, s16 player_index);
extern void func_80060758(s32 a);
extern void func_80060BC8(s16 a, s16 b);
extern void func_8006EB40(s16 win_id);
extern void func_80071C8C(s16 a, s32 b);
extern void func_80071E80(s16 a, s32 b);
extern void func_80072644(s16 a, s16 b);
extern void func_800726AC(s16 a, s16 b);
extern s32 func_80072718();

extern u32 IsCameraMoving();
extern s16 GetCurrentSpaceIndex();
extern u8 GetRandomByte();
extern void SetNextChainAndSpace(s16 player, s16 chain, s16 space);
extern s32 GetChainLength(s32 chain_index);
extern void SetSpaceType(s16 space_index, s32 space_type);
extern void AdjustPlayerCoinsGradual(s16 player_index, s16 coins);
extern void ShowPlayerCoinChange(s16 player_index, s16 coins);
extern s32 CreateTextWindow(s16 x, s16 y, s16 w, s16 h);
extern void SetTextCharsPerFrame(s16 win_id, s16 chars);
extern void ShowTextWindow(s16 win_id);
extern void HideTextWindow(s16 win_id);
extern void WaitForTextConfirmation(s16 win_id);
extern void LoadStringIntoWindow(s16 win_id, s32 string_id, s32 a, s32 b);
extern s32 DirectionPrompt(void *arrow_obj);
extern void *SpawnDirArrows(s32 player, s16 *dir);
extern void InitDirArrows(void *arrow_obj, s32 player, s16 new_flags);
extern s16 RunDecisionTree(void *tree);
extern void FreeObject(void *obj);
extern s32 PlaySound(s32 sound_index);
extern void InitCameras(s32 count);
extern void EventTableHydrate(struct event_table_entry *table);
extern void SetupBoard(s32 bg_index, s32 board_def_file, s32 board_bg_index, s32 d);
extern struct space_data *GetSpaceData(s16 index);
extern s16 GetChainSpaceIndexFromAbsSpaceIndex(s16 a, s16 b);
extern s16 GetAbsSpaceIndexFromChainSpaceIndex(u16 chain_index, u16 space_index);
extern void SetPlayerOntoChain(u16 player, s16 chain_index, s16 space_index);
