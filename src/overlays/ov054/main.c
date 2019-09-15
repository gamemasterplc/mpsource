#include <ultra64.h>

/**
 * This is the main entrypoint to the overlay for the
 * DK Jungle Adventure board.
 */

struct board_overlay_entrypoint {
    s16 index;
    void *fn;
};

extern void ov054_entrypoint0(void);
extern void ov054_entrypoint1(void);
extern void ov054_entrypoint2(void);
extern void ov054_entrypoint3(void);
extern void ov054_entrypoint4(void);
extern s16 D_800C597A;

const struct board_overlay_entrypoint ov54_entrypoints[] = {
    { 0, ov054_entrypoint0 },
    { 1, ov054_entrypoint1 },
    { 2, ov054_entrypoint2 },
    { 3, ov054_entrypoint3 },
    { 4, ov054_entrypoint4 },
    { -1, NULL }
};

void dkmain() {
    ExecBoardScene(ov54_entrypoints, D_800C597A);
}

/**
/* 000000 800F65E0 27BDFFE8  addiu $sp, $sp, -0x18
/* 000004 800F65E4 AFBF0010  sw    $ra, 0x10($sp)
/* 000008 800F65E8 3C048010  lui   $a0, 0x8010
/* 00000C 800F65EC 24849890  addiu $a0, $a0, -0x6770
/* 000010 800F65F0 3C05800C  lui   $a1, 0x800c
/* 000014 800F65F4 0C0161D4  jal   ExecBoardScene
/* 000018 800F65F8 84A5597A   lh    $a1, 0x597a($a1)
/* 00001C 800F65FC 8FBF0010  lw    $ra, 0x10($sp)
/* 000020 800F6600 03E00008  jr    $ra
/* 000024 800F6604 27BD0018   addiu $sp, $sp, 0x18

/* 000028 800F6608 00000000  nop   
/* 00002C 800F660C 00000000  nop   
 */