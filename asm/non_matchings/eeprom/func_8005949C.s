# assembler directives
.set noat      # allow manual use of $1
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

glabel func_8005949C
/* 05A09C 8005949C 27BDFFE0 */  addiu $29, $29, -0x20
/* 05A0A0 800594A0 AFBF0018 */  sw    $31, 0x18($29)
/* 05A0A4 800594A4 00042400 */  sll   $4, $4, 0x10
/* 05A0A8 800594A8 00042403 */  sra   $4, $4, 0x10
/* 05A0AC 800594AC 27A50010 */  addiu $5, $29, 0x10
/* 05A0B0 800594B0 0C0164D5 */  jal   func_80059354
/* 05A0B4 800594B4 27A60012 */   addiu $6, $29, 0x12
/* 05A0B8 800594B8 87A20010 */  lh    $2, 0x10($29)
/* 05A0BC 800594BC 3C04800F */  lui   $4, 0x800f
/* 05A0C0 800594C0 00822021 */  addu  $4, $4, $2
/* 05A0C4 800594C4 9084D119 */  lbu   $4, -0x2ee7($4)
/* 05A0C8 800594C8 87A30012 */  lh    $3, 0x12($29)
/* 05A0CC 800594CC 24020001 */  li    $2, 1
/* 05A0D0 800594D0 00621004 */  sllv  $2, $2, $3
/* 05A0D4 800594D4 8FBF0018 */  lw    $31, 0x18($29)
/* 05A0D8 800594D8 00821024 */  and   $2, $4, $2
/* 05A0DC 800594DC 03E00008 */  jr    $31
/* 05A0E0 800594E0 27BD0020 */   addiu $29, $29, 0x20

.set at
.set reorder
