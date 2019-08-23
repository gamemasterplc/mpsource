# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_8007FB70
/* 080770 8007FB70 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 080774 8007FB74 00A4082A */  slt   $at, $a1, $a0
/* 080778 8007FB78 AFBF001C */  sw    $ra, 0x1c($sp)
/* 08077C 8007FB7C AFA40030 */  sw    $a0, 0x30($sp)
/* 080780 8007FB80 AFA50034 */  sw    $a1, 0x34($sp)
/* 080784 8007FB84 AFA60038 */  sw    $a2, 0x38($sp)
/* 080788 8007FB88 10200003 */  beqz  $at, .L8007FB98
/* 08078C 8007FB8C AFA7003C */   sw    $a3, 0x3c($sp)
/* 080790 8007FB90 10000002 */  b     .L8007FB9C
/* 080794 8007FB94 00802825 */   or  $a1, $a0, $zero
.L8007FB98:
/* 080798 8007FB98 8FA50034 */  lw    $a1, 0x34($sp)
.L8007FB9C:
/* 08079C 8007FB9C 2418FFFF */  li    $t8, -1
/* 0807A0 8007FBA0 AFB80028 */  sw    $t8, 0x28($sp)
/* 0807A4 8007FBA4 00002025 */  or  $a0, $zero, $zero
/* 0807A8 8007FBA8 0C0221FC */  jal   func_800887F0
/* 0807AC 8007FBAC AFA50020 */   sw    $a1, 0x20($sp)
/* 0807B0 8007FBB0 8FA50020 */  lw    $a1, 0x20($sp)
/* 0807B4 8007FBB4 0045082A */  slt   $at, $v0, $a1
/* 0807B8 8007FBB8 10200004 */  beqz  $at, .L8007FBCC
/* 0807BC 8007FBBC 00000000 */   nop   
/* 0807C0 8007FBC0 AFA20028 */  sw    $v0, 0x28($sp)
/* 0807C4 8007FBC4 0C022310 */  jal   osSetThreadPri
/* 0807C8 8007FBC8 00002025 */   or  $a0, $zero, $zero
.L8007FBCC:
/* 0807CC 8007FBCC 0C024D48 */  jal   func_80093520
/* 0807D0 8007FBD0 00000000 */   nop   
/* 0807D4 8007FBD4 24190001 */  li    $t9, 1
/* 0807D8 8007FBD8 3C01800C */  lui   $at, %hi(D_800C63C4) # $at, 0x800c
/* 0807DC 8007FBDC 3C04800F */  lui   $a0, %hi(D_800E8748) # $a0, 0x800f
/* 0807E0 8007FBE0 AFA2002C */  sw    $v0, 0x2c($sp)
/* 0807E4 8007FBE4 AC3963C4 */  sw    $t9, %lo(D_800C63C4)($at)
/* 0807E8 8007FBE8 24848748 */  addiu $a0, %lo(D_800E8748) # addiu $a0, $a0, -0x78b8
/* 0807EC 8007FBEC 8FA50038 */  lw    $a1, 0x38($sp)
/* 0807F0 8007FBF0 0C022188 */  jal   func_80088620
/* 0807F4 8007FBF4 8FA6003C */   lw    $a2, 0x3c($sp)
/* 0807F8 8007FBF8 3C04800F */  lui   $a0, %hi(D_800E8778) # $a0, 0x800f
/* 0807FC 8007FBFC 3C05800F */  lui   $a1, %hi(D_800E87C4) # $a1, 0x800f
/* 080800 8007FC00 24A587C4 */  addiu $a1, %lo(D_800E87C4) # addiu $a1, $a1, -0x783c
/* 080804 8007FC04 24848778 */  addiu $a0, %lo(D_800E8778) # addiu $a0, $a0, -0x7888
/* 080808 8007FC08 0C022188 */  jal   func_80088620
/* 08080C 8007FC0C 24060001 */   li    $a2, 1
/* 080810 8007FC10 3C04800F */  lui   $a0, %hi(D_800E8760) # $a0, 0x800f
/* 080814 8007FC14 3C05800F */  lui   $a1, %hi(D_800E87C0) # $a1, 0x800f
/* 080818 8007FC18 24A587C0 */  addiu $a1, %lo(D_800E87C0) # addiu $a1, $a1, -0x7840
/* 08081C 8007FC1C 24848760 */  addiu $a0, %lo(D_800E8760) # addiu $a0, $a0, -0x78a0
/* 080820 8007FC20 0C022188 */  jal   func_80088620
/* 080824 8007FC24 24060001 */   li    $a2, 1
/* 080828 8007FC28 3C04800F */  lui   $a0, %hi(D_800E8790) # $a0, 0x800f
/* 08082C 8007FC2C 3C05800F */  lui   $a1, %hi(D_800E87C8) # $a1, 0x800f
/* 080830 8007FC30 24A587C8 */  addiu $a1, %lo(D_800E87C8) # addiu $a1, $a1, -0x7838
/* 080834 8007FC34 24848790 */  addiu $a0, %lo(D_800E8790) # addiu $a0, $a0, -0x7870
/* 080838 8007FC38 0C022188 */  jal   func_80088620
/* 08083C 8007FC3C 24060002 */   li    $a2, 2
/* 080840 8007FC40 3C04800F */  lui   $a0, %hi(D_800E87A8) # $a0, 0x800f
/* 080844 8007FC44 3C05800F */  lui   $a1, %hi(D_800E87D0) # $a1, 0x800f
/* 080848 8007FC48 24A587D0 */  addiu $a1, %lo(D_800E87D0) # addiu $a1, $a1, -0x7830
/* 08084C 8007FC4C 248487A8 */  addiu $a0, %lo(D_800E87A8) # addiu $a0, $a0, -0x7858
/* 080850 8007FC50 0C022188 */  jal   func_80088620
/* 080854 8007FC54 24060001 */   li    $a2, 1
/* 080858 8007FC58 3C04800E */  lui   $a0, %hi(D_800E7A70) # $a0, 0x800e
/* 08085C 8007FC5C 3C05800E */  lui   $a1, %hi(D_800E7A88) # $a1, 0x800e
/* 080860 8007FC60 24A57A88 */  addiu $a1, %lo(D_800E7A88) # addiu $a1, $a1, 0x7a88
/* 080864 8007FC64 24847A70 */  addiu $a0, %lo(D_800E7A70) # addiu $a0, $a0, 0x7a70
/* 080868 8007FC68 0C022188 */  jal   func_80088620
/* 08086C 8007FC6C 24060001 */   li    $a2, 1
/* 080870 8007FC70 8FA90030 */  lw    $t1, 0x30($sp)
/* 080874 8007FC74 3C08800F */  lui   $t0, %hi(D_800E8348) # $t0, 0x800f
/* 080878 8007FC78 25088348 */  addiu $t0, %lo(D_800E8348) # addiu $t0, $t0, -0x7cb8
/* 08087C 8007FC7C 3C04800E */  lui   $a0, %hi(D_800E7BE8) # $a0, 0x800e
/* 080880 8007FC80 3C068008 */  lui   $a2, %hi(D_80083E60) # $a2, 0x8008
/* 080884 8007FC84 24C63E60 */  addiu $a2, %lo(D_80083E60) # addiu $a2, $a2, 0x3e60
/* 080888 8007FC88 24847BE8 */  addiu $a0, %lo(D_800E7BE8) # addiu $a0, $a0, 0x7be8
/* 08088C 8007FC8C AFA80010 */  sw    $t0, 0x10($sp)
/* 080890 8007FC90 24050001 */  li    $a1, 1
/* 080894 8007FC94 00003825 */  or  $a3, $zero, $zero
/* 080898 8007FC98 0C022194 */  jal   osCreateThread
/* 08089C 8007FC9C AFA90014 */   sw    $t1, 0x14($sp)
/* 0808A0 8007FCA0 3C04800E */  lui   $a0, %hi(D_800E7BE8) # $a0, 0x800e
/* 0808A4 8007FCA4 0C022344 */  jal   osStartThread
/* 0808A8 8007FCA8 24847BE8 */   addiu $a0, %lo(D_800E7BE8) # addiu $a0, $a0, 0x7be8
/* 0808AC 8007FCAC 8FAB0034 */  lw    $t3, 0x34($sp)
/* 0808B0 8007FCB0 3C0A800F */  lui   $t2, %hi(D_800E8748) # $t2, 0x800f
/* 0808B4 8007FCB4 254A8748 */  addiu $t2, %lo(D_800E8748) # addiu $t2, $t2, -0x78b8
/* 0808B8 8007FCB8 3C04800E */  lui   $a0, %hi(D_800E7D98) # $a0, 0x800e
/* 0808BC 8007FCBC 3C068008 */  lui   $a2, %hi(D_8007FFE0) # $a2, 0x8008
/* 0808C0 8007FCC0 24C6FFE0 */  addiu $a2, %lo(D_8007FFE0) # addiu $a2, $a2, -0x20
/* 0808C4 8007FCC4 24847D98 */  addiu $a0, %lo(D_800E7D98) # addiu $a0, $a0, 0x7d98
/* 0808C8 8007FCC8 AFAA0010 */  sw    $t2, 0x10($sp)
/* 0808CC 8007FCCC 24050001 */  li    $a1, 1
/* 0808D0 8007FCD0 00003825 */  or  $a3, $zero, $zero
/* 0808D4 8007FCD4 0C022194 */  jal   osCreateThread
/* 0808D8 8007FCD8 AFAB0014 */   sw    $t3, 0x14($sp)
/* 0808DC 8007FCDC 3C04800E */  lui   $a0, %hi(D_800E7D98) # $a0, 0x800e
/* 0808E0 8007FCE0 0C022344 */  jal   osStartThread
/* 0808E4 8007FCE4 24847D98 */   addiu $a0, %lo(D_800E7D98) # addiu $a0, $a0, 0x7d98
/* 0808E8 8007FCE8 3C05800F */  lui   $a1, %hi(D_800E8760) # $a1, 0x800f
/* 0808EC 8007FCEC 24A58760 */  addiu $a1, %lo(D_800E8760) # addiu $a1, $a1, -0x78a0
/* 0808F0 8007FCF0 24040002 */  li    $a0, 2
/* 0808F4 8007FCF4 0C024D6C */  jal   func_800935B0
/* 0808F8 8007FCF8 3C060003 */   lui   $a2, 3
/* 0808FC 8007FCFC 3C04800F */  lui   $a0, %hi(D_800E87A8) # $a0, 0x800f
/* 080900 8007FD00 248487A8 */  addiu $a0, %lo(D_800E87A8) # addiu $a0, $a0, -0x7858
/* 080904 8007FD04 00002825 */  or  $a1, $zero, $zero
/* 080908 8007FD08 0C0222C4 */  jal   func_80088B10
/* 08090C 8007FD0C 00003025 */   or  $a2, $zero, $zero
/* 080910 8007FD10 0C024D64 */  jal   func_80093590
/* 080914 8007FD14 8FA4002C */   lw    $a0, 0x2c($sp)
/* 080918 8007FD18 8FAC0028 */  lw    $t4, 0x28($sp)
/* 08091C 8007FD1C 2401FFFF */  li    $at, -1
/* 080920 8007FD20 00002025 */  or  $a0, $zero, $zero
/* 080924 8007FD24 51810004 */  beql  $t4, $at, .L8007FD38
/* 080928 8007FD28 8FBF001C */   lw    $ra, 0x1c($sp)
/* 08092C 8007FD2C 0C022310 */  jal   osSetThreadPri
/* 080930 8007FD30 01802825 */   or  $a1, $t4, $zero
/* 080934 8007FD34 8FBF001C */  lw    $ra, 0x1c($sp)
.L8007FD38:
/* 080938 8007FD38 27BD0030 */  addiu $sp, $sp, 0x30
/* 08093C 8007FD3C 03E00008 */  jr    $ra
/* 080940 8007FD40 00000000 */   nop   

glabel func_8007FD44
/* 080944 8007FD44 3C0E800C */  lui   $t6, %hi(D_800C63C0) # $t6, 0x800c
/* 080948 8007FD48 8DCE63C0 */  lw    $t6, %lo(D_800C63C0)($t6)
/* 08094C 8007FD4C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 080950 8007FD50 AFBF0014 */  sw    $ra, 0x14($sp)
/* 080954 8007FD54 11C0000E */  beqz  $t6, .L8007FD90
/* 080958 8007FD58 00803825 */   or  $a3, $a0, $zero
/* 08095C 8007FD5C 90990002 */  lbu   $t9, 2($a0)
/* 080960 8007FD60 240F0002 */  li    $t7, 2
/* 080964 8007FD64 24180025 */  li    $t8, 37
/* 080968 8007FD68 33280080 */  andi  $t0, $t9, 0x80
/* 08096C 8007FD6C A08F0004 */  sb    $t7, 4($a0)
/* 080970 8007FD70 11000048 */  beqz  $t0, .L8007FE94
/* 080974 8007FD74 A0980005 */   sb    $t8, 5($a0)
/* 080978 8007FD78 8C840008 */  lw    $a0, 8($a0)
/* 08097C 8007FD7C 24050025 */  li    $a1, 37
/* 080980 8007FD80 0C0222C4 */  jal   func_80088B10
/* 080984 8007FD84 24060001 */   li    $a2, 1
/* 080988 8007FD88 10000043 */  b     .L8007FE98
/* 08098C 8007FD8C 8FBF0014 */   lw    $ra, 0x14($sp)
.L8007FD90:
/* 080990 8007FD90 3C04800F */  lui   $a0, %hi(D_800E87A8) # $a0, 0x800f
/* 080994 8007FD94 248487A8 */  addiu $a0, %lo(D_800E87A8) # addiu $a0, $a0, -0x7858
/* 080998 8007FD98 00002825 */  or  $a1, $zero, $zero
/* 08099C 8007FD9C 24060001 */  li    $a2, 1
/* 0809A0 8007FDA0 0C022278 */  jal   func_800889E0
/* 0809A4 8007FDA4 AFA70018 */   sw    $a3, 0x18($sp)
/* 0809A8 8007FDA8 8FA70018 */  lw    $a3, 0x18($sp)
/* 0809AC 8007FDAC 24090008 */  li    $t1, 8
/* 0809B0 8007FDB0 24010001 */  li    $at, 1
/* 0809B4 8007FDB4 90E40000 */  lbu   $a0, ($a3)
/* 0809B8 8007FDB8 240A00FF */  li    $t2, 255
/* 0809BC 8007FDBC A0E90004 */  sb    $t1, 4($a3)
/* 0809C0 8007FDC0 10810009 */  beq   $a0, $at, .L8007FDE8
/* 0809C4 8007FDC4 A0E00005 */   sb    $zero, 5($a3)
/* 0809C8 8007FDC8 24010005 */  li    $at, 5
/* 0809CC 8007FDCC 10810019 */  beq   $a0, $at, .L8007FE34
/* 0809D0 8007FDD0 00E02825 */   or  $a1, $a3, $zero
/* 0809D4 8007FDD4 24010006 */  li    $at, 6
/* 0809D8 8007FDD8 10810016 */  beq   $a0, $at, .L8007FE34
/* 0809DC 8007FDDC 248FFFFF */   addiu $t7, $a0, -1
/* 0809E0 8007FDE0 10000016 */  b     .L8007FE3C
/* 0809E4 8007FDE4 2DE1000E */   sltiu $at, $t7, 0xe
.L8007FDE8:
/* 0809E8 8007FDE8 3C0B800F */  lui   $t3, %hi(D_800E87E5) # $t3, 0x800f
/* 0809EC 8007FDEC 256B87E5 */  addiu $t3, %lo(D_800E87E5) # addiu $t3, $t3, -0x781b
/* 0809F0 8007FDF0 A16A0000 */  sb    $t2, ($t3)
/* 0809F4 8007FDF4 0C020534 */  jal   func_800814D0
/* 0809F8 8007FDF8 AFA70018 */   sw    $a3, 0x18($sp)
/* 0809FC 8007FDFC 8FA70018 */  lw    $a3, 0x18($sp)
/* 080A00 8007FE00 3C0C800F */  lui   $t4, %hi(D_800E87E5) # $t4, 0x800f
/* 080A04 8007FE04 258C87E5 */  addiu $t4, %lo(D_800E87E5) # addiu $t4, $t4, -0x781b
/* 080A08 8007FE08 A1800000 */  sb    $zero, ($t4)
/* 080A0C 8007FE0C 90ED0002 */  lbu   $t5, 2($a3)
/* 080A10 8007FE10 00002825 */  or  $a1, $zero, $zero
/* 080A14 8007FE14 24060001 */  li    $a2, 1
/* 080A18 8007FE18 31AE0080 */  andi  $t6, $t5, 0x80
/* 080A1C 8007FE1C 11C00018 */  beqz  $t6, .L8007FE80
/* 080A20 8007FE20 A0E00004 */   sb    $zero, 4($a3)
/* 080A24 8007FE24 0C0222C4 */  jal   func_80088B10
/* 080A28 8007FE28 8CE40008 */   lw    $a0, 8($a3)
/* 080A2C 8007FE2C 10000014 */  b     .L8007FE80
/* 080A30 8007FE30 00000000 */   nop   
.L8007FE34:
/* 080A34 8007FE34 10000007 */  b     .L8007FE54
/* 080A38 8007FE38 ACE00018 */   sw    $zero, 0x18($a3)
.L8007FE3C:
/* 080A3C 8007FE3C 14200005 */  bnez  $at, .L8007FE54
/* 080A40 8007FE40 2418001F */   li    $t8, 31
/* 080A44 8007FE44 24190002 */  li    $t9, 2
/* 080A48 8007FE48 A0F80005 */  sb    $t8, 5($a3)
/* 080A4C 8007FE4C 1000000C */  b     .L8007FE80
/* 080A50 8007FE50 A0F90004 */   sb    $t9, 4($a3)
.L8007FE54:
/* 080A54 8007FE54 3C04800F */  lui   $a0, %hi(D_800E8748) # $a0, 0x800f
/* 080A58 8007FE58 24848748 */  addiu $a0, %lo(D_800E8748) # addiu $a0, $a0, -0x78b8
/* 080A5C 8007FE5C 00003025 */  or  $a2, $zero, $zero
/* 080A60 8007FE60 0C0222C4 */  jal   func_80088B10
/* 080A64 8007FE64 AFA70018 */   sw    $a3, 0x18($sp)
/* 080A68 8007FE68 10400005 */  beqz  $v0, .L8007FE80
/* 080A6C 8007FE6C 8FA70018 */   lw    $a3, 0x18($sp)
/* 080A70 8007FE70 24080023 */  li    $t0, 35
/* 080A74 8007FE74 24090002 */  li    $t1, 2
/* 080A78 8007FE78 A0E80005 */  sb    $t0, 5($a3)
/* 080A7C 8007FE7C A0E90004 */  sb    $t1, 4($a3)
.L8007FE80:
/* 080A80 8007FE80 3C04800F */  lui   $a0, %hi(D_800E87A8) # $a0, 0x800f
/* 080A84 8007FE84 248487A8 */  addiu $a0, %lo(D_800E87A8) # addiu $a0, $a0, -0x7858
/* 080A88 8007FE88 00002825 */  or  $a1, $zero, $zero
/* 080A8C 8007FE8C 0C0222C4 */  jal   func_80088B10
/* 080A90 8007FE90 24060001 */   li    $a2, 1
.L8007FE94:
/* 080A94 8007FE94 8FBF0014 */  lw    $ra, 0x14($sp)
.L8007FE98:
/* 080A98 8007FE98 27BD0018 */  addiu $sp, $sp, 0x18
/* 080A9C 8007FE9C 03E00008 */  jr    $ra
/* 080AA0 8007FEA0 00000000 */   nop   

/* 080AA4 8007FEA4 3C0F800C */  lui   $t7, %hi(D_800C63C4) # $t7, 0x800c
/* 080AA8 8007FEA8 8DEF63C4 */  lw    $t7, %lo(D_800C63C4)($t7)
/* 080AAC 8007FEAC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 080AB0 8007FEB0 240E0001 */  li    $t6, 1
/* 080AB4 8007FEB4 3C01800C */  lui   $at, %hi(D_800C63C0) # $at, 0x800c
/* 080AB8 8007FEB8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 080ABC 8007FEBC 11E00019 */  beqz  $t7, .L8007FF24
/* 080AC0 8007FEC0 AC2E63C0 */   sw    $t6, %lo(D_800C63C0)($at)
/* 080AC4 8007FEC4 3C19800F */  lui   $t9, %hi(D_800E87E5) # $t9, 0x800f
/* 080AC8 8007FEC8 273987E5 */  addiu $t9, %lo(D_800E87E5) # addiu $t9, $t9, -0x781b
/* 080ACC 8007FECC 241800FF */  li    $t8, 255
/* 080AD0 8007FED0 0C020534 */  jal   func_800814D0
/* 080AD4 8007FED4 A3380000 */   sb    $t8, ($t9)
/* 080AD8 8007FED8 3C08800F */  lui   $t0, %hi(D_800E87E5) # $t0, 0x800f
/* 080ADC 8007FEDC 250887E5 */  addiu $t0, %lo(D_800E87E5) # addiu $t0, $t0, -0x781b
/* 080AE0 8007FEE0 3C04800F */  lui   $a0, %hi(D_800E8760) # $a0, 0x800f
/* 080AE4 8007FEE4 A1000000 */  sb    $zero, ($t0)
/* 080AE8 8007FEE8 24848760 */  addiu $a0, %lo(D_800E8760) # addiu $a0, $a0, -0x78a0
/* 080AEC 8007FEEC 00002825 */  or  $a1, $zero, $zero
/* 080AF0 8007FEF0 0C022278 */  jal   func_800889E0
/* 080AF4 8007FEF4 00003025 */   or  $a2, $zero, $zero
/* 080AF8 8007FEF8 3C04800F */  lui   $a0, %hi(D_800E8760) # $a0, 0x800f
/* 080AFC 8007FEFC 24848760 */  addiu $a0, %lo(D_800E8760) # addiu $a0, $a0, -0x78a0
/* 080B00 8007FF00 3C05000A */  lui   $a1, 0xa
/* 080B04 8007FF04 0C0222C4 */  jal   func_80088B10
/* 080B08 8007FF08 24060001 */   li    $a2, 1
/* 080B0C 8007FF0C 3C04800F */  lui   $a0, %hi(D_800E8748) # $a0, 0x800f
/* 080B10 8007FF10 3C05800D */  lui   $a1, %hi(D_800CBAF0) # $a1, 0x800d
/* 080B14 8007FF14 24A5BAF0 */  addiu $a1, %lo(D_800CBAF0) # addiu $a1, $a1, -0x4510
/* 080B18 8007FF18 24848748 */  addiu $a0, %lo(D_800E8748) # addiu $a0, $a0, -0x78b8
/* 080B1C 8007FF1C 0C0222C4 */  jal   func_80088B10
/* 080B20 8007FF20 24060001 */   li    $a2, 1
.L8007FF24:
/* 080B24 8007FF24 8FBF0014 */  lw    $ra, 0x14($sp)
/* 080B28 8007FF28 27BD0018 */  addiu $sp, $sp, 0x18
/* 080B2C 8007FF2C 03E00008 */  jr    $ra
/* 080B30 8007FF30 00000000 */   nop   

glabel func_8007FF34
/* 080B34 8007FF34 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 080B38 8007FF38 AFBF0014 */  sw    $ra, 0x14($sp)
/* 080B3C 8007FF3C 0C020494 */  jal   func_80081250
/* 080B40 8007FF40 00000000 */   nop   
/* 080B44 8007FF44 8FBF0014 */  lw    $ra, 0x14($sp)
/* 080B48 8007FF48 27BD0018 */  addiu $sp, $sp, 0x18
/* 080B4C 8007FF4C 00001025 */  or  $v0, $zero, $zero
/* 080B50 8007FF50 03E00008 */  jr    $ra
/* 080B54 8007FF54 00000000 */   nop   

/* 080B58 8007FF58 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 080B5C 8007FF5C 3C18800E */  lui   $t8, %hi(D_800E7A70) # $t8, 0x800e
/* 080B60 8007FF60 AFBF0014 */  sw    $ra, 0x14($sp)
/* 080B64 8007FF64 240E000F */  li    $t6, 15
/* 080B68 8007FF68 240F0080 */  li    $t7, 128
/* 080B6C 8007FF6C 27187A70 */  addiu $t8, %lo(D_800E7A70) # addiu $t8, $t8, 0x7a70
/* 080B70 8007FF70 3C04800F */  lui   $a0, %hi(D_800E8748) # $a0, 0x800f
/* 080B74 8007FF74 A3AE001C */  sb    $t6, 0x1c($sp)
/* 080B78 8007FF78 A3AF001E */  sb    $t7, 0x1e($sp)
/* 080B7C 8007FF7C A3A00020 */  sb    $zero, 0x20($sp)
/* 080B80 8007FF80 AFB80024 */  sw    $t8, 0x24($sp)
/* 080B84 8007FF84 24848748 */  addiu $a0, %lo(D_800E8748) # addiu $a0, $a0, -0x78b8
/* 080B88 8007FF88 27A5001C */  addiu $a1, $sp, 0x1c
/* 080B8C 8007FF8C 0C0222C4 */  jal   func_80088B10
/* 080B90 8007FF90 00003025 */   or  $a2, $zero, $zero
/* 080B94 8007FF94 10400003 */  beqz  $v0, .L8007FFA4
/* 080B98 8007FF98 3C04800E */   lui   $a0, %hi(D_800E7A70) # $a0, 0x800e
/* 080B9C 8007FF9C 1000000B */  b     .L8007FFCC
/* 080BA0 8007FFA0 24020023 */   li    $v0, 35
.L8007FFA4:
/* 080BA4 8007FFA4 24847A70 */  addiu $a0, %lo(D_800E7A70) # addiu $a0, $a0, 0x7a70
/* 080BA8 8007FFA8 00002825 */  or  $a1, $zero, $zero
/* 080BAC 8007FFAC 0C022278 */  jal   func_800889E0
/* 080BB0 8007FFB0 24060001 */   li    $a2, 1
/* 080BB4 8007FFB4 93B90020 */  lbu   $t9, 0x20($sp)
/* 080BB8 8007FFB8 93A20021 */  lbu   $v0, 0x21($sp)
/* 080BBC 8007FFBC 17200003 */  bnez  $t9, .L8007FFCC
/* 080BC0 8007FFC0 00000000 */   nop   
/* 080BC4 8007FFC4 10000001 */  b     .L8007FFCC
/* 080BC8 8007FFC8 00001025 */   or  $v0, $zero, $zero
.L8007FFCC:
/* 080BCC 8007FFCC 8FBF0014 */  lw    $ra, 0x14($sp)
/* 080BD0 8007FFD0 27BD0028 */  addiu $sp, $sp, 0x28
/* 080BD4 8007FFD4 03E00008 */  jr    $ra
/* 080BD8 8007FFD8 00000000 */   nop

/* 080BDC 8007FFDC 00000000 */  nop
