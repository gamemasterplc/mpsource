void func_80000460();
void func_800004B8(void *arg);
void func_80093240();
void osCreateThread(void *thread, int id, void (*entry)(void *), void *arg, void *sp, int pri);
void osStartThread(void *thread);
void osSetIntMask(int mask);
void osSetThreadPri(void *thread, int pri);
void func_8003B330(void *arg);

extern unsigned char D_800CCE50[];
extern unsigned char D_800CD650[];
extern unsigned char D_800CD800[];
extern unsigned char D_800F2A70[];
void func_80000460()
{
    func_80093240();
    osCreateThread(&D_800CD650, 1, func_800004B8, (void *)0, (void *)((unsigned char *)&D_800CCE50 + 2048), 10);
    osStartThread(&D_800CD650);
}

void func_800004B8(void *arg)
{
    osCreateThread(&D_800CD800, 3, func_8003B330, arg, (void *)&D_800F2A70, 2);
    osStartThread(&D_800CD800);
    osSetIntMask(0x3FFF01);
    osSetThreadPri((void *)0, 0);
    while(1);
}