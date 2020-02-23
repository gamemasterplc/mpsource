#ifndef _WINDOW_H
#define _WINDOW_H

#include <ultra64.h>

s32 CreateTextWindow(s16 x, s16 y, s16 w, s16 h);
void ShowTextWindow(s32 win_id);
void HideTextWindow(s32 win_id);
extern void func_8004DBD4(s16 win_id, s32 player);

#endif /* _WINDOW_H */
