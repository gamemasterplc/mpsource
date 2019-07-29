# Mario Party (U) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

D_800420A0:
/* 042CA0 800420A0 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 042CA4 800420A4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 042CA8 800420A8 F7B80028 */  sdc1  $f24, 0x28($sp)
/* 042CAC 800420AC F7B60020 */  sdc1  $f22, 0x20($sp)
/* 042CB0 800420B0 F7B40018 */  sdc1  $f20, 0x18($sp)
/* 042CB4 800420B4 3C0142C0 */  li    $at, 0x42C00000 # 96.000000
/* 042CB8 800420B8 4481A000 */  mtc1  $at, $f20
/* 042CBC 800420BC 00000000 */  nop   
/* 042CC0 800420C0 0C018085 */  jal   func_80060214
/* 042CC4 800420C4 24040060 */   li    $a0, 96
/* 042CC8 800420C8 3C013FF8 */  li    $at, 0x3FF80000 # 1.937500
/* 042CCC 800420CC 4481C000 */  mtc1  $at, $f24
/* 042CD0 800420D0 3C0142FE */  li    $at, 0x42FE0000 # 127.000000
/* 042CD4 800420D4 4481B000 */  mtc1  $at, $f22
.L800420D8:
/* 042CD8 800420D8 0C018D6D */  jal   SleepVProcess
/* 042CDC 800420DC 00000000 */   nop   
/* 042CE0 800420E0 4618A500 */  add.s $f20, $f20, $f24
/* 042CE4 800420E4 4614B03E */  c.le.s $f22, $f20
/* 042CE8 800420E8 00000000 */  nop   
/* 042CEC 800420EC 00000000 */  nop   
/* 042CF0 800420F0 45030001 */  bc1tl .L800420F8
/* 042CF4 800420F4 4600B506 */   mov.s $f20, $f22
.L800420F8:
/* 042CF8 800420F8 4600A00D */  trunc.w.s $f0, $f20
/* 042CFC 800420FC 44040000 */  mfc1  $a0, $f0
/* 042D00 80042100 00000000 */  nop   
/* 042D04 80042104 00042600 */  sll   $a0, $a0, 0x18
/* 042D08 80042108 0C018085 */  jal   func_80060214
/* 042D0C 8004210C 00042603 */   sra   $a0, $a0, 0x18
/* 042D10 80042110 4616A03C */  c.lt.s $f20, $f22
/* 042D14 80042114 00000000 */  nop   
/* 042D18 80042118 4501FFEF */  bc1t  .L800420D8
/* 042D1C 8004211C 00000000 */   nop   
/* 042D20 80042120 0C017764 */  jal   EndProcess
/* 042D24 80042124 00002021 */   addu  $a0, $zero, $zero
/* 042D28 80042128 8FBF0010 */  lw    $ra, 0x10($sp)
/* 042D2C 8004212C D7B80028 */  ldc1  $f24, 0x28($sp)
/* 042D30 80042130 D7B60020 */  ldc1  $f22, 0x20($sp)
/* 042D34 80042134 D7B40018 */  ldc1  $f20, 0x18($sp)
/* 042D38 80042138 03E00008 */  jr    $ra
/* 042D3C 8004213C 27BD0030 */   addiu $sp, $sp, 0x30

D_80042140:
/* 042D40 80042140 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 042D44 80042144 AFBF0010 */  sw    $ra, 0x10($sp)
/* 042D48 80042148 F7B80028 */  sdc1  $f24, 0x28($sp)
/* 042D4C 8004214C F7B60020 */  sdc1  $f22, 0x20($sp)
/* 042D50 80042150 F7B40018 */  sdc1  $f20, 0x18($sp)
/* 042D54 80042154 3C0142FE */  li    $at, 0x42FE0000 # 127.000000
/* 042D58 80042158 4481A000 */  mtc1  $at, $f20
/* 042D5C 8004215C 00000000 */  nop   
/* 042D60 80042160 0C018085 */  jal   func_80060214
/* 042D64 80042164 2404007F */   li    $a0, 127
/* 042D68 80042168 3C013FF8 */  li    $at, 0x3FF80000 # 1.937500
/* 042D6C 8004216C 4481C000 */  mtc1  $at, $f24
/* 042D70 80042170 3C0142C0 */  li    $at, 0x42C00000 # 96.000000
/* 042D74 80042174 4481B000 */  mtc1  $at, $f22
.L80042178:
/* 042D78 80042178 0C018D6D */  jal   SleepVProcess
/* 042D7C 8004217C 00000000 */   nop   
/* 042D80 80042180 4618A501 */  sub.s $f20, $f20, $f24
/* 042D84 80042184 4616A03E */  c.le.s $f20, $f22
/* 042D88 80042188 00000000 */  nop   
/* 042D8C 8004218C 00000000 */  nop   
/* 042D90 80042190 45030001 */  bc1tl .L80042198
/* 042D94 80042194 4600B506 */   mov.s $f20, $f22
.L80042198:
/* 042D98 80042198 4600A00D */  trunc.w.s $f0, $f20
/* 042D9C 8004219C 44040000 */  mfc1  $a0, $f0
/* 042DA0 800421A0 00000000 */  nop   
/* 042DA4 800421A4 00042600 */  sll   $a0, $a0, 0x18
/* 042DA8 800421A8 0C018085 */  jal   func_80060214
/* 042DAC 800421AC 00042603 */   sra   $a0, $a0, 0x18
/* 042DB0 800421B0 4614B03C */  c.lt.s $f22, $f20
/* 042DB4 800421B4 00000000 */  nop   
/* 042DB8 800421B8 4501FFEF */  bc1t  .L80042178
/* 042DBC 800421BC 00000000 */   nop   
/* 042DC0 800421C0 0C017764 */  jal   EndProcess
/* 042DC4 800421C4 00002021 */   addu  $a0, $zero, $zero
/* 042DC8 800421C8 8FBF0010 */  lw    $ra, 0x10($sp)
/* 042DCC 800421CC D7B80028 */  ldc1  $f24, 0x28($sp)
/* 042DD0 800421D0 D7B60020 */  ldc1  $f22, 0x20($sp)
/* 042DD4 800421D4 D7B40018 */  ldc1  $f20, 0x18($sp)
/* 042DD8 800421D8 03E00008 */  jr    $ra
/* 042DDC 800421DC 27BD0030 */   addiu $sp, $sp, 0x30

glabel func_800421E0
/* 042DE0 800421E0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 042DE4 800421E4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 042DE8 800421E8 3C048004 */  lui   $a0, %hi(D_80042140) # $a0, 0x8004
/* 042DEC 800421EC 24842140 */  addiu $a0, %lo(D_80042140) # addiu $a0, $a0, 0x2140
/* 042DF0 800421F0 3405EFFF */  li    $a1, 61439
/* 042DF4 800421F4 00003021 */  addu  $a2, $zero, $zero
/* 042DF8 800421F8 0C01770A */  jal   InitProcess
/* 042DFC 800421FC 00003821 */   addu  $a3, $zero, $zero
/* 042E00 80042200 8FBF0010 */  lw    $ra, 0x10($sp)
/* 042E04 80042204 03E00008 */  jr    $ra
/* 042E08 80042208 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_8004220C
/* 042E0C 8004220C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 042E10 80042210 AFBF0010 */  sw    $ra, 0x10($sp)
/* 042E14 80042214 3C048004 */  lui   $a0, %hi(D_800420A0) # $a0, 0x8004
/* 042E18 80042218 248420A0 */  addiu $a0, %lo(D_800420A0) # addiu $a0, $a0, 0x20a0
/* 042E1C 8004221C 3405EFFF */  li    $a1, 61439
/* 042E20 80042220 00003021 */  addu  $a2, $zero, $zero
/* 042E24 80042224 0C01770A */  jal   InitProcess
/* 042E28 80042228 00003821 */   addu  $a3, $zero, $zero
/* 042E2C 8004222C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 042E30 80042230 03E00008 */  jr    $ra
/* 042E34 80042234 27BD0018 */   addiu $sp, $sp, 0x18

/* 042E38 80042238 00000000 */  nop   
/* 042E3C 8004223C 00000000 */  nop   
