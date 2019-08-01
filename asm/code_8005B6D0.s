# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_8005B6D0
/* 05C2D0 8005B6D0 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 05C2D4 8005B6D4 AFBF0018 */  sw    $ra, 0x18($sp)
/* 05C2D8 8005B6D8 AFB10014 */  sw    $s1, 0x14($sp)
/* 05C2DC 8005B6DC AFB00010 */  sw    $s0, 0x10($sp)
/* 05C2E0 8005B6E0 00808821 */  addu  $s1, $a0, $zero
/* 05C2E4 8005B6E4 3C01800E */  lui   $at, %hi(D_800D8910) # $at, 0x800e
/* 05C2E8 8005B6E8 AC318910 */  sw    $s1, %lo(D_800D8910)($at)
/* 05C2EC 8005B6EC 0C00EDA9 */  jal   MallocPerm
/* 05C2F0 8005B6F0 24040010 */   li    $a0, 16
/* 05C2F4 8005B6F4 00408021 */  addu  $s0, $v0, $zero
/* 05C2F8 8005B6F8 02202021 */  addu  $a0, $s1, $zero
/* 05C2FC 8005B6FC 02002821 */  addu  $a1, $s0, $zero
/* 05C300 8005B700 0C0187FA */  jal   func_80061FE8
/* 05C304 8005B704 24060010 */   li    $a2, 16
/* 05C308 8005B708 8E020000 */  lw    $v0, ($s0)
/* 05C30C 8005B70C 3C01800E */  lui   $at, %hi(D_800D8914) # $at, 0x800e
/* 05C310 8005B710 AC228914 */  sw    $v0, %lo(D_800D8914)($at)
/* 05C314 8005B714 0C00EDB2 */  jal   FreePerm
/* 05C318 8005B718 02002021 */   addu  $a0, $s0, $zero
/* 05C31C 8005B71C 3C10800E */  lui   $s0, %hi(D_800D8914) # $s0, 0x800e
/* 05C320 8005B720 8E108914 */  lw    $s0, %lo(D_800D8914)($s0)
/* 05C324 8005B724 00108080 */  sll   $s0, $s0, 2
/* 05C328 8005B728 0C00EDA9 */  jal   MallocPerm
/* 05C32C 8005B72C 02002021 */   addu  $a0, $s0, $zero
/* 05C330 8005B730 3C01800E */  lui   $at, %hi(D_800D8918) # $at, 0x800e
/* 05C334 8005B734 AC228918 */  sw    $v0, %lo(D_800D8918)($at)
/* 05C338 8005B738 26240004 */  addiu $a0, $s1, 4
/* 05C33C 8005B73C 00402821 */  addu  $a1, $v0, $zero
/* 05C340 8005B740 0C0187FA */  jal   func_80061FE8
/* 05C344 8005B744 02003021 */   addu  $a2, $s0, $zero
/* 05C348 8005B748 8FBF0018 */  lw    $ra, 0x18($sp)
/* 05C34C 8005B74C 8FB10014 */  lw    $s1, 0x14($sp)
/* 05C350 8005B750 8FB00010 */  lw    $s0, 0x10($sp)
/* 05C354 8005B754 03E00008 */  jr    $ra
/* 05C358 8005B758 27BD0020 */   addiu $sp, $sp, 0x20

StringLen:
/* 05C35C 8005B75C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 05C360 8005B760 AFBF001C */  sw    $ra, 0x1c($sp)
/* 05C364 8005B764 AFB20018 */  sw    $s2, 0x18($sp)
/* 05C368 8005B768 AFB10014 */  sw    $s1, 0x14($sp)
/* 05C36C 8005B76C AFB00010 */  sw    $s0, 0x10($sp)
/* 05C370 8005B770 00808021 */  addu  $s0, $a0, $zero
/* 05C374 8005B774 00A08821 */  addu  $s1, $a1, $zero
/* 05C378 8005B778 0C00EDA9 */  jal   MallocPerm
/* 05C37C 8005B77C 24040010 */   li    $a0, 16
/* 05C380 8005B780 00409021 */  addu  $s2, $v0, $zero
/* 05C384 8005B784 3C02800E */  lui   $v0, %hi(D_800D8918) # $v0, 0x800e
/* 05C388 8005B788 8C428918 */  lw    $v0, %lo(D_800D8918)($v0)
/* 05C38C 8005B78C 00108080 */  sll   $s0, $s0, 2
/* 05C390 8005B790 02028021 */  addu  $s0, $s0, $v0
/* 05C394 8005B794 3C04800E */  lui   $a0, %hi(D_800D8910) # $a0, 0x800e
/* 05C398 8005B798 8C848910 */  lw    $a0, %lo(D_800D8910)($a0)
/* 05C39C 8005B79C 8E020000 */  lw    $v0, ($s0)
/* 05C3A0 8005B7A0 00822021 */  addu  $a0, $a0, $v0
/* 05C3A4 8005B7A4 AE240000 */  sw    $a0, ($s1)
/* 05C3A8 8005B7A8 02402821 */  addu  $a1, $s2, $zero
/* 05C3AC 8005B7AC 0C0187FA */  jal   func_80061FE8
/* 05C3B0 8005B7B0 24060010 */   li    $a2, 16
/* 05C3B4 8005B7B4 8E220000 */  lw    $v0, ($s1)
/* 05C3B8 8005B7B8 24420002 */  addiu $v0, $v0, 2
/* 05C3BC 8005B7BC AE220000 */  sw    $v0, ($s1)
/* 05C3C0 8005B7C0 96420000 */  lhu   $v0, ($s2)
/* 05C3C4 8005B7C4 A6220004 */  sh    $v0, 4($s1)
/* 05C3C8 8005B7C8 0C00EDB2 */  jal   FreePerm
/* 05C3CC 8005B7CC 02402021 */   addu  $a0, $s2, $zero
/* 05C3D0 8005B7D0 8FBF001C */  lw    $ra, 0x1c($sp)
/* 05C3D4 8005B7D4 8FB20018 */  lw    $s2, 0x18($sp)
/* 05C3D8 8005B7D8 8FB10014 */  lw    $s1, 0x14($sp)
/* 05C3DC 8005B7DC 8FB00010 */  lw    $s0, 0x10($sp)
/* 05C3E0 8005B7E0 03E00008 */  jr    $ra
/* 05C3E4 8005B7E4 27BD0020 */   addiu $sp, $sp, 0x20

LoadString:
/* 05C3E8 8005B7E8 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 05C3EC 8005B7EC AFBF001C */  sw    $ra, 0x1c($sp)
/* 05C3F0 8005B7F0 AFB00018 */  sw    $s0, 0x18($sp)
/* 05C3F4 8005B7F4 0C016DD7 */  jal   StringLen
/* 05C3F8 8005B7F8 27A50010 */   addiu $a1, $sp, 0x10
/* 05C3FC 8005B7FC 97A40014 */  lhu   $a0, 0x14($sp)
/* 05C400 8005B800 0C00EDA9 */  jal   MallocPerm
/* 05C404 8005B804 00000000 */   nop   
/* 05C408 8005B808 00408021 */  addu  $s0, $v0, $zero
/* 05C40C 8005B80C 12000006 */  beqz  $s0, .L8005B828
/* 05C410 8005B810 02001021 */   addu  $v0, $s0, $zero
/* 05C414 8005B814 8FA40010 */  lw    $a0, 0x10($sp)
/* 05C418 8005B818 97A60014 */  lhu   $a2, 0x14($sp)
/* 05C41C 8005B81C 0C0187FA */  jal   func_80061FE8
/* 05C420 8005B820 02002821 */   addu  $a1, $s0, $zero
/* 05C424 8005B824 02001021 */  addu  $v0, $s0, $zero
.L8005B828:
/* 05C428 8005B828 8FBF001C */  lw    $ra, 0x1c($sp)
/* 05C42C 8005B82C 8FB00018 */  lw    $s0, 0x18($sp)
/* 05C430 8005B830 03E00008 */  jr    $ra
/* 05C434 8005B834 27BD0020 */   addiu $sp, $sp, 0x20

FreeString:
/* 05C438 8005B838 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 05C43C 8005B83C 10800003 */  beqz  $a0, .L8005B84C
/* 05C440 8005B840 AFBF0010 */   sw    $ra, 0x10($sp)
/* 05C444 8005B844 0C00EDB2 */  jal   FreePerm
/* 05C448 8005B848 00000000 */   nop   
.L8005B84C:
/* 05C44C 8005B84C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 05C450 8005B850 03E00008 */  jr    $ra
/* 05C454 8005B854 27BD0018 */   addiu $sp, $sp, 0x18

/* 05C458 8005B858 00000000 */  nop   
/* 05C45C 8005B85C 00000000 */  nop   