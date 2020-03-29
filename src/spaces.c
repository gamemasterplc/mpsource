#include <ultra64.h>
#include "../asm/code_800174C0.h"
#include "../asm/code_80023B40.h"
#include "../asm/code_8005C1B0.h"
#include "spaces.h"
#include "process.h"
#include "mainfs.h"
#include "heap_temporary.h"

// ROM 0x4C460 - 0x4D76C (len 4876)

//#define SPACES_NONMATCHING

extern u16 *D_800C4FD0;
extern u32 D_800C4FD4[];
extern u32 D_800C4FFC[];
extern u32 D_800C5024[];
extern f32 *D_800C504C;
extern f32 *D_800C5074;
extern Vtx D_000C50A0;
extern Vtx D_000C50E0;
extern Gfx *D_800C5120;
extern u8 D_800C51B0[];

extern u16 D_800D8100; // space_count
extern u16 D_800D8102; // unk_count
extern u16 D_800D8104; // chain_count
extern struct space_data *D_800D8108;
extern struct chain_data *D_800D810C;
extern struct chain_data *D_800D8110;
extern void *D_800D8118[];
extern s16 D_800D8140;
extern struct event_list_entry *D_800D8144; // event type -2 list
extern struct event_list_entry *D_800D8148; // event type -3 list
extern struct event_list_entry *D_800D814C; // event type -4 list
extern struct event_list_entry *D_800D8150; // event type -5 list
extern s32 D_800D8154; // Set by event code to suspend execution

extern s16 D_800ED52C;
extern s16 D_800ED5E0;

extern u16 D_800F3290;
extern Mtx (*D_800F374C)[];

extern void func_8001D658(s32 a, void *b);
extern void func_8001D7DC(s32 a, void *b);
extern Mtx *func_800A0A20(void *a, s32 b);
extern void func_800A0B90(void *a, s32 b);
extern void func_80022390(void *a, f32 x, f32 y, f32 z);
extern void func_80022450(void *a, f32 x, f32 y, f32 z);

void func_8004B860(s16 param_1) {
    int i;
    u32 *ptr;

    D_800D8140 = param_1;

    switch (param_1) {
        case 0:
            ptr = D_800C4FD4;
            break;

        case 1:
            ptr = D_800C4FFC;
            break;

        default:
            ptr = D_800C5024;
            break;
    }

    for (i = 0; i < 10; i++) {
        if (ptr[i] != 0) {
            D_800D8118[i] = ReadMainFS(ptr[i]);
        }
        else {
            D_800D8118[i] = NULL;
        }
    }
}

void func_8004B92C() {
    s32 i;
    for (i = 0; i < 10; i++) {
        if (D_800D8118[i] != NULL) {
            FreeMainFS(D_800D8118[i]);
        }
        D_800D8118[i] = NULL;
    }
}

void func_8004B994() {
    func_8004B860(0);
    D_800C4FD0 = NULL;
}

void func_8004B9B8() {
    func_8004B92C();
}

void func_8004B9D4(s16 param_1) {
    func_8004B92C();
    func_8004B860(param_1);
}

#ifdef SPACES_NONMATCHING
void func_8004BA04(Gfx **displayList, void *param_2, u8 param_3) {
    s32 imgSize;
    f32 *puVar12;
    f32 uVar13;
    s32 i;
    Vtx *vertices;
    Mtx matrix;

    if (param_3 == 0 && D_800F3290 != 0) {
        gSPDisplayList((*displayList)++, &D_800C5120);

        func_8001D658(0, displayList);
        func_8001D7DC(0, displayList);

        switch (D_800D8140) {
            case 0:
                vertices = &D_000C50A0;
                puVar12 = &D_800C504C;
                imgSize = 32;
                break;

            case 1:
                vertices = &D_000C50E0;
                puVar12 = &D_800C504C;
                imgSize = 8;
                break;

            default:
                imgSize = 32;
                vertices = &D_000C50A0;
                puVar12 = &D_800C5074;
                break;
        }

        for (i = 0; i < 10; i++) { // For each space type
            {
                if (D_800D8118[i] != NULL) {
                    uVar13 = puVar12[i];

                    // FIXME: Something off with this.
                    gDPLoadTextureBlock(
                        (*displayList)++,
                        D_800D8118[i] + 16,
                        G_IM_FMT_RGBA,
                        G_IM_SIZ_32b,
                        imgSize,
                        imgSize,
                        0,
                        G_TX_CLAMP | G_TX_NOMIRROR,
                        G_TX_CLAMP | G_TX_NOMIRROR,
                        G_TX_NOMASK,
                        G_TX_NOMASK,
                        G_TX_NOLOD,
                        G_TX_NOLOD
                    );
                    // dl_out = *param_1;
                    // *param_1 = dl_out + 2;
                    // *dl_out = 0xFD180000;
                    // *(dl_out + 1) = D_800D8118[i];
                    // gDPSetTextureImage(displayList++, 0, totalPixels, 0, D_800D8118[i]);

                    // // dl_out = *param_1;
                    // // *param_1 = dl_out + 2;
                    // // *dl_out = 0xF5180000;
                    // // *(dl_out + 1) = 0x07080200;
                    // gDPSetTile(displayList++, );

                    // gDPLoadSync(displayList++); // 0xE6...

                    // gDPLoadBlock(displayList++, );
                    // // dl_out = *param_1;
                    // // *param_1 = dl_out + 2;
                    // // *dl_out = 0xF3000000;

                    // // uVar5 = 0x800;
                    // // if (uVar9 != 0) {
                    // //     uVar5 = uVar9 + 0x7FF;
                    // // }
                    // // if (0x7FF < size - 1) {
                    // //     size = 0x7FF;
                    // // }
                    // // if (uVar9 != 0) {
                    // //     uVar5 = uVar5 / (uVar9 & 0xFFF);
                    // // }
                    // // *(dl_out + 1) = ((size - 1) & 0xFFF) << 0xC | 0x7000000 | uVar5;

                    // gDPPipeSync(displayList++); // 0xE7...

                    // // dl_out = *param_1;
                    // // *param_1 = dl_out + 2;
                    // // *dl_out = uVar1 << 7 | 0xF5180000;
                    // // *(dl_out + 1) = 0x80200;
                    // gDPSetTile(displayList++, );

                    // // dl_out = *param_1;
                    // // *param_1 = dl_out + 2;
                    // // *dl_out = 0xF2000000;
                    // // *(dl_out + 1) = uVar11 << 0xC | uVar11;
                    // gDPSetTileSize(displayList++, );

                    {
                        s32 j;
                        struct space_data *space;
                        Mtx *mt;

                        for (j = 0; j < D_800D8100; j++) {
                            space = GetSpaceData(i);
                            if (space->space_type == i && (space->unk0 & 1) != 0) {
                                func_800A0B90(&matrix, param_2 + 0x40);
                                func_80022390(&matrix, space->coords.x, space->coords.y, space->coords.z);
                                func_80022450(&matrix, uVar13 * space->sx, 1.0f, uVar13 * space->sz);

                                mt = &(*D_800F374C)[D_800ED52C++];
                                func_800A0A20(&matrix, mt);

                                // FIXME: What did they do to subu 0x80000000, this generates addu.
                                // *dl_out = 0xDA380003;
                                // *(dl_out + 1) = iVar6 + 0x80000000;
                                gSPMatrix((*displayList)++, (u32)mt - 0x80000000, G_MTX_LOAD);

                                gSPVertex((*displayList)++, vertices, 4, 0);
                                gSP2Triangles((*displayList)++, 0, 1, 2, 0, 0, 2, 3, 0);
                            }
                        }
                    }
                }
            }
        }
    }
}
#else
asm(".include \"asm/non_matchings/spaces/func_8004BA04.s\"");
#endif

u16 *func_8004BDEC(u8 *arr, s32 index) {
    u16 offset = *((u16 *)(arr + index));
    return (u16 *)(arr + offset);
}

#ifdef SPACES_NONMATCHING
// 8004BDFC
s32 BoardDefInit(s16 dir, s16 file) {
    //struct board_def *boarddef;
    u16 *boarddef;
    s16 *chain_offsets;
    s32 i, j;
    struct space_data *spacedata;
    struct board_def_space_entry *spaceentry;
    struct chain_data *chaindata;
    s16 *chain_raw;
    s16 chain_len;
    s16 *chain_values;

    D_800C4FD0 = (u16 *)ReadMainFS((dir << 16) | file);
    if (D_800C4FD0 != NULL) {
        D_800D8144 = NULL;
        D_800D8148 = NULL;
        D_800D814C = NULL;
        D_800D8150 = NULL;

        boarddef = D_800C4FD0;
        D_800D8100 = *boarddef; // space_count
        boarddef++;
        D_800D8102 = *boarddef;
        D_800D8104 = *(boarddef + 1);

        D_800D8108 = (struct space_data *)MallocTemp(D_800D8100 * sizeof(struct space_data));
        spaceentry = (struct board_def_space_entry *)func_8004BDEC((u8 *)D_800C4FD0, 6);
        for (i = 0, spacedata = D_800D8108;
            i < D_800D8100;
            i++, spacedata++, spaceentry++)
        {
            spacedata->unk0 = 1;
            spacedata->unk2 = spaceentry->unk0;
            spacedata->space_type = spaceentry->space_type;
            spacedata->coords.x = spaceentry->x * 5.0f;
            spacedata->coords.y = spaceentry->y * 5.0f;
            spacedata->coords.z = spaceentry->z * 5.0f;
            spacedata->sx = 1.0f;
            spacedata->sy = 1.0f;
            spacedata->sz = 1.0f;
            spacedata->event_list = NULL;
        }

        D_800D810C = (struct chain_data *)MallocTemp(D_800D8102 * sizeof(struct chain_data));
        chain_offsets = (s16 *)func_8004BDEC((u8 *)D_800C4FD0, 8);
        for (i = 0, chaindata = D_800D810C; i < D_800D8102; i++, chaindata++) {
            chain_raw = (s16 *)func_8004BDEC((u8 *)chain_offsets, i * 2);

            chain_len = chain_raw[0];
            chaindata->len = chain_len;

            chain_values = (s16 *)MallocTemp(chain_len * 2);
            chaindata->space_indices = chain_values;
            for (j = 0; i < chaindata->len; j++) {
                chain_values[j] = chain_raw[1 + j];
            }
        }

        D_800D8110 = (struct chain_data *)MallocTemp(D_800D8104 * sizeof(struct chain_data));
        chain_offsets = (s16 *)func_8004BDEC((u8 *)D_800C4FD0, 10);
        for (i = 0, chaindata = D_800D8110; i < D_800D8104; i++, chaindata++) {
            chain_raw = (s16 *)func_8004BDEC((u8 *)chain_offsets, i * 2);

            chain_len = chain_raw[0];
            chaindata->len = chain_len;

            chain_values = (s16 *)MallocTemp(chain_len * 2);
            chaindata->space_indices = chain_values;
            for (j = 0; i < chaindata->len; j++) {
                chain_values[j] = chain_raw[1 + j];
            }
        }

        FreeMainFS(D_800C4FD0);
        func_80028E8C(1, func_8004BA04);
        D_800F3290 = 1;
    }
    return 0;
}
#else
asm(".include \"asm/non_matchings/spaces/func_8004BDFC.s\"");
#endif

// BoardDefFree
void func_8004C100() {
    s32 i;
    struct chain_data *chaindata;

    if (D_800C4FD0 != NULL) {
        D_800C4FD0 = NULL;
        D_800F3290 = 0;
        FreeTemp(D_800D8108);

        for (i = 0, chaindata = D_800D810C; i < D_800D8102; i++, chaindata++) {
            FreeTemp(chaindata->space_indices);
        }
        FreeTemp(D_800D810C);

        for (i = 0, chaindata = D_800D8110; i < D_800D8104; i++, chaindata++) {
            FreeTemp(chaindata->space_indices);
        }
        FreeTemp(D_800D8110);

        func_80028E8C(1, NULL);
    }
}

// 8004C1EC
struct space_data *GetSpaceData(s16 index) {
    return &D_800D8108[index];
}

// 8004C204
s16 GetAbsSpaceIndexFromChainSpaceIndex(u16 chain_index, u16 space_index) {
    return D_800D8110[chain_index].space_indices[space_index];
}

// 8004C230
s16 GetChainLength(u16 chain_index) {
    return D_800D8110[chain_index].len;
}

// 8004C24C
s16 GetChainSpaceIndexFromAbsSpaceIndex(s16 abs_space_index, s32 chain_index) {
    s32 i;
    for (i = 0; i < GetChainLength(chain_index); i++) {
        if (GetAbsSpaceIndexFromChainSpaceIndex(chain_index, i) == abs_space_index) {
            return i;
        }
    }
    return -1;
}

#ifdef SPACES_NONMATCHING
// Pick random space of type from chain?
s16 func_8004C2CC(s8 type, u16 chain_index) {
    s32 chain_len;
    u8 rand_byte;
    s16 i;
    u32 absidx;
    struct space_data *space;

    i = 0;
    chain_len = GetChainLength(chain_index);
    rand_byte = GetRandomByte() % chain_len;

    while (1) {
        absidx = GetAbsSpaceIndexFromChainSpaceIndex(chain_index, i);
        space = GetSpaceData(absidx);
        if ((D_800C51B0[space->space_type] & type) != 0 && --rand_byte == 0) {
            break;
        }
        i = (i + 1) % D_800D8100;
    }

    return i;
}
#else
asm(".include \"asm/non_matchings/spaces/func_8004C2CC.s\"");
#endif

#ifdef SPACES_NONMATCHING
// Pick random space of type?
s16 func_8004C3B8(s8 type) {
    u8 rand_byte;
    u32 rand2;
    s16 i;
    struct space_data *space;

    rand_byte = GetRandomByte();
    rand2 = rand_byte % D_800D8100;

    i = 0;
    while (1) {
        space = GetSpaceData(i);
        if ((D_800C51B0[space->space_type] & type) != 0 && --rand2 == 0) {
            break;
        }
        i = (i + 1);
        if (i >= D_800D8100) {
            i = 0;
        }
    }

    return i;
}
#else
asm(".include \"asm/non_matchings/spaces/func_8004C3B8.s\"");
#endif

// Should be s8 space_type?
// 8004C48C
void SetSpaceType(s16 space_index, s32 space_type) {
    struct space_data *space;

    space = GetSpaceData(space_index);
    space->space_type = space_type;
}

// Change spaces of old type to new type on a given chain.
// 8004C4BC
void func_8004C4BC(u16 chain_index, u16 old_type, u8 new_type) {
    s32 chain_len;
    s16 absidx;
    struct space_data *space;
    s32 i;

    i = 0;
    chain_len = GetChainLength(chain_index);
    for (i = 0; i < chain_len; i++) {
        absidx = GetAbsSpaceIndexFromChainSpaceIndex(chain_index, i);
        space = GetSpaceData(absidx);
        if (space->space_type == old_type) {
            space->space_type = new_type;
        }
    }
}

void func_8004C558() {
    struct process *process;
    struct space_data *space;
    f32 fval;

    process = GetCurrentProcess();
    space = GetSpaceData((s16)process->user_data);

    fval = 1.4f;
    if (D_800C4FD0 != NULL) {
        do {
            SleepVProcess();
            fval -= 0.05f;
            if (fval <= 1.0f) {
                fval = 1.0f;
            }

            space->sx = fval;
            space->sz = fval;
        }
        while (!(fval <= 1.0f) && D_800C4FD0 != NULL);
    }

    EndProcess(NULL);
}

void func_8004C61C(s16 space_index) {
    struct process *process;
    process = InitProcess(func_8004C558, 0xEF00, 0, 0);
    process->user_data = (void *)space_index;
}

void func_8004C660() {
    struct process *process;
    struct space_data *space;
    f32 fval;

    process = GetCurrentProcess();
    space = GetSpaceData((s16)process->user_data);

    fval = 1.0f;
    if (D_800C4FD0 != NULL) {
        do {
            SleepVProcess();
            fval -= 0.1f;
            if (fval <= 0.0f) {
                fval = 0.0f;
            }

            space->sx = fval;
            space->sz = fval;
        }
        while (!(fval <= 0.0f) && D_800C4FD0 != NULL);
    }

    EndProcess(NULL);
}

void func_8004C71C(s16 space_index) {
    struct process *process;
    process = InitProcess(func_8004C660, 0xEF00, 0, 0);
    process->user_data = (void *)space_index;
}

void func_8004C760() {
    struct process *process;
    struct space_data *space;
    f32 fval;

    process = GetCurrentProcess();
    space = GetSpaceData((s16)process->user_data);

    fval = 0.0f;
    if (D_800C4FD0 != NULL) {
        do {
            SleepVProcess();
            fval += 0.1f;
            if (fval >= 1.0f) {
                fval = 1.0f;
            }

            space->sx = fval;
            space->sz = fval;
        }
        while (!(fval >= 1.0f) && D_800C4FD0 != NULL);
    }

    EndProcess(NULL);
}

void func_8004C81C(s16 space_index) {
    struct process *process;
    process = InitProcess(func_8004C760, 0xEF00, 0, 0);
    process->user_data = (void *)space_index;
}

void func_8004C860(s16 space_index, struct event_list_entry *event_list) {
    switch (space_index) {
        case -2:
            D_800D8144 = event_list;
            return;

        case -3:
            D_800D8148 = event_list;
            return;

        case -4:
            D_800D814C = event_list;
            return;

        case -5:
            D_800D8150 = event_list;
            return;
    }

    {
        struct space_data *space;
        space = GetSpaceData(space_index);
        space->event_list = event_list;
    }
}

// 8004C900
void EventTableHydrate(struct event_table_entry *table) {
    while (table->space_index != -1) {
        func_8004C860(table->space_index, table->event_list);
        table++;
    }
}

// 8004C968
s32 ExecuteEventForSpace(s16 space_index, s16 activation_type) {
    struct event_list_entry *event_list;
    s16 cur_space_index;
    s32 ret;

    switch (space_index) {
        case -2:
            event_list = D_800D8144;
            break;

        case -3:
            event_list = D_800D8148;
            break;

        case -4:
            event_list = D_800D814C;
            break;

        case -5:
            event_list = D_800D8150;
            break;

        default:
            event_list = GetSpaceData(space_index)->event_list;
            break;
    }

    ret = 0;
    cur_space_index = GetCurrentSpaceIndex();
    SetCurrentSpaceIndex(space_index);

    if (event_list != NULL) {
        while (event_list->activation_type != 0) {
            if (event_list->activation_type == activation_type) {
                D_800D8154 = 0;

                switch (event_list->execution_type) {
                    case 1:
                        event_list->event_fn();
                        break;

                    case 2:
                        {
                            struct process *cur_process = GetCurrentProcess();
                            struct process *space_process = InitProcess(event_list->event_fn, 0x4800, 0, 0);
                            LinkChildProcess(cur_process, space_process);
                            WaitForChildProcess();
                        }
                        break;
                }

                ret = ret | D_800D8154;
            }
            event_list++;
        }
    }

    SetCurrentSpaceIndex(cur_space_index);
    return ret;
}

void func_8004CB20(s32 unk) {
    D_800D8154 = unk;
}

// 8004CB2C
void SetCurrentSpaceIndex(s16 space_index) {
    D_800ED5E0 = space_index;
}

// 8004CB38
s16 GetCurrentSpaceIndex() {
    return D_800ED5E0;
}

s16 func_8004CB44() {
  return func_8004C3B8(SPACE_CHANCE);
}
