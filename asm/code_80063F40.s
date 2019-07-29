# Mario Party (U) disassembly and split file
# generated by n64split v0.4a - N64 ROM splitter

# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_80063F40
/* 064B40 80063F40 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 064B44 80063F44 AFBF0018 */  sw    $ra, 0x18($sp)
/* 064B48 80063F48 3C01800E */  lui   $at, %hi(D_800E40D0) # $at, 0x800e
/* 064B4C 80063F4C AC2040D0 */  sw    $zero, %lo(D_800E40D0)($at)
/* 064B50 80063F50 3C01800E */  lui   $at, %hi(D_800E40D4) # $at, 0x800e
/* 064B54 80063F54 AC2040D4 */  sw    $zero, %lo(D_800E40D4)($at)
/* 064B58 80063F58 3C04800F */  lui   $a0, %hi(D_800EE960) # $a0, 0x800f
/* 064B5C 80063F5C 2484E960 */  addiu $a0, %lo(D_800EE960) # addiu $a0, $a0, -0x16a0
/* 064B60 80063F60 3C05800E */  lui   $a1, %hi(D_800E3620) # $a1, 0x800e
/* 064B64 80063F64 24A53620 */  addiu $a1, %lo(D_800E3620) # addiu $a1, $a1, 0x3620
/* 064B68 80063F68 0C022188 */  jal   func_80088620
/* 064B6C 80063F6C 24060020 */   li    $a2, 32
/* 064B70 80063F70 24040005 */  li    $a0, 5
/* 064B74 80063F74 3C05800F */  lui   $a1, %hi(D_800EE960) # $a1, 0x800f
/* 064B78 80063F78 24A5E960 */  addiu $a1, %lo(D_800EE960) # addiu $a1, $a1, -0x16a0
/* 064B7C 80063F7C 0C024D6C */  jal   func_800935B0
/* 064B80 80063F80 24060020 */   li    $a2, 32
/* 064B84 80063F84 3C04800F */  lui   $a0, %hi(D_800F3370) # $a0, 0x800f
/* 064B88 80063F88 24843370 */  addiu $a0, %lo(D_800F3370) # addiu $a0, $a0, 0x3370
/* 064B8C 80063F8C 3C05800E */  lui   $a1, %hi(D_800E36A0) # $a1, 0x800e
/* 064B90 80063F90 24A536A0 */  addiu $a1, %lo(D_800E36A0) # addiu $a1, $a1, 0x36a0
/* 064B94 80063F94 0C022188 */  jal   func_80088620
/* 064B98 80063F98 24060020 */   li    $a2, 32
/* 064B9C 80063F9C 3C02800E */  lui   $v0, %hi(D_800E40D0) # $v0, 0x800e
/* 064BA0 80063FA0 244240D0 */  addiu $v0, %lo(D_800E40D0) # addiu $v0, $v0, 0x40d0
/* 064BA4 80063FA4 AFA20010 */  sw    $v0, 0x10($sp)
/* 064BA8 80063FA8 2402005A */  li    $v0, 90
/* 064BAC 80063FAC AFA20014 */  sw    $v0, 0x14($sp)
/* 064BB0 80063FB0 3C04800E */  lui   $a0, %hi(D_800E3720) # $a0, 0x800e
/* 064BB4 80063FB4 24843720 */  addiu $a0, %lo(D_800E3720) # addiu $a0, $a0, 0x3720
/* 064BB8 80063FB8 24050014 */  li    $a1, 20
/* 064BBC 80063FBC 3C068006 */  lui   $a2, %hi(D_80064234) # $a2, 0x8006
/* 064BC0 80063FC0 24C64234 */  addiu $a2, %lo(D_80064234) # addiu $a2, $a2, 0x4234
/* 064BC4 80063FC4 0C022194 */  jal   osCreateThread
/* 064BC8 80063FC8 00003821 */   addu  $a3, $zero, $zero
/* 064BCC 80063FCC 3C04800E */  lui   $a0, %hi(D_800E3720) # $a0, 0x800e
/* 064BD0 80063FD0 0C022344 */  jal   osStartThread
/* 064BD4 80063FD4 24843720 */   addiu $a0, %lo(D_800E3720) # addiu $a0, $a0, 0x3720
/* 064BD8 80063FD8 8FBF0018 */  lw    $ra, 0x18($sp)
/* 064BDC 80063FDC 03E00008 */  jr    $ra
/* 064BE0 80063FE0 27BD0020 */   addiu $sp, $sp, 0x20

glabel func_80063FE4
/* 064BE4 80063FE4 84830008 */  lh    $v1, 8($a0)
/* 064BE8 80063FE8 10600005 */  beqz  $v1, .L80064000
/* 064BEC 80063FEC 24020001 */   li    $v0, 1
/* 064BF0 80063FF0 10620006 */  beq   $v1, $v0, .L8006400C
/* 064BF4 80063FF4 00001021 */   addu  $v0, $zero, $zero
/* 064BF8 80063FF8 08019005 */  j     func_80064014
/* 064BFC 80063FFC 00000000 */   nop   

.L80064000:
/* 064C00 80064000 3C02800E */  lui   $v0, %hi(D_800E40D0) # $v0, 0x800e
/* 064C04 80064004 08019005 */  j     func_80064014
/* 064C08 80064008 244240D0 */   addiu $v0, %lo(D_800E40D0) # addiu $v0, $v0, 0x40d0

.L8006400C:
/* 064C0C 8006400C 3C02800E */  lui   $v0, %hi(D_800E40D4) # $v0, 0x800e
/* 064C10 80064010 244240D4 */  addiu $v0, %lo(D_800E40D4) # addiu $v0, $v0, 0x40d4
glabel func_80064014
/* 064C14 80064014 03E00008 */  jr    $ra
/* 064C18 80064018 00000000 */   nop   

D_8006401C:
/* 064C1C 8006401C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 064C20 80064020 AFBF0014 */  sw    $ra, 0x14($sp)
/* 064C24 80064024 AFB00010 */  sw    $s0, 0x10($sp)
/* 064C28 80064028 0C018FF9 */  jal   func_80063FE4
/* 064C2C 8006402C 00808021 */   addu  $s0, $a0, $zero
/* 064C30 80064030 00401821 */  addu  $v1, $v0, $zero
/* 064C34 80064034 8C620000 */  lw    $v0, ($v1)
/* 064C38 80064038 5040000A */  beql  $v0, $zero, .L80064064
/* 064C3C 8006403C AC700000 */   sw    $s0, ($v1)
/* 064C40 80064040 00401821 */  addu  $v1, $v0, $zero
/* 064C44 80064044 8C620000 */  lw    $v0, ($v1)
/* 064C48 80064048 50400006 */  beql  $v0, $zero, .L80064064
/* 064C4C 8006404C AC700000 */   sw    $s0, ($v1)
.L80064050:
/* 064C50 80064050 8C630000 */  lw    $v1, ($v1)
/* 064C54 80064054 8C620000 */  lw    $v0, ($v1)
/* 064C58 80064058 1440FFFD */  bnez  $v0, .L80064050
/* 064C5C 8006405C 00000000 */   nop   
/* 064C60 80064060 AC700000 */  sw    $s0, ($v1)
.L80064064:
/* 064C64 80064064 AE000000 */  sw    $zero, ($s0)
/* 064C68 80064068 00001021 */  addu  $v0, $zero, $zero
/* 064C6C 8006406C 8FBF0014 */  lw    $ra, 0x14($sp)
/* 064C70 80064070 8FB00010 */  lw    $s0, 0x10($sp)
/* 064C74 80064074 03E00008 */  jr    $ra
/* 064C78 80064078 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_8006407C
/* 064C7C 8006407C 27BDFFB8 */  addiu $sp, $sp, -0x48
/* 064C80 80064080 AFBF0044 */  sw    $ra, 0x44($sp)
/* 064C84 80064084 AFB00040 */  sw    $s0, 0x40($sp)
/* 064C88 80064088 3C028006 */  lui   $v0, %hi(D_8006401C) # $v0, 0x8006
/* 064C8C 8006408C 2442401C */  addiu $v0, %lo(D_8006401C) # addiu $v0, $v0, 0x401c
/* 064C90 80064090 AFA20028 */  sw    $v0, 0x28($sp)
/* 064C94 80064094 AFA4002C */  sw    $a0, 0x2c($sp)
/* 064C98 80064098 27B00010 */  addiu $s0, $sp, 0x10
/* 064C9C 8006409C AFB00034 */  sw    $s0, 0x34($sp)
/* 064CA0 800640A0 AC860004 */  sw    $a2, 4($a0)
/* 064CA4 800640A4 A4850008 */  sh    $a1, 8($a0)
/* 064CA8 800640A8 02002021 */  addu  $a0, $s0, $zero
/* 064CAC 800640AC 27A50038 */  addiu $a1, $sp, 0x38
/* 064CB0 800640B0 0C022188 */  jal   func_80088620
/* 064CB4 800640B4 24060001 */   li    $a2, 1
/* 064CB8 800640B8 3C04800F */  lui   $a0, %hi(D_800F3370) # $a0, 0x800f
/* 064CBC 800640BC 24843370 */  addiu $a0, %lo(D_800F3370) # addiu $a0, $a0, 0x3370
/* 064CC0 800640C0 27A50028 */  addiu $a1, $sp, 0x28
/* 064CC4 800640C4 0C0222C4 */  jal   func_80088B10
/* 064CC8 800640C8 24060001 */   li    $a2, 1
/* 064CCC 800640CC 02002021 */  addu  $a0, $s0, $zero
/* 064CD0 800640D0 00002821 */  addu  $a1, $zero, $zero
/* 064CD4 800640D4 0C022278 */  jal   func_800889E0
/* 064CD8 800640D8 24060001 */   li    $a2, 1
/* 064CDC 800640DC 8FBF0044 */  lw    $ra, 0x44($sp)
/* 064CE0 800640E0 8FB00040 */  lw    $s0, 0x40($sp)
/* 064CE4 800640E4 03E00008 */  jr    $ra
/* 064CE8 800640E8 27BD0048 */   addiu $sp, $sp, 0x48

D_800640EC:
/* 064CEC 800640EC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 064CF0 800640F0 AFBF0014 */  sw    $ra, 0x14($sp)
/* 064CF4 800640F4 AFB00010 */  sw    $s0, 0x10($sp)
/* 064CF8 800640F8 0C018FF9 */  jal   func_80063FE4
/* 064CFC 800640FC 00808021 */   addu  $s0, $a0, $zero
/* 064D00 80064100 00402021 */  addu  $a0, $v0, $zero
/* 064D04 80064104 8C820000 */  lw    $v0, ($a0)
/* 064D08 80064108 1040000E */  beqz  $v0, .L80064144
/* 064D0C 8006410C 00001821 */   addu  $v1, $zero, $zero
.L80064110:
/* 064D10 80064110 54500009 */  bnel  $v0, $s0, .L80064138
/* 064D14 80064114 00401821 */   addu  $v1, $v0, $zero
/* 064D18 80064118 10600004 */  beqz  $v1, .L8006412C
/* 064D1C 8006411C 00000000 */   nop   
/* 064D20 80064120 8C420000 */  lw    $v0, ($v0)
/* 064D24 80064124 08019051 */  j     func_80064144
/* 064D28 80064128 AC620000 */   sw    $v0, ($v1)

.L8006412C:
/* 064D2C 8006412C 8E020000 */  lw    $v0, ($s0)
/* 064D30 80064130 08019051 */  j     func_80064144
/* 064D34 80064134 AC820000 */   sw    $v0, ($a0)

.L80064138:
/* 064D38 80064138 8C420000 */  lw    $v0, ($v0)
/* 064D3C 8006413C 1440FFF4 */  bnez  $v0, .L80064110
/* 064D40 80064140 00000000 */   nop   
glabel func_80064144
.L80064144:
/* 064D44 80064144 00001021 */  addu  $v0, $zero, $zero
/* 064D48 80064148 8FBF0014 */  lw    $ra, 0x14($sp)
/* 064D4C 8006414C 8FB00010 */  lw    $s0, 0x10($sp)
/* 064D50 80064150 03E00008 */  jr    $ra
/* 064D54 80064154 27BD0018 */   addiu $sp, $sp, 0x18

glabel func_80064158
/* 064D58 80064158 27BDFFB8 */  addiu $sp, $sp, -0x48
/* 064D5C 8006415C AFBF0044 */  sw    $ra, 0x44($sp)
/* 064D60 80064160 AFB00040 */  sw    $s0, 0x40($sp)
/* 064D64 80064164 3C028006 */  lui   $v0, %hi(D_800640EC) # $v0, 0x8006
/* 064D68 80064168 244240EC */  addiu $v0, %lo(D_800640EC) # addiu $v0, $v0, 0x40ec
/* 064D6C 8006416C AFA20028 */  sw    $v0, 0x28($sp)
/* 064D70 80064170 AFA4002C */  sw    $a0, 0x2c($sp)
/* 064D74 80064174 27B00010 */  addiu $s0, $sp, 0x10
/* 064D78 80064178 AFB00034 */  sw    $s0, 0x34($sp)
/* 064D7C 8006417C 02002021 */  addu  $a0, $s0, $zero
/* 064D80 80064180 27A50038 */  addiu $a1, $sp, 0x38
/* 064D84 80064184 0C022188 */  jal   func_80088620
/* 064D88 80064188 24060001 */   li    $a2, 1
/* 064D8C 8006418C 3C04800F */  lui   $a0, %hi(D_800F3370) # $a0, 0x800f
/* 064D90 80064190 24843370 */  addiu $a0, %lo(D_800F3370) # addiu $a0, $a0, 0x3370
/* 064D94 80064194 27A50028 */  addiu $a1, $sp, 0x28
/* 064D98 80064198 0C0222C4 */  jal   func_80088B10
/* 064D9C 8006419C 24060001 */   li    $a2, 1
/* 064DA0 800641A0 02002021 */  addu  $a0, $s0, $zero
/* 064DA4 800641A4 00002821 */  addu  $a1, $zero, $zero
/* 064DA8 800641A8 0C022278 */  jal   func_800889E0
/* 064DAC 800641AC 24060001 */   li    $a2, 1
/* 064DB0 800641B0 8FBF0044 */  lw    $ra, 0x44($sp)
/* 064DB4 800641B4 8FB00040 */  lw    $s0, 0x40($sp)
/* 064DB8 800641B8 03E00008 */  jr    $ra
/* 064DBC 800641BC 27BD0048 */   addiu $sp, $sp, 0x48

glabel func_800641C0
/* 064DC0 800641C0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 064DC4 800641C4 AFBF0014 */  sw    $ra, 0x14($sp)
/* 064DC8 800641C8 AFB00010 */  sw    $s0, 0x10($sp)
/* 064DCC 800641CC 00042400 */  sll   $a0, $a0, 0x10
/* 064DD0 800641D0 00042403 */  sra   $a0, $a0, 0x10
/* 064DD4 800641D4 10800006 */  beqz  $a0, .L800641F0
/* 064DD8 800641D8 00008021 */   addu  $s0, $zero, $zero
/* 064DDC 800641DC 24020001 */  li    $v0, 1
/* 064DE0 800641E0 10820006 */  beq   $a0, $v0, .L800641FC
/* 064DE4 800641E4 00000000 */   nop   
/* 064DE8 800641E8 08019081 */  j     func_80064204
/* 064DEC 800641EC 00000000 */   nop   

.L800641F0:
/* 064DF0 800641F0 3C10800E */  lui   $s0, %hi(D_800E40D0) # $s0, 0x800e
/* 064DF4 800641F4 08019081 */  j     func_80064204
/* 064DF8 800641F8 8E1040D0 */   lw    $s0, %lo(D_800E40D0)($s0)

.L800641FC:
/* 064DFC 800641FC 3C10800E */  lui   $s0, %hi(D_800E40D4) # $s0, 0x800e
/* 064E00 80064200 8E1040D4 */  lw    $s0, %lo(D_800E40D4)($s0)
glabel func_80064204
/* 064E04 80064204 12000007 */  beqz  $s0, .L80064224
/* 064E08 80064208 00000000 */   nop   
.L8006420C:
/* 064E0C 8006420C 8E020004 */  lw    $v0, 4($s0)
/* 064E10 80064210 0040F809 */  jalr  $v0
/* 064E14 80064214 00000000 */  nop   
/* 064E18 80064218 8E100000 */  lw    $s0, ($s0)
/* 064E1C 8006421C 1600FFFB */  bnez  $s0, .L8006420C
/* 064E20 80064220 00000000 */   nop   
.L80064224:
/* 064E24 80064224 8FBF0014 */  lw    $ra, 0x14($sp)
/* 064E28 80064228 8FB00010 */  lw    $s0, 0x10($sp)
/* 064E2C 8006422C 03E00008 */  jr    $ra
/* 064E30 80064230 27BD0018 */   addiu $sp, $sp, 0x18

D_80064234:
/* 064E34 80064234 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 064E38 80064238 AFBF0034 */  sw    $ra, 0x34($sp)
/* 064E3C 8006423C AFB20030 */  sw    $s2, 0x30($sp)
/* 064E40 80064240 AFB1002C */  sw    $s1, 0x2c($sp)
/* 064E44 80064244 AFB00028 */  sw    $s0, 0x28($sp)
/* 064E48 80064248 27A40010 */  addiu $a0, $sp, 0x10
/* 064E4C 8006424C 3C05800F */  lui   $a1, %hi(D_800F3370) # $a1, 0x800f
/* 064E50 80064250 24A53370 */  addiu $a1, %lo(D_800F3370) # addiu $a1, $a1, 0x3370
/* 064E54 80064254 0C018E7E */  jal   func_800639F8
/* 064E58 80064258 24060003 */   li    $a2, 3
/* 064E5C 8006425C 24120001 */  li    $s2, 1
/* 064E60 80064260 24110002 */  li    $s1, 2
glabel func_80064264
.L80064264:
/* 064E64 80064264 3C04800F */  lui   $a0, %hi(D_800F3370) # $a0, 0x800f
/* 064E68 80064268 24843370 */  addiu $a0, %lo(D_800F3370) # addiu $a0, $a0, 0x3370
/* 064E6C 8006426C 27A50020 */  addiu $a1, $sp, 0x20
/* 064E70 80064270 0C022278 */  jal   func_800889E0
/* 064E74 80064274 24060001 */   li    $a2, 1
/* 064E78 80064278 8FA20020 */  lw    $v0, 0x20($sp)
/* 064E7C 8006427C 10520005 */  beq   $v0, $s2, .L80064294
/* 064E80 80064280 00000000 */   nop   
/* 064E84 80064284 10510007 */  beq   $v0, $s1, .L800642A4
/* 064E88 80064288 00000000 */   nop   
/* 064E8C 8006428C 080190AD */  j     func_800642B4
/* 064E90 80064290 00000000 */   nop   

.L80064294:
/* 064E94 80064294 0C019070 */  jal   func_800641C0
/* 064E98 80064298 00002021 */   addu  $a0, $zero, $zero
/* 064E9C 8006429C 08019099 */  j     func_80064264
/* 064EA0 800642A0 00000000 */   nop   

.L800642A4:
/* 064EA4 800642A4 0C019070 */  jal   func_800641C0
/* 064EA8 800642A8 24040001 */   li    $a0, 1
/* 064EAC 800642AC 08019099 */  j     func_80064264
/* 064EB0 800642B0 00000000 */   nop   

glabel func_800642B4
/* 064EB4 800642B4 8FB00020 */  lw    $s0, 0x20($sp)
/* 064EB8 800642B8 8E020000 */  lw    $v0, ($s0)
/* 064EBC 800642BC 0040F809 */  jalr  $v0
/* 064EC0 800642C0 8E040004 */  lw    $a0, 4($s0)
/* 064EC4 800642C4 AE020008 */  sw    $v0, 8($s0)
/* 064EC8 800642C8 8E04000C */  lw    $a0, 0xc($s0)
/* 064ECC 800642CC 1080FFE5 */  beqz  $a0, .L80064264
/* 064ED0 800642D0 00002821 */   addu  $a1, $zero, $zero
/* 064ED4 800642D4 0C0222C4 */  jal   func_80088B10
/* 064ED8 800642D8 24060001 */   li    $a2, 1
/* 064EDC 800642DC 08019099 */  j     func_80064264
/* 064EE0 800642E0 00000000 */   nop   

/* 064EE4 800642E4 8FBF0034 */  lw    $ra, 0x34($sp)
/* 064EE8 800642E8 8FB20030 */  lw    $s2, 0x30($sp)
/* 064EEC 800642EC 8FB1002C */  lw    $s1, 0x2c($sp)
/* 064EF0 800642F0 8FB00028 */  lw    $s0, 0x28($sp)
/* 064EF4 800642F4 03E00008 */  jr    $ra
/* 064EF8 800642F8 27BD0038 */   addiu $sp, $sp, 0x38

glabel func_800642FC
/* 064EFC 800642FC 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 064F00 80064300 AFBF0038 */  sw    $ra, 0x38($sp)
/* 064F04 80064304 AFB10034 */  sw    $s1, 0x34($sp)
/* 064F08 80064308 AFB00030 */  sw    $s0, 0x30($sp)
/* 064F0C 8006430C 00808821 */  addu  $s1, $a0, $zero
/* 064F10 80064310 00E08021 */  addu  $s0, $a3, $zero
/* 064F14 80064314 AE250000 */  sw    $a1, ($s1)
/* 064F18 80064318 AE260004 */  sw    $a2, 4($s1)
/* 064F1C 8006431C 27A40010 */  addiu $a0, $sp, 0x10
/* 064F20 80064320 AE24000C */  sw    $a0, 0xc($s1)
/* 064F24 80064324 27A50028 */  addiu $a1, $sp, 0x28
/* 064F28 80064328 0C022188 */  jal   func_80088620
/* 064F2C 8006432C 24060001 */   li    $a2, 1
/* 064F30 80064330 3C04800F */  lui   $a0, %hi(D_800F3370) # $a0, 0x800f
/* 064F34 80064334 24843370 */  addiu $a0, %lo(D_800F3370) # addiu $a0, $a0, 0x3370
/* 064F38 80064338 02202821 */  addu  $a1, $s1, $zero
/* 064F3C 8006433C 0C0222C4 */  jal   func_80088B10
/* 064F40 80064340 24060001 */   li    $a2, 1
/* 064F44 80064344 24020001 */  li    $v0, 1
/* 064F48 80064348 1202000B */  beq   $s0, $v0, .L80064378
/* 064F4C 8006434C 2A020002 */   slti  $v0, $s0, 2
/* 064F50 80064350 50400005 */  beql  $v0, $zero, .L80064368
/* 064F54 80064354 24020002 */   li    $v0, 2
/* 064F58 80064358 52000016 */  beql  $s0, $zero, .L800643B4
/* 064F5C 8006435C AE200008 */   sw    $zero, 8($s1)
/* 064F60 80064360 080190ED */  j     func_800643B4
/* 064F64 80064364 00000000 */   nop   

.L80064368:
/* 064F68 80064368 12020009 */  beq   $s0, $v0, .L80064390
/* 064F6C 8006436C 27A40010 */   addiu $a0, $sp, 0x10
/* 064F70 80064370 080190ED */  j     func_800643B4
/* 064F74 80064374 00000000 */   nop   

.L80064378:
/* 064F78 80064378 27A40010 */  addiu $a0, $sp, 0x10
/* 064F7C 8006437C 00002821 */  addu  $a1, $zero, $zero
/* 064F80 80064380 0C022278 */  jal   func_800889E0
/* 064F84 80064384 24060001 */   li    $a2, 1
/* 064F88 80064388 080190ED */  j     func_800643B4
/* 064F8C 8006438C 00000000 */   nop   

glabel func_80064390
.L80064390:
/* 064F90 80064390 00002821 */  addu  $a1, $zero, $zero
/* 064F94 80064394 0C022278 */  jal   func_800889E0
/* 064F98 80064398 00003021 */   addu  $a2, $zero, $zero
/* 064F9C 8006439C 10400005 */  beqz  $v0, .L800643B4
/* 064FA0 800643A0 00000000 */   nop   
/* 064FA4 800643A4 0C018D6D */  jal   SleepVProcess
/* 064FA8 800643A8 00000000 */   nop   
/* 064FAC 800643AC 080190E4 */  j     func_80064390
/* 064FB0 800643B0 27A40010 */   addiu $a0, $sp, 0x10

glabel func_800643B4
.L800643B4:
/* 064FB4 800643B4 8E220008 */  lw    $v0, 8($s1)
/* 064FB8 800643B8 8FBF0038 */  lw    $ra, 0x38($sp)
/* 064FBC 800643BC 8FB10034 */  lw    $s1, 0x34($sp)
/* 064FC0 800643C0 8FB00030 */  lw    $s0, 0x30($sp)
/* 064FC4 800643C4 03E00008 */  jr    $ra
/* 064FC8 800643C8 27BD0040 */   addiu $sp, $sp, 0x40

/* 064FCC 800643CC 00000000 */  nop   
