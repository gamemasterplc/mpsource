#ifndef _SPACES_H
#define _SPACES_H

#include <ultra64.h>
#include "object.h"

enum board_space_type {
    SPACE_INVISIBLE = 0,
    SPACE_BLUE = 1,
    SPACE_RED = 2,
    SPACE_MINIGAME = 3,
    SPACE_HAPPENING = 4,
    SPACE_STAR = 5,
    SPACE_CHANCE = 6,
    SPACE_START = 7,
    SPACE_MUSHROOM = 8,
    SPACE_BOWSER = 9
};

struct event_list_entry {
    s16 activation_type;
    s16 execution_type;
    void (*event_fn)();
};

struct event_table_entry {
    s16 space_index;
    struct event_list_entry *event_list;
};

struct space_data {
    s8 unk0;
    u8 space_type; // enum board_space_type
    s16 unk2;
    struct coords_3d coords;
    f32 sx;
    f32 sy;
    f32 sz;
    struct event_list_entry *event_list;
};

struct chain_data {
    u16 len;
    s16 *space_indices;
};

struct board_def {
  u16 space_count; // 0
  u16 chain_counts[2];
  u16 spaces_offset; // 6
  u16 chain_offsets[2];
};

struct board_def_space_entry {
    u16 unk0;
    u16 space_type;
    f32 x;
    f32 y;
    f32 z;
};

struct board_def_unk_entry {
    s16 unk_count;
    s16 *unks;
};

void func_8004B860(s16 param_1);
void func_8004B92C();
void func_8004B994();
void func_8004B9B8();
void func_8004B9D4(s16 param_1);
void func_8004BA04(Gfx **displayList, void *param_2, u8 param_3);
s32 BoardDefInit(s16 dir, s16 file);
void func_8004C100();
struct space_data *GetSpaceData(s16 index);
s16 GetAbsSpaceIndexFromChainSpaceIndex(u16 chain_index, u16 space_index);
s16 GetChainLength(u16 chain_index);
s16 GetChainSpaceIndexFromAbsSpaceIndex(s16 abs_space_index, s32 chain_index);
s16 func_8004C2CC(s8 type, u16 chain_index);
s16 func_8004C3B8(s8 type);
void SetSpaceType(s16 space_index, s32 space_type);
void func_8004C4BC(u16 chain_index, u16 old_type, u8 new_type);
void func_8004C558();
void func_8004C61C(s16 space_index);
void func_8004C71C(s16 space_index);
void func_8004C81C(s16 space_index);
void EventTableHydrate(struct event_table_entry *table);
s32 ExecuteEventForSpace(s16 space_index, s16 activation_type);
void func_8004CB20(s32 unk);
void SetCurrentSpaceIndex(s16 space_index);
s16 GetCurrentSpaceIndex();
s16 func_8004CB44();

#endif /* _SPACES_H */
