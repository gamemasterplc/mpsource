#include <ultra64.h>

struct decode_struct
{
    u16 chunk_len;
    s16 pad;
    u8 *src;
    u8 *dest;
    u32 len;
};

extern u8 *D_800D1320;
extern u8 *D_800D1720;

void DecodeNone(struct decode_struct *decode);
void DecodeLZ(struct decode_struct *decode);
void DecodeFile(void *src, void *dest, s32 len, s32 decode_type);
void func_80061FE8(void *src, void *dest, s32 len); // ExecRomCopy

void DecodeNone(struct decode_struct *decode)
{
    s32 copy_len;
    while(decode->len)
    {
        if(decode->len < 1024)
        {
            copy_len = (decode->len+1) & 0xFFFFFFFE;
            decode->len = 0;
        }
        else
        {
            copy_len = 1024;
            decode->len -= 1024;
        }
        func_80061FE8(decode->src, decode->dest, copy_len);
        decode->src += copy_len;
        decode->dest += copy_len;
    }
}

#ifdef NONMATCHING
void DecodeLZ(struct decode_struct *decode)
{
    u16 flag = 0;
    s32 window_pos = 958;

    bzero(&D_800D1720, 1024);
    while(decode->len)
    {
        if (!((flag = (((flag & 0xFFFF) >> 1)) & 0x100)))
        {
            if(decode->chunk_len >= 1024)
            {
                func_80061FE8(decode->src, &D_800D1320, 1024);
                decode->src += 1024;
                decode->chunk_len = 0;
            }
            flag = 0xFF00|D_800D1320[decode->chunk_len++];
        }
        if((flag & 0x1))
        {
            if(decode->chunk_len >= 1024)
            {
                func_80061FE8(decode->src, &D_800D1320, 1024);
                decode->src += 1024;
                decode->chunk_len = 0;
            }
            {
                u8 temp = D_800D1320[decode->chunk_len++];
                *(decode->dest++) = temp;
                D_800D1720[window_pos++] = temp;
                window_pos &= 0x3FF;
                decode->len--;
            }
        }
        else
        {
            if(decode->chunk_len >= 1024)
            {
                func_80061FE8(decode->src, &D_800D1320, 1024);
                decode->src += 1024;
                decode->chunk_len = 0;
            }
            {
                s32 byte_1 = D_800D1320[decode->chunk_len++];
                s32 byte_2;
                s32 copy_pos;
                s32 len;
                s32 i;
                if(decode->chunk_len >= 1024)
                {
                    func_80061FE8(decode->src, &D_800D1320, 1024);
                    decode->src += 1024;
                    decode->chunk_len = 0;
                }
                byte_2 = D_800D1320[decode->chunk_len++];
                copy_pos = ((byte_2 & 0xC0) << 2)|byte_1;
                len = byte_2 & 0x3F;
                if(len)
                {
                    for(i=0; i<len; i++)
                    {
                        *(decode->dest++) = D_800D1720[copy_pos+i];
                        D_800D1720[copy_pos+i] = D_800D1720[copy_pos+i];
                    }
                }
                decode->len -= len;
            }
        }
    }
}
#else
void __attribute__ ((naked)) DecodeLZ(struct decode_struct *decode)
{
asm(".set noat\n\
     .set noreorder\n\
     \n\
    addiu $sp, $sp, -0x30\n\
    sw    $ra, 0x28($sp)\n\
    sw    $s3, 0x24($sp)\n\
    sw    $s2, 0x20($sp)\n\
    sw    $s1, 0x1c($sp)\n\
    sw    $s0, 0x18($sp)\n\
    addu  $s0, $a0, $zero\n\
    addu  $s3, $zero, $zero\n\
    li    $s2, 958\n\
    lui   $a0, %hi(D_800D1720) # $a0, 0x800d\n\
    addiu $a0, %lo(D_800D1720) # addiu $a0, $a0, 0x1720\n\
    jal   bzero\n\
     li    $a1, 1024\n\
    lw    $v0, 0xc($s0)\n\
    beqz  $v0, .L80017440\n\
     andi  $v0, $s3, 0xffff\n\
.L8001722C:\n\
    srl   $v0, $v0, 1\n\
    addu  $s3, $v0, $zero\n\
    andi  $v0, $v0, 0x100\n\
    bnez  $v0, .L80017298\n\
     andi  $v0, $s3, 1\n\
    lhu   $v0, ($s0)\n\
    sltiu $v0, $v0, 0x400\n\
    bnez  $v0, .L80017274\n\
     nop   \n\
    lw    $a0, 4($s0)\n\
    lui   $a1, %hi(D_800D1320) # $a1, 0x800d\n\
    addiu $a1, %lo(D_800D1320) # addiu $a1, $a1, 0x1320\n\
    jal   func_80061FE8\n\
     li    $a2, 1024\n\
    lw    $v0, 4($s0)\n\
    addiu $v0, $v0, 0x400\n\
    sw    $v0, 4($s0)\n\
    sh    $zero, ($s0)\n\
.L80017274:\n\
    lhu   $v0, ($s0)\n\
    addiu $v1, $v0, 1\n\
    sh    $v1, ($s0)\n\
    andi  $v0, $v0, 0xffff\n\
    lui   $at, 0x800d\n\
    addu  $at, $at, $v0\n\
    lbu   $v0, 0x1320($at)\n\
    ori   $s3, $v0, 0xff00\n\
    andi  $v0, $s3, 1\n\
.L80017298:\n\
    beqz  $v0, .L80017324\n\
     nop   \n\
    lhu   $v0, ($s0)\n\
    sltiu $v0, $v0, 0x400\n\
    bnez  $v0, .L800172D4\n\
     nop   \n\
    lw    $a0, 4($s0)\n\
    lui   $a1, %hi(D_800D1320) # $a1, 0x800d\n\
    addiu $a1, %lo(D_800D1320) # addiu $a1, $a1, 0x1320\n\
    jal   func_80061FE8\n\
     li    $a2, 1024\n\
    lw    $v0, 4($s0)\n\
    addiu $v0, $v0, 0x400\n\
    sw    $v0, 4($s0)\n\
    sh    $zero, ($s0)\n\
.L800172D4:\n\
    lhu   $v1, ($s0)\n\
    addiu $v0, $v1, 1\n\
    sh    $v0, ($s0)\n\
    andi  $v1, $v1, 0xffff\n\
    lui   $at, 0x800d\n\
    addu  $at, $at, $v1\n\
    lbu   $v1, 0x1320($at)\n\
    addiu $a2, $s2, 1\n\
    addu  $a1, $s2, $zero\n\
    lw    $a0, 8($s0)\n\
    addiu $v0, $a0, 1\n\
    sw    $v0, 8($s0)\n\
    sb    $v1, ($a0)\n\
    lui   $at, 0x800d\n\
    addu  $at, $at, $a1\n\
    sb    $v1, 0x1720($at)\n\
    andi  $s2, $a2, 0x3ff\n\
    lw    $v0, 0xc($s0)\n\
    j     .L80017430\n\
     addiu $v0, $v0, -1\n\
.L80017324:\n\
    lhu   $v0, ($s0)\n\
    sltiu $v0, $v0, 0x400\n\
    bnez  $v0, .L80017358\n\
     nop   \n\
    lw    $a0, 4($s0)\n\
    lui   $a1, %hi(D_800D1320) # $a1, 0x800d\n\
    addiu $a1, %lo(D_800D1320) # addiu $a1, $a1, 0x1320\n\
    jal   func_80061FE8\n\
     li    $a2, 1024\n\
    lw    $v0, 4($s0)\n\
    addiu $v0, $v0, 0x400\n\
    sw    $v0, 4($s0)\n\
    sh    $zero, ($s0)\n\
.L80017358:\n\
    lhu   $v1, ($s0)\n\
    addiu $v0, $v1, 1\n\
    sh    $v0, ($s0)\n\
    andi  $v1, $v1, 0xffff\n\
    lui   $s1, 0x800d\n\
    addu  $s1, $s1, $v1\n\
    lbu   $s1, 0x1320($s1)\n\
    lhu   $v0, ($s0)\n\
    sltiu $v0, $v0, 0x400\n\
    bnez  $v0, .L800173A8\n\
     nop   \n\
    lw    $a0, 4($s0)\n\
    lui   $a1, %hi(D_800D1320) # $a1, 0x800d\n\
    addiu $a1, %lo(D_800D1320) # addiu $a1, $a1, 0x1320\n\
    jal   func_80061FE8\n\
     li    $a2, 1024\n\
    lw    $v0, 4($s0)\n\
    addiu $v0, $v0, 0x400\n\
    sw    $v0, 4($s0)\n\
    sh    $zero, ($s0)\n\
.L800173A8:\n\
    lhu   $v1, ($s0)\n\
    addiu $v0, $v1, 1\n\
    sh    $v0, ($s0)\n\
    andi  $v1, $v1, 0xffff\n\
    lui   $a3, 0x800d\n\
    addu  $a3, $a3, $v1\n\
    lbu   $a3, 0x1320($a3)\n\
    andi  $v0, $a3, 0xc0\n\
    sll   $v0, $v0, 2\n\
    or    $s1, $s1, $v0\n\
    andi  $a3, $a3, 0x3f\n\
    addiu $a3, $a3, 3\n\
    beqz  $a3, .L80017428\n\
     addu  $a2, $zero, $zero\n\
.L800173E0:\n\
    addiu $a1, $s2, 1\n\
    addu  $a0, $s2, $zero\n\
    lw    $v1, 8($s0)\n\
    addiu $v0, $v1, 1\n\
    sw    $v0, 8($s0)\n\
    addu  $v0, $s1, $a2\n\
    andi  $v0, $v0, 0x3ff\n\
    lui   $at, 0x800d\n\
    addu  $at, $at, $v0\n\
    lbu   $v0, 0x1720($at)\n\
    sb    $v0, ($v1)\n\
    lui   $at, 0x800d\n\
    addu  $at, $at, $a0\n\
    sb    $v0, 0x1720($at)\n\
    addiu $a2, $a2, 1\n\
    slt   $v0, $a2, $a3\n\
    bnez  $v0, .L800173E0\n\
     andi  $s2, $a1, 0x3ff\n\
.L80017428:\n\
    lw    $v0, 0xc($s0)\n\
    subu  $v0, $v0, $a2\n\
.L80017430:\n\
    sw    $v0, 0xc($s0)\n\
    lw    $v0, 0xc($s0)\n\
    bnez  $v0, .L8001722C\n\
     andi  $v0, $s3, 0xffff\n\
.L80017440:\n\
    lw    $ra, 0x28($sp)\n\
    lw    $s3, 0x24($sp)\n\
    lw    $s2, 0x20($sp)\n\
    lw    $s1, 0x1c($sp)\n\
    lw    $s0, 0x18($sp)\n\
    jr    $ra\n\
    addiu $sp, $sp, 0x30\n\
    .set at\n\
     .set reorder");
}
#endif

void DecodeFile(void *src, void *dest, s32 len, s32 decode_type)
{
    struct decode_struct decode_struct;
    struct decode_struct *decode_ptr = &decode_struct;
    decode_struct.src = (u8 *)src;
    decode_struct.dest = (u8 *)dest;
    decode_struct.len = len;
    decode_struct.chunk_len = 1024;
    switch(decode_type)
    {
        case 0:
            DecodeNone(decode_ptr);
            break;

        case 1:
            DecodeLZ(decode_ptr);
            break;

        default:
            break;
    }
}
