#include <ultra64.h>

/**
 * This is the main entrypoint to the overlay for the
 * DK Jungle Adventure board.
 */

struct board_overlay_entrypoint {
    s16 index;
    void *fn;
};

extern void ov054_Entrypoint0(void);
extern void ov054_Entrypoint1(void);
extern void ov054_Entrypoint2(void);
extern void ov054_Entrypoint3(void);
extern void ov054_Entrypoint4(void);
extern s16 D_800C597A;

const struct board_overlay_entrypoint ov54_entrypoints[] = {
    { 0, ov054_Entrypoint0 },
    { 1, ov054_Entrypoint1 },
    { 2, ov054_Entrypoint2 },
    { 3, ov054_Entrypoint3 },
    { 4, ov054_Entrypoint4 },
    { -1, NULL }
};

void ov054_main() {
    ExecBoardScene(ov54_entrypoints, D_800C597A);
}
