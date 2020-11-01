#include <ultra64.h>
#include "heap_permanent.h"
#include "heap_temporary.h"

// ROM 0x14E20 - 0x156EC

//#define MAINFS_NONMATCHING

extern u16 D_800EC6EA[4];
extern u8 *D_800ECE14;
extern u16 D_800EDEB4[4];

extern u16 D_800F2CF0[4];
extern u16 D_800F32A4[4];
extern u16 D_800F3396[4];
extern u8 *D_800F3843;
extern u16 D_800F544C[4];

void func_80014220() {
    s16 i;

    u16 *D_800F544C_ptr;
    u16 *D_800F32A4_ptr;
    u16 *D_800F2CF0_ptr;
    u16 *D_800EC6EA_ptr;
    u16 *D_800F3396_ptr;

    for (i = 0; i < 4; i++) {
        D_800F544C_ptr = (D_800F544C + i);
        D_800F3396_ptr = (D_800F3396 + i);
        D_800EC6EA_ptr = (D_800EC6EA + i);
        D_800F2CF0_ptr = (D_800F2CF0 + i);
        D_800F32A4_ptr = (D_800F32A4 + i);

        *(D_800F32A4_ptr) = 0;
        *(D_800F2CF0_ptr) = 0;
        *(D_800EC6EA_ptr) = 0;
        *(D_800F3396_ptr) = 0;
        *(D_800F544C_ptr) = 0;
    }
}

#ifdef MAINFS_NONMATCHING
void func_8001429C() {
    s16 i;
    u16 uVar5;
    u32 uVar2;

    u16 *D_800F544C_ptr;
    u16 *D_800F3396_ptr;
    u16 *D_800EDEB4_ptr;
    u16 *D_800EC6EA_ptr;
    u16 *D_800F32A4_ptr;
    u16 *D_800F2CF0_ptr;

    for (i = 0; i < 4; i++) {
        D_800F3396_ptr = (D_800F3396 + i);
        D_800F544C_ptr = (D_800F544C + i);

        *D_800F3396_ptr = *D_800F544C_ptr;

        D_800EDEB4_ptr = (D_800EDEB4 + i);
        uVar5 = *D_800EDEB4_ptr;
        uVar2 = D_800ECE14[i];
        if ((uVar2 >> 0x1F) | 1) {
          uVar5 |= 0x200;
        }
        else {
          uVar5 |= 0x100;
        }

        uVar2 = D_800F3843[i];
        if ((uVar2 >> 0x1F) | 1) {
          uVar5 |= 0x400;
        }
        else {
          uVar5 |= 0x800;
        }

        *D_800F544C_ptr = uVar5;

        D_800EC6EA_ptr = (D_800EC6EA + i);
        *D_800EC6EA_ptr = uVar5 & (uVar5 ^ *D_800F3396_ptr);

        if (uVar5 == *D_800F3396_ptr) {
            D_800F32A4_ptr = (D_800F32A4 + i);
            if ((s16)*D_800F32A4_ptr < 1) {
                *D_800F32A4_ptr = 5;

                D_800F2CF0_ptr = (D_800F2CF0 + i);
                *D_800F2CF0_ptr = uVar5;
            }
            else {
                *D_800F32A4_ptr = *D_800F32A4_ptr - 1;

                D_800F2CF0_ptr = (D_800F2CF0 + i);
                *D_800F2CF0_ptr = *D_800EC6EA_ptr;
            }
        }
        else {
            D_800F32A4_ptr = (D_800F32A4 + i);
            *D_800F32A4_ptr = 0xF;

            D_800F2CF0_ptr = (D_800F2CF0 + i);
            *D_800F2CF0_ptr = *D_800EC6EA_ptr;
        }
    }
}
#else
asm(".include \"asm/non_matchings/mainfs/func_8001429C.s\"");
#endif

// This may be the start of a new file (actual mainfs related code).

#include "../asm/code_80061F60.h"
#include "decode.h"

// 16 byte portion of a directory or file table, which is initially read from ROM.
struct mainfs_table_header {
    s32 count;
    s32 offsets[3]; // Enough to pad to size 16
};

struct mainfs_entry_info {
    u8 *file_bytes;
    s32 size;
    s32 compression_type;
};

extern void *D_800D12F0; // FS ROM location
extern u32 D_800D12F4; // Directory count
extern s32 *D_800D12F8; // Directory offset table pointer.

extern void *D_800D12FC; // FS ROM location (copy)
extern u32 D_800D1300; // Directory count (copy)
extern s32 *D_800D1304; // Directory offset table pointer (copy)

extern struct mainfs_table_header D_800D1310;

extern void *func_80014678(s32, s32);
extern void *func_800146D4(s32, s32);
extern void func_80014770(s32, s32);
extern void func_80014504(s32 type, s32 index, struct mainfs_entry_info *info);

// Initialize file system from ROM.
void func_80014460(void *fs_rom_loc) {
    s32 dir_table_size;
    struct mainfs_table_header *mainfs_table_header;

    D_800D12F0 = fs_rom_loc;
    mainfs_table_header = &D_800D1310;
    func_80061FE8(fs_rom_loc, mainfs_table_header, 16); // ExecRomCopy
    D_800D12F4 = mainfs_table_header->count;
    dir_table_size = mainfs_table_header->count * 4;
    D_800D12F8 = (s32 *)MallocPerm(dir_table_size);
    func_80061FE8(fs_rom_loc + 4, D_800D12F8, dir_table_size);
    D_800D12FC = D_800D12F0;
    D_800D1300 = D_800D12F4;
    D_800D1304 = D_800D12F8;
}

void func_80014504(s32 type, s32 index, struct mainfs_entry_info *info) {
    struct mainfs_table_header *mainfs_table_header;

    mainfs_table_header = &D_800D1310;

    switch (type) {
        case 0x2F:
            info->file_bytes = (u8 *)D_800D12F0 + D_800D12F8[index];
            break;
        case 0x2E:
            info->file_bytes = (u8 *)D_800D12FC + D_800D1304[index];
            break;
    }

    func_80061FE8(info->file_bytes, mainfs_table_header, 16); // ExecRomCopy
    info->file_bytes += 8;
    info->size = mainfs_table_header->count;
    info->compression_type = mainfs_table_header->offsets[0];
}

/**
 * Reads a file from the main filesystem and decodes it.
 * File is in the permanent heap.
 */
void *ReadMainFS(s32 dirAndFile) {
    u32 dir;
    u32 file;

    dir = dirAndFile >> 16;
    file = dirAndFile & 0xFFFF;

    if (dir < D_800D12F4) {
        func_80014770(0x2F, dir);

        if (file < D_800D1300) {
            return func_80014678(0x2E, file);
        }
    }

    return NULL;
}

/**
 * Reads a file from the main filesystem and decodes it.
 * Files is in the temporary heap.
 */
void *func_80014614(s32 dirAndFile) {
    u32 dir;
    u32 file;

    dir = dirAndFile >> 16;
    file = dirAndFile & 0xFFFF;

    if (dir < D_800D12F4) {
        func_80014770(0x2F, dir);

        if (file < D_800D1300) {
            return func_800146D4(0x2E, file);
        }
    }

    return NULL;
}

/**
 * Read file, allocate space in perm heap, decode it.
 */
void *func_80014678(s32 type, s32 index) {
    struct mainfs_entry_info info;
    void *ret;

    func_80014504(type, index, &info);
    ret = MallocPerm((info.size + 1) & -2);
    if (ret != NULL) {
        DecodeFile(info.file_bytes, ret, info.size, info.compression_type);
    }
    return ret;
}

/**
 * Read file, allocate space in temp heap, decode it.
 */
void *func_800146D4(s32 type, s32 index) {
    struct mainfs_entry_info info;
    void *ret;

    func_80014504(type, index, &info);
    ret = MallocTemp((info.size + 1) & -2);
    if (ret != NULL) {
        DecodeFile(info.file_bytes, ret, info.size, info.compression_type);
    }
    return ret;
}

/**
 * Free file previously obtained through ReadMainFS.
 * 80014730
 */
void FreeMainFS(void *file) {
    if (file != NULL) {
        FreePerm(file);
    }
}

/**
 * Free file previously obtained through func_80014614.
 */
void func_80014750(void *file) {
    if (file != NULL) {
        FreePerm(file); //! Should be FreeTemp, but not functionally problematic.
    }
}

#ifdef MAINFS_NONMATCHING
void func_80014770(s32 type, s32 index) {
    void *ptr;
    s32 table_size;
    struct mainfs_table_header *mainfs_table_header;

    ptr = D_800D12F0 + D_800D12F8[index];
    if (D_800D12FC != ptr) {
        if (D_800D12FC != D_800D12F0) {
            FreePerm(D_800D1304);
        }

        D_800D12FC = ptr;
        mainfs_table_header = &D_800D1310;
        func_80061FE8(ptr, mainfs_table_header, 16);
        D_800D1300 = mainfs_table_header->count;
        table_size = mainfs_table_header->count * 4;
        D_800D1304 = MallocPerm(table_size);
        func_80061FE8(ptr + 4, D_800D1304, table_size);
    }
}
#else
asm(".include \"asm/non_matchings/mainfs/func_80014770.s\"");
#endif

#ifdef MAINFS_NONMATCHING
void *func_80014828(s32 type, s32 index) {
    void *ret;
    struct mainfs_entry_info info;

    ret = MallocPerm(24);
    if (ret == NULL) {
        return NULL;
    }

    func_80014504(type, index, &info);
    ((s32 *)ret)[1] = info.size;
    ((s32 *)ret)[0] = info.file_bytes;
    ((s32 *)ret)[2] = MallocPerm(1024);
    ((s16 *)ret)[6] = 1;
    ((s16 *)ret)[7] = 0;
    ((s32 *)ret)[4] = info.compression_type;
    ((s32 *)ret)[3] = info.compression_type;
    return ret;
}
#else
asm(".include \"asm/non_matchings/mainfs/func_80014828.s\"");
#endif

// Frees whatever func_80014828 allocated.
void func_800148BC(void *param_1) {
    FreePerm((void *)(((s32 *)param_1)[2]));
    FreePerm(param_1);
}

asm(".include \"asm/non_matchings/mainfs/mainfs_rest.s\"");
