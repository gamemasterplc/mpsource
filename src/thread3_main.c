#include <ultra64.h>
#include "heap_permanent.h"
#include "heap_temporary.h"
#include "process.h"
#include "../asm/libs/libs.h"
#include "../asm/code_80013770.h"
#include "../asm/code_80014220.h"
#include "../asm/code_8001A0F0.h"
#include "../asm/code_8001A600.h"
#include "../asm/code_80060F70.h"
#include "../asm/code_80061F60.h"
#include "../asm/code_800637C0.h"
#include "../asm/code_80063F40.h"
#include "../asm/code_8006C8E0.h"

// ROM 0x3BF30 - 0x3C27C (len 844)

extern s32 D_800C32B0;
extern void *D_800C4250[3];
extern void *D_800C425C;
extern void *D_800C426C;
extern s32 D_800C42B0;

#define INTR_MESG_BUF_SIZE 320
extern OSMesgQueue D_800ED538; // gIntrMesgQueue
extern u8 D_800ED552;

extern s32 D_800F3758;
extern u32 D_800F383C;

extern void *ROM_MAINFS;

void func_8003B5EC(s16);

void thread3_main() {
    s32 iVar5;
    s32 stopLooping;

    OSMesg msg;
    OSMesg intrMesgBuf[INTR_MESG_BUF_SIZE + 4];

    iVar5 = 0;
    stopLooping = FALSE;

    func_8003B5EC(3);

    MakePermHeap((void *)0x80140000, 0x1a0000);
    MakeTempHeap((void *)0x80120000, 0x20000);

    func_800637C0(osTvType == TV_TYPE_NTSC ? 2 : 0x1E, 1);

    D_800ED552 = 3;

    func_8001A600(&D_800C4250, 3, 2, &D_800C425C, &D_800C426C);
    func_80060F70(0, 0x20, 0xd2, 0x20, 0xd4);
    func_80063F40();
    func_800138DC(4, 1);
    func_8006CBB0();
    func_80014220();
    func_80061F60();

    func_80014460(&ROM_MAINFS);

    InitProcessSys();

    osCreateMesgQueue(&D_800ED538, &intrMesgBuf[4], INTR_MESG_BUF_SIZE);
    func_800639F8(&intrMesgBuf, &D_800ED538, 3);

    func_80013E84();
    func_80092390(2);
    func_8001ABF4(2);
    CreateProcess(func_8001A0F0, 1, 0, 0);

    while (!stopLooping) {
        osRecvMesg(&D_800ED538, &msg, OS_MESG_BLOCK);
        switch ((s32)msg) {
            case 1:
                {
                    s16 func_80061228_ret;
                    s32 D_800C32B0_temp;

                    func_80061354();
                    func_80061228_ret = func_80061228(200, 0, 0);
                    if (D_800F383C - iVar5 >= 2) {
                        iVar5 = D_800F383C;
                        if (D_800C42B0 < D_800ED552) {
                            func_80013E84();
                            func_8001429C();
                            D_800C32B0_temp = D_800C32B0;
                            CallProcess(1);
                            if (D_800C32B0_temp != D_800C32B0) {
                                D_800C42B0++;
                            }
                            func_80061264((s32)func_80061228_ret);
                            func_800613A0();
                        }
                    }
                }
                break;

            case 777:
                D_800C42B0--;
                D_800F3758++;
                break;

            case 2:
                stopLooping = TRUE;
                break;
        }
    }

    while (TRUE) {}
}

void func_8003B5EC(s16 count) {
    s16 i = 0;
    for (i = 0; i < count; i++) {
        func_8009B770(*(&D_800C4250[i]), 0, 0x25800); // sizeof(gZBuffer) ?
    }
}
