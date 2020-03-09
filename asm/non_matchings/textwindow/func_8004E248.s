# assembler directives
.set noat      # allow manual use of $1
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

glabel func_8004E248
/* 04EE48 8004E248 27BDFFE8 */  addiu $29, $29, -0x18
/* 04EE4C 8004E24C AFBF0010 */  sw    $31, 0x10($29)
/* 04EE50 8004E250 8C830050 */  lw    $3, 0x50($4)
/* 04EE54 8004E254 9082004D */  lbu   $2, 0x4d($4)
/* 04EE58 8004E258 2442FFFF */  addiu $2, $2, -1
/* 04EE5C 8004E25C 14600044 */  bnez  $3, .L8004E370
/* 04EE60 8004E260 A082004D */   sb    $2, 0x4d($4)
/* 04EE64 8004E264 9082004D */  lbu   $2, 0x4d($4)
/* 04EE68 8004E268 1440001F */  bnez  $2, .L8004E2E8
/* 04EE6C 8004E26C 00000000 */   nop   
/* 04EE70 8004E270 9083004C */  lbu   $3, 0x4c($4)
/* 04EE74 8004E274 00031040 */  sll   $2, $3, 1
/* 04EE78 8004E278 00431021 */  addu  $2, $2, $3
/* 04EE7C 8004E27C 00021100 */  sll   $2, $2, 4
/* 04EE80 8004E280 3C01800F */  lui   $1, 0x800f
/* 04EE84 8004E284 00220821 */  addu  $1, $1, $2
/* 04EE88 8004E288 8C2232D0 */  lw    $2, 0x32d0($1)
/* 04EE8C 8004E28C C4800018 */  lwc1  $f0, 0x18($4)
/* 04EE90 8004E290 E440000C */  swc1  $f0, 0xc($2)
/* 04EE94 8004E294 9083004C */  lbu   $3, 0x4c($4)
/* 04EE98 8004E298 00031040 */  sll   $2, $3, 1
/* 04EE9C 8004E29C 00431021 */  addu  $2, $2, $3
/* 04EEA0 8004E2A0 00021100 */  sll   $2, $2, 4
/* 04EEA4 8004E2A4 3C01800F */  lui   $1, 0x800f
/* 04EEA8 8004E2A8 00220821 */  addu  $1, $1, $2
/* 04EEAC 8004E2AC 8C2232D0 */  lw    $2, 0x32d0($1)
/* 04EEB0 8004E2B0 C480001C */  lwc1  $f0, 0x1c($4)
/* 04EEB4 8004E2B4 E4400010 */  swc1  $f0, 0x10($2)
/* 04EEB8 8004E2B8 9083004C */  lbu   $3, 0x4c($4)
/* 04EEBC 8004E2BC 00031040 */  sll   $2, $3, 1
/* 04EEC0 8004E2C0 00431021 */  addu  $2, $2, $3
/* 04EEC4 8004E2C4 00021100 */  sll   $2, $2, 4
/* 04EEC8 8004E2C8 3C01800F */  lui   $1, 0x800f
/* 04EECC 8004E2CC 00220821 */  addu  $1, $1, $2
/* 04EED0 8004E2D0 8C2232D0 */  lw    $2, 0x32d0($1)
/* 04EED4 8004E2D4 C4800020 */  lwc1  $f0, 0x20($4)
/* 04EED8 8004E2D8 0C0175C6 */  jal   func_8005D718
/* 04EEDC 8004E2DC E4400014 */   swc1  $f0, 0x14($2)
/* 04EEE0 8004E2E0 080138F5 */  j     .L8004E3D4
/* 04EEE4 8004E2E4 00000000 */   nop   

.L8004E2E8:
/* 04EEE8 8004E2E8 9083004C */  lbu   $3, 0x4c($4)
/* 04EEEC 8004E2EC 00031040 */  sll   $2, $3, 1
/* 04EEF0 8004E2F0 00431021 */  addu  $2, $2, $3
/* 04EEF4 8004E2F4 00021100 */  sll   $2, $2, 4
/* 04EEF8 8004E2F8 3C01800F */  lui   $1, 0x800f
/* 04EEFC 8004E2FC 00220821 */  addu  $1, $1, $2
/* 04EF00 8004E300 8C2232D0 */  lw    $2, 0x32d0($1)
/* 04EF04 8004E304 C440000C */  lwc1  $f0, 0xc($2)
/* 04EF08 8004E308 C4820030 */  lwc1  $f2, 0x30($4)
/* 04EF0C 8004E30C 46020000 */  add.s $f0, $f0, $f2
/* 04EF10 8004E310 E440000C */  swc1  $f0, 0xc($2)
/* 04EF14 8004E314 9083004C */  lbu   $3, 0x4c($4)
/* 04EF18 8004E318 00031040 */  sll   $2, $3, 1
/* 04EF1C 8004E31C 00431021 */  addu  $2, $2, $3
/* 04EF20 8004E320 00021100 */  sll   $2, $2, 4
/* 04EF24 8004E324 3C01800F */  lui   $1, 0x800f
/* 04EF28 8004E328 00220821 */  addu  $1, $1, $2
/* 04EF2C 8004E32C 8C2232D0 */  lw    $2, 0x32d0($1)
/* 04EF30 8004E330 C4400010 */  lwc1  $f0, 0x10($2)
/* 04EF34 8004E334 C4820034 */  lwc1  $f2, 0x34($4)
/* 04EF38 8004E338 46020000 */  add.s $f0, $f0, $f2
/* 04EF3C 8004E33C E4400010 */  swc1  $f0, 0x10($2)
/* 04EF40 8004E340 9083004C */  lbu   $3, 0x4c($4)
/* 04EF44 8004E344 00031040 */  sll   $2, $3, 1
/* 04EF48 8004E348 00431021 */  addu  $2, $2, $3
/* 04EF4C 8004E34C 00021100 */  sll   $2, $2, 4
/* 04EF50 8004E350 3C01800F */  lui   $1, 0x800f
/* 04EF54 8004E354 00220821 */  addu  $1, $1, $2
/* 04EF58 8004E358 8C2232D0 */  lw    $2, 0x32d0($1)
/* 04EF5C 8004E35C C4400014 */  lwc1  $f0, 0x14($2)
/* 04EF60 8004E360 C4820038 */  lwc1  $f2, 0x38($4)
/* 04EF64 8004E364 46020000 */  add.s $f0, $f0, $f2
/* 04EF68 8004E368 080138F5 */  j     .L8004E3D4
/* 04EF6C 8004E36C E4400014 */   swc1  $f0, 0x14($2)

.L8004E370:
/* 04EF70 8004E370 9082004D */  lbu   $2, 0x4d($4)
/* 04EF74 8004E374 1440000B */  bnez  $2, .L8004E3A4
/* 04EF78 8004E378 00000000 */   nop   
/* 04EF7C 8004E37C C4800018 */  lwc1  $f0, 0x18($4)
/* 04EF80 8004E380 E460000C */  swc1  $f0, 0xc($3)
/* 04EF84 8004E384 C480001C */  lwc1  $f0, 0x1c($4)
/* 04EF88 8004E388 E4600010 */  swc1  $f0, 0x10($3)
/* 04EF8C 8004E38C C4800020 */  lwc1  $f0, 0x20($4)
/* 04EF90 8004E390 E4600014 */  swc1  $f0, 0x14($3)
/* 04EF94 8004E394 0C0175C6 */  jal   func_8005D718
/* 04EF98 8004E398 AC800050 */   sw    $0, 0x50($4)
/* 04EF9C 8004E39C 080138F5 */  j     .L8004E3D4
/* 04EFA0 8004E3A0 00000000 */   nop   

.L8004E3A4:
/* 04EFA4 8004E3A4 C460000C */  lwc1  $f0, 0xc($3)
/* 04EFA8 8004E3A8 C4820030 */  lwc1  $f2, 0x30($4)
/* 04EFAC 8004E3AC 46020000 */  add.s $f0, $f0, $f2
/* 04EFB0 8004E3B0 E460000C */  swc1  $f0, 0xc($3)
/* 04EFB4 8004E3B4 C4600010 */  lwc1  $f0, 0x10($3)
/* 04EFB8 8004E3B8 C4820034 */  lwc1  $f2, 0x34($4)
/* 04EFBC 8004E3BC 46020000 */  add.s $f0, $f0, $f2
/* 04EFC0 8004E3C0 E4600010 */  swc1  $f0, 0x10($3)
/* 04EFC4 8004E3C4 C4600014 */  lwc1  $f0, 0x14($3)
/* 04EFC8 8004E3C8 C4820038 */  lwc1  $f2, 0x38($4)
/* 04EFCC 8004E3CC 46020000 */  add.s $f0, $f0, $f2
/* 04EFD0 8004E3D0 E4600014 */  swc1  $f0, 0x14($3)
.L8004E3D4:
/* 04EFD4 8004E3D4 8FBF0010 */  lw    $31, 0x10($29)
/* 04EFD8 8004E3D8 03E00008 */  jr    $31
/* 04EFDC 8004E3DC 27BD0018 */   addiu $29, $29, 0x18

.set at
.set reorder