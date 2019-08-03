#include <ultra64.h>

extern void osInitialize(void);
extern void thread3_main(void *arg);

extern u8 gInitThread[];
extern u8 gThread1Stack[];
extern u8 gMainThread[];
extern u8 gThread3Stack[];

void ultraMain(void);
void thread1_idle(void *arg);

void ultraMain(void)
{
    osInitialize();
    osCreateThread(&gInitThread, 1, thread1_idle, NULL, gThread1Stack + 0x800, 10);
    osStartThread(&gInitThread);
}

void thread1_idle(void *arg)
{
    osCreateThread(&gMainThread, 3, thread3_main, arg, gThread3Stack, 2);
    osStartThread(&gMainThread);
    osSetIntMask(0x3FFF01);
    osSetThreadPri(NULL, 0);

    // idle forever
    while(1)
        ;
}
