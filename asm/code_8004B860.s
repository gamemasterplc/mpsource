# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_8004B860
/* 04C460 8004B860 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 04C464 8004B864 AFBF0020 */  sw    $ra, 0x20($sp)
/* 04C468 8004B868 AFB3001C */  sw    $s3, 0x1c($sp)
/* 04C46C 8004B86C AFB20018 */  sw    $s2, 0x18($sp)
/* 04C470 8004B870 AFB10014 */  sw    $s1, 0x14($sp)
/* 04C474 8004B874 AFB00010 */  sw    $s0, 0x10($sp)
/* 04C478 8004B878 3C01800E */  lui   $at, %hi(D_800D8140) # $at, 0x800e
/* 04C47C 8004B87C A4248140 */  sh    $a0, %lo(D_800D8140)($at)
/* 04C480 8004B880 00042400 */  sll   $a0, $a0, 0x10
/* 04C484 8004B884 00042403 */  sra   $a0, $a0, 0x10
/* 04C488 8004B888 10800005 */  beqz  $a0, .L8004B8A0
/* 04C48C 8004B88C 24020001 */   li    $v0, 1
/* 04C490 8004B890 10820007 */  beq   $a0, $v0, .L8004B8B0
/* 04C494 8004B894 00000000 */   nop   
/* 04C498 8004B898 08012E30 */  j     func_8004B8C0
/* 04C49C 8004B89C 00008021 */   addu  $s0, $zero, $zero

.L8004B8A0:
/* 04C4A0 8004B8A0 3C12800C */  lui   $s2, %hi(D_800C4FD4) # $s2, 0x800c
/* 04C4A4 8004B8A4 26524FD4 */  addiu $s2, %lo(D_800C4FD4) # addiu $s2, $s2, 0x4fd4
/* 04C4A8 8004B8A8 08012E32 */  j     func_8004B8C8
/* 04C4AC 8004B8AC 00008021 */   addu  $s0, $zero, $zero

.L8004B8B0:
/* 04C4B0 8004B8B0 3C12800C */  lui   $s2, %hi(D_800C4FFC) # $s2, 0x800c
/* 04C4B4 8004B8B4 26524FFC */  addiu $s2, %lo(D_800C4FFC) # addiu $s2, $s2, 0x4ffc
/* 04C4B8 8004B8B8 08012E32 */  j     func_8004B8C8
/* 04C4BC 8004B8BC 00008021 */   addu  $s0, $zero, $zero

glabel func_8004B8C0
/* 04C4C0 8004B8C0 3C12800C */  lui   $s2, %hi(D_800C5024) # $s2, 0x800c
/* 04C4C4 8004B8C4 26525024 */  addiu $s2, %lo(D_800C5024) # addiu $s2, $s2, 0x5024
glabel func_8004B8C8
/* 04C4C8 8004B8C8 3C13800E */  lui   $s3, %hi(D_800D8118) # $s3, 0x800e
/* 04C4CC 8004B8CC 26738118 */  addiu $s3, %lo(D_800D8118) # addiu $s3, $s3, -0x7ee8
/* 04C4D0 8004B8D0 00108880 */  sll   $s1, $s0, 2
.L8004B8D4:
/* 04C4D4 8004B8D4 02321021 */  addu  $v0, $s1, $s2
/* 04C4D8 8004B8D8 8C440000 */  lw    $a0, ($v0)
/* 04C4DC 8004B8DC 10800006 */  beqz  $a0, .L8004B8F8
/* 04C4E0 8004B8E0 00101080 */   sll   $v0, $s0, 2
/* 04C4E4 8004B8E4 0C00516C */  jal   ReadMainFS
/* 04C4E8 8004B8E8 26100001 */   addiu $s0, $s0, 1
/* 04C4EC 8004B8EC 02331821 */  addu  $v1, $s1, $s3
/* 04C4F0 8004B8F0 08012E41 */  j     func_8004B904
/* 04C4F4 8004B8F4 AC620000 */   sw    $v0, ($v1)

.L8004B8F8:
/* 04C4F8 8004B8F8 00531021 */  addu  $v0, $v0, $s3
/* 04C4FC 8004B8FC AC400000 */  sw    $zero, ($v0)
/* 04C500 8004B900 26100001 */  addiu $s0, $s0, 1
glabel func_8004B904
/* 04C504 8004B904 2A02000A */  slti  $v0, $s0, 0xa
/* 04C508 8004B908 1440FFF2 */  bnez  $v0, .L8004B8D4
/* 04C50C 8004B90C 00108880 */   sll   $s1, $s0, 2
/* 04C510 8004B910 8FBF0020 */  lw    $ra, 0x20($sp)
/* 04C514 8004B914 8FB3001C */  lw    $s3, 0x1c($sp)
/* 04C518 8004B918 8FB20018 */  lw    $s2, 0x18($sp)
/* 04C51C 8004B91C 8FB10014 */  lw    $s1, 0x14($sp)
/* 04C520 8004B920 8FB00010 */  lw    $s0, 0x10($sp)
/* 04C524 8004B924 03E00008 */  jr    $ra
/* 04C528 8004B928 27BD0028 */   addiu $sp, $sp, 0x28

glabel func_8004B92C
/* 04C52C 8004B92C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 04C530 8004B930 AFBF0018 */  sw    $ra, 0x18($sp)
/* 04C534 8004B934 AFB10014 */  sw    $s1, 0x14($sp)
/* 04C538 8004B938 AFB00010 */  sw    $s0, 0x10($sp)
/* 04C53C 8004B93C 00008021 */  addu  $s0, $zero, $zero
/* 04C540 8004B940 3C11800E */  lui   $s1, %hi(D_800D8118) # $s1, 0x800e
/* 04C544 8004B944 26318118 */  addiu $s1, %lo(D_800D8118) # addiu $s1, $s1, -0x7ee8
/* 04C548 8004B948 00101080 */  sll   $v0, $s0, 2
.L8004B94C:
/* 04C54C 8004B94C 00511021 */  addu  $v0, $v0, $s1
/* 04C550 8004B950 8C440000 */  lw    $a0, ($v0)
/* 04C554 8004B954 10800004 */  beqz  $a0, .L8004B968
/* 04C558 8004B958 00101080 */   sll   $v0, $s0, 2
/* 04C55C 8004B95C 0C0051CC */  jal   func_80014730
/* 04C560 8004B960 00000000 */   nop   
/* 04C564 8004B964 00101080 */  sll   $v0, $s0, 2
.L8004B968:
/* 04C568 8004B968 00511021 */  addu  $v0, $v0, $s1
/* 04C56C 8004B96C AC400000 */  sw    $zero, ($v0)
/* 04C570 8004B970 26100001 */  addiu $s0, $s0, 1
/* 04C574 8004B974 2A02000A */  slti  $v0, $s0, 0xa
/* 04C578 8004B978 1440FFF4 */  bnez  $v0, .L8004B94C
/* 04C57C 8004B97C 00101080 */   sll   $v0, $s0, 2
/* 04C580 8004B980 8FBF0018 */  lw    $ra, 0x18($sp)
/* 04C584 8004B984 8FB10014 */  lw    $s1, 0x14($sp)
/* 04C588 8004B988 8FB00010 */  lw    $s0, 0x10($sp)
/* 04C58C 8004B98C 03E00008 */  jr    $ra
/* 04C590 8004B990 27BD0020 */   addiu $sp, $sp, 0x20

glabel func_8004B994
/* 04C594 8004B994 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04C598 8004B998 AFBF0010 */  sw    $ra, 0x10($sp)
/* 04C59C 8004B99C 0C012E18 */  jal   func_8004B860
/* 04C5A0 8004B9A0 00002021 */   addu  $a0, $zero, $zero
/* 04C5A4 8004B9A4 3C01800C */  lui   $at, %hi(D_800C4FD0) # $at, 0x800c
/* 04C5A8 8004B9A8 AC204FD0 */  sw    $zero, %lo(D_800C4FD0)($at)
/* 04C5AC 8004B9AC 8FBF0010 */  lw    $ra, 0x10($sp)
/* 04C5B0 8004B9B0 03E00008 */  jr    $ra
/* 04C5B4 8004B9B4 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_8004B9B8
/* 04C5B8 8004B9B8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04C5BC 8004B9BC AFBF0010 */  sw    $ra, 0x10($sp)
/* 04C5C0 8004B9C0 0C012E4B */  jal   func_8004B92C
/* 04C5C4 8004B9C4 00000000 */   nop   
/* 04C5C8 8004B9C8 8FBF0010 */  lw    $ra, 0x10($sp)
/* 04C5CC 8004B9CC 03E00008 */  jr    $ra
/* 04C5D0 8004B9D0 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_8004B9D4
/* 04C5D4 8004B9D4 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04C5D8 8004B9D8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04C5DC 8004B9DC AFB00010 */  sw    $s0, 0x10($sp)
/* 04C5E0 8004B9E0 0C012E4B */  jal   func_8004B92C
/* 04C5E4 8004B9E4 00808021 */   addu  $s0, $a0, $zero
/* 04C5E8 8004B9E8 00108400 */  sll   $s0, $s0, 0x10
/* 04C5EC 8004B9EC 0C012E18 */  jal   func_8004B860
/* 04C5F0 8004B9F0 00102403 */   sra   $a0, $s0, 0x10
/* 04C5F4 8004B9F4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04C5F8 8004B9F8 8FB00010 */  lw    $s0, 0x10($sp)
/* 04C5FC 8004B9FC 03E00008 */  jr    $ra
/* 04C600 8004BA00 27BD0018 */   addiu $sp, $sp, 0x18

D_8004BA04:
/* 04C604 8004BA04 27BDFF68 */  addiu $sp, $sp, -0x98
/* 04C608 8004BA08 AFBF008C */  sw    $ra, 0x8c($sp)
/* 04C60C 8004BA0C AFBE0088 */  sw    $fp, 0x88($sp)
/* 04C610 8004BA10 AFB70084 */  sw    $s7, 0x84($sp)
/* 04C614 8004BA14 AFB60080 */  sw    $s6, 0x80($sp)
/* 04C618 8004BA18 AFB5007C */  sw    $s5, 0x7c($sp)
/* 04C61C 8004BA1C AFB40078 */  sw    $s4, 0x78($sp)
/* 04C620 8004BA20 AFB30074 */  sw    $s3, 0x74($sp)
/* 04C624 8004BA24 AFB20070 */  sw    $s2, 0x70($sp)
/* 04C628 8004BA28 AFB1006C */  sw    $s1, 0x6c($sp)
/* 04C62C 8004BA2C AFB00068 */  sw    $s0, 0x68($sp)
/* 04C630 8004BA30 F7B40090 */  sdc1  $f20, 0x90($sp)
/* 04C634 8004BA34 00808821 */  addu  $s1, $a0, $zero
/* 04C638 8004BA38 30C600FF */  andi  $a2, $a2, 0xff
/* 04C63C 8004BA3C 14C000DE */  bnez  $a2, .L8004BDB8
/* 04C640 8004BA40 AFA50054 */   sw    $a1, 0x54($sp)
/* 04C644 8004BA44 3C02800F */  lui   $v0, %hi(D_800F3290) # $v0, 0x800f
/* 04C648 8004BA48 94423290 */  lhu   $v0, %lo(D_800F3290)($v0)
/* 04C64C 8004BA4C 104000DA */  beqz  $v0, .L8004BDB8
/* 04C650 8004BA50 00002021 */   addu  $a0, $zero, $zero
/* 04C654 8004BA54 8E230000 */  lw    $v1, ($s1)
/* 04C658 8004BA58 24620008 */  addiu $v0, $v1, 8
/* 04C65C 8004BA5C AE220000 */  sw    $v0, ($s1)
/* 04C660 8004BA60 3C02DE00 */  lui   $v0, 0xde00
/* 04C664 8004BA64 AC620000 */  sw    $v0, ($v1)
/* 04C668 8004BA68 3C02800C */  lui   $v0, %hi(D_800C5120) # $v0, 0x800c
/* 04C66C 8004BA6C 24425120 */  addiu $v0, %lo(D_800C5120) # addiu $v0, $v0, 0x5120
/* 04C670 8004BA70 AC620004 */  sw    $v0, 4($v1)
/* 04C674 8004BA74 0C007596 */  jal   func_8001D658
/* 04C678 8004BA78 02202821 */   addu  $a1, $s1, $zero
/* 04C67C 8004BA7C 00002021 */  addu  $a0, $zero, $zero
/* 04C680 8004BA80 0C0075F7 */  jal   func_8001D7DC
/* 04C684 8004BA84 02202821 */   addu  $a1, $s1, $zero
/* 04C688 8004BA88 3C03800E */  lui   $v1, %hi(D_800D8140) # $v1, 0x800e
/* 04C68C 8004BA8C 84638140 */  lh    $v1, %lo(D_800D8140)($v1)
/* 04C690 8004BA90 10600005 */  beqz  $v1, .L8004BAA8
/* 04C694 8004BA94 24020001 */   li    $v0, 1
/* 04C698 8004BA98 10620009 */  beq   $v1, $v0, .L8004BAC0
/* 04C69C 8004BA9C 24020020 */   li    $v0, 32
/* 04C6A0 8004BAA0 08012EB6 */  j     func_8004BAD8
/* 04C6A4 8004BAA4 00000000 */   nop   

.L8004BAA8:
/* 04C6A8 8004BAA8 3C16000C */  lui   $s6, %hi(D_000C50A0) # $s6, 0xc
/* 04C6AC 8004BAAC 26D650A0 */  addiu $s6, %lo(D_000C50A0) # addiu $s6, $s6, 0x50a0
/* 04C6B0 8004BAB0 3C1E800C */  lui   $fp, %hi(D_800C504C) # $fp, 0x800c
/* 04C6B4 8004BAB4 27DE504C */  addiu $fp, %lo(D_800C504C) # addiu $fp, $fp, 0x504c
/* 04C6B8 8004BAB8 08012EBA */  j     func_8004BAE8
/* 04C6BC 8004BABC 24020020 */   li    $v0, 32

.L8004BAC0:
/* 04C6C0 8004BAC0 3C16000C */  lui   $s6, %hi(D_000C50E0) # $s6, 0xc
/* 04C6C4 8004BAC4 26D650E0 */  addiu $s6, %lo(D_000C50E0) # addiu $s6, $s6, 0x50e0
/* 04C6C8 8004BAC8 3C1E800C */  lui   $fp, %hi(D_800C504C) # $fp, 0x800c
/* 04C6CC 8004BACC 27DE504C */  addiu $fp, %lo(D_800C504C) # addiu $fp, $fp, 0x504c
/* 04C6D0 8004BAD0 08012EBA */  j     func_8004BAE8
/* 04C6D4 8004BAD4 24020008 */   li    $v0, 8

glabel func_8004BAD8
/* 04C6D8 8004BAD8 3C16000C */  lui   $s6, %hi(D_000C50A0) # $s6, 0xc
/* 04C6DC 8004BADC 26D650A0 */  addiu $s6, %lo(D_000C50A0) # addiu $s6, $s6, 0x50a0
/* 04C6E0 8004BAE0 3C1E800C */  lui   $fp, %hi(D_800C5074) # $fp, 0x800c
/* 04C6E4 8004BAE4 27DE5074 */  addiu $fp, %lo(D_800C5074) # addiu $fp, $fp, 0x5074
glabel func_8004BAE8
/* 04C6E8 8004BAE8 00009821 */  addu  $s3, $zero, $zero
/* 04C6EC 8004BAEC 0040A821 */  addu  $s5, $v0, $zero
/* 04C6F0 8004BAF0 0002A042 */  srl   $s4, $v0, 1
/* 04C6F4 8004BAF4 02B50018 */  mult  $s5, $s5
/* 04C6F8 8004BAF8 00004012 */  mflo  $t0
/* 04C6FC 8004BAFC AFA8005C */  sw    $t0, 0x5c($sp)
/* 04C700 8004BB00 26A2FFFF */  addiu $v0, $s5, -1
/* 04C704 8004BB04 00021080 */  sll   $v0, $v0, 2
/* 04C708 8004BB08 30570FFF */  andi  $s7, $v0, 0xfff
.L8004BB0C:
/* 04C70C 8004BB0C 3C02800E */  lui   $v0, %hi(D_800D8118) # $v0, 0x800e
/* 04C710 8004BB10 24428118 */  addiu $v0, %lo(D_800D8118) # addiu $v0, $v0, -0x7ee8
/* 04C714 8004BB14 00131880 */  sll   $v1, $s3, 2
/* 04C718 8004BB18 00622021 */  addu  $a0, $v1, $v0
/* 04C71C 8004BB1C 8C820000 */  lw    $v0, ($a0)
/* 04C720 8004BB20 104000A1 */  beqz  $v0, .L8004BDA8
/* 04C724 8004BB24 007E1021 */   addu  $v0, $v1, $fp
/* 04C728 8004BB28 C4540000 */  lwc1  $f20, ($v0)
/* 04C72C 8004BB2C 8E230000 */  lw    $v1, ($s1)
/* 04C730 8004BB30 24620008 */  addiu $v0, $v1, 8
/* 04C734 8004BB34 AE220000 */  sw    $v0, ($s1)
/* 04C738 8004BB38 3C02FD18 */  lui   $v0, 0xfd18
/* 04C73C 8004BB3C AC620000 */  sw    $v0, ($v1)
/* 04C740 8004BB40 8C820000 */  lw    $v0, ($a0)
/* 04C744 8004BB44 24420010 */  addiu $v0, $v0, 0x10
/* 04C748 8004BB48 AC620004 */  sw    $v0, 4($v1)
/* 04C74C 8004BB4C 8E230000 */  lw    $v1, ($s1)
/* 04C750 8004BB50 24620008 */  addiu $v0, $v1, 8
/* 04C754 8004BB54 AE220000 */  sw    $v0, ($s1)
/* 04C758 8004BB58 3C08F518 */  lui   $t0, 0xf518
/* 04C75C 8004BB5C AC680000 */  sw    $t0, ($v1)
/* 04C760 8004BB60 3C020708 */  lui   $v0, (0x07080200 >> 16) # lui $v0, 0x708
/* 04C764 8004BB64 34420200 */  ori   $v0, (0x07080200 & 0xFFFF) # ori $v0, $v0, 0x200
/* 04C768 8004BB68 AC620004 */  sw    $v0, 4($v1)
/* 04C76C 8004BB6C 8E230000 */  lw    $v1, ($s1)
/* 04C770 8004BB70 24620008 */  addiu $v0, $v1, 8
/* 04C774 8004BB74 AE220000 */  sw    $v0, ($s1)
/* 04C778 8004BB78 3C02E600 */  lui   $v0, 0xe600
/* 04C77C 8004BB7C AC620000 */  sw    $v0, ($v1)
/* 04C780 8004BB80 AC600004 */  sw    $zero, 4($v1)
/* 04C784 8004BB84 8E230000 */  lw    $v1, ($s1)
/* 04C788 8004BB88 24620008 */  addiu $v0, $v1, 8
/* 04C78C 8004BB8C AE220000 */  sw    $v0, ($s1)
/* 04C790 8004BB90 00603021 */  addu  $a2, $v1, $zero
/* 04C794 8004BB94 3C02F300 */  lui   $v0, 0xf300
/* 04C798 8004BB98 ACC20000 */  sw    $v0, ($a2)
/* 04C79C 8004BB9C 1A800002 */  blez  $s4, .L8004BBA8
/* 04C7A0 8004BBA0 24040800 */   li    $a0, 2048
/* 04C7A4 8004BBA4 268407FF */  addiu $a0, $s4, 0x7ff
.L8004BBA8:
/* 04C7A8 8004BBA8 8FA8005C */  lw    $t0, 0x5c($sp)
/* 04C7AC 8004BBAC 2503FFFF */  addiu $v1, $t0, -1
/* 04C7B0 8004BBB0 28620800 */  slti  $v0, $v1, 0x800
/* 04C7B4 8004BBB4 50400001 */  beql  $v0, $zero, .L8004BBBC
/* 04C7B8 8004BBB8 240307FF */   li    $v1, 2047
.L8004BBBC:
/* 04C7BC 8004BBBC 30620FFF */  andi  $v0, $v1, 0xfff
/* 04C7C0 8004BBC0 00021300 */  sll   $v0, $v0, 0xc
/* 04C7C4 8004BBC4 3C030700 */  lui   $v1, 0x700
/* 04C7C8 8004BBC8 1A800010 */  blez  $s4, .L8004BC0C
/* 04C7CC 8004BBCC 00432825 */   or    $a1, $v0, $v1
/* 04C7D0 8004BBD0 0094001A */  div   $zero, $a0, $s4
/* 04C7D4 8004BBD4 16800002 */  bnez  $s4, .L8004BBE0
/* 04C7D8 8004BBD8 00000000 */   nop   
/* 04C7DC 8004BBDC 0007000D */  break 7
.L8004BBE0:
/* 04C7E0 8004BBE0 2401FFFF */  li    $at, -1
/* 04C7E4 8004BBE4 16810004 */  bne   $s4, $at, .L8004BBF8
/* 04C7E8 8004BBE8 3C018000 */   lui   $at, 0x8000
/* 04C7EC 8004BBEC 14810002 */  bne   $a0, $at, .L8004BBF8
/* 04C7F0 8004BBF0 00000000 */   nop   
/* 04C7F4 8004BBF4 0006000D */  break 6
.L8004BBF8:
/* 04C7F8 8004BBF8 00001012 */  mflo  $v0
/* 04C7FC 8004BBFC 00000000 */  nop   
/* 04C800 8004BC00 00000000 */  nop   
/* 04C804 8004BC04 08012F04 */  j     func_8004BC10
/* 04C808 8004BC08 30420FFF */   andi  $v0, $v0, 0xfff

.L8004BC0C:
/* 04C80C 8004BC0C 30820FFF */  andi  $v0, $a0, 0xfff
glabel func_8004BC10
/* 04C810 8004BC10 00A21025 */  or    $v0, $a1, $v0
/* 04C814 8004BC14 ACC20004 */  sw    $v0, 4($a2)
/* 04C818 8004BC18 8E230000 */  lw    $v1, ($s1)
/* 04C81C 8004BC1C 24620008 */  addiu $v0, $v1, 8
/* 04C820 8004BC20 AE220000 */  sw    $v0, ($s1)
/* 04C824 8004BC24 3C02E700 */  lui   $v0, 0xe700
/* 04C828 8004BC28 AC620000 */  sw    $v0, ($v1)
/* 04C82C 8004BC2C AC600004 */  sw    $zero, 4($v1)
/* 04C830 8004BC30 8E230000 */  lw    $v1, ($s1)
/* 04C834 8004BC34 24620008 */  addiu $v0, $v1, 8
/* 04C838 8004BC38 AE220000 */  sw    $v0, ($s1)
/* 04C83C 8004BC3C 001511C0 */  sll   $v0, $s5, 7
/* 04C840 8004BC40 3C08F518 */  lui   $t0, 0xf518
/* 04C844 8004BC44 00481025 */  or    $v0, $v0, $t0
/* 04C848 8004BC48 AC620000 */  sw    $v0, ($v1)
/* 04C84C 8004BC4C 3C020008 */  lui   $v0, (0x00080200 >> 16) # lui $v0, 8
/* 04C850 8004BC50 34420200 */  ori   $v0, (0x00080200 & 0xFFFF) # ori $v0, $v0, 0x200
/* 04C854 8004BC54 AC620004 */  sw    $v0, 4($v1)
/* 04C858 8004BC58 8E230000 */  lw    $v1, ($s1)
/* 04C85C 8004BC5C 24620008 */  addiu $v0, $v1, 8
/* 04C860 8004BC60 AE220000 */  sw    $v0, ($s1)
/* 04C864 8004BC64 3C02F200 */  lui   $v0, 0xf200
/* 04C868 8004BC68 AC620000 */  sw    $v0, ($v1)
/* 04C86C 8004BC6C 00171300 */  sll   $v0, $s7, 0xc
/* 04C870 8004BC70 00571025 */  or    $v0, $v0, $s7
/* 04C874 8004BC74 AC620004 */  sw    $v0, 4($v1)
/* 04C878 8004BC78 3C02800E */  lui   $v0, %hi(D_800D8100) # $v0, 0x800e
/* 04C87C 8004BC7C 94428100 */  lhu   $v0, %lo(D_800D8100)($v0)
/* 04C880 8004BC80 18400049 */  blez  $v0, .L8004BDA8
/* 04C884 8004BC84 00009021 */   addu  $s2, $zero, $zero
/* 04C888 8004BC88 00122400 */  sll   $a0, $s2, 0x10
.L8004BC8C:
/* 04C88C 8004BC8C 0C01307B */  jal   GetSpaceData
/* 04C890 8004BC90 00042403 */   sra   $a0, $a0, 0x10
/* 04C894 8004BC94 00408021 */  addu  $s0, $v0, $zero
/* 04C898 8004BC98 92020001 */  lbu   $v0, 1($s0)
/* 04C89C 8004BC9C 5453003D */  bnel  $v0, $s3, .L8004BD94
/* 04C8A0 8004BCA0 26520001 */   addiu $s2, $s2, 1
/* 04C8A4 8004BCA4 92020000 */  lbu   $v0, ($s0)
/* 04C8A8 8004BCA8 30420001 */  andi  $v0, $v0, 1
/* 04C8AC 8004BCAC 10400038 */  beqz  $v0, .L8004BD90
/* 04C8B0 8004BCB0 27A40010 */   addiu $a0, $sp, 0x10
/* 04C8B4 8004BCB4 8FA80054 */  lw    $t0, 0x54($sp)
/* 04C8B8 8004BCB8 0C0282E4 */  jal   func_800A0B90
/* 04C8BC 8004BCBC 25050040 */   addiu $a1, $t0, 0x40
/* 04C8C0 8004BCC0 8E050004 */  lw    $a1, 4($s0)
/* 04C8C4 8004BCC4 8E060008 */  lw    $a2, 8($s0)
/* 04C8C8 8004BCC8 8E07000C */  lw    $a3, 0xc($s0)
/* 04C8CC 8004BCCC 0C0088E4 */  jal   func_80022390
/* 04C8D0 8004BCD0 27A40010 */   addiu $a0, $sp, 0x10
/* 04C8D4 8004BCD4 C6000010 */  lwc1  $f0, 0x10($s0)
/* 04C8D8 8004BCD8 C6020018 */  lwc1  $f2, 0x18($s0)
/* 04C8DC 8004BCDC 4600A002 */  mul.s $f0, $f20, $f0
/* 04C8E0 8004BCE0 44050000 */  mfc1  $a1, $f0
/* 04C8E4 8004BCE4 3C063F80 */  lui   $a2, 0x3f80
/* 04C8E8 8004BCE8 4602A082 */  mul.s $f2, $f20, $f2
/* 04C8EC 8004BCEC 44071000 */  mfc1  $a3, $f2
/* 04C8F0 8004BCF0 00000000 */  nop   
/* 04C8F4 8004BCF4 0C008914 */  jal   func_80022450
/* 04C8F8 8004BCF8 27A40010 */   addiu $a0, $sp, 0x10
/* 04C8FC 8004BCFC 3C10800F */  lui   $s0, %hi(D_800ED52C) # $s0, 0x800f
/* 04C900 8004BD00 9610D52C */  lhu   $s0, %lo(D_800ED52C)($s0)
/* 04C904 8004BD04 26020001 */  addiu $v0, $s0, 1
/* 04C908 8004BD08 3C01800F */  lui   $at, %hi(D_800ED52C) # $at, 0x800f
/* 04C90C 8004BD0C A422D52C */  sh    $v0, %lo(D_800ED52C)($at)
/* 04C910 8004BD10 00108400 */  sll   $s0, $s0, 0x10
/* 04C914 8004BD14 00108283 */  sra   $s0, $s0, 0xa
/* 04C918 8004BD18 3C02800F */  lui   $v0, %hi(D_800F374C) # $v0, 0x800f
/* 04C91C 8004BD1C 8C42374C */  lw    $v0, %lo(D_800F374C)($v0)
/* 04C920 8004BD20 02028021 */  addu  $s0, $s0, $v0
/* 04C924 8004BD24 27A40010 */  addiu $a0, $sp, 0x10
/* 04C928 8004BD28 0C028288 */  jal   func_800A0A20
/* 04C92C 8004BD2C 02002821 */   addu  $a1, $s0, $zero
/* 04C930 8004BD30 8E230000 */  lw    $v1, ($s1)
/* 04C934 8004BD34 24620008 */  addiu $v0, $v1, 8
/* 04C938 8004BD38 AE220000 */  sw    $v0, ($s1)
/* 04C93C 8004BD3C 3C02DA38 */  lui   $v0, (0xDA380003 >> 16) # lui $v0, 0xda38
/* 04C940 8004BD40 34420003 */  ori   $v0, (0xDA380003 & 0xFFFF) # ori $v0, $v0, 3
/* 04C944 8004BD44 AC620000 */  sw    $v0, ($v1)
/* 04C948 8004BD48 3C028000 */  lui   $v0, 0x8000
/* 04C94C 8004BD4C 02028023 */  subu  $s0, $s0, $v0
/* 04C950 8004BD50 AC700004 */  sw    $s0, 4($v1)
/* 04C954 8004BD54 8E230000 */  lw    $v1, ($s1)
/* 04C958 8004BD58 24620008 */  addiu $v0, $v1, 8
/* 04C95C 8004BD5C AE220000 */  sw    $v0, ($s1)
/* 04C960 8004BD60 3C020100 */  lui   $v0, (0x01004008 >> 16) # lui $v0, 0x100
/* 04C964 8004BD64 34424008 */  ori   $v0, (0x01004008 & 0xFFFF) # ori $v0, $v0, 0x4008
/* 04C968 8004BD68 AC620000 */  sw    $v0, ($v1)
/* 04C96C 8004BD6C AC760004 */  sw    $s6, 4($v1)
/* 04C970 8004BD70 8E230000 */  lw    $v1, ($s1)
/* 04C974 8004BD74 24620008 */  addiu $v0, $v1, 8
/* 04C978 8004BD78 AE220000 */  sw    $v0, ($s1)
/* 04C97C 8004BD7C 3C020600 */  lui   $v0, (0x06000204 >> 16) # lui $v0, 0x600
/* 04C980 8004BD80 34420204 */  ori   $v0, (0x06000204 & 0xFFFF) # ori $v0, $v0, 0x204
/* 04C984 8004BD84 AC620000 */  sw    $v0, ($v1)
/* 04C988 8004BD88 24020406 */  li    $v0, 1030
/* 04C98C 8004BD8C AC620004 */  sw    $v0, 4($v1)
.L8004BD90:
/* 04C990 8004BD90 26520001 */  addiu $s2, $s2, 1
.L8004BD94:
/* 04C994 8004BD94 3C02800E */  lui   $v0, %hi(D_800D8100) # $v0, 0x800e
/* 04C998 8004BD98 94428100 */  lhu   $v0, %lo(D_800D8100)($v0)
/* 04C99C 8004BD9C 0242102A */  slt   $v0, $s2, $v0
/* 04C9A0 8004BDA0 1440FFBA */  bnez  $v0, .L8004BC8C
/* 04C9A4 8004BDA4 00122400 */   sll   $a0, $s2, 0x10
.L8004BDA8:
/* 04C9A8 8004BDA8 26730001 */  addiu $s3, $s3, 1
/* 04C9AC 8004BDAC 2A62000A */  slti  $v0, $s3, 0xa
/* 04C9B0 8004BDB0 1440FF56 */  bnez  $v0, .L8004BB0C
/* 04C9B4 8004BDB4 00000000 */   nop   
.L8004BDB8:
/* 04C9B8 8004BDB8 8FBF008C */  lw    $ra, 0x8c($sp)
/* 04C9BC 8004BDBC 8FBE0088 */  lw    $fp, 0x88($sp)
/* 04C9C0 8004BDC0 8FB70084 */  lw    $s7, 0x84($sp)
/* 04C9C4 8004BDC4 8FB60080 */  lw    $s6, 0x80($sp)
/* 04C9C8 8004BDC8 8FB5007C */  lw    $s5, 0x7c($sp)
/* 04C9CC 8004BDCC 8FB40078 */  lw    $s4, 0x78($sp)
/* 04C9D0 8004BDD0 8FB30074 */  lw    $s3, 0x74($sp)
/* 04C9D4 8004BDD4 8FB20070 */  lw    $s2, 0x70($sp)
/* 04C9D8 8004BDD8 8FB1006C */  lw    $s1, 0x6c($sp)
/* 04C9DC 8004BDDC 8FB00068 */  lw    $s0, 0x68($sp)
/* 04C9E0 8004BDE0 D7B40090 */  ldc1  $f20, 0x90($sp)
/* 04C9E4 8004BDE4 03E00008 */  jr    $ra
/* 04C9E8 8004BDE8 27BD0098 */   addiu $sp, $sp, 0x98

glabel func_8004BDEC
/* 04C9EC 8004BDEC 00852821 */  addu  $a1, $a0, $a1
/* 04C9F0 8004BDF0 94A20000 */  lhu   $v0, ($a1)
/* 04C9F4 8004BDF4 03E00008 */  jr    $ra
/* 04C9F8 8004BDF8 00821021 */   addu  $v0, $a0, $v0

BoardDefInit:
/* 04C9FC 8004BDFC 27BDFFB0 */  addiu $sp, $sp, -0x50
/* 04CA00 8004BE00 AFBF0048 */  sw    $ra, 0x48($sp)
/* 04CA04 8004BE04 AFB30044 */  sw    $s3, 0x44($sp)
/* 04CA08 8004BE08 AFB20040 */  sw    $s2, 0x40($sp)
/* 04CA0C 8004BE0C AFB1003C */  sw    $s1, 0x3c($sp)
/* 04CA10 8004BE10 AFB00038 */  sw    $s0, 0x38($sp)
/* 04CA14 8004BE14 00042400 */  sll   $a0, $a0, 0x10
/* 04CA18 8004BE18 00052C00 */  sll   $a1, $a1, 0x10
/* 04CA1C 8004BE1C 00052C03 */  sra   $a1, $a1, 0x10
/* 04CA20 8004BE20 0C00516C */  jal   ReadMainFS
/* 04CA24 8004BE24 00852025 */   or    $a0, $a0, $a1
/* 04CA28 8004BE28 3C01800C */  lui   $at, %hi(D_800C4FD0) # $at, 0x800c
/* 04CA2C 8004BE2C AC224FD0 */  sw    $v0, %lo(D_800C4FD0)($at)
/* 04CA30 8004BE30 504000AC */  beql  $v0, $zero, .L8004C0E4
/* 04CA34 8004BE34 00001021 */   addu  $v0, $zero, $zero
/* 04CA38 8004BE38 3C01800E */  lui   $at, %hi(D_800D8144) # $at, 0x800e
/* 04CA3C 8004BE3C AC208144 */  sw    $zero, %lo(D_800D8144)($at)
/* 04CA40 8004BE40 3C01800E */  lui   $at, %hi(D_800D8148) # $at, 0x800e
/* 04CA44 8004BE44 AC208148 */  sw    $zero, %lo(D_800D8148)($at)
/* 04CA48 8004BE48 3C01800E */  lui   $at, %hi(D_800D814C) # $at, 0x800e
/* 04CA4C 8004BE4C AC20814C */  sw    $zero, %lo(D_800D814C)($at)
/* 04CA50 8004BE50 3C01800E */  lui   $at, %hi(D_800D8150) # $at, 0x800e
/* 04CA54 8004BE54 AC208150 */  sw    $zero, %lo(D_800D8150)($at)
/* 04CA58 8004BE58 00408021 */  addu  $s0, $v0, $zero
/* 04CA5C 8004BE5C 96020000 */  lhu   $v0, ($s0)
/* 04CA60 8004BE60 3C01800E */  lui   $at, %hi(D_800D8100) # $at, 0x800e
/* 04CA64 8004BE64 A4228100 */  sh    $v0, %lo(D_800D8100)($at)
/* 04CA68 8004BE68 26100002 */  addiu $s0, $s0, 2
/* 04CA6C 8004BE6C 96020000 */  lhu   $v0, ($s0)
/* 04CA70 8004BE70 3C01800E */  lui   $at, %hi(D_800D8102) # $at, 0x800e
/* 04CA74 8004BE74 A4228102 */  sh    $v0, %lo(D_800D8102)($at)
/* 04CA78 8004BE78 96020002 */  lhu   $v0, 2($s0)
/* 04CA7C 8004BE7C 3C01800E */  lui   $at, %hi(D_800D8104) # $at, 0x800e
/* 04CA80 8004BE80 A4228104 */  sh    $v0, %lo(D_800D8104)($at)
/* 04CA84 8004BE84 3C04800E */  lui   $a0, %hi(D_800D8100) # $a0, 0x800e
/* 04CA88 8004BE88 94848100 */  lhu   $a0, %lo(D_800D8100)($a0)
/* 04CA8C 8004BE8C 0C00EDDD */  jal   MallocTemp
/* 04CA90 8004BE90 00042140 */   sll   $a0, $a0, 5
/* 04CA94 8004BE94 3C01800E */  lui   $at, %hi(D_800D8108) # $at, 0x800e
/* 04CA98 8004BE98 AC228108 */  sw    $v0, %lo(D_800D8108)($at)
/* 04CA9C 8004BE9C 3C04800C */  lui   $a0, %hi(D_800C4FD0) # $a0, 0x800c
/* 04CAA0 8004BEA0 8C844FD0 */  lw    $a0, %lo(D_800C4FD0)($a0)
/* 04CAA4 8004BEA4 0C012F7B */  jal   func_8004BDEC
/* 04CAA8 8004BEA8 24050006 */   li    $a1, 6
/* 04CAAC 8004BEAC 00408021 */  addu  $s0, $v0, $zero
/* 04CAB0 8004BEB0 3C03800E */  lui   $v1, %hi(D_800D8108) # $v1, 0x800e
/* 04CAB4 8004BEB4 8C638108 */  lw    $v1, %lo(D_800D8108)($v1)
/* 04CAB8 8004BEB8 3C02800E */  lui   $v0, %hi(D_800D8100) # $v0, 0x800e
/* 04CABC 8004BEBC 94428100 */  lhu   $v0, %lo(D_800D8100)($v0)
/* 04CAC0 8004BEC0 18400021 */  blez  $v0, .L8004BF48
/* 04CAC4 8004BEC4 00009021 */   addu  $s2, $zero, $zero
/* 04CAC8 8004BEC8 24040001 */  li    $a0, 1
/* 04CACC 8004BECC 3C0140A0 */  li    $at, 0x40A00000 # 5.000000
/* 04CAD0 8004BED0 44812000 */  mtc1  $at, $f4
/* 04CAD4 8004BED4 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 04CAD8 8004BED8 44811000 */  mtc1  $at, $f2
.L8004BEDC:
/* 04CADC 8004BEDC A0640000 */  sb    $a0, ($v1)
/* 04CAE0 8004BEE0 96020000 */  lhu   $v0, ($s0)
/* 04CAE4 8004BEE4 A4620002 */  sh    $v0, 2($v1)
/* 04CAE8 8004BEE8 26100002 */  addiu $s0, $s0, 2
/* 04CAEC 8004BEEC 92020001 */  lbu   $v0, 1($s0)
/* 04CAF0 8004BEF0 A0620001 */  sb    $v0, 1($v1)
/* 04CAF4 8004BEF4 26100002 */  addiu $s0, $s0, 2
/* 04CAF8 8004BEF8 C6000000 */  lwc1  $f0, ($s0)
/* 04CAFC 8004BEFC 46040002 */  mul.s $f0, $f0, $f4
/* 04CB00 8004BF00 E4600004 */  swc1  $f0, 4($v1)
/* 04CB04 8004BF04 C6000004 */  lwc1  $f0, 4($s0)
/* 04CB08 8004BF08 46040002 */  mul.s $f0, $f0, $f4
/* 04CB0C 8004BF0C E4600008 */  swc1  $f0, 8($v1)
/* 04CB10 8004BF10 C6000008 */  lwc1  $f0, 8($s0)
/* 04CB14 8004BF14 46040002 */  mul.s $f0, $f0, $f4
/* 04CB18 8004BF18 E460000C */  swc1  $f0, 0xc($v1)
/* 04CB1C 8004BF1C 2610000C */  addiu $s0, $s0, 0xc
/* 04CB20 8004BF20 E4620010 */  swc1  $f2, 0x10($v1)
/* 04CB24 8004BF24 E4620014 */  swc1  $f2, 0x14($v1)
/* 04CB28 8004BF28 E4620018 */  swc1  $f2, 0x18($v1)
/* 04CB2C 8004BF2C AC60001C */  sw    $zero, 0x1c($v1)
/* 04CB30 8004BF30 26520001 */  addiu $s2, $s2, 1
/* 04CB34 8004BF34 3C02800E */  lui   $v0, %hi(D_800D8100) # $v0, 0x800e
/* 04CB38 8004BF38 94428100 */  lhu   $v0, %lo(D_800D8100)($v0)
/* 04CB3C 8004BF3C 0242102A */  slt   $v0, $s2, $v0
/* 04CB40 8004BF40 1440FFE6 */  bnez  $v0, .L8004BEDC
/* 04CB44 8004BF44 24630020 */   addiu $v1, $v1, 0x20
.L8004BF48:
/* 04CB48 8004BF48 3C04800E */  lui   $a0, %hi(D_800D8102) # $a0, 0x800e
/* 04CB4C 8004BF4C 94848102 */  lhu   $a0, %lo(D_800D8102)($a0)
/* 04CB50 8004BF50 0C00EDDD */  jal   MallocTemp
/* 04CB54 8004BF54 000420C0 */   sll   $a0, $a0, 3
/* 04CB58 8004BF58 3C01800E */  lui   $at, %hi(D_800D810C) # $at, 0x800e
/* 04CB5C 8004BF5C AC22810C */  sw    $v0, %lo(D_800D810C)($at)
/* 04CB60 8004BF60 3C04800C */  lui   $a0, %hi(D_800C4FD0) # $a0, 0x800c
/* 04CB64 8004BF64 8C844FD0 */  lw    $a0, %lo(D_800C4FD0)($a0)
/* 04CB68 8004BF68 0C012F7B */  jal   func_8004BDEC
/* 04CB6C 8004BF6C 24050008 */   li    $a1, 8
/* 04CB70 8004BF70 00409821 */  addu  $s3, $v0, $zero
/* 04CB74 8004BF74 3C11800E */  lui   $s1, %hi(D_800D810C) # $s1, 0x800e
/* 04CB78 8004BF78 8E31810C */  lw    $s1, %lo(D_800D810C)($s1)
/* 04CB7C 8004BF7C 3C02800E */  lui   $v0, %hi(D_800D8102) # $v0, 0x800e
/* 04CB80 8004BF80 94428102 */  lhu   $v0, %lo(D_800D8102)($v0)
/* 04CB84 8004BF84 1840001E */  blez  $v0, .L8004C000
/* 04CB88 8004BF88 00009021 */   addu  $s2, $zero, $zero
.L8004BF8C:
/* 04CB8C 8004BF8C 02602021 */  addu  $a0, $s3, $zero
/* 04CB90 8004BF90 0C012F7B */  jal   func_8004BDEC
/* 04CB94 8004BF94 00122840 */   sll   $a1, $s2, 1
/* 04CB98 8004BF98 00408021 */  addu  $s0, $v0, $zero
/* 04CB9C 8004BF9C 96040000 */  lhu   $a0, ($s0)
/* 04CBA0 8004BFA0 A6240000 */  sh    $a0, ($s1)
/* 04CBA4 8004BFA4 26100002 */  addiu $s0, $s0, 2
/* 04CBA8 8004BFA8 00042400 */  sll   $a0, $a0, 0x10
/* 04CBAC 8004BFAC 0C00EDDD */  jal   MallocTemp
/* 04CBB0 8004BFB0 000423C3 */   sra   $a0, $a0, 0xf
/* 04CBB4 8004BFB4 AE220004 */  sw    $v0, 4($s1)
/* 04CBB8 8004BFB8 00402021 */  addu  $a0, $v0, $zero
/* 04CBBC 8004BFBC 86220000 */  lh    $v0, ($s1)
/* 04CBC0 8004BFC0 18400009 */  blez  $v0, .L8004BFE8
/* 04CBC4 8004BFC4 00001821 */   addu  $v1, $zero, $zero
.L8004BFC8:
/* 04CBC8 8004BFC8 96020000 */  lhu   $v0, ($s0)
/* 04CBCC 8004BFCC A4820000 */  sh    $v0, ($a0)
/* 04CBD0 8004BFD0 26100002 */  addiu $s0, $s0, 2
/* 04CBD4 8004BFD4 24630001 */  addiu $v1, $v1, 1
/* 04CBD8 8004BFD8 86220000 */  lh    $v0, ($s1)
/* 04CBDC 8004BFDC 0062102A */  slt   $v0, $v1, $v0
/* 04CBE0 8004BFE0 1440FFF9 */  bnez  $v0, .L8004BFC8
/* 04CBE4 8004BFE4 24840002 */   addiu $a0, $a0, 2
.L8004BFE8:
/* 04CBE8 8004BFE8 26520001 */  addiu $s2, $s2, 1
/* 04CBEC 8004BFEC 3C02800E */  lui   $v0, %hi(D_800D8102) # $v0, 0x800e
/* 04CBF0 8004BFF0 94428102 */  lhu   $v0, %lo(D_800D8102)($v0)
/* 04CBF4 8004BFF4 0242102A */  slt   $v0, $s2, $v0
/* 04CBF8 8004BFF8 1440FFE4 */  bnez  $v0, .L8004BF8C
/* 04CBFC 8004BFFC 26310008 */   addiu $s1, $s1, 8
.L8004C000:
/* 04CC00 8004C000 3C04800E */  lui   $a0, %hi(D_800D8104) # $a0, 0x800e
/* 04CC04 8004C004 94848104 */  lhu   $a0, %lo(D_800D8104)($a0)
/* 04CC08 8004C008 0C00EDDD */  jal   MallocTemp
/* 04CC0C 8004C00C 000420C0 */   sll   $a0, $a0, 3
/* 04CC10 8004C010 3C01800E */  lui   $at, %hi(D_800D8110) # $at, 0x800e
/* 04CC14 8004C014 AC228110 */  sw    $v0, %lo(D_800D8110)($at)
/* 04CC18 8004C018 3C04800C */  lui   $a0, %hi(D_800C4FD0) # $a0, 0x800c
/* 04CC1C 8004C01C 8C844FD0 */  lw    $a0, %lo(D_800C4FD0)($a0)
/* 04CC20 8004C020 0C012F7B */  jal   func_8004BDEC
/* 04CC24 8004C024 2405000A */   li    $a1, 10
/* 04CC28 8004C028 00409821 */  addu  $s3, $v0, $zero
/* 04CC2C 8004C02C 3C11800E */  lui   $s1, %hi(D_800D8110) # $s1, 0x800e
/* 04CC30 8004C030 8E318110 */  lw    $s1, %lo(D_800D8110)($s1)
/* 04CC34 8004C034 3C02800E */  lui   $v0, %hi(D_800D8104) # $v0, 0x800e
/* 04CC38 8004C038 94428104 */  lhu   $v0, %lo(D_800D8104)($v0)
/* 04CC3C 8004C03C 1840001E */  blez  $v0, .L8004C0B8
/* 04CC40 8004C040 00009021 */   addu  $s2, $zero, $zero
.L8004C044:
/* 04CC44 8004C044 02602021 */  addu  $a0, $s3, $zero
/* 04CC48 8004C048 0C012F7B */  jal   func_8004BDEC
/* 04CC4C 8004C04C 00122840 */   sll   $a1, $s2, 1
/* 04CC50 8004C050 00408021 */  addu  $s0, $v0, $zero
/* 04CC54 8004C054 96040000 */  lhu   $a0, ($s0)
/* 04CC58 8004C058 A6240000 */  sh    $a0, ($s1)
/* 04CC5C 8004C05C 26100002 */  addiu $s0, $s0, 2
/* 04CC60 8004C060 00042400 */  sll   $a0, $a0, 0x10
/* 04CC64 8004C064 0C00EDDD */  jal   MallocTemp
/* 04CC68 8004C068 000423C3 */   sra   $a0, $a0, 0xf
/* 04CC6C 8004C06C AE220004 */  sw    $v0, 4($s1)
/* 04CC70 8004C070 00402021 */  addu  $a0, $v0, $zero
/* 04CC74 8004C074 86220000 */  lh    $v0, ($s1)
/* 04CC78 8004C078 18400009 */  blez  $v0, .L8004C0A0
/* 04CC7C 8004C07C 00001821 */   addu  $v1, $zero, $zero
.L8004C080:
/* 04CC80 8004C080 96020000 */  lhu   $v0, ($s0)
/* 04CC84 8004C084 A4820000 */  sh    $v0, ($a0)
/* 04CC88 8004C088 26100002 */  addiu $s0, $s0, 2
/* 04CC8C 8004C08C 24630001 */  addiu $v1, $v1, 1
/* 04CC90 8004C090 86220000 */  lh    $v0, ($s1)
/* 04CC94 8004C094 0062102A */  slt   $v0, $v1, $v0
/* 04CC98 8004C098 1440FFF9 */  bnez  $v0, .L8004C080
/* 04CC9C 8004C09C 24840002 */   addiu $a0, $a0, 2
.L8004C0A0:
/* 04CCA0 8004C0A0 26520001 */  addiu $s2, $s2, 1
/* 04CCA4 8004C0A4 3C02800E */  lui   $v0, %hi(D_800D8104) # $v0, 0x800e
/* 04CCA8 8004C0A8 94428104 */  lhu   $v0, %lo(D_800D8104)($v0)
/* 04CCAC 8004C0AC 0242102A */  slt   $v0, $s2, $v0
/* 04CCB0 8004C0B0 1440FFE4 */  bnez  $v0, .L8004C044
/* 04CCB4 8004C0B4 26310008 */   addiu $s1, $s1, 8
.L8004C0B8:
/* 04CCB8 8004C0B8 3C04800C */  lui   $a0, %hi(D_800C4FD0) # $a0, 0x800c
/* 04CCBC 8004C0BC 0C0051CC */  jal   func_80014730
/* 04CCC0 8004C0C0 8C844FD0 */   lw    $a0, %lo(D_800C4FD0)($a0)
/* 04CCC4 8004C0C4 3C058005 */  lui   $a1, %hi(D_8004BA04) # $a1, 0x8005
/* 04CCC8 8004C0C8 24A5BA04 */  addiu $a1, %lo(D_8004BA04) # addiu $a1, $a1, -0x45fc
/* 04CCCC 8004C0CC 0C00A3A3 */  jal   func_80028E8C
/* 04CCD0 8004C0D0 24040001 */   li    $a0, 1
/* 04CCD4 8004C0D4 24020001 */  li    $v0, 1
/* 04CCD8 8004C0D8 3C01800F */  lui   $at, %hi(D_800F3290) # $at, 0x800f
/* 04CCDC 8004C0DC A4223290 */  sh    $v0, %lo(D_800F3290)($at)
/* 04CCE0 8004C0E0 00001021 */  addu  $v0, $zero, $zero
.L8004C0E4:
/* 04CCE4 8004C0E4 8FBF0048 */  lw    $ra, 0x48($sp)
/* 04CCE8 8004C0E8 8FB30044 */  lw    $s3, 0x44($sp)
/* 04CCEC 8004C0EC 8FB20040 */  lw    $s2, 0x40($sp)
/* 04CCF0 8004C0F0 8FB1003C */  lw    $s1, 0x3c($sp)
/* 04CCF4 8004C0F4 8FB00038 */  lw    $s0, 0x38($sp)
/* 04CCF8 8004C0F8 03E00008 */  jr    $ra
/* 04CCFC 8004C0FC 27BD0050 */   addiu $sp, $sp, 0x50

glabel func_8004C100
/* 04CD00 8004C100 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 04CD04 8004C104 AFBF0028 */  sw    $ra, 0x28($sp)
/* 04CD08 8004C108 AFB10024 */  sw    $s1, 0x24($sp)
/* 04CD0C 8004C10C AFB00020 */  sw    $s0, 0x20($sp)
/* 04CD10 8004C110 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04CD14 8004C114 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04CD18 8004C118 1040002F */  beqz  $v0, .L8004C1D8
/* 04CD1C 8004C11C 00000000 */   nop   
/* 04CD20 8004C120 3C01800C */  lui   $at, %hi(D_800C4FD0) # $at, 0x800c
/* 04CD24 8004C124 AC204FD0 */  sw    $zero, %lo(D_800C4FD0)($at)
/* 04CD28 8004C128 3C01800F */  lui   $at, %hi(D_800F3290) # $at, 0x800f
/* 04CD2C 8004C12C A4203290 */  sh    $zero, %lo(D_800F3290)($at)
/* 04CD30 8004C130 3C04800E */  lui   $a0, %hi(D_800D8108) # $a0, 0x800e
/* 04CD34 8004C134 8C848108 */  lw    $a0, %lo(D_800D8108)($a0)
/* 04CD38 8004C138 0C00EDE6 */  jal   FreeTemp
/* 04CD3C 8004C13C 00008021 */   addu  $s0, $zero, $zero
/* 04CD40 8004C140 3C11800E */  lui   $s1, %hi(D_800D810C) # $s1, 0x800e
/* 04CD44 8004C144 8E31810C */  lw    $s1, %lo(D_800D810C)($s1)
/* 04CD48 8004C148 3C02800E */  lui   $v0, %hi(D_800D8102) # $v0, 0x800e
/* 04CD4C 8004C14C 94428102 */  lhu   $v0, %lo(D_800D8102)($v0)
/* 04CD50 8004C150 18400009 */  blez  $v0, .L8004C178
/* 04CD54 8004C154 00000000 */   nop   
.L8004C158:
/* 04CD58 8004C158 8E240004 */  lw    $a0, 4($s1)
/* 04CD5C 8004C15C 0C00EDE6 */  jal   FreeTemp
/* 04CD60 8004C160 26100001 */   addiu $s0, $s0, 1
/* 04CD64 8004C164 3C02800E */  lui   $v0, %hi(D_800D8102) # $v0, 0x800e
/* 04CD68 8004C168 94428102 */  lhu   $v0, %lo(D_800D8102)($v0)
/* 04CD6C 8004C16C 0202102A */  slt   $v0, $s0, $v0
/* 04CD70 8004C170 1440FFF9 */  bnez  $v0, .L8004C158
/* 04CD74 8004C174 26310008 */   addiu $s1, $s1, 8
.L8004C178:
/* 04CD78 8004C178 3C04800E */  lui   $a0, %hi(D_800D810C) # $a0, 0x800e
/* 04CD7C 8004C17C 8C84810C */  lw    $a0, %lo(D_800D810C)($a0)
/* 04CD80 8004C180 0C00EDE6 */  jal   FreeTemp
/* 04CD84 8004C184 00008021 */   addu  $s0, $zero, $zero
/* 04CD88 8004C188 3C11800E */  lui   $s1, %hi(D_800D8110) # $s1, 0x800e
/* 04CD8C 8004C18C 8E318110 */  lw    $s1, %lo(D_800D8110)($s1)
/* 04CD90 8004C190 3C02800E */  lui   $v0, %hi(D_800D8104) # $v0, 0x800e
/* 04CD94 8004C194 94428104 */  lhu   $v0, %lo(D_800D8104)($v0)
/* 04CD98 8004C198 18400009 */  blez  $v0, .L8004C1C0
/* 04CD9C 8004C19C 00000000 */   nop   
.L8004C1A0:
/* 04CDA0 8004C1A0 8E240004 */  lw    $a0, 4($s1)
/* 04CDA4 8004C1A4 0C00EDE6 */  jal   FreeTemp
/* 04CDA8 8004C1A8 26100001 */   addiu $s0, $s0, 1
/* 04CDAC 8004C1AC 3C02800E */  lui   $v0, %hi(D_800D8104) # $v0, 0x800e
/* 04CDB0 8004C1B0 94428104 */  lhu   $v0, %lo(D_800D8104)($v0)
/* 04CDB4 8004C1B4 0202102A */  slt   $v0, $s0, $v0
/* 04CDB8 8004C1B8 1440FFF9 */  bnez  $v0, .L8004C1A0
/* 04CDBC 8004C1BC 26310008 */   addiu $s1, $s1, 8
.L8004C1C0:
/* 04CDC0 8004C1C0 3C04800E */  lui   $a0, %hi(D_800D8110) # $a0, 0x800e
/* 04CDC4 8004C1C4 0C00EDE6 */  jal   FreeTemp
/* 04CDC8 8004C1C8 8C848110 */   lw    $a0, %lo(D_800D8110)($a0)
/* 04CDCC 8004C1CC 24040001 */  li    $a0, 1
/* 04CDD0 8004C1D0 0C00A3A3 */  jal   func_80028E8C
/* 04CDD4 8004C1D4 00002821 */   addu  $a1, $zero, $zero
.L8004C1D8:
/* 04CDD8 8004C1D8 8FBF0028 */  lw    $ra, 0x28($sp)
/* 04CDDC 8004C1DC 8FB10024 */  lw    $s1, 0x24($sp)
/* 04CDE0 8004C1E0 8FB00020 */  lw    $s0, 0x20($sp)
/* 04CDE4 8004C1E4 03E00008 */  jr    $ra
/* 04CDE8 8004C1E8 27BD0030 */   addiu $sp, $sp, 0x30

GetSpaceData:
/* 04CDEC 8004C1EC 00042400 */  sll   $a0, $a0, 0x10
/* 04CDF0 8004C1F0 000422C3 */  sra   $a0, $a0, 0xb
/* 04CDF4 8004C1F4 3C02800E */  lui   $v0, %hi(D_800D8108) # $v0, 0x800e
/* 04CDF8 8004C1F8 8C428108 */  lw    $v0, %lo(D_800D8108)($v0)
/* 04CDFC 8004C1FC 03E00008 */  jr    $ra
/* 04CE00 8004C200 00821021 */   addu  $v0, $a0, $v0

GetAbsSpaceIndexFromChainSpaceIndex:
/* 04CE04 8004C204 3084FFFF */  andi  $a0, $a0, 0xffff
/* 04CE08 8004C208 3C02800E */  lui   $v0, %hi(D_800D8110) # $v0, 0x800e
/* 04CE0C 8004C20C 8C428110 */  lw    $v0, %lo(D_800D8110)($v0)
/* 04CE10 8004C210 000420C0 */  sll   $a0, $a0, 3
/* 04CE14 8004C214 00822021 */  addu  $a0, $a0, $v0
/* 04CE18 8004C218 30A5FFFF */  andi  $a1, $a1, 0xffff
/* 04CE1C 8004C21C 8C820004 */  lw    $v0, 4($a0)
/* 04CE20 8004C220 00052840 */  sll   $a1, $a1, 1
/* 04CE24 8004C224 00A22821 */  addu  $a1, $a1, $v0
/* 04CE28 8004C228 03E00008 */  jr    $ra
/* 04CE2C 8004C22C 84A20000 */   lh    $v0, ($a1)

GetChainLength:
/* 04CE30 8004C230 3084FFFF */  andi  $a0, $a0, 0xffff
/* 04CE34 8004C234 3C02800E */  lui   $v0, %hi(D_800D8110) # $v0, 0x800e
/* 04CE38 8004C238 8C428110 */  lw    $v0, %lo(D_800D8110)($v0)
/* 04CE3C 8004C23C 000420C0 */  sll   $a0, $a0, 3
/* 04CE40 8004C240 00822021 */  addu  $a0, $a0, $v0
/* 04CE44 8004C244 03E00008 */  jr    $ra
/* 04CE48 8004C248 84820000 */   lh    $v0, ($a0)

GetChainSpaceIndexFromAbsSpaceIndex:
/* 04CE4C 8004C24C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 04CE50 8004C250 AFBF001C */  sw    $ra, 0x1c($sp)
/* 04CE54 8004C254 AFB20018 */  sw    $s2, 0x18($sp)
/* 04CE58 8004C258 AFB10014 */  sw    $s1, 0x14($sp)
/* 04CE5C 8004C25C AFB00010 */  sw    $s0, 0x10($sp)
/* 04CE60 8004C260 00008021 */  addu  $s0, $zero, $zero
/* 04CE64 8004C264 30B1FFFF */  andi  $s1, $a1, 0xffff
/* 04CE68 8004C268 00042400 */  sll   $a0, $a0, 0x10
/* 04CE6C 8004C26C 00049403 */  sra   $s2, $a0, 0x10
.L8004C270:
/* 04CE70 8004C270 0C01308C */  jal   GetChainLength
/* 04CE74 8004C274 02202021 */   addu  $a0, $s1, $zero
/* 04CE78 8004C278 00021400 */  sll   $v0, $v0, 0x10
/* 04CE7C 8004C27C 00021403 */  sra   $v0, $v0, 0x10
/* 04CE80 8004C280 0202102A */  slt   $v0, $s0, $v0
/* 04CE84 8004C284 1040000A */  beqz  $v0, .L8004C2B0
/* 04CE88 8004C288 02202021 */   addu  $a0, $s1, $zero
/* 04CE8C 8004C28C 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 04CE90 8004C290 3205FFFF */   andi  $a1, $s0, 0xffff
/* 04CE94 8004C294 00021400 */  sll   $v0, $v0, 0x10
/* 04CE98 8004C298 00021403 */  sra   $v0, $v0, 0x10
/* 04CE9C 8004C29C 5452FFF4 */  bnel  $v0, $s2, .L8004C270
/* 04CEA0 8004C2A0 26100001 */   addiu $s0, $s0, 1
/* 04CEA4 8004C2A4 00101400 */  sll   $v0, $s0, 0x10
/* 04CEA8 8004C2A8 080130AD */  j     func_8004C2B4
/* 04CEAC 8004C2AC 00021403 */   sra   $v0, $v0, 0x10

.L8004C2B0:
/* 04CEB0 8004C2B0 2402FFFF */  li    $v0, -1
glabel func_8004C2B4
/* 04CEB4 8004C2B4 8FBF001C */  lw    $ra, 0x1c($sp)
/* 04CEB8 8004C2B8 8FB20018 */  lw    $s2, 0x18($sp)
/* 04CEBC 8004C2BC 8FB10014 */  lw    $s1, 0x14($sp)
/* 04CEC0 8004C2C0 8FB00010 */  lw    $s0, 0x10($sp)
/* 04CEC4 8004C2C4 03E00008 */  jr    $ra
/* 04CEC8 8004C2C8 27BD0020 */   addiu $sp, $sp, 0x20

/* 04CECC 8004C2CC 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 04CED0 8004C2D0 AFBF0024 */  sw    $ra, 0x24($sp)
/* 04CED4 8004C2D4 AFB40020 */  sw    $s4, 0x20($sp)
/* 04CED8 8004C2D8 AFB3001C */  sw    $s3, 0x1c($sp)
/* 04CEDC 8004C2DC AFB20018 */  sw    $s2, 0x18($sp)
/* 04CEE0 8004C2E0 AFB10014 */  sw    $s1, 0x14($sp)
/* 04CEE4 8004C2E4 AFB00010 */  sw    $s0, 0x10($sp)
/* 04CEE8 8004C2E8 00808021 */  addu  $s0, $a0, $zero
/* 04CEEC 8004C2EC 00A09821 */  addu  $s3, $a1, $zero
/* 04CEF0 8004C2F0 0C01308C */  jal   GetChainLength
/* 04CEF4 8004C2F4 3264FFFF */   andi  $a0, $s3, 0xffff
/* 04CEF8 8004C2F8 00021400 */  sll   $v0, $v0, 0x10
/* 04CEFC 8004C2FC 0C005D63 */  jal   GetRandomByte
/* 04CF00 8004C300 0002A403 */   sra   $s4, $v0, 0x10
/* 04CF04 8004C304 304200FF */  andi  $v0, $v0, 0xff
/* 04CF08 8004C308 3C038888 */  lui   $v1, (0x88888889 >> 16) # lui $v1, 0x8888
/* 04CF0C 8004C30C 34638889 */  ori   $v1, (0x88888889 & 0xFFFF) # ori $v1, $v1, 0x8889
/* 04CF10 8004C310 00430019 */  multu $v0, $v1
/* 04CF14 8004C314 00003010 */  mfhi  $a2
/* 04CF18 8004C318 00062102 */  srl   $a0, $a2, 4
/* 04CF1C 8004C31C 00041900 */  sll   $v1, $a0, 4
/* 04CF20 8004C320 00641823 */  subu  $v1, $v1, $a0
/* 04CF24 8004C324 00031840 */  sll   $v1, $v1, 1
/* 04CF28 8004C328 00431023 */  subu  $v0, $v0, $v1
/* 04CF2C 8004C32C 24520001 */  addiu $s2, $v0, 1
/* 04CF30 8004C330 00008821 */  addu  $s1, $zero, $zero
/* 04CF34 8004C334 3210FFFF */  andi  $s0, $s0, 0xffff
glabel func_8004C338
/* 04CF38 8004C338 3264FFFF */  andi  $a0, $s3, 0xffff
/* 04CF3C 8004C33C 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 04CF40 8004C340 3225FFFF */   andi  $a1, $s1, 0xffff
/* 04CF44 8004C344 00021400 */  sll   $v0, $v0, 0x10
/* 04CF48 8004C348 0C01307B */  jal   GetSpaceData
/* 04CF4C 8004C34C 00022403 */   sra   $a0, $v0, 0x10
/* 04CF50 8004C350 90420001 */  lbu   $v0, 1($v0)
/* 04CF54 8004C354 3042000F */  andi  $v0, $v0, 0xf
/* 04CF58 8004C358 3C01800C */  lui   $at, 0x800c
/* 04CF5C 8004C35C 00220821 */  addu  $at, $at, $v0
/* 04CF60 8004C360 902251B0 */  lbu   $v0, 0x51b0($at)
/* 04CF64 8004C364 00501024 */  and   $v0, $v0, $s0
/* 04CF68 8004C368 10400005 */  beqz  $v0, .L8004C380
/* 04CF6C 8004C36C 2642FFFF */   addiu $v0, $s2, -1
/* 04CF70 8004C370 00409021 */  addu  $s2, $v0, $zero
/* 04CF74 8004C374 304200FF */  andi  $v0, $v0, 0xff
/* 04CF78 8004C378 10400006 */  beqz  $v0, .L8004C394
/* 04CF7C 8004C37C 00111400 */   sll   $v0, $s1, 0x10
.L8004C380:
/* 04CF80 8004C380 26310001 */  addiu $s1, $s1, 1
/* 04CF84 8004C384 0234102A */  slt   $v0, $s1, $s4
/* 04CF88 8004C388 00021023 */  negu  $v0, $v0
/* 04CF8C 8004C38C 080130CE */  j     func_8004C338
/* 04CF90 8004C390 00518824 */   and   $s1, $v0, $s1

.L8004C394:
/* 04CF94 8004C394 00021403 */  sra   $v0, $v0, 0x10
/* 04CF98 8004C398 8FBF0024 */  lw    $ra, 0x24($sp)
/* 04CF9C 8004C39C 8FB40020 */  lw    $s4, 0x20($sp)
/* 04CFA0 8004C3A0 8FB3001C */  lw    $s3, 0x1c($sp)
/* 04CFA4 8004C3A4 8FB20018 */  lw    $s2, 0x18($sp)
/* 04CFA8 8004C3A8 8FB10014 */  lw    $s1, 0x14($sp)
/* 04CFAC 8004C3AC 8FB00010 */  lw    $s0, 0x10($sp)
/* 04CFB0 8004C3B0 03E00008 */  jr    $ra
/* 04CFB4 8004C3B4 27BD0028 */   addiu $sp, $sp, 0x28

glabel func_8004C3B8
/* 04CFB8 8004C3B8 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 04CFBC 8004C3BC AFBF001C */  sw    $ra, 0x1c($sp)
/* 04CFC0 8004C3C0 AFB20018 */  sw    $s2, 0x18($sp)
/* 04CFC4 8004C3C4 AFB10014 */  sw    $s1, 0x14($sp)
/* 04CFC8 8004C3C8 AFB00010 */  sw    $s0, 0x10($sp)
/* 04CFCC 8004C3CC 0C005D63 */  jal   GetRandomByte
/* 04CFD0 8004C3D0 00808021 */   addu  $s0, $a0, $zero
/* 04CFD4 8004C3D4 304200FF */  andi  $v0, $v0, 0xff
/* 04CFD8 8004C3D8 3C03800E */  lui   $v1, %hi(D_800D8100) # $v1, 0x800e
/* 04CFDC 8004C3DC 94638100 */  lhu   $v1, %lo(D_800D8100)($v1)
/* 04CFE0 8004C3E0 0043001A */  div   $zero, $v0, $v1
/* 04CFE4 8004C3E4 14600002 */  bnez  $v1, .L8004C3F0
/* 04CFE8 8004C3E8 00000000 */   nop   
/* 04CFEC 8004C3EC 0007000D */  break 7
.L8004C3F0:
/* 04CFF0 8004C3F0 2401FFFF */  li    $at, -1
/* 04CFF4 8004C3F4 14610004 */  bne   $v1, $at, .L8004C408
/* 04CFF8 8004C3F8 3C018000 */   lui   $at, 0x8000
/* 04CFFC 8004C3FC 14410002 */  bne   $v0, $at, .L8004C408
/* 04D000 8004C400 00000000 */   nop   
/* 04D004 8004C404 0006000D */  break 6
.L8004C408:
/* 04D008 8004C408 00001810 */  mfhi  $v1
/* 04D00C 8004C40C 00609021 */  addu  $s2, $v1, $zero
/* 04D010 8004C410 00008821 */  addu  $s1, $zero, $zero
/* 04D014 8004C414 3210FFFF */  andi  $s0, $s0, 0xffff
glabel func_8004C418
/* 04D018 8004C418 00112400 */  sll   $a0, $s1, 0x10
/* 04D01C 8004C41C 0C01307B */  jal   GetSpaceData
/* 04D020 8004C420 00042403 */   sra   $a0, $a0, 0x10
/* 04D024 8004C424 90420001 */  lbu   $v0, 1($v0)
/* 04D028 8004C428 3042000F */  andi  $v0, $v0, 0xf
/* 04D02C 8004C42C 3C01800C */  lui   $at, 0x800c
/* 04D030 8004C430 00220821 */  addu  $at, $at, $v0
/* 04D034 8004C434 902251B0 */  lbu   $v0, 0x51b0($at)
/* 04D038 8004C438 00501024 */  and   $v0, $v0, $s0
/* 04D03C 8004C43C 10400005 */  beqz  $v0, .L8004C454
/* 04D040 8004C440 2642FFFF */   addiu $v0, $s2, -1
/* 04D044 8004C444 00409021 */  addu  $s2, $v0, $zero
/* 04D048 8004C448 304200FF */  andi  $v0, $v0, 0xff
/* 04D04C 8004C44C 10400008 */  beqz  $v0, .L8004C470
/* 04D050 8004C450 00111400 */   sll   $v0, $s1, 0x10
.L8004C454:
/* 04D054 8004C454 26310001 */  addiu $s1, $s1, 1
/* 04D058 8004C458 3C02800E */  lui   $v0, %hi(D_800D8100) # $v0, 0x800e
/* 04D05C 8004C45C 94428100 */  lhu   $v0, %lo(D_800D8100)($v0)
/* 04D060 8004C460 0222102A */  slt   $v0, $s1, $v0
/* 04D064 8004C464 00021023 */  negu  $v0, $v0
/* 04D068 8004C468 08013106 */  j     func_8004C418
/* 04D06C 8004C46C 00518824 */   and   $s1, $v0, $s1

.L8004C470:
/* 04D070 8004C470 00021403 */  sra   $v0, $v0, 0x10
/* 04D074 8004C474 8FBF001C */  lw    $ra, 0x1c($sp)
/* 04D078 8004C478 8FB20018 */  lw    $s2, 0x18($sp)
/* 04D07C 8004C47C 8FB10014 */  lw    $s1, 0x14($sp)
/* 04D080 8004C480 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D084 8004C484 03E00008 */  jr    $ra
/* 04D088 8004C488 27BD0020 */   addiu $sp, $sp, 0x20

SetSpaceType:
/* 04D08C 8004C48C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04D090 8004C490 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D094 8004C494 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D098 8004C498 00A08021 */  addu  $s0, $a1, $zero
/* 04D09C 8004C49C 00042400 */  sll   $a0, $a0, 0x10
/* 04D0A0 8004C4A0 0C01307B */  jal   GetSpaceData
/* 04D0A4 8004C4A4 00042403 */   sra   $a0, $a0, 0x10
/* 04D0A8 8004C4A8 A0500001 */  sb    $s0, 1($v0)
/* 04D0AC 8004C4AC 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D0B0 8004C4B0 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D0B4 8004C4B4 03E00008 */  jr    $ra
/* 04D0B8 8004C4B8 27BD0018 */   addiu $sp, $sp, 0x18

/* 04D0BC 8004C4BC 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 04D0C0 8004C4C0 AFBF002C */  sw    $ra, 0x2c($sp)
/* 04D0C4 8004C4C4 AFB40028 */  sw    $s4, 0x28($sp)
/* 04D0C8 8004C4C8 AFB30024 */  sw    $s3, 0x24($sp)
/* 04D0CC 8004C4CC AFB20020 */  sw    $s2, 0x20($sp)
/* 04D0D0 8004C4D0 AFB1001C */  sw    $s1, 0x1c($sp)
/* 04D0D4 8004C4D4 AFB00018 */  sw    $s0, 0x18($sp)
/* 04D0D8 8004C4D8 00809021 */  addu  $s2, $a0, $zero
/* 04D0DC 8004C4DC 00A09821 */  addu  $s3, $a1, $zero
/* 04D0E0 8004C4E0 00C0A021 */  addu  $s4, $a2, $zero
/* 04D0E4 8004C4E4 0C01308C */  jal   GetChainLength
/* 04D0E8 8004C4E8 3244FFFF */   andi  $a0, $s2, 0xffff
/* 04D0EC 8004C4EC 00021400 */  sll   $v0, $v0, 0x10
/* 04D0F0 8004C4F0 00028C03 */  sra   $s1, $v0, 0x10
/* 04D0F4 8004C4F4 1A200010 */  blez  $s1, .L8004C538
/* 04D0F8 8004C4F8 00008021 */   addu  $s0, $zero, $zero
/* 04D0FC 8004C4FC 3273FFFF */  andi  $s3, $s3, 0xffff
/* 04D100 8004C500 3244FFFF */  andi  $a0, $s2, 0xffff
.L8004C504:
/* 04D104 8004C504 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 04D108 8004C508 3205FFFF */   andi  $a1, $s0, 0xffff
/* 04D10C 8004C50C 00021400 */  sll   $v0, $v0, 0x10
/* 04D110 8004C510 0C01307B */  jal   GetSpaceData
/* 04D114 8004C514 00022403 */   sra   $a0, $v0, 0x10
/* 04D118 8004C518 00401821 */  addu  $v1, $v0, $zero
/* 04D11C 8004C51C 90620001 */  lbu   $v0, 1($v1)
/* 04D120 8004C520 50530001 */  beql  $v0, $s3, .L8004C528
/* 04D124 8004C524 A0740001 */   sb    $s4, 1($v1)
.L8004C528:
/* 04D128 8004C528 26100001 */  addiu $s0, $s0, 1
/* 04D12C 8004C52C 0211102A */  slt   $v0, $s0, $s1
/* 04D130 8004C530 1440FFF4 */  bnez  $v0, .L8004C504
/* 04D134 8004C534 3244FFFF */   andi  $a0, $s2, 0xffff
.L8004C538:
/* 04D138 8004C538 8FBF002C */  lw    $ra, 0x2c($sp)
/* 04D13C 8004C53C 8FB40028 */  lw    $s4, 0x28($sp)
/* 04D140 8004C540 8FB30024 */  lw    $s3, 0x24($sp)
/* 04D144 8004C544 8FB20020 */  lw    $s2, 0x20($sp)
/* 04D148 8004C548 8FB1001C */  lw    $s1, 0x1c($sp)
/* 04D14C 8004C54C 8FB00018 */  lw    $s0, 0x18($sp)
/* 04D150 8004C550 03E00008 */  jr    $ra
/* 04D154 8004C554 27BD0030 */   addiu $sp, $sp, 0x30

D_8004C558:
/* 04D158 8004C558 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 04D15C 8004C55C AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D160 8004C560 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D164 8004C564 F7B80028 */  sdc1  $f24, 0x28($sp)
/* 04D168 8004C568 F7B60020 */  sdc1  $f22, 0x20($sp)
/* 04D16C 8004C56C 0C018CEA */  jal   func_800633A8
/* 04D170 8004C570 F7B40018 */   sdc1  $f20, 0x18($sp)
/* 04D174 8004C574 0C01307B */  jal   GetSpaceData
/* 04D178 8004C578 8444008E */   lh    $a0, 0x8e($v0)
/* 04D17C 8004C57C 00408021 */  addu  $s0, $v0, $zero
/* 04D180 8004C580 3C013FB3 */  li    $at, 0x3FB30000 # 1.398438
/* 04D184 8004C584 34213333 */  ori   $at, (0x3FB33333 & 0xFFFF) # ori $at, $at, 0x3333
/* 04D188 8004C588 4481A000 */  mtc1  $at, $f20
/* 04D18C 8004C58C 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04D190 8004C590 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04D194 8004C594 10400018 */  beqz  $v0, .L8004C5F8
/* 04D198 8004C598 00000000 */   nop   
/* 04D19C 8004C59C 3C013D4C */  li    $at, 0x3D4C0000 # 0.049805
/* 04D1A0 8004C5A0 3421CCCD */  ori   $at, (0x3D4CCCCD & 0xFFFF) # ori $at, $at, 0xcccd
/* 04D1A4 8004C5A4 4481C000 */  mtc1  $at, $f24
/* 04D1A8 8004C5A8 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 04D1AC 8004C5AC 4481B000 */  mtc1  $at, $f22
.L8004C5B0:
/* 04D1B0 8004C5B0 0C018D6D */  jal   SleepVProcess
/* 04D1B4 8004C5B4 00000000 */   nop   
/* 04D1B8 8004C5B8 4618A501 */  sub.s $f20, $f20, $f24
/* 04D1BC 8004C5BC 4616A03E */  c.le.s $f20, $f22
/* 04D1C0 8004C5C0 00000000 */  nop   
/* 04D1C4 8004C5C4 00000000 */  nop   
/* 04D1C8 8004C5C8 45030001 */  bc1tl .L8004C5D0
/* 04D1CC 8004C5CC 4600B506 */   mov.s $f20, $f22
.L8004C5D0:
/* 04D1D0 8004C5D0 E6140010 */  swc1  $f20, 0x10($s0)
/* 04D1D4 8004C5D4 4616A03E */  c.le.s $f20, $f22
/* 04D1D8 8004C5D8 00000000 */  nop   
/* 04D1DC 8004C5DC 00000000 */  nop   
/* 04D1E0 8004C5E0 45010005 */  bc1t  .L8004C5F8
/* 04D1E4 8004C5E4 E6140018 */   swc1  $f20, 0x18($s0)
/* 04D1E8 8004C5E8 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04D1EC 8004C5EC 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04D1F0 8004C5F0 1440FFEF */  bnez  $v0, .L8004C5B0
/* 04D1F4 8004C5F4 00000000 */   nop   
.L8004C5F8:
/* 04D1F8 8004C5F8 0C017764 */  jal   EndProcess
/* 04D1FC 8004C5FC 00002021 */   addu  $a0, $zero, $zero
/* 04D200 8004C600 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D204 8004C604 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D208 8004C608 D7B80028 */  ldc1  $f24, 0x28($sp)
/* 04D20C 8004C60C D7B60020 */  ldc1  $f22, 0x20($sp)
/* 04D210 8004C610 D7B40018 */  ldc1  $f20, 0x18($sp)
/* 04D214 8004C614 03E00008 */  jr    $ra
/* 04D218 8004C618 27BD0030 */   addiu $sp, $sp, 0x30

glabel func_8004C61C
/* 04D21C 8004C61C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04D220 8004C620 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D224 8004C624 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D228 8004C628 00808021 */  addu  $s0, $a0, $zero
/* 04D22C 8004C62C 3C048005 */  lui   $a0, %hi(D_8004C558) # $a0, 0x8005
/* 04D230 8004C630 2484C558 */  addiu $a0, %lo(D_8004C558) # addiu $a0, $a0, -0x3aa8
/* 04D234 8004C634 3405EF00 */  li    $a1, 61184
/* 04D238 8004C638 00003021 */  addu  $a2, $zero, $zero
/* 04D23C 8004C63C 0C01770A */  jal   InitProcess
/* 04D240 8004C640 00003821 */   addu  $a3, $zero, $zero
/* 04D244 8004C644 00108400 */  sll   $s0, $s0, 0x10
/* 04D248 8004C648 00108403 */  sra   $s0, $s0, 0x10
/* 04D24C 8004C64C AC50008C */  sw    $s0, 0x8c($v0)
/* 04D250 8004C650 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D254 8004C654 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D258 8004C658 03E00008 */  jr    $ra
/* 04D25C 8004C65C 27BD0018 */   addiu $sp, $sp, 0x18

D_8004C660:
/* 04D260 8004C660 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 04D264 8004C664 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D268 8004C668 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D26C 8004C66C F7B80028 */  sdc1  $f24, 0x28($sp)
/* 04D270 8004C670 F7B60020 */  sdc1  $f22, 0x20($sp)
/* 04D274 8004C674 0C018CEA */  jal   func_800633A8
/* 04D278 8004C678 F7B40018 */   sdc1  $f20, 0x18($sp)
/* 04D27C 8004C67C 0C01307B */  jal   GetSpaceData
/* 04D280 8004C680 8444008E */   lh    $a0, 0x8e($v0)
/* 04D284 8004C684 00408021 */  addu  $s0, $v0, $zero
/* 04D288 8004C688 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 04D28C 8004C68C 4481A000 */  mtc1  $at, $f20
/* 04D290 8004C690 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04D294 8004C694 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04D298 8004C698 10400017 */  beqz  $v0, .L8004C6F8
/* 04D29C 8004C69C 00000000 */   nop   
/* 04D2A0 8004C6A0 3C013DCC */  li    $at, 0x3DCC0000 # 0.099609
/* 04D2A4 8004C6A4 3421CCCD */  ori   $at, (0x3DCCCCCD & 0xFFFF) # ori $at, $at, 0xcccd
/* 04D2A8 8004C6A8 4481C000 */  mtc1  $at, $f24
/* 04D2AC 8004C6AC 4480B000 */  mtc1  $zero, $f22
.L8004C6B0:
/* 04D2B0 8004C6B0 0C018D6D */  jal   SleepVProcess
/* 04D2B4 8004C6B4 00000000 */   nop   
/* 04D2B8 8004C6B8 4618A501 */  sub.s $f20, $f20, $f24
/* 04D2BC 8004C6BC 4616A03E */  c.le.s $f20, $f22
/* 04D2C0 8004C6C0 00000000 */  nop   
/* 04D2C4 8004C6C4 00000000 */  nop   
/* 04D2C8 8004C6C8 45030001 */  bc1tl .L8004C6D0
/* 04D2CC 8004C6CC 4600B506 */   mov.s $f20, $f22
.L8004C6D0:
/* 04D2D0 8004C6D0 E6140010 */  swc1  $f20, 0x10($s0)
/* 04D2D4 8004C6D4 4616A03E */  c.le.s $f20, $f22
/* 04D2D8 8004C6D8 00000000 */  nop   
/* 04D2DC 8004C6DC 00000000 */  nop   
/* 04D2E0 8004C6E0 45010005 */  bc1t  .L8004C6F8
/* 04D2E4 8004C6E4 E6140018 */   swc1  $f20, 0x18($s0)
/* 04D2E8 8004C6E8 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04D2EC 8004C6EC 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04D2F0 8004C6F0 1440FFEF */  bnez  $v0, .L8004C6B0
/* 04D2F4 8004C6F4 00000000 */   nop   
.L8004C6F8:
/* 04D2F8 8004C6F8 0C017764 */  jal   EndProcess
/* 04D2FC 8004C6FC 00002021 */   addu  $a0, $zero, $zero
/* 04D300 8004C700 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D304 8004C704 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D308 8004C708 D7B80028 */  ldc1  $f24, 0x28($sp)
/* 04D30C 8004C70C D7B60020 */  ldc1  $f22, 0x20($sp)
/* 04D310 8004C710 D7B40018 */  ldc1  $f20, 0x18($sp)
/* 04D314 8004C714 03E00008 */  jr    $ra
/* 04D318 8004C718 27BD0030 */   addiu $sp, $sp, 0x30

/* 04D31C 8004C71C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04D320 8004C720 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D324 8004C724 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D328 8004C728 00808021 */  addu  $s0, $a0, $zero
/* 04D32C 8004C72C 3C048005 */  lui   $a0, %hi(D_8004C660) # $a0, 0x8005
/* 04D330 8004C730 2484C660 */  addiu $a0, %lo(D_8004C660) # addiu $a0, $a0, -0x39a0
/* 04D334 8004C734 3405EF00 */  li    $a1, 61184
/* 04D338 8004C738 00003021 */  addu  $a2, $zero, $zero
/* 04D33C 8004C73C 0C01770A */  jal   InitProcess
/* 04D340 8004C740 00003821 */   addu  $a3, $zero, $zero
/* 04D344 8004C744 00108400 */  sll   $s0, $s0, 0x10
/* 04D348 8004C748 00108403 */  sra   $s0, $s0, 0x10
/* 04D34C 8004C74C AC50008C */  sw    $s0, 0x8c($v0)
/* 04D350 8004C750 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D354 8004C754 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D358 8004C758 03E00008 */  jr    $ra
/* 04D35C 8004C75C 27BD0018 */   addiu $sp, $sp, 0x18

D_8004C760:
/* 04D360 8004C760 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 04D364 8004C764 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D368 8004C768 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D36C 8004C76C F7B80028 */  sdc1  $f24, 0x28($sp)
/* 04D370 8004C770 F7B60020 */  sdc1  $f22, 0x20($sp)
/* 04D374 8004C774 0C018CEA */  jal   func_800633A8
/* 04D378 8004C778 F7B40018 */   sdc1  $f20, 0x18($sp)
/* 04D37C 8004C77C 0C01307B */  jal   GetSpaceData
/* 04D380 8004C780 8444008E */   lh    $a0, 0x8e($v0)
/* 04D384 8004C784 00408021 */  addu  $s0, $v0, $zero
/* 04D388 8004C788 4480A000 */  mtc1  $zero, $f20
/* 04D38C 8004C78C 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04D390 8004C790 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04D394 8004C794 10400018 */  beqz  $v0, .L8004C7F8
/* 04D398 8004C798 00000000 */   nop   
/* 04D39C 8004C79C 3C013DCC */  li    $at, 0x3DCC0000 # 0.099609
/* 04D3A0 8004C7A0 3421CCCD */  ori   $at, (0x3DCCCCCD & 0xFFFF) # ori $at, $at, 0xcccd
/* 04D3A4 8004C7A4 4481C000 */  mtc1  $at, $f24
/* 04D3A8 8004C7A8 3C013F80 */  li    $at, 0x3F800000 # 1.000000
/* 04D3AC 8004C7AC 4481B000 */  mtc1  $at, $f22
.L8004C7B0:
/* 04D3B0 8004C7B0 0C018D6D */  jal   SleepVProcess
/* 04D3B4 8004C7B4 00000000 */   nop   
/* 04D3B8 8004C7B8 4618A500 */  add.s $f20, $f20, $f24
/* 04D3BC 8004C7BC 4614B03E */  c.le.s $f22, $f20
/* 04D3C0 8004C7C0 00000000 */  nop   
/* 04D3C4 8004C7C4 00000000 */  nop   
/* 04D3C8 8004C7C8 45030001 */  bc1tl .L8004C7D0
/* 04D3CC 8004C7CC 4600B506 */   mov.s $f20, $f22
.L8004C7D0:
/* 04D3D0 8004C7D0 E6140010 */  swc1  $f20, 0x10($s0)
/* 04D3D4 8004C7D4 4614B03E */  c.le.s $f22, $f20
/* 04D3D8 8004C7D8 00000000 */  nop   
/* 04D3DC 8004C7DC 00000000 */  nop   
/* 04D3E0 8004C7E0 45010005 */  bc1t  .L8004C7F8
/* 04D3E4 8004C7E4 E6140018 */   swc1  $f20, 0x18($s0)
/* 04D3E8 8004C7E8 3C02800C */  lui   $v0, %hi(D_800C4FD0) # $v0, 0x800c
/* 04D3EC 8004C7EC 8C424FD0 */  lw    $v0, %lo(D_800C4FD0)($v0)
/* 04D3F0 8004C7F0 1440FFEF */  bnez  $v0, .L8004C7B0
/* 04D3F4 8004C7F4 00000000 */   nop   
.L8004C7F8:
/* 04D3F8 8004C7F8 0C017764 */  jal   EndProcess
/* 04D3FC 8004C7FC 00002021 */   addu  $a0, $zero, $zero
/* 04D400 8004C800 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D404 8004C804 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D408 8004C808 D7B80028 */  ldc1  $f24, 0x28($sp)
/* 04D40C 8004C80C D7B60020 */  ldc1  $f22, 0x20($sp)
/* 04D410 8004C810 D7B40018 */  ldc1  $f20, 0x18($sp)
/* 04D414 8004C814 03E00008 */  jr    $ra
/* 04D418 8004C818 27BD0030 */   addiu $sp, $sp, 0x30

/* 04D41C 8004C81C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04D420 8004C820 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D424 8004C824 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D428 8004C828 00808021 */  addu  $s0, $a0, $zero
/* 04D42C 8004C82C 3C048005 */  lui   $a0, %hi(D_8004C760) # $a0, 0x8005
/* 04D430 8004C830 2484C760 */  addiu $a0, %lo(D_8004C760) # addiu $a0, $a0, -0x38a0
/* 04D434 8004C834 3405EF00 */  li    $a1, 61184
/* 04D438 8004C838 00003021 */  addu  $a2, $zero, $zero
/* 04D43C 8004C83C 0C01770A */  jal   InitProcess
/* 04D440 8004C840 00003821 */   addu  $a3, $zero, $zero
/* 04D444 8004C844 00108400 */  sll   $s0, $s0, 0x10
/* 04D448 8004C848 00108403 */  sra   $s0, $s0, 0x10
/* 04D44C 8004C84C AC50008C */  sw    $s0, 0x8c($v0)
/* 04D450 8004C850 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D454 8004C854 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D458 8004C858 03E00008 */  jr    $ra
/* 04D45C 8004C85C 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_8004C860
/* 04D460 8004C860 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04D464 8004C864 AFBF0014 */  sw    $ra, 0x14($sp)
/* 04D468 8004C868 AFB00010 */  sw    $s0, 0x10($sp)
/* 04D46C 8004C86C 00801821 */  addu  $v1, $a0, $zero
/* 04D470 8004C870 00042400 */  sll   $a0, $a0, 0x10
/* 04D474 8004C874 00042403 */  sra   $a0, $a0, 0x10
/* 04D478 8004C878 2402FFFC */  li    $v0, -4
/* 04D47C 8004C87C 10820013 */  beq   $a0, $v0, .L8004C8CC
/* 04D480 8004C880 00A08021 */   addu  $s0, $a1, $zero
/* 04D484 8004C884 2882FFFD */  slti  $v0, $a0, -3
/* 04D488 8004C888 10400005 */  beqz  $v0, .L8004C8A0
/* 04D48C 8004C88C 2402FFFB */   li    $v0, -5
/* 04D490 8004C890 10820011 */  beq   $a0, $v0, .L8004C8D8
/* 04D494 8004C894 00032400 */   sll   $a0, $v1, 0x10
/* 04D498 8004C898 08013239 */  j     func_8004C8E4
/* 04D49C 8004C89C 00000000 */   nop   

.L8004C8A0:
/* 04D4A0 8004C8A0 2402FFFD */  li    $v0, -3
/* 04D4A4 8004C8A4 10820006 */  beq   $a0, $v0, .L8004C8C0
/* 04D4A8 8004C8A8 2402FFFE */   li    $v0, -2
/* 04D4AC 8004C8AC 1482000D */  bne   $a0, $v0, .L8004C8E4
/* 04D4B0 8004C8B0 00032400 */   sll   $a0, $v1, 0x10
/* 04D4B4 8004C8B4 3C01800E */  lui   $at, %hi(D_800D8144) # $at, 0x800e
/* 04D4B8 8004C8B8 0801323C */  j     func_8004C8F0
/* 04D4BC 8004C8BC AC308144 */   sw    $s0, %lo(D_800D8144)($at)

.L8004C8C0:
/* 04D4C0 8004C8C0 3C01800E */  lui   $at, %hi(D_800D8148) # $at, 0x800e
/* 04D4C4 8004C8C4 0801323C */  j     func_8004C8F0
/* 04D4C8 8004C8C8 AC308148 */   sw    $s0, %lo(D_800D8148)($at)

.L8004C8CC:
/* 04D4CC 8004C8CC 3C01800E */  lui   $at, %hi(D_800D814C) # $at, 0x800e
/* 04D4D0 8004C8D0 0801323C */  j     func_8004C8F0
/* 04D4D4 8004C8D4 AC30814C */   sw    $s0, %lo(D_800D814C)($at)

.L8004C8D8:
/* 04D4D8 8004C8D8 3C01800E */  lui   $at, %hi(D_800D8150) # $at, 0x800e
/* 04D4DC 8004C8DC 0801323C */  j     func_8004C8F0
/* 04D4E0 8004C8E0 AC308150 */   sw    $s0, %lo(D_800D8150)($at)

glabel func_8004C8E4
.L8004C8E4:
/* 04D4E4 8004C8E4 0C01307B */  jal   GetSpaceData
/* 04D4E8 8004C8E8 00042403 */   sra   $a0, $a0, 0x10
/* 04D4EC 8004C8EC AC50001C */  sw    $s0, 0x1c($v0)
glabel func_8004C8F0
/* 04D4F0 8004C8F0 8FBF0014 */  lw    $ra, 0x14($sp)
/* 04D4F4 8004C8F4 8FB00010 */  lw    $s0, 0x10($sp)
/* 04D4F8 8004C8F8 03E00008 */  jr    $ra
/* 04D4FC 8004C8FC 27BD0018 */   addiu $sp, $sp, 0x18

EventTableHydrate:
/* 04D500 8004C900 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 04D504 8004C904 AFBF0020 */  sw    $ra, 0x20($sp)
/* 04D508 8004C908 AFB1001C */  sw    $s1, 0x1c($sp)
/* 04D50C 8004C90C AFB00018 */  sw    $s0, 0x18($sp)
/* 04D510 8004C910 00808021 */  addu  $s0, $a0, $zero
/* 04D514 8004C914 96020000 */  lhu   $v0, ($s0)
/* 04D518 8004C918 00402021 */  addu  $a0, $v0, $zero
/* 04D51C 8004C91C 00021400 */  sll   $v0, $v0, 0x10
/* 04D520 8004C920 00021403 */  sra   $v0, $v0, 0x10
/* 04D524 8004C924 2403FFFF */  li    $v1, -1
/* 04D528 8004C928 1043000A */  beq   $v0, $v1, .L8004C954
/* 04D52C 8004C92C 2411FFFF */   li    $s1, -1
/* 04D530 8004C930 00042400 */  sll   $a0, $a0, 0x10
.L8004C934:
/* 04D534 8004C934 8E050004 */  lw    $a1, 4($s0)
/* 04D538 8004C938 0C013218 */  jal   func_8004C860
/* 04D53C 8004C93C 00042403 */   sra   $a0, $a0, 0x10
/* 04D540 8004C940 26100008 */  addiu $s0, $s0, 8
/* 04D544 8004C944 96040000 */  lhu   $a0, ($s0)
/* 04D548 8004C948 86020000 */  lh    $v0, ($s0)
/* 04D54C 8004C94C 1451FFF9 */  bne   $v0, $s1, .L8004C934
/* 04D550 8004C950 00042400 */   sll   $a0, $a0, 0x10
.L8004C954:
/* 04D554 8004C954 8FBF0020 */  lw    $ra, 0x20($sp)
/* 04D558 8004C958 8FB1001C */  lw    $s1, 0x1c($sp)
/* 04D55C 8004C95C 8FB00018 */  lw    $s0, 0x18($sp)
/* 04D560 8004C960 03E00008 */  jr    $ra
/* 04D564 8004C964 27BD0028 */   addiu $sp, $sp, 0x28

ExecuteEventForSpace:
/* 04D568 8004C968 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 04D56C 8004C96C AFBF0034 */  sw    $ra, 0x34($sp)
/* 04D570 8004C970 AFB60030 */  sw    $s6, 0x30($sp)
/* 04D574 8004C974 AFB5002C */  sw    $s5, 0x2c($sp)
/* 04D578 8004C978 AFB40028 */  sw    $s4, 0x28($sp)
/* 04D57C 8004C97C AFB30024 */  sw    $s3, 0x24($sp)
/* 04D580 8004C980 AFB20020 */  sw    $s2, 0x20($sp)
/* 04D584 8004C984 AFB1001C */  sw    $s1, 0x1c($sp)
/* 04D588 8004C988 AFB00018 */  sw    $s0, 0x18($sp)
/* 04D58C 8004C98C 00808021 */  addu  $s0, $a0, $zero
/* 04D590 8004C990 00042400 */  sll   $a0, $a0, 0x10
/* 04D594 8004C994 00042403 */  sra   $a0, $a0, 0x10
/* 04D598 8004C998 2402FFFC */  li    $v0, -4
/* 04D59C 8004C99C 10820013 */  beq   $a0, $v0, .L8004C9EC
/* 04D5A0 8004C9A0 00A09821 */   addu  $s3, $a1, $zero
/* 04D5A4 8004C9A4 2882FFFD */  slti  $v0, $a0, -3
/* 04D5A8 8004C9A8 10400005 */  beqz  $v0, .L8004C9C0
/* 04D5AC 8004C9AC 2402FFFB */   li    $v0, -5
/* 04D5B0 8004C9B0 10820011 */  beq   $a0, $v0, .L8004C9F8
/* 04D5B4 8004C9B4 00000000 */   nop   
/* 04D5B8 8004C9B8 08013281 */  j     func_8004CA04
/* 04D5BC 8004C9BC 00102400 */   sll   $a0, $s0, 0x10

.L8004C9C0:
/* 04D5C0 8004C9C0 2402FFFD */  li    $v0, -3
/* 04D5C4 8004C9C4 10820006 */  beq   $a0, $v0, .L8004C9E0
/* 04D5C8 8004C9C8 2402FFFE */   li    $v0, -2
/* 04D5CC 8004C9CC 5482000D */  bnel  $a0, $v0, .L8004CA04
/* 04D5D0 8004C9D0 00102400 */   sll   $a0, $s0, 0x10
/* 04D5D4 8004C9D4 3C11800E */  lui   $s1, %hi(D_800D8144) # $s1, 0x800e
/* 04D5D8 8004C9D8 08013284 */  j     func_8004CA10
/* 04D5DC 8004C9DC 8E318144 */   lw    $s1, %lo(D_800D8144)($s1)

.L8004C9E0:
/* 04D5E0 8004C9E0 3C11800E */  lui   $s1, %hi(D_800D8148) # $s1, 0x800e
/* 04D5E4 8004C9E4 08013284 */  j     func_8004CA10
/* 04D5E8 8004C9E8 8E318148 */   lw    $s1, %lo(D_800D8148)($s1)

.L8004C9EC:
/* 04D5EC 8004C9EC 3C11800E */  lui   $s1, %hi(D_800D814C) # $s1, 0x800e
/* 04D5F0 8004C9F0 08013284 */  j     func_8004CA10
/* 04D5F4 8004C9F4 8E31814C */   lw    $s1, %lo(D_800D814C)($s1)

.L8004C9F8:
/* 04D5F8 8004C9F8 3C11800E */  lui   $s1, %hi(D_800D8150) # $s1, 0x800e
/* 04D5FC 8004C9FC 08013284 */  j     func_8004CA10
/* 04D600 8004CA00 8E318150 */   lw    $s1, %lo(D_800D8150)($s1)

glabel func_8004CA04
.L8004CA04:
/* 04D604 8004CA04 0C01307B */  jal   GetSpaceData
/* 04D608 8004CA08 00042403 */   sra   $a0, $a0, 0x10
/* 04D60C 8004CA0C 8C51001C */  lw    $s1, 0x1c($v0)
glabel func_8004CA10
/* 04D610 8004CA10 0C0132CE */  jal   func_8004CB38
/* 04D614 8004CA14 00009021 */   addu  $s2, $zero, $zero
/* 04D618 8004CA18 0040B021 */  addu  $s6, $v0, $zero
/* 04D61C 8004CA1C 00102400 */  sll   $a0, $s0, 0x10
/* 04D620 8004CA20 0C0132CB */  jal   SetCurrentSpaceIndex
/* 04D624 8004CA24 00042403 */   sra   $a0, $a0, 0x10
/* 04D628 8004CA28 52200030 */  beql  $s1, $zero, .L8004CAEC
/* 04D62C 8004CA2C 00162400 */   sll   $a0, $s6, 0x10
/* 04D630 8004CA30 96220000 */  lhu   $v0, ($s1)
/* 04D634 8004CA34 1040002C */  beqz  $v0, .L8004CAE8
/* 04D638 8004CA38 00401821 */   addu  $v1, $v0, $zero
/* 04D63C 8004CA3C 00131400 */  sll   $v0, $s3, 0x10
/* 04D640 8004CA40 00029C03 */  sra   $s3, $v0, 0x10
/* 04D644 8004CA44 24150001 */  li    $s5, 1
/* 04D648 8004CA48 24140002 */  li    $s4, 2
/* 04D64C 8004CA4C 00031400 */  sll   $v0, $v1, 0x10
.L8004CA50:
/* 04D650 8004CA50 00021403 */  sra   $v0, $v0, 0x10
/* 04D654 8004CA54 54530020 */  bnel  $v0, $s3, .L8004CAD8
/* 04D658 8004CA58 26310008 */   addiu $s1, $s1, 8
/* 04D65C 8004CA5C 3C01800E */  lui   $at, %hi(D_800D8154) # $at, 0x800e
/* 04D660 8004CA60 AC208154 */  sw    $zero, %lo(D_800D8154)($at)
/* 04D664 8004CA64 86220002 */  lh    $v0, 2($s1)
/* 04D668 8004CA68 10550005 */  beq   $v0, $s5, .L8004CA80
/* 04D66C 8004CA6C 00000000 */   nop   
/* 04D670 8004CA70 10540008 */  beq   $v0, $s4, .L8004CA94
/* 04D674 8004CA74 00000000 */   nop   
/* 04D678 8004CA78 080132B2 */  j     func_8004CAC8
/* 04D67C 8004CA7C 00000000 */   nop   

.L8004CA80:
/* 04D680 8004CA80 8E220004 */  lw    $v0, 4($s1)
/* 04D684 8004CA84 0040F809 */  jalr  $v0
/* 04D688 8004CA88 00000000 */  nop   
/* 04D68C 8004CA8C 080132B2 */  j     func_8004CAC8
/* 04D690 8004CA90 00000000 */   nop   

.L8004CA94:
/* 04D694 8004CA94 0C018CEA */  jal   func_800633A8
/* 04D698 8004CA98 00000000 */   nop   
/* 04D69C 8004CA9C 00408021 */  addu  $s0, $v0, $zero
/* 04D6A0 8004CAA0 8E240004 */  lw    $a0, 4($s1)
/* 04D6A4 8004CAA4 24054800 */  li    $a1, 18432
/* 04D6A8 8004CAA8 00003021 */  addu  $a2, $zero, $zero
/* 04D6AC 8004CAAC 0C01770A */  jal   InitProcess
/* 04D6B0 8004CAB0 00003821 */   addu  $a3, $zero, $zero
/* 04D6B4 8004CAB4 02002021 */  addu  $a0, $s0, $zero
/* 04D6B8 8004CAB8 0C018C9C */  jal   func_80063270
/* 04D6BC 8004CABC 00402821 */   addu  $a1, $v0, $zero
/* 04D6C0 8004CAC0 0C018CD6 */  jal   func_80063358
/* 04D6C4 8004CAC4 00000000 */   nop   
glabel func_8004CAC8
/* 04D6C8 8004CAC8 3C02800E */  lui   $v0, %hi(D_800D8154) # $v0, 0x800e
/* 04D6CC 8004CACC 8C428154 */  lw    $v0, %lo(D_800D8154)($v0)
/* 04D6D0 8004CAD0 02429025 */  or    $s2, $s2, $v0
/* 04D6D4 8004CAD4 26310008 */  addiu $s1, $s1, 8
.L8004CAD8:
/* 04D6D8 8004CAD8 96230000 */  lhu   $v1, ($s1)
/* 04D6DC 8004CADC 86220000 */  lh    $v0, ($s1)
/* 04D6E0 8004CAE0 1440FFDB */  bnez  $v0, .L8004CA50
/* 04D6E4 8004CAE4 00031400 */   sll   $v0, $v1, 0x10
.L8004CAE8:
/* 04D6E8 8004CAE8 00162400 */  sll   $a0, $s6, 0x10
.L8004CAEC:
/* 04D6EC 8004CAEC 0C0132CB */  jal   SetCurrentSpaceIndex
/* 04D6F0 8004CAF0 00042403 */   sra   $a0, $a0, 0x10
/* 04D6F4 8004CAF4 02401021 */  addu  $v0, $s2, $zero
/* 04D6F8 8004CAF8 8FBF0034 */  lw    $ra, 0x34($sp)
/* 04D6FC 8004CAFC 8FB60030 */  lw    $s6, 0x30($sp)
/* 04D700 8004CB00 8FB5002C */  lw    $s5, 0x2c($sp)
/* 04D704 8004CB04 8FB40028 */  lw    $s4, 0x28($sp)
/* 04D708 8004CB08 8FB30024 */  lw    $s3, 0x24($sp)
/* 04D70C 8004CB0C 8FB20020 */  lw    $s2, 0x20($sp)
/* 04D710 8004CB10 8FB1001C */  lw    $s1, 0x1c($sp)
/* 04D714 8004CB14 8FB00018 */  lw    $s0, 0x18($sp)
/* 04D718 8004CB18 03E00008 */  jr    $ra
/* 04D71C 8004CB1C 27BD0038 */   addiu $sp, $sp, 0x38

glabel func_8004CB20
/* 04D720 8004CB20 3C01800E */  lui   $at, 0x800e
/* 04D724 8004CB24 03E00008 */  jr    $ra
/* 04D728 8004CB28 AC248154 */   sw    $a0, -0x7eac($at)

SetCurrentSpaceIndex:
/* 04D72C 8004CB2C 3C01800F */  lui   $at, 0x800f
/* 04D730 8004CB30 03E00008 */  jr    $ra
GetCurrentSpaceIndex:
/* 04D734 8004CB34 A424D5E0 */   sh    $a0, -0x2a20($at)

glabel func_8004CB38
/* 04D738 8004CB38 3C02800F */  lui   $v0, 0x800f
/* 04D73C 8004CB3C 03E00008 */  jr    $ra
/* 04D740 8004CB40 8442D5E0 */   lh    $v0, -0x2a20($v0)

glabel func_8004CB44
/* 04D744 8004CB44 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 04D748 8004CB48 AFBF0010 */  sw    $ra, 0x10($sp)
/* 04D74C 8004CB4C 0C0130EE */  jal   func_8004C3B8
/* 04D750 8004CB50 24040006 */   li    $a0, 6
/* 04D754 8004CB54 00021400 */  sll   $v0, $v0, 0x10
/* 04D758 8004CB58 8FBF0010 */  lw    $ra, 0x10($sp)
/* 04D75C 8004CB5C 00021403 */  sra   $v0, $v0, 0x10
/* 04D760 8004CB60 03E00008 */  jr    $ra
/* 04D764 8004CB64 27BD0018 */   addiu $sp, $sp, 0x18

/* 04D768 8004CB68 00000000 */  nop   
/* 04D76C 8004CB6C 00000000 */  nop   
