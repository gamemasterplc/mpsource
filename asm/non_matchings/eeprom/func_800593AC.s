# assembler directives
.set noat      # allow manual use of $1
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

glabel func_800593AC
/* 059FAC 800593AC 27BDFFE0 */  addiu $29, $29, -0x20
/* 059FB0 800593B0 AFBF0018 */  sw    $31, 0x18($29)
/* 059FB4 800593B4 00042400 */  sll   $4, $4, 0x10
/* 059FB8 800593B8 00042403 */  sra   $4, $4, 0x10
/* 059FBC 800593BC 27A50010 */  addiu $5, $29, 0x10
/* 059FC0 800593C0 0C0164D5 */  jal   func_80059354
/* 059FC4 800593C4 27A60012 */   addiu $6, $29, 0x12
/* 059FC8 800593C8 87A40010 */  lh    $4, 0x10($29)
/* 059FCC 800593CC 87A20012 */  lh    $2, 0x12($29)
/* 059FD0 800593D0 24030001 */  li    $3, 1
/* 059FD4 800593D4 00431804 */  sllv  $3, $3, $2
/* 059FD8 800593D8 3C02800F */  lui   $2, 0x800f
/* 059FDC 800593DC 00441021 */  addu  $2, $2, $4
/* 059FE0 800593E0 9042D112 */  lbu   $2, -0x2eee($2)
/* 059FE4 800593E4 00431025 */  or    $2, $2, $3
/* 059FE8 800593E8 3C01800F */  lui   $1, 0x800f
/* 059FEC 800593EC 00240821 */  addu  $1, $1, $4
/* 059FF0 800593F0 A022D112 */  sb    $2, -0x2eee($1)
/* 059FF4 800593F4 8FBF0018 */  lw    $31, 0x18($29)
/* 059FF8 800593F8 03E00008 */  jr    $31
/* 059FFC 800593FC 27BD0020 */   addiu $29, $29, 0x20

.set at
.set reorder
