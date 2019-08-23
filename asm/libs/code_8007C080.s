# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_8007C080
/* 07CC80 8007C080 AC9D0000 */  sw    $sp, ($a0)
/* 07CC84 8007C084 AC9F0004 */  sw    $ra, 4($a0)
/* 07CC88 8007C088 AC900008 */  sw    $s0, 8($a0)
/* 07CC8C 8007C08C AC91000C */  sw    $s1, 0xc($a0)
/* 07CC90 8007C090 AC920010 */  sw    $s2, 0x10($a0)
/* 07CC94 8007C094 AC930014 */  sw    $s3, 0x14($a0)
/* 07CC98 8007C098 AC940018 */  sw    $s4, 0x18($a0)
/* 07CC9C 8007C09C AC95001C */  sw    $s5, 0x1c($a0)
/* 07CCA0 8007C0A0 AC960020 */  sw    $s6, 0x20($a0)
/* 07CCA4 8007C0A4 AC970024 */  sw    $s7, 0x24($a0)
/* 07CCA8 8007C0A8 AC9E0028 */  sw    $fp, 0x28($a0)
/* 07CCAC 8007C0AC E494002C */  swc1  $f20, 0x2c($a0)
/* 07CCB0 8007C0B0 E4950030 */  swc1  $f21, 0x30($a0)
/* 07CCB4 8007C0B4 E4960034 */  swc1  $f22, 0x34($a0)
/* 07CCB8 8007C0B8 E4970038 */  swc1  $f23, 0x38($a0)
/* 07CCBC 8007C0BC E498003C */  swc1  $f24, 0x3c($a0)
/* 07CCC0 8007C0C0 E4990040 */  swc1  $f25, 0x40($a0)
/* 07CCC4 8007C0C4 E49A0044 */  swc1  $f26, 0x44($a0)
/* 07CCC8 8007C0C8 E49B0048 */  swc1  $f27, 0x48($a0)
/* 07CCCC 8007C0CC E49C004C */  swc1  $f28, 0x4c($a0)
/* 07CCD0 8007C0D0 E49D0050 */  swc1  $f29, 0x50($a0)
/* 07CCD4 8007C0D4 E49E0054 */  swc1  $f30, 0x54($a0)
/* 07CCD8 8007C0D8 E49F0058 */  swc1  $f31, 0x58($a0)
/* 07CCDC 8007C0DC 03E00008 */  jr    $ra
/* 07CCE0 8007C0E0 00001025 */   or  $v0, $zero, $zero

glabel func_8007C0E4
/* 07CCE4 8007C0E4 8C9D0000 */  lw    $sp, ($a0)
/* 07CCE8 8007C0E8 8C9F0004 */  lw    $ra, 4($a0)
/* 07CCEC 8007C0EC 8C900008 */  lw    $s0, 8($a0)
/* 07CCF0 8007C0F0 8C91000C */  lw    $s1, 0xc($a0)
/* 07CCF4 8007C0F4 8C920010 */  lw    $s2, 0x10($a0)
/* 07CCF8 8007C0F8 8C930014 */  lw    $s3, 0x14($a0)
/* 07CCFC 8007C0FC 8C940018 */  lw    $s4, 0x18($a0)
/* 07CD00 8007C100 8C95001C */  lw    $s5, 0x1c($a0)
/* 07CD04 8007C104 8C960020 */  lw    $s6, 0x20($a0)
/* 07CD08 8007C108 8C970024 */  lw    $s7, 0x24($a0)
/* 07CD0C 8007C10C 8C9E0028 */  lw    $fp, 0x28($a0)
/* 07CD10 8007C110 C494002C */  lwc1  $f20, 0x2c($a0)
/* 07CD14 8007C114 C4950030 */  lwc1  $f21, 0x30($a0)
/* 07CD18 8007C118 C4960034 */  lwc1  $f22, 0x34($a0)
/* 07CD1C 8007C11C C4970038 */  lwc1  $f23, 0x38($a0)
/* 07CD20 8007C120 C498003C */  lwc1  $f24, 0x3c($a0)
/* 07CD24 8007C124 C4990040 */  lwc1  $f25, 0x40($a0)
/* 07CD28 8007C128 C49A0044 */  lwc1  $f26, 0x44($a0)
/* 07CD2C 8007C12C C49B0048 */  lwc1  $f27, 0x48($a0)
/* 07CD30 8007C130 C49C004C */  lwc1  $f28, 0x4c($a0)
/* 07CD34 8007C134 C49D0050 */  lwc1  $f29, 0x50($a0)
/* 07CD38 8007C138 C49E0054 */  lwc1  $f30, 0x54($a0)
/* 07CD3C 8007C13C C49F0058 */  lwc1  $f31, 0x58($a0)
/* 07CD40 8007C140 00A01025 */  or  $v0, $a1, $zero
/* 07CD44 8007C144 14400002 */  bnez  $v0, .L8007C150
/* 07CD48 8007C148 00000000 */   nop
/* 07CD4C 8007C14C 24020001 */  li    $v0, 1
.L8007C150:
/* 07CD50 8007C150 03E00008 */  jr    $ra
/* 07CD54 8007C154 00000000 */   nop

/* 07CD58 8007C158 00000000 */  nop
/* 07CD5C 8007C15C 00000000 */  nop
