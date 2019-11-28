#ifndef _PLAYER_H
#define _PLAYER_H

#include <ultra64.h>
#include "object.h"
#include "process.h"

/**
 * Represents a player's state during a game.
 */
struct player {
    s8 unk0;
    s8 cpu_difficulty_1;
    s8 cpu_difficulty_2;
    s8 pad0;
    u8 character; // 4
    s8 pad1;
    /**
     * Miscellaneous flags.
     * 1: Is CPU player
     */
    u16 flags;
    /**
     * Current coin count.
     */
    s16 coins; // 8
    /**
     * Coins obtained during a Mini-Game.
     */
    s16 minigame_coins; // 10
    s16 stars; // 12
    u16 cur_chain_index; // 14
    u16 cur_space_index; // 16
    u16 next_chain_index; // 18
    u16 next_space_index; // 20
    u8 poisoned; // 22
    u8 turn_status;
    u8 id; // 24
    u8 pad4;
    u8 pad5;
    u8 pad6;
    struct process *process; // 28
    struct object *obj; // 32
    s8 pad8[2]; // 36
    s16 max_coins; // 38
    s8 pad9[8];
};

s16 GetCurrentPlayerIndex();
struct player *GetPlayerStruct(s32 index);
s16 PlayerIsCurrent(s16 index);
u32 PlayerStructIsCurrent(struct player *player);
u32 PlayerIsCPU(s16 index);
void AdjustPlayerCoins(s32 index, s32 count);
u32 PlayerHasCoins(s32 index, s32 count);
void SetPlayerAnimation(s32 index, s32 animation, s32 unk);
void func_80052C44(s32 index, s32 a, s32 b, s32 c, u16 d);
void func_80052CCC(s32 index, u8 b);
void func_80052D34();
void func_80052DC8(s16 index, void *param_2);
void func_80052E84(s16 index);
void func_80052ECC(s16 index, u8 param_2);
u8 func_80052F04(s16 index);
void func_80052F34(s16 index);
u8 func_80052F6C(s16 index);
void func_80052F9C(s16 index);
void func_80052FD4(s16 index);
void func_80053020();
void func_80053064();
void func_80053074();

#endif /* _PLAYER_H */
