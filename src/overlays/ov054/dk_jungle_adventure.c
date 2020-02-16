#include <ultra64.h>
#include "dk_jungle_adventure.h"
#include "../../../asm/code_8005C1B0.h"

/**
 * DK Jungle Adventure board logic.
 */

// ROM: 0x2418A0 - 0x244B60

#define DK_STAR_COUNT 7
#define DK_BOO_COUNT 2
#define DK_COIN_GATE_COUNT 2
#define DK_THWOMP_COUNT 3

static struct ov054_dimens ov054_data_screen_dimensions = {
    0.0f,
    0.0f,
    320.0f,
    240.0f
};

static s16 ov054_func_800F663C_data0[] = {
    3, 5, 6, 0, 1, 2, 4
};

static s16 ov054_func_800F663C_data1[] = {
    0, 0, 0, 1, 1, 1, 3
};

static s16 ov054_data_mystery_40s[] = {
    0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C
};

static s16 ov054_star_space_indices[] = {
    0x77, 0x80, 0x7F, 0x84, 0x83, 0x75, 0x76
};

static s16 ov054_toad_space_indices[] = {
    0x61, 0x6E, 0x6D, 0x72, 0x71, 0x5F, 0x60
};

static s16 ov054_data_star_related_800F9920[] = {
    0, 1, 7, 3
};

static s16 ov054_toad_space_indices_repeat[] = {
    0x61, 0x6E, 0x6D, 0x72, 0x71, 0x5F, 0x60
};

static s16 ov054_data_mystery_40s_2[] = {
    0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B, 0x4C
};

struct D_800F9948_tuple {
    s16 one;
    s16 two;
};
static struct D_800F9948_tuple D_800F9948[] = {
    { 6, 0 },
    { 0, -3 },
    { 0, -8 },
    { -3, 0 },
    { -2, 0 },
    { -2, 0 },
    { -3, 0 },
};

static s16 ov054_thwomp_nums[] = {
    0, 1, 2
};

static s16 ov054_thwomp_spaces_left[] = {
    0x68, 0x66, 0x67
};

static s16 ov054_thwomp_spaces_right[] = {
    0x65, 0x6C, 0x5E
};

static s16 ov054_thwomp_event_space_indices[] = {
    0x74, 0x7E, 0x85
};

static s32 ov054_D_800F9984[2] = { 1, 0x68 };

static s16 ov054_boo_space_indices[] = {
    0x6F, 0x62
};

static s16 ov054_gate_20_coins_space_indices[] = {
    0x64, 0x63
};

static s16 ov054_gate_20_coins_player_space_indices[] = {
    0x7A, 0x7B
};

static struct ai_node ai_entry_thwomp74_1_1_1[] = {
    { 3, 0x0000003F, { .decision = 0x0001503C } },
    { 0, 0x00000000, { .decision = 0x00011E32 } },
};
static struct ai_node ai_entry_thwomp74_1_1[] = {
    { 1, 0x00000028, { .decision = 0x00016450 } },
    { 1, 0x0000001E, { .decision = 0x00015F46 } },
    { 1, 0x00000014, { .ptr = ai_entry_thwomp74_1_1_1 } },
    { 3, 0x0000003F, { .decision = 0x00014632 } },
    { 0, 0x00000000, { .decision = 0x00011E28 } },
};
static struct ai_node ai_entry_thwomp74_1_2_1[] = {
    { 3, 0x0000001F, { .decision = 0x0001503C } },
    { 0, 0x00000000, { .decision = 0x00012832 } },
};
static struct ai_node ai_entry_thwomp74_1_2[] = {
    { 1, 0x00000028, { .decision = 0x0001645A } },
    { 1, 0x0000001E, { .decision = 0x00015F50 } },
    { 1, 0x00000014, { .ptr = ai_entry_thwomp74_1_2_1 } },
    { 3, 0x0000001F, { .decision = 0x00014632 } },
    { 0, 0x00000000, { .decision = 0x00011E32 } },
};
static struct ai_node ai_entry_thwomp74_1[] = {
    { 2, 0x00000001, { .decision = 0x00006450 } },
    { 2, 0x00000002, { .ptr = ai_entry_thwomp74_1_1 } },
    { 2, 0x00000004, { .ptr = ai_entry_thwomp74_1_2 } },
    { 1, 0x00000014, { .decision = 0x00015F46 } },
    { 0, 0x00000000, { .decision = 0x0001503C } },
};
static struct ai_node ai_entry_thwomp74_2_1[] = {
    { 3, 0x0000000F, { .decision = 0x00005F50 } },
    { 0, 0x00000000, { .decision = 0x00003C3C } },
};
static struct ai_node ai_entry_thwomp74_2_2[] = {
    { 3, 0x0000000F, { .decision = 0x00004646 } },
    { 0, 0x00000000, { .decision = 0x00001428 } },
};
static struct ai_node ai_entry_thwomp74_2[] = {
    { 2, 0x0000007E, { .decision = 0x0001645A } },
    { 1, 0x0000001E, { .decision = 0x00005F50 } },
    { 1, 0x00000014, { .ptr = ai_entry_thwomp74_2_1 } },
    { 0, 0x00000000, { .ptr = ai_entry_thwomp74_2_2 } },
};
static struct ai_node ai_entry_thwomp74[2] = {
    { 4, 0x00010000, { .ptr = ai_entry_thwomp74_1 } },
    { 0, 0x00000000, { .ptr = ai_entry_thwomp74_2 } },
};


static struct ai_node ai_entry_thwomp7E_1_1_1[] = {
    { 3, 0x00000018, { .decision = 0x0001141E } },
    { 0, 0x00000000, { .decision = 0x00016450 } },
};
static struct ai_node ai_entry_thwomp7E_1_1[] = {
    { 1, 0x0000001E, { .ptr = ai_entry_thwomp7E_1_1_1 } },
    { 3, 0x00000007, { .decision = 0x00015F50 } },
    { 0, 0x00000000, { .decision = 0x00011E28 } },
};
static struct ai_node ai_entry_thwomp7E_1_2[] = {
    { 3, 0x00000118, { .decision = 0x00013232 } },
    { 0, 0x00000000, { .decision = 0x00010028 } },
};
static struct ai_node ai_entry_thwomp7E_1[] = {
    { 2, 0x00000004, { .ptr = ai_entry_thwomp7E_1_1 } },
    { 2, 0x00000002, { .decision = 0x00006450 } },
    { 2, 0x00000001, { .ptr = ai_entry_thwomp7E_1_2 } },
    { 3, 0x00000200, { .decision = 0x0001463C } },
    { 0, 0x00000000, { .decision = 0x00010028 } },
};
static struct ai_node ai_entry_thwomp7E_2_1_1[] = {
    { 3, 0x00000007, { .decision = 0x00016450 } },
    { 3, 0x00000007, { .decision = 0x00011432 } },
    { 0, 0x00000000, { .decision = 0x00016450 } },
};
static struct ai_node ai_entry_thwomp7E_2_1[] = {
    { 1, 0x00000014, { ai_entry_thwomp7E_2_1_1 } },
    { 3, 0x00000007, { .decision = 0x00016450 } },
    { 3, 0x00000007, { .decision = 0x00011432 } },
    { 0, 0x00000000, { .decision = 0x00012846 } },
};
static struct ai_node ai_entry_thwomp7E_2_2_1[] = {
    { 3, 0x0000000F, { .decision = 0x00006446 } },
    { 0, 0x00000000, { .decision = 0x0000283C } },
};
static struct ai_node ai_entry_thwomp7E_2_2[] = {
    { 1, 0x0000001E, { .decision = 0x00006450 } },
    { 1, 0x00000014, { .ptr = ai_entry_thwomp7E_2_2_1 } },
    { 3, 0x0000000F, { .decision = 0x00005A46 } },
    { 0, 0x00000000, { .decision = 0x00001E32 } },
};
static struct ai_node ai_entry_thwomp7E_2_3[] = {
    { 3, 0x000001FF, { .decision = 0x00000514 } },
    { 0, 0x00000000, { .decision = 0x00003232 } },
};
static struct ai_node ai_entry_thwomp7E_2[] = {
    { 2, 0x00000004, { .ptr = ai_entry_thwomp7E_2_1 } },
    { 2, 0x00000002, { .ptr = ai_entry_thwomp7E_2_2 } },
    { 2, 0x00000001, { .ptr = ai_entry_thwomp7E_2_3 } },
    { 3, 0x00000118, { .decision = 0x00005046 } },
    { 0, 0x00000000, { .decision = 0x00000514 } },
};
static struct ai_node ai_entry_thwomp7E[] = {
    { 4, 0x00110000, { .ptr = ai_entry_thwomp7E_1 } },
    { 0, 0x00000000, { .ptr = ai_entry_thwomp7E_2 } },
};


static struct ai_node ai_entry_thwomp85_1_1_1[] = {
    { 3, 0x0000007F, { .decision = 0x00016450 } },
    { 0, 0x00000000, { .decision = 0x00011E32 } },
};
static struct ai_node ai_entry_thwomp85_1_1[] = {
    { 1, 0x0000001E, { .decision = 0x00016450 } },
    { 1, 0x00000014, { ai_entry_thwomp85_1_1_1 } },
    { 3, 0x0000007F, { .decision = 0x00016450 } },
    { 0, 0x00000000, { .decision = 0x00011428 } },
};
static struct ai_node ai_entry_thwomp85_1[] = {
    { 2, 0x00000020, { .decision = 0x00005F50 } },
    { 2, 0x00000040, { .ptr = ai_entry_thwomp85_1_1 } },
    { 1, 0x00000037, { .decision = 0x0001463C } },
    { 1, 0x0000001E, { .decision = 0x00013228 } },
    { 0, 0x00000000, { .decision = 0x0001141E } },
};
static struct ai_node ai_entry_thwomp85_2_1_1[] = {
    { 3, 0x00000003, { .decision = 0x00006450 } },
    { 0, 0x00000000, { .decision = 0x00001428 } },
};
static struct ai_node ai_entry_thwomp85_2_1[] = {
    { 1, 0x0000001E, { .decision = 0x00006450 } },
    { 1, 0x00000014, { .ptr = ai_entry_thwomp85_2_1_1 } },
    { 3, 0x00000003, { .decision = 0x00005F50 } },
    { 0, 0x00000000, { .decision = 0x00000A1E } },
};
static struct ai_node ai_entry_thwomp85_2[] = {
    { 2, 0x00000020, { ai_entry_thwomp85_2_1 } },
    { 2, 0x00000040, { .decision = 0x00015F50 } },
    { 0, 0x00000000, { .decision = 0x00001428 } },
};
static struct ai_node ai_entry_thwomp85[] = {
    { 4, 0x00200000, { .ptr = ai_entry_thwomp85_1 } },
    { 0, 0x00000000, { .ptr = ai_entry_thwomp85_2 } },
};


static struct ai_node ai_entry_door7A_1[] = {
    { 3, 0x00000004, { .decision = 0x00002832 } },
    { 0, 0x00000000, { .decision = 0x00005A46 } },
};
static struct ai_node ai_entry_door7A_2_1[] = {
    { 5, 0x00000001, { .decision = 0x00005032 } },
    { 5, 0x00000006, { .decision = 0x00003232 } },
    { 0, 0x00000000, { .decision = 0x00001E28 } },
};
static struct ai_node ai_entry_door7A_2_2[] = {
    { 5, 0x00000001, { .decision = 0x00001E28 } },
    { 5, 0x00000006, { .decision = 0x0000463C } },
    { 0, 0x00000000, { .decision = 0x00005046 } },
};
static struct ai_node ai_entry_door7A_2[] = {
    { 3, 0x00000010, { .ptr = ai_entry_door7A_2_1 } },
    { 3, 0x00000080, { .ptr = ai_entry_door7A_2_2 } },
    { 5, 0x00000001, { .decision = 0x00001E28 } },
    { 5, 0x00000006, { .decision = 0x00003C32 } },
    { 0, 0x00000000, { .decision = 0x00005A46 } },
};
static struct ai_node ai_entry_door7A[] = {
    { 2, 0x00000016, { .ptr = ai_entry_door7A_1 } },
    { 2, 0x00000068, { .ptr = ai_entry_door7A_2 } },
    { 0, 0x00000000, { .decision = 0x00006450 } },
};


static struct ai_node ai_entry_door7B_1_1_1[] = {
    { 5, 0x00000001, { .decision = 0x00003C32 } },
    { 5, 0x00000006, { .decision = 0x00001428 } },
    { 0, 0x00000000, { .decision = 0x00000514 } },
};
static struct ai_node ai_entry_door7B_1_1[] = {
    { 3, 0x00000030, { .ptr = ai_entry_door7B_1_1_1 } },
    { 0, 0x00000000, { .decision = 0x00006450 } },
};
static struct ai_node ai_entry_door7B_1_2[] = {
    { 5, 0x00000001, { .decision = 0x00002832 } },
    { 5, 0x00000006, { .decision = 0x00001428 } },
    { 0, 0x00000000, { .decision = 0x00000514 } },
};
static struct ai_node ai_entry_door7B_1[] = {
    { 1, 0x0000001E, { .ptr = ai_entry_door7B_1_1 } },
    { 3, 0x0000004F, { .decision = 0x00005A46 } },
    { 3, 0x00000030, { .ptr = ai_entry_door7B_1_2 } },
    { 5, 0x00000001, { .decision = 0x00001E32 } },
    { 5, 0x00000006, { .decision = 0x00000A1E } },
    { 0, 0x00000000, { .decision = 0x00000014 } },
};
static struct ai_node ai_entry_door7B_2_1[] = {
    { 3, 0x000003F0, { .decision = 0x00001E32 } },
    { 0, 0x00000000, { .decision = 0x00001428 } },
};
static struct ai_node ai_entry_door7B_2[] = {
    { 1, 0x0000001E, { .ptr = ai_entry_door7B_2_1 } },
    { 3, 0x000003F0, { .decision = 0x00001428 } },
    { 0, 0x00000000, { .decision = 0x00000A1E } },
};
static struct ai_node ai_entry_door7B[] = {
    { 2, 0x00000010, { .ptr = ai_entry_door7B_1 } },
    { 2, 0x00000007, { .ptr = ai_entry_door7B_2 } },
    { 0, 0x00000000, { .decision = 0x00000014 } },
};


static s16 ov054_thwomp_split_74_space_indices[] = {
    0x48, 0x45, -1
};

#define EVENT_LIST_TERMINATOR { 0, 0, NULL }

static struct event_list_entry thwomp_split_74_event_list[] = {
    { 1, 2, ov054_ThwompSplit_74_PassingEvent },
    { 2, 1, ov054_ThwompSplit_74_2_Event },
    EVENT_LIST_TERMINATOR
};

static s16 ov054_thwomp_split_7E_space_indices[] = {
    0x42, 0x38, -1
};

static struct event_list_entry thwomp_split_7E_event_list[] = {
    { 1, 2, ov054_ThwompSplit_7E_PassingEvent },
    { 2, 1, ov054_ThwompSplit_7E_2_Event },
    EVENT_LIST_TERMINATOR
};

static s16 ov054_thwomp_split_85_space_indices[] = {
    0x1A, 0x25, -1
};

static struct event_list_entry thwomp_split_85_event_list[] = {
    { 1, 2, ov054_ThwompSplit_85_PassingEvent },
    { 2, 1, ov054_ThwompSplit_85_2_Event },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry post_thwomp_event_list[] = {
    { 1, 2, ov054_PostThwompIntersectionEvent },
    EVENT_LIST_TERMINATOR
};

static s16 ov054_boulder_space_indices[] = {
    1, 2, 3, 4, 5, 6, 7, -1
};

static struct event_list_entry boulder_event_event_list[] = {
    { 3, 2, ov054_BoulderEvent },
    EVENT_LIST_TERMINATOR
};

static s16 event20coindoor_4D_57_spaces[] = {
    0x4D, 0x57, -1
};

static struct event_list_entry event20coindoor_4D_57_event_list[] = {
    { 1, 2, ov054_Event20CoinDoor_4D_57 },
    EVENT_LIST_TERMINATOR
};

static s16 event20coindoor_2A_2E_spaces[] = {
    0x2A, 0x2E, -1
};

static struct event_list_entry event20coindoor_2A_2E_event_list[] = {
    { 1, 2, ov054_Event20CoinDoor_2A_2E },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry chain_event_5B_event_list[] = {
    { 1, 1, ov054_ChainEvent_5B },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry chain_event_56_34_event_list[] = {
    { 1, 1, ov054_ChainEvent_56_34 },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry chain_event_3A_30_event_list[] = {
    { 1, 1, ov054_ChainEvent_3A_30 },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry chain_event_54_1C_event_list[] = {
    { 1, 1, ov054_ChainEvent_54_1C },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry chain_event_9_15_event_list[] = {
    { 1, 1, ov054_ChainEvent_9_15 },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry koopa_space_event_event_list_main[] = {
    { 1, 1, ov054_KoopaStartSpaceChainEvent },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry koopa_space_event_event_list[] = {
    { 1, 1, ov054_KoopaStartSpaceChainEvent },
    { 1, 2, ov054_KoopaStartSpaceEvent },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry star_space_event_event_list[] = {
    { 1, 1, ov054_StarSpacePassingEvent },
    { 3, 1, ov054_StarSpaceChanceLandonEvent },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry boo_space_event_event_list[] = {
    { 1, 1, ov054_BooSpaceEvent },
    EVENT_LIST_TERMINATOR
};

static struct event_list_entry bowser_space_event_event_list[] = {
    { 1, 1, ov054_BowserSpaceEvent },
    EVENT_LIST_TERMINATOR
};

#define EVENT_TABLE_TERMINATOR { -1, NULL }

static struct event_table_entry main_event_table[] = {
    { 0x77, star_space_event_event_list },
    { 0x80, star_space_event_event_list },
    { 0x7F, star_space_event_event_list },
    { 0x84, star_space_event_event_list },
    { 0x83, star_space_event_event_list },
    { 0x75, star_space_event_event_list },
    { 0x76, star_space_event_event_list },
    { 0x74, thwomp_split_74_event_list },
    { 0x45, post_thwomp_event_list },
    { 0x48, post_thwomp_event_list },
    { 0x38, post_thwomp_event_list },
    { 0x42, post_thwomp_event_list },
    { 0x1A, post_thwomp_event_list },
    { 0x25, post_thwomp_event_list },
    { 0x7E, thwomp_split_7E_event_list },
    { 0x85, thwomp_split_85_event_list },
    { 0x7A, event20coindoor_4D_57_event_list },
    { 0x7B, event20coindoor_2A_2E_event_list },
    { 0x2F, boulder_event_event_list },
    { 0x33, boulder_event_event_list },
    { 0x35, boulder_event_event_list },
    { 0x22, boulder_event_event_list },
    { 0x21, boulder_event_event_list },
    { 0x59, boulder_event_event_list },
    { 0x16, boulder_event_event_list },
    { 0x0D, boulder_event_event_list },
    { 0x0C, boulder_event_event_list },
    { 0x79, koopa_space_event_event_list_main },
    { 0x56, chain_event_56_34_event_list },
    { 0x5B, chain_event_5B_event_list },
    { 0x34, chain_event_56_34_event_list },
    { 0x3A, chain_event_3A_30_event_list },
    { 0x30, chain_event_3A_30_event_list },
    { 0x09, chain_event_9_15_event_list },
    { 0x15, chain_event_9_15_event_list },
    { 0x54, chain_event_54_1C_event_list },
    { 0x1C, chain_event_54_1C_event_list },
    EVENT_TABLE_TERMINATOR
};

static struct event_table_entry koopa_event_table[] = {
    { 0x79, koopa_space_event_event_list },
    EVENT_TABLE_TERMINATOR
};

static struct event_table_entry boo_event_table[] = {
    { 0x81, boo_space_event_event_list },
    { 0x0A, boo_space_event_event_list },
    EVENT_TABLE_TERMINATOR
};

static struct event_table_entry bowser_event_table[] = {
    { 0x82, bowser_space_event_event_list },
    EVENT_TABLE_TERMINATOR
};


// bss
static struct object *bss_bowser_model;
static struct object *bss_koopa_model;
static struct object *bss_toad_model;
static struct object *bss_toad_instances[DK_STAR_COUNT];
static struct object *bss_thwomp_model;
static struct object *thwomp_instances[DK_THWOMP_COUNT];
static struct object *boo_model;
static struct object *boo_instances[DK_BOO_COUNT];
static struct object *coin_gate_model;
// Seems awkward this isn't an array like the others,
// but memory alignment issues occur with an array.
static struct object *coin_gate_right;
static struct object *coin_gate_left;
static void *arrow_unk_1;
static void *arrow_unk_2;
static void *arrow_unk_3;
static void *arrow_unk_4;
static f32 ov054_unk_boulder_float_1;
static f32 ov054_unk_boulder_float_2;
static s16 boulder_active;
static struct object *boulder_obj_model;


// 0x800F6610
s16 ov054_GetNextToadIndex() {
    s16 *unkaa;
    s16 *unkcc;

    // FIXME: Seems like it should be something like this, but what???
    // return ov054_toad_space_indices[ed5c0->unkc[ed5c0->unka]];

    unkaa = (void *)&D_800ED5C0 + 10;
    unkcc = (void *)unkaa + 2;

    return ov054_toad_space_indices[*(unkcc + *unkaa)];
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

        if (rand1 < ov054_func_800F663C_data1[rand2]) {
            continue;
        }

        if (rand2 < ov054_func_800F663C_data1[rand1]) {
            continue;
        }

        swap1 = ov054_func_800F663C_data0[rand1];
        ov054_func_800F663C_data0[rand1] = ov054_func_800F663C_data0[rand2];
        ov054_func_800F663C_data0[rand2] = swap1;

        swap1 = ov054_func_800F663C_data1[rand1];
        ov054_func_800F663C_data1[rand1] = ov054_func_800F663C_data1[rand2];
        ov054_func_800F663C_data1[rand2] = swap1;
    }

    for (s1 = 0; s1 < DK_STAR_COUNT; s1++) {
        ed5c0->unkc[s1] = ov054_func_800F663C_data0[s1];
    }
}

void ov054_func_800F67A4() {
    s32 temp;
    struct ed5c0struct *ed5c0;

    ed5c0 = &D_800ED5C0;

    if (++ed5c0->unka < DK_STAR_COUNT) {
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
    for (s1 = 0; s1 < DK_STAR_COUNT; s1++) {
        SetSpaceType(ov054_star_space_indices[s1], 1);
        SetBoardFeatureEnabled(ov054_data_mystery_40s[s1]);
    }

    if (IsBoardFeatureDisabled(0x44)) {
        s0 = DK_STAR_COUNT;
    }
    else {
        s0 = ed5c0->unka;
    }

    for (s1 = 0; s1 < s0; s1++) {
        SetSpaceType(ov054_star_space_indices[ed5c0->unkc[s1]], 6);
    }

    SetSpaceType(ov054_star_space_indices[ed5c0->unkc[ed5c0->unka]], 5);

    SetBoardFeatureDisabled(ov054_data_mystery_40s[ed5c0->unkc[ed5c0->unka]]);
}

// 0x800F6958
s32 ov054_StarSpaceEventInner(s32 current_space_index) {
    s32 i;
    s32 j;
    s16 *ov054_star_space_indicesptr;
    struct ed5c0struct *ed5c0;

    ed5c0 = &D_800ED5C0;

    i = 0;

    ov054_star_space_indicesptr = ov054_star_space_indices;

    // This feels a bit odd, but the match was difficult.
    current_space_index <<= 16;
    current_space_index >>= 16;

    while (i < DK_STAR_COUNT) {
        if (current_space_index == ov054_star_space_indicesptr[i]) {
            if (i == ed5c0->unkc[ed5c0->unka]) {
                ed5c0->unk1a = ov054_data_mystery_40s[i];
                return 1;
            }

            if (IsBoardFeatureDisabled(68)) {
                current_space_index = DK_STAR_COUNT;
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
    struct space_data *space_data;
    struct object *ptr;
    struct f2b7cstruct *f2bstr;
    void *ret;
    s32 s0;
    f32 ftemp;
    f32 ftt;
    f32 const20;

    space_data = (GetCurrentProcess())->user_data;

    PlaySound(109);
    ptr = func_8003DBE0(64, NULL);
    ptr->unka |= 4;
    func_8004CDCC(ptr);
    func_800A0D50(&ptr->coords, &space_data->coords);

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
    struct object *unk0ptr;

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
    str = func_80048224(ov054_data_star_related_800F9920);
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

    spacedata = GetSpaceData(ov054_toad_space_indices[ed5c0->unkc[ed5c0->unka]]);
    func_8004B5DC(&spacedata->coords);
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

    EventTableHydrate(main_event_table);

    if (!IsBoardFeatureDisabled(0xe)) {
        EventTableHydrate(koopa_event_table);
    }

    if (!IsBoardFeatureDisabled(0xf)) {
        EventTableHydrate(boo_event_table);
    }

    if (!IsBoardFeatureDisabled(0xd)) {
        EventTableHydrate(bowser_event_table);
    }

    func_800584F0(0);
}

void ov054_Entrypoint3() {
    InitCameras(1);
    ov054_SetupRoutine();
    func_800584F0(1);
}

void ov054_DrawBowserInner() {
    struct object *ptr;

    if (bss_bowser_model != NULL) {
        return;
    }

    ptr = func_8003DBE0(0x3B, NULL);
    func_8003E174(ptr);
    bss_bowser_model = ptr;

    ptr->unka |= 0x2;

    func_800A0D50(&ptr->coords, &GetSpaceData(0x70)->coords);
    func_8003C314(7, ptr, -2, 0);
}

void ov054_DrawBowserOuter() {
    bss_bowser_model = 0;
    ov054_DrawBowserInner();
}

void ov054_DrawKoopaInner() {
    struct object *ptr;

    if (bss_koopa_model != NULL) {
        return;
    }

    ptr = func_8003DBE0(0x39, NULL);
    func_8003E174(ptr);
    bss_koopa_model = ptr;

    ptr->unka |= 0x2;

    func_800A0D50(&ptr->coords, &GetSpaceData(0x5D)->coords);
    func_8003C314(9, ptr, -1, -3);
}

void ov054_DrawKoopaOuter() {
    bss_koopa_model = 0;
    ov054_DrawKoopaInner();
}

void ov054_DrawToadsInner(s16 index) {
    struct object *ptr;

    if (bss_toad_instances[index] != NULL) {
        return;
    }

    if (bss_toad_model == NULL) {
        ptr = func_8003DBE0(0x3A, NULL);
        func_8003E174(ptr);
        bss_toad_model = ptr;
    }
    else {
        ptr = func_8003E320(bss_toad_model);
    }

    bss_toad_instances[index] = ptr;
    ptr->unka |= 0x2;
    func_8004CDCC(ptr);
    func_800A0D50(&ptr->coords, &GetSpaceData(ov054_toad_space_indices_repeat[index])->coords);
    func_8003C314(6, ptr, D_800F9948[index].one, D_800F9948[index].two);
}

// draw_toads_outer
void ov054_DrawToadsOuter() {
    s32 i;

    bss_toad_model = NULL;
    for (i = 0; i < DK_STAR_COUNT; i++) {
        bss_toad_instances[i] = 0;
        if (!IsBoardFeatureDisabled(ov054_data_mystery_40s_2[i])) {
            ov054_DrawToadsInner(i);
        }
    }
}

void ov054_DrawThwompsInner(s16 index) {
    struct object *ptr;
    struct space_data *spacedata_temp;

    if (thwomp_instances[index] != NULL) {
        return;
    }

    if (bss_thwomp_model == NULL) {
        ptr = func_8003DBE0(0xA, ov054_D_800F9984);
        func_8003E174(ptr);
        bss_thwomp_model = ptr;
    }
    else {
        ptr = func_8003E320(bss_thwomp_model);
    }

    thwomp_instances[index] = ptr;
    func_800A0D00(&ptr->unk36, 0.8f, 0.8f, 0.8f);
    ptr->unka |= 0x2;

    if (D_800ED154[ov054_thwomp_nums[index]] == 0) {
        spacedata_temp = GetSpaceData(ov054_thwomp_spaces_left[index]);
    }
    else {
        spacedata_temp = GetSpaceData(ov054_thwomp_spaces_right[index]);
    }
    func_800A0D50(&ptr->coords, &spacedata_temp->coords);
    func_800A0E80(&ptr->unk24, &GetSpaceData(ov054_thwomp_event_space_indices[index])->coords, &ptr->coords);
}

// draw_thwomps_outer
void ov054_DrawThwompsOuter() {
    s32 i;

    bss_thwomp_model = NULL;
    for (i = 0; i < DK_THWOMP_COUNT; i++) {
        ov054_DrawThwompsInner(i);
    }
}

void ov054_DrawBooInner(s16 index) {
    struct object *ptr;

    if (boo_instances[index] != NULL) {
        return;
    }

    if (boo_model == NULL) {
        ptr = func_8003DBE0(106, 0);
        func_8003E174(ptr);
        boo_model = ptr;
    }
    else {
        ptr = func_8003E320(boo_model);
    }

    boo_instances[index] = ptr;
    ptr->unka |= 0x2;
    func_800A0D00(&ptr->unk36, 0.6f, 0.6f, 0.6f);
    ptr->unk48 = 100.0f;

    func_800A0D50(&ptr->coords, &GetSpaceData(ov054_boo_space_indices[index])->coords);
    func_8003C314(8, ptr, 0, 0);
}

void ov054_DrawBooOuter() {
    s32 i;

    boo_model = 0;
    for (i = 0; i < DK_BOO_COUNT; i++) {
        ov054_DrawBooInner(i);
    }
}

void ov054_Draw20CoinGateInner(s16 index) {
    struct object *ptr;

    if ((&coin_gate_right)[index] != NULL) {
        return;
    }

    if (coin_gate_model == NULL) {
        ptr = func_8003DBE0(41, 0);
        func_8003E174(ptr);
        coin_gate_model = ptr;
    }
    else {
        ptr = func_8003E320(coin_gate_model);
    }

    ptr->unka |= 0x2;
    (&coin_gate_right)[index] = ptr;
    func_800A0D50(&ptr->coords, &GetSpaceData(ov054_gate_20_coins_space_indices[index])->coords);
    func_8004CD48(ptr, ov054_gate_20_coins_player_space_indices[index]);
}

void ov054_Draw20CoinGateOuter() {
    s32 i;

    coin_gate_model = NULL;
    for (i = 0; i < DK_COIN_GATE_COUNT; i++) {
        ov054_Draw20CoinGateInner(i);
    }
}

void ov054_AllGatesArrowSetup() {
    while (func_8004B850()) {
        SleepVProcess();
    }
    SleepVProcess();

    arrow_unk_1 = func_80045D84(0, 0x92, 1);
    arrow_unk_2 = func_80045D84(1, 0xA0, 1);
    arrow_unk_3 = func_80045D84(3, 0xAE, 1);
    arrow_unk_4 = func_80045D84(0xB, 0xBC, 1);

    SleepProcess(3);

    D_800EE320 = 1;
}

// 0x800F79D0
void ov054_AllGatesArrowTeardown() {
    D_800EE320 = 0;
    func_80045E6C(arrow_unk_1);
    func_80045E6C(arrow_unk_2);
    func_80045E6C(arrow_unk_3);
    func_80045E6C(arrow_unk_4);
}

// 800F7A1C
void ov054_ThwompSplit_74_PassingEvent() {
    void *arrowsObj;

    SetPlayerAnimation(-1, -1, 2);
    SleepVProcess();
    if (PlayerHasCoins(-1, 10)) {
        ov054_AllGatesArrowSetup();
        arrowsObj = SpawnDirArrows(-1, ov054_thwomp_split_74_space_indices);
        InitDirArrows(arrowsObj, -1, 0);
        if (PlayerIsCPU(-1)) {
            {
                s32 i;
                s32 decision = RunDecisionTree(&ai_entry_thwomp74);
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

            if ((D_800ED154[0] == 0) & (decision2 != 0)) {
                SetNextChainAndSpace(-1, 3, 0);
            }
            else if ((D_800ED154[0] != 0) & (decision2 == 0)) {
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

    SetPlayerAnimation(-1, -1, 2);
    SleepVProcess();
    if (PlayerHasCoins(-1, 10)) {
        ov054_AllGatesArrowSetup();
        arrowsObj = SpawnDirArrows(-1, ov054_thwomp_split_7E_space_indices);
        InitDirArrows(arrowsObj, -1, 0);
        if (PlayerIsCPU(-1)) {
            {
                s32 i = 0;
                s32 decision = RunDecisionTree(&ai_entry_thwomp7E);
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

            if ((D_800ED154[1] == 0) & (decision2 != 0)) {
                SetNextChainAndSpace(-1, 0xF, 0);
            }
            else if ((D_800ED154[1] != 0) & (decision2 == 0)) {
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

    SetPlayerAnimation(-1, -1, 2);
    SleepVProcess();
    if (PlayerHasCoins(-1, 10)) {
      ov054_AllGatesArrowSetup();
      arrowsObj = SpawnDirArrows(-1, ov054_thwomp_split_85_space_indices);
      InitDirArrows(arrowsObj, -1, 0);
      if (PlayerIsCPU(-1)) {
          {
              s32 i;
              s32 decision = RunDecisionTree(&ai_entry_thwomp85);
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

          if ((D_800ED154[2] == 0) & (decision2 == 0)) {
              SetNextChainAndSpace(-1, 0x6, 0);
          }
          else if ((D_800ED154[2] != 0) & (decision2 != 0)) {
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

struct post_thwomp_proc_args {
    struct object *obj;
    struct space_data *unkspacedata1;
    struct space_data *unkspacedata2;
};

// 800F8114
void ov054_PostThwompIntersectionEventProcess() {
    struct process *cur_process;
    struct post_thwomp_proc_args *user_data;
    struct object *obj_temp;
    struct space_data *space_data_temp;
    struct coords_3d *space_coords_temp;
    struct process *child_proc_temp;
    struct ov054_16byte_struct unkcptr;
    void *coords_temp;
    void *unk24cache;

    cur_process = GetCurrentProcess();
    user_data = (struct post_thwomp_proc_args *)cur_process->user_data;

    obj_temp = user_data->obj;
    space_data_temp = user_data->unkspacedata1;

    func_8003E81C(obj_temp, 0, 2);
    space_coords_temp = &space_data_temp->coords;
    coords_temp = &obj_temp->coords;
    func_800A0E80(&unkcptr, space_coords_temp, coords_temp);
    unk24cache = &obj_temp->unk24;
    child_proc_temp = func_8004D1EC(unk24cache, &unkcptr, unk24cache, 10);
    LinkChildProcess(cur_process, child_proc_temp);
    WaitForChildProcess();
    func_800A0D50(&unkcptr, coords_temp);
    child_proc_temp = func_8004D3F4(&unkcptr, space_coords_temp, coords_temp, 25);
    LinkChildProcess(cur_process, child_proc_temp);
    WaitForChildProcess();
    space_data_temp = user_data->unkspacedata2;
    func_800A0E80(&unkcptr, &space_data_temp->coords, coords_temp);
    child_proc_temp = func_8004D1EC(unk24cache, &unkcptr, unk24cache, 10);
    LinkChildProcess(cur_process, child_proc_temp);
    WaitForChildProcess();
    func_8003E81C(obj_temp, -1, 2);
    EndProcess(NULL);
}

// 800F8248
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

        proc_args->obj = thwomp_instances[s2];
        proc_args->unkspacedata1 = GetSpaceData(a0);
        proc_args->unkspacedata2 = GetSpaceData(ov054_thwomp_event_space_indices[s2]);
    }

    EndProcess(NULL);
}

void ov054_MoveModelsForBoulder() {
    struct space_data *spacedata;

    if (!IsBoardFeatureDisabled(13)) {
        spacedata = GetSpaceData(106); // Bowser's alternate location space
        func_800A0D50(&bss_bowser_model->coords, &spacedata->coords);
    }

    if (!IsBoardFeatureDisabled(72)) {
        spacedata = GetSpaceData(105);
        func_800A0D50(&bss_toad_instances[2]->coords, &spacedata->coords);
    }

    if (!IsBoardFeatureDisabled(74)) {
        spacedata = GetSpaceData(107);
        func_800A0D50(&bss_toad_instances[4]->coords, &spacedata->coords);
    }
}

void ov054_RestoreModelsAfterBoulder() {
    struct space_data *spacedata;

    if (!IsBoardFeatureDisabled(13)) {
        spacedata = GetSpaceData(112); // Bowser's regular space
        func_800A0D50(&bss_bowser_model->coords, &spacedata->coords);
    }

    if (!IsBoardFeatureDisabled(72)) {
        spacedata = GetSpaceData(109);
        func_800A0D50(&bss_toad_instances[2]->coords, &spacedata->coords);
    }

    if (!IsBoardFeatureDisabled(74)) {
        spacedata = GetSpaceData(113);
        func_800A0D50(&bss_toad_instances[4]->coords, &spacedata->coords);
    }
}

void ov054_BoulderFunc_800F84E0() {
    func_800726AC(4, 16);
    SleepProcess(16);
    ov054_MoveModelsForBoulder();
    func_8004A7DC();
    func_8004A7A4();

    ov054_unk_boulder_float_1 = func_8004B844();
    func_8004B838(-1.0f);

    ov054_unk_boulder_float_2 = func_8004B5D0();
    func_8004B5C4(1.0f);

    func_8004A510();

    // Space index 0 is start of boulder path.
    func_8004B5DC(&GetSpaceData(0)->coords);

    SleepVProcess();

    func_8004A520();

    func_8004B5C4(ov054_unk_boulder_float_2);
    func_8004B838(ov054_unk_boulder_float_1);

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

    ov054_unk_boulder_float_1 = func_8004B844();
    func_8004B838(-1.0f);

    ov054_unk_boulder_float_2 = func_8004B5D0();
    func_8004B5C4(1.0f);

    func_8004A510();

    func_8004B5DC(&GetPlayerStruct(-1)->obj->coords);

    SleepVProcess();
    func_8004A520();

    func_8004B5C4(ov054_unk_boulder_float_2);
    func_8004B838(ov054_unk_boulder_float_1);
    func_8004220C();
    func_80072644(4, 16);
    SleepProcess(16);
}

// 800F869C
void ov054_BoulderEventProcess() {
    s16 s3;
    struct player *args_player;
    struct object *player_obj;
    struct process *proc_struct;
    struct object *boulder_obj;
    void *boulder_unkc_cached;
    struct ov054_16byte_struct sp10; // maybe
    void *sp24;

    s3 = 0;
    args_player = (GetCurrentProcess())->user_data;
    player_obj = args_player->obj;

    boulder_obj = boulder_obj_model;
    boulder_unkc_cached = &boulder_obj->coords;

    proc_struct = GetCurrentProcess();

    sp24 = func_80058A4C(args_player->id, 0, 10);

    while (TRUE) {
        {
            s16 abs_index;
            struct space_data *spacedata;
            f32 fret;

            abs_index = GetAbsSpaceIndexFromChainSpaceIndex(args_player->cur_chain_index, args_player->cur_space_index);
            spacedata = GetSpaceData(abs_index);
            fret = func_800A13C0(&spacedata->coords, boulder_unkc_cached);

            if (fret < 310.0f) {
                break;
            }

            func_8004CCD0(&player_obj->coords, boulder_unkc_cached, &player_obj->unk24);
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

        SetPlayerAnimation(args_player->id, 1, 2);

        while (spaces_left > 0) {
          {
              struct process *fromret;
              s32 ONE = 1;

              unk24cache = &player_obj->unk24;
              unkccache = &player_obj->coords;

              if (spaces_left == ONE) {
                  SetNextChainAndSpace(args_player->id, 9, 1);
              }

              if (s3 == 124) {
                  player_obj->funk52 = 40.0f;
                  player_obj->funk56 = -5.0f;
                  SetPlayerAnimation(args_player->id, 2, 0);
              }
              if (s3 == 36) {
                  SetPlayerAnimation(args_player->id, -1, 2);
                  func_800A0E80(&sp10, &boulder_obj->coords, &player_obj->coords);
                  func_8004D1EC(unk24cache, &sp10, unk24cache, 8);
                  SleepProcess(30);
                  SetPlayerAnimation(args_player->id, 1, 2);
              }

              if (args_player->obj->funk56 == 0.0f && args_player->obj->unk70 != ONE) {
                  SetPlayerAnimation(args_player->id, 1, 2);
              }

              s3 = GetAbsSpaceIndexFromChainSpaceIndex(args_player->next_chain_index, args_player->next_space_index);
              func_8004CB70(args_player->id, s3, &sp10);
              func_8004CCD0(unkccache, &sp10, &player_obj->unk24);
              fromret = func_8004D648(unkccache, &sp10, unkccache, 20.0f);
              LinkChildProcess(proc_struct, fromret);
              WaitForChildProcess();
              SetPlayerOntoChain(args_player->id, args_player->next_chain_index, args_player->next_space_index);
          }

          spaces_left--;
        }
    }

    SetPlayerAnimation(args_player->id, -1, 2);
    func_80058AD0(sp24);
    EndProcess(NULL);
}

// 800F8978
void ov054_BoulderEventProcess_2() {
    s32 value;

    value = func_80056E3C();

    func_80056E30(0);
    ov054_BoulderFunc_800F84E0();

    while (boulder_obj_model != NULL) {
        func_8004B5DC(&boulder_obj_model->coords);
        SleepVProcess();
    }

    ov054_BoulderEventProcess2Inner();
    func_80056E30(value);
    EndProcess(NULL);
}

void ov054_BoulderEvent() {
    s32 i;
    s32 num_players_in_boulders_path;
    struct process *proc_struct;
    struct ov054_16byte_struct boulder_unk;
    struct object *obj;

    i = 0;

    proc_struct = GetCurrentProcess();

    num_players_in_boulders_path = 0;

    for (i = 0; i < 4; i++) {
        {
            s16 cur_abs_space_index;
            s16 chain_space_index;
            struct process *some_struct;
            struct player *player;

            player = GetPlayerStruct(i);
            cur_abs_space_index = GetAbsSpaceIndexFromChainSpaceIndex(player->cur_chain_index, player->cur_space_index);
            chain_space_index = GetChainSpaceIndexFromAbsSpaceIndex(cur_abs_space_index, 17);

            if (chain_space_index >= 0) {
                {
                    s16 next = chain_space_index + 1;

                    player->cur_chain_index = 17;
                    player->cur_space_index = chain_space_index;
                    player->next_chain_index = 17;
                    player->next_space_index = next;
                }

                some_struct = InitProcess(ov054_BoulderEventProcess, 18432, 0, 0);
                some_struct->user_data = player;

                num_players_in_boulders_path++;
            }
        }
    }

    if (num_players_in_boulders_path == 0) {
        {
            s16 win_id;
            struct process *fromret;

            obj = GetPlayerStruct(-1)->obj;
            func_8004CD84(&boulder_unk);
            func_8003D514(&boulder_unk, 0);
            fromret = func_8004D1EC(&obj->unk24, &boulder_unk, &obj->unk24, 6);
            LinkChildProcess(proc_struct, fromret);
            WaitForChildProcess();

            win_id = CreateTextWindow(75, 64, 14, 1);
            LoadStringIntoWindow(win_id, 404, -1, -1); // "Huh? Nothing happened!?!"
            SetTextCharsPerFrame(win_id, 0);
            ShowTextWindow(win_id);
            func_8004DBD4(win_id, GetCurrentPlayerIndex());
            HideTextWindow(win_id);
            EndProcess(NULL);
        }
    }

    boulder_active = 0;
    boulder_obj_model = NULL;

    {
        s32 sound_ret;

        InitProcess(ov054_BoulderEventProcess_2, 4099, 0, 0);
        obj = func_8003DBE0(38, 0);
        boulder_obj_model = obj;

        func_800A0D50(&obj->coords, &GetSpaceData(0)->coords);
        func_800A0D00(&obj->unk36, 0.8f, 0.8f, 0.8f);
        SleepProcess(30);
        sound_ret = PlaySound(139);

        i = 0;
        while (ov054_boulder_space_indices[i] >= 0) {
            {
                void *unkccache;
                void *unk24cache;
                void *spacedataunk4;
                struct process *fromret;

                unkccache = &obj->coords;
                unk24cache = &obj->unk24;

                spacedataunk4 = &GetSpaceData(ov054_boulder_space_indices[i])->coords;
                func_8004CCD0(unkccache, spacedataunk4, unk24cache);
                fromret = func_8004D648(unkccache, spacedataunk4, unkccache, 20.0f);
                LinkChildProcess(proc_struct, fromret);
                WaitForChildProcess();

                if (ov054_boulder_space_indices[i] == 6) {
                    func_800A0E80(&boulder_unk, &GetSpaceData(ov054_boulder_space_indices[i + 1])->coords, unkccache);
                    func_8004D1EC(unk24cache, &boulder_unk, unk24cache, 20);

                    obj->funk52 = 38.0f;
                    obj->funk56 = -2.0f;

                    PlaySound(141);
                    func_80060758(139);

                    while (obj->funk56 != 0.0) { // unintentional double math
                        SleepVProcess();
                    }

                    PlaySound(141);
                    sound_ret = PlaySound(139);
                }
            }
            i++;
        }

        func_80060BC8(sound_ret, 30);
        func_8003E694(obj);
    }

    boulder_obj_model = NULL;
    SleepProcess(30);
    boulder_active = 1;
    EndProcess(NULL);
}

// 800F8DC8
void ov054_Event20CoinDoorEndInnerProcess() {
    struct object *some_struct;

    some_struct = (GetCurrentProcess())->user_data;
    SleepProcess(5);
    PlaySound(0x92);

    while (some_struct->unk40 < 1.0f) {
        SleepVProcess();
        some_struct->unk40 += 0.05f;
    }

    some_struct->unk40 = 1.0f;
    PlaySound(0x93);
    EndProcess(NULL);
}

// Raises a 20 coin gate after the player goes through.
// 0x800F8E80
void ov054_Event20CoinDoorEndInner(struct object *arg) {
    struct process *some_struct;

    some_struct = InitProcess(ov054_Event20CoinDoorEndInnerProcess, 18432, 0, 0);
    some_struct->user_data = arg;
}

// 0x800F8EBC
void ov054_Event20CoinDoorProcess() {
    struct object *some_struct;
    void *value;

    some_struct = (GetCurrentProcess())->user_data;
    SleepProcess(5);
    value = func_80058A4C(-1, 0, 10);

    PlaySound(146);

    while (some_struct->unk40 > 0) {
        SleepVProcess();
        some_struct->unk40 -= 0.05f;
    }
    some_struct->unk40 = 0;

    PlaySound(147);
    func_80058AD0(value);
    EndProcess(NULL);
}

// 0x800F8F88
struct process *ov054_Event20CoinDoorInner(struct object *arg) {
    struct process *some_struct;

    some_struct = InitProcess(ov054_Event20CoinDoorProcess, 18432, 0, 0);
    some_struct->user_data = arg;
    return some_struct;
}

// 0x800F8FC4
void ov054_Event20CoinDoor_4D_57() {
    struct player *curr_player = GetPlayerStruct(-1);
    SetPlayerAnimation(-1, -1, 2);
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
            void *curr_process = GetCurrentProcess();
            void *lower_process = ov054_Event20CoinDoorInner(coin_gate_right);
            LinkChildProcess(curr_process, lower_process);
        }
        WaitForChildProcess();
        ov054_AllGatesArrowSetup();
        {
            void *arrow_obj = SpawnDirArrows(-1, event20coindoor_4D_57_spaces);
            InitDirArrows(arrow_obj, -1, 0);
            if (PlayerIsCPU(-1)) {
                {
                    s32 i;
                    s32 num_decisions = RunDecisionTree(&ai_entry_door7A);
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
        ov054_Event20CoinDoorEndInner(coin_gate_right);
    }
    EndProcess(NULL);
}

// 800F91B4
void ov054_Event20CoinDoor_2A_2E() {
    struct player *curr_player = GetPlayerStruct(-1);
    SetPlayerAnimation(-1, -1, 2);
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
            void *curr_process = GetCurrentProcess();
            void *lower_process = ov054_Event20CoinDoorInner(coin_gate_left);
            LinkChildProcess(curr_process, lower_process);
        }
        WaitForChildProcess();
        ov054_AllGatesArrowSetup();
        {
            void *arrow_obj = SpawnDirArrows(-1, event20coindoor_2A_2E_spaces);
            InitDirArrows(arrow_obj, -1, 0);
            if (PlayerIsCPU(-1)) {
                {
                    s32 i;
                    s32 num_decisions = RunDecisionTree(&ai_entry_door7B);
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
        ov054_Event20CoinDoorEndInner(coin_gate_left);
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
    SetPlayerAnimation(-1, -1, 2);

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
    func_8001D4D4(1, &ov054_data_screen_dimensions);
    ov054_SetupRoutine();
    func_800584F0(2);
    InitProcess(ov054_ShowNextStarSpot, 4101, 0, 0);
}
