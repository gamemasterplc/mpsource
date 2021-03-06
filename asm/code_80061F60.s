# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_80061F60
/* 062B60 80061F60 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 062B64 80061F64 AFBF0010 */  sw    $ra, 0x10($sp)
/* 062B68 80061F68 24040096 */  li    $a0, 150
/* 062B6C 80061F6C 3C05800F */  lui   $a1, %hi(D_800F65A0) # $a1, 0x800f
/* 062B70 80061F70 24A565A0 */  addiu $a1, %lo(D_800F65A0) # addiu $a1, $a1, 0x65a0
/* 062B74 80061F74 3C06800F */  lui   $a2, %hi(D_800ED570) # $a2, 0x800f
/* 062B78 80061F78 24C6D570 */  addiu $a2, %lo(D_800ED570) # addiu $a2, $a2, -0x2a90
/* 062B7C 80061F7C 0C02472C */  jal   func_80091CB0
/* 062B80 80061F80 24070014 */   li    $a3, 20
/* 062B84 80061F84 0C023E54 */  jal   func_8008F950
/* 062B88 80061F88 00000000 */   nop   
/* 062B8C 80061F8C 3C01800F */  lui   $at, %hi(D_800EE31C) # $at, 0x800f
/* 062B90 80061F90 AC22E31C */  sw    $v0, %lo(D_800EE31C)($at)
/* 062B94 80061F94 8FBF0010 */  lw    $ra, 0x10($sp)
/* 062B98 80061F98 03E00008 */  jr    $ra
/* 062B9C 80061F9C 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80061FA0
/* 062BA0 80061FA0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 062BA4 80061FA4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 062BA8 80061FA8 00801021 */  addu  $v0, $a0, $zero
/* 062BAC 80061FAC 8FA40028 */  lw    $a0, 0x28($sp)
/* 062BB0 80061FB0 8FA8002C */  lw    $t0, 0x2c($sp)
/* 062BB4 80061FB4 8FA30030 */  lw    $v1, 0x30($sp)
/* 062BB8 80061FB8 A0450002 */  sb    $a1, 2($v0)
/* 062BBC 80061FBC AC430004 */  sw    $v1, 4($v0)
/* 062BC0 80061FC0 AC440008 */  sw    $a0, 8($v0)
/* 062BC4 80061FC4 AC47000C */  sw    $a3, 0xc($v0)
/* 062BC8 80061FC8 AC480010 */  sw    $t0, 0x10($v0)
/* 062BCC 80061FCC 3C04800F */  lui   $a0, %hi(D_800EE31C) # $a0, 0x800f
/* 062BD0 80061FD0 8C84E31C */  lw    $a0, %lo(D_800EE31C)($a0)
/* 062BD4 80061FD4 0C022FAC */  jal   func_8008BEB0
/* 062BD8 80061FD8 00402821 */   addu  $a1, $v0, $zero
/* 062BDC 80061FDC 8FBF0010 */  lw    $ra, 0x10($sp)
/* 062BE0 80061FE0 03E00008 */  jr    $ra
/* 062BE4 80061FE4 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80061FE8
/* 062BE8 80061FE8 27BDFF98 */  addiu $sp, $sp, -0x68
/* 062BEC 80061FEC AFBF0064 */  sw    $ra, 0x64($sp)
/* 062BF0 80061FF0 AFB20060 */  sw    $s2, 0x60($sp)
/* 062BF4 80061FF4 AFB1005C */  sw    $s1, 0x5c($sp)
/* 062BF8 80061FF8 AFB00058 */  sw    $s0, 0x58($sp)
/* 062BFC 80061FFC 00809021 */  addu  $s2, $a0, $zero
/* 062C00 80062000 00A08021 */  addu  $s0, $a1, $zero
/* 062C04 80062004 00C08821 */  addu  $s1, $a2, $zero
/* 062C08 80062008 27A40020 */  addiu $a0, $sp, 0x20
/* 062C0C 8006200C 27A50050 */  addiu $a1, $sp, 0x50
/* 062C10 80062010 0C022188 */  jal   func_80088620
/* 062C14 80062014 24060001 */   li    $a2, 1
/* 062C18 80062018 2625000F */  addiu $a1, $s1, 0xf
/* 062C1C 8006201C 00052902 */  srl   $a1, $a1, 4
/* 062C20 80062020 02002021 */  addu  $a0, $s0, $zero
/* 062C24 80062024 0C0220C0 */  jal   func_80088300
/* 062C28 80062028 00052900 */   sll   $a1, $a1, 4
/* 062C2C 8006202C AFB00010 */  sw    $s0, 0x10($sp)
/* 062C30 80062030 AFB10014 */  sw    $s1, 0x14($sp)
/* 062C34 80062034 27B10020 */  addiu $s1, $sp, 0x20
/* 062C38 80062038 AFB10018 */  sw    $s1, 0x18($sp)
/* 062C3C 8006203C 27A40038 */  addiu $a0, $sp, 0x38
/* 062C40 80062040 00002821 */  addu  $a1, $zero, $zero
/* 062C44 80062044 00003021 */  addu  $a2, $zero, $zero
/* 062C48 80062048 0C0187E8 */  jal   func_80061FA0
/* 062C4C 8006204C 02403821 */   addu  $a3, $s2, $zero
/* 062C50 80062050 00408021 */  addu  $s0, $v0, $zero
/* 062C54 80062054 16000006 */  bnez  $s0, .L80062070
/* 062C58 80062058 02001021 */   addu  $v0, $s0, $zero
/* 062C5C 8006205C 02202021 */  addu  $a0, $s1, $zero
/* 062C60 80062060 00002821 */  addu  $a1, $zero, $zero
/* 062C64 80062064 0C022278 */  jal   func_800889E0
/* 062C68 80062068 24060001 */   li    $a2, 1
/* 062C6C 8006206C 02001021 */  addu  $v0, $s0, $zero
.L80062070:
/* 062C70 80062070 8FBF0064 */  lw    $ra, 0x64($sp)
/* 062C74 80062074 8FB20060 */  lw    $s2, 0x60($sp)
/* 062C78 80062078 8FB1005C */  lw    $s1, 0x5c($sp)
/* 062C7C 8006207C 8FB00058 */  lw    $s0, 0x58($sp)
/* 062C80 80062080 03E00008 */  jr    $ra
/* 062C84 80062084 27BD0068 */   addiu $sp, $sp, 0x68

ReadFromRom:
/* 062C88 80062088 27BDFF90 */  addiu $sp, $sp, -0x70
/* 062C8C 8006208C AFBF0068 */  sw    $ra, 0x68($sp)
/* 062C90 80062090 AFB30064 */  sw    $s3, 0x64($sp)
/* 062C94 80062094 AFB20060 */  sw    $s2, 0x60($sp)
/* 062C98 80062098 AFB1005C */  sw    $s1, 0x5c($sp)
/* 062C9C 8006209C AFB00058 */  sw    $s0, 0x58($sp)
/* 062CA0 800620A0 00809821 */  addu  $s3, $a0, $zero
/* 062CA4 800620A4 00A08821 */  addu  $s1, $a1, $zero
/* 062CA8 800620A8 00C09021 */  addu  $s2, $a2, $zero
/* 062CAC 800620AC 27A40020 */  addiu $a0, $sp, 0x20
/* 062CB0 800620B0 27A50050 */  addiu $a1, $sp, 0x50
/* 062CB4 800620B4 0C022188 */  jal   func_80088620
/* 062CB8 800620B8 24060001 */   li    $a2, 1
/* 062CBC 800620BC 2650000F */  addiu $s0, $s2, 0xf
/* 062CC0 800620C0 00108102 */  srl   $s0, $s0, 4
/* 062CC4 800620C4 00108100 */  sll   $s0, $s0, 4
/* 062CC8 800620C8 02202021 */  addu  $a0, $s1, $zero
/* 062CCC 800620CC 0C0220EC */  jal   func_800883B0
/* 062CD0 800620D0 02002821 */   addu  $a1, $s0, $zero
/* 062CD4 800620D4 02202021 */  addu  $a0, $s1, $zero
/* 062CD8 800620D8 0C0220C0 */  jal   func_80088300
/* 062CDC 800620DC 02002821 */   addu  $a1, $s0, $zero
/* 062CE0 800620E0 AFB10010 */  sw    $s1, 0x10($sp)
/* 062CE4 800620E4 AFB20014 */  sw    $s2, 0x14($sp)
/* 062CE8 800620E8 27B10020 */  addiu $s1, $sp, 0x20
/* 062CEC 800620EC AFB10018 */  sw    $s1, 0x18($sp)
/* 062CF0 800620F0 27A40038 */  addiu $a0, $sp, 0x38
/* 062CF4 800620F4 00002821 */  addu  $a1, $zero, $zero
/* 062CF8 800620F8 00003021 */  addu  $a2, $zero, $zero
/* 062CFC 800620FC 0C0187E8 */  jal   func_80061FA0
/* 062D00 80062100 02603821 */   addu  $a3, $s3, $zero
/* 062D04 80062104 00408021 */  addu  $s0, $v0, $zero
/* 062D08 80062108 16000006 */  bnez  $s0, .L80062124
/* 062D0C 8006210C 02001021 */   addu  $v0, $s0, $zero
/* 062D10 80062110 02202021 */  addu  $a0, $s1, $zero
/* 062D14 80062114 00002821 */  addu  $a1, $zero, $zero
/* 062D18 80062118 0C022278 */  jal   func_800889E0
/* 062D1C 8006211C 24060001 */   li    $a2, 1
/* 062D20 80062120 02001021 */  addu  $v0, $s0, $zero
.L80062124:
/* 062D24 80062124 8FBF0068 */  lw    $ra, 0x68($sp)
/* 062D28 80062128 8FB30064 */  lw    $s3, 0x64($sp)
/* 062D2C 8006212C 8FB20060 */  lw    $s2, 0x60($sp)
/* 062D30 80062130 8FB1005C */  lw    $s1, 0x5c($sp)
/* 062D34 80062134 8FB00058 */  lw    $s0, 0x58($sp)
/* 062D38 80062138 03E00008 */  jr    $ra
/* 062D3C 8006213C 27BD0070 */   addiu $sp, $sp, 0x70
