#include <ultra64.h>
#include "object.h"
#include "process.h"
#include "../asm/code_8003D960.h"
#include "../asm/code_80059280.h"
#include "../asm/code_8005C1B0.h"
#include "../asm/libs/libs.h"
#include "player.h"

// ROM 0x53680 - 0x53C7C

extern u8 D_800C53E0[]; // { 0, 1, 2 }
extern u8 D_800C53E4[]; // { 1, 2, 3 }
extern void *D_800C5490[];
extern u8 D_800C54A8[]; // { 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C }
extern u8 D_800C54B0[]; // { 0x5E, 0x5F, 0x60, 0x61, 0x62, 0x63 }

extern s16 D_800D8380;
extern s16 D_800ED5DC; // current player index

u8 func_80052F6C(s16 index);

/**
 * Returns the index of the current player in the turn.
 * 80052A80
 */
s16 GetCurrentPlayerIndex() {
    return D_800ED5DC;
}

/**
 * Returns a pointer to a player by index.
 * 80052A8C
 */
struct player *GetPlayerStruct(s32 index) {
    if (index < 0) {
        index = GetCurrentPlayerIndex();
    }
    return &gPlayers[index];
}

/**
 * Returns true if the given index matches the current player index.
 * 80052ACC
 */
s16 PlayerIsCurrent(s16 index) {
    return index == D_800ED5DC;
}

/**
 * Returns true if the given player is the same as the current player.
 * 80052AE8
 */
u32 PlayerStructIsCurrent(struct player *player) {
  s16 cur_index = GetCurrentPlayerIndex();
  return player->id == cur_index;
}

/**
 * Returns true if the player is CPU-controlled.
 * 80052B20
 */
u32 PlayerIsCPU(s16 index) {
    return GetPlayerStruct(index)->flags & 1;
}

/**
 * Adjust's a player's coin total by a given count.
 * 80052B48
 */
void AdjustPlayerCoins(s32 index, s32 count) {
    struct player *player = GetPlayerStruct(index);
    player->coins += count;
    if (player->coins >= 1000) {
        player->coins = 999;
    }
    if (player->coins < 0) {
        player->coins = 0;
    }

    if (player->max_coins <= player->coins) {
        player->max_coins = player->coins;
    }
}

/**
 * Returns true if a player has at least the given coin count.
 * 80052BB8
 */
u32 PlayerHasCoins(s32 index, s32 count) {
    struct player *player = GetPlayerStruct(index);
    return player->coins >= count;
}

/**
 * Updates the given player's current animation.
 * 80052BE8
 */
void SetPlayerAnimation(s32 index, s32 animation, s32 unk) {
    struct player *player = GetPlayerStruct(index);
    if (player == GetPlayerStruct(-1)) {
        func_8003E81C(player->obj, animation, unk);
    }
}

void func_80052C44(s32 index, s32 a, s32 b, s32 c, u16 d) {
    struct player *player = GetPlayerStruct(index);
    if (player == GetPlayerStruct(-1)) {
        func_8003E8B8(player->obj, a, b, c, d);
    }
}

void func_80052CCC(s32 index, u8 b) {
    struct player *player = GetPlayerStruct(index);
    player->cpu_difficulty_2 = b;
    if (!IsBoardFeatureDisabled(44)) {
        player->cpu_difficulty_1 = D_800C53E0[b];
    }
    else {
        player->cpu_difficulty_1 = D_800C53E4[b];
    }
}

void func_80052D34() {
    struct process *process = GetCurrentProcess();
    struct player *player = (struct player *)process->user_data;
    u16 flags;

    while (1) {
        SleepVProcess();
        while (((flags = player->flags) & 4) != 0) {
            SleepVProcess();
        }

        {
            f32 val = 1.0f;
            if ((flags & 2) == 0 && !PlayerStructIsCurrent(player)) {
                val = 0.7f;
            }
            func_800A0D00(&player->obj->unk36, val, val, val);
        }
    }
}

void func_80052DC8(s16 index, void *param_2) {
    u8 character;
    struct process *process;

    struct player *player = GetPlayerStruct(index);
    player->id = index;

    // This was hard to match, seems awkward still.
    if (D_800D8380 != 0) {
        if (PlayerIsCurrent(index) != 0) {
            character = player->character;
        }
        else {
            character = func_80052F6C(index);
        }
    }
    else {
        character = player->character;
    }

    player->obj = func_8003DBE0(character, param_2);

    process = InitProcess(func_80052D34, 0x5000, 0, 0);
    player->process = process;
    process->user_data = player;
}

void func_80052E84(s16 index) {
    struct player *player = GetPlayerStruct(index);
    func_80052DC8(index, D_800C5490[player->character]);
}

void func_80052ECC(s16 index, u8 param_2) {
    struct player *player = GetPlayerStruct(index);
    func_8003E1BC(player->obj, param_2);
}

u8 func_80052F04(s16 index) {
    struct player *player = GetPlayerStruct(index);
    return D_800C54A8[player->character];
}

void func_80052F34(s16 index) {
    u8 var1 = func_80052F04(index);
    func_80052ECC(index, var1);
}

u8 func_80052F6C(s16 index) {
    struct player *player = GetPlayerStruct(index);
    return D_800C54B0[player->character];
}

void func_80052F9C(s16 index) {
    u8 var1 = func_80052F6C(index);
    func_80052ECC(index, var1);
}

void func_80052FD4(s16 index) {
    struct player *player = GetPlayerStruct(index);
    if (player->obj != NULL) {
        EndProcess(player->process);
        func_8003E694(player->obj);
        player->obj = NULL;
    }
}

void func_80053020() {
    s32 i;
    struct player *player;

    for (i = 0; i < 4; i++) {
        player = GetPlayerStruct(i);
        player->obj = NULL;
    }
    D_800D8380 = 0;
}

void func_80053064() {
    D_800D8380 = 1;
}

// Empty function
void func_80053074() {
}
