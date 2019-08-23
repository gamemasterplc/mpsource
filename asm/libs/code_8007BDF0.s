# assembler directives
.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

glabel func_8007BDF0
/* 07C9F0 8007BDF0 27BDFFC8 */  addiu $sp, $sp, -0x38
/* 07C9F4 8007BDF4 AFBF0030 */  sw    $ra, 0x30($sp)
/* 07C9F8 8007BDF8 AFBE002C */  sw    $fp, 0x2c($sp)
/* 07C9FC 8007BDFC AFB20028 */  sw    $s2, 0x28($sp)
/* 07CA00 8007BE00 AFB10024 */  sw    $s1, 0x24($sp)
/* 07CA04 8007BE04 AFB00020 */  sw    $s0, 0x20($sp)
/* 07CA08 8007BE08 03A0F021 */  addu  $fp, $sp, $zero
/* 07CA0C 8007BE0C AFC40038 */  sw    $a0, 0x38($fp)
/* 07CA10 8007BE10 AFC5003C */  sw    $a1, 0x3c($fp)
/* 07CA14 8007BE14 AFC60040 */  sw    $a2, 0x40($fp)
/* 07CA18 8007BE18 AFC70044 */  sw    $a3, 0x44($fp)
/* 07CA1C 8007BE1C 8FD00048 */  lw    $s0, 0x48($fp)
/* 07CA20 8007BE20 8FD1004C */  lw    $s1, 0x4c($fp)
/* 07CA24 8007BE24 8FD20050 */  lw    $s2, 0x50($fp)
/* 07CA28 8007BE28 A7D00010 */  sh    $s0, 0x10($fp)
/* 07CA2C 8007BE2C A3D10012 */  sb    $s1, 0x12($fp)
/* 07CA30 8007BE30 A3D20013 */  sb    $s2, 0x13($fp)
/* 07CA34 8007BE34 8FC2003C */  lw    $v0, 0x3c($fp)
/* 07CA38 8007BE38 8C430008 */  lw    $v1, 8($v0)
/* 07CA3C 8007BE3C 10600048 */  beqz  $v1, .L8007BF60
/* 07CA40 8007BE40 00000000 */   nop   
/* 07CA44 8007BE44 0C023D9B */  jal   func_8008F66C
/* 07CA48 8007BE48 00000000 */   nop   
/* 07CA4C 8007BE4C AFC20014 */  sw    $v0, 0x14($fp)
/* 07CA50 8007BE50 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CA54 8007BE54 14400003 */  bnez  $v0, .L8007BE64
/* 07CA58 8007BE58 00000000 */   nop   
/* 07CA5C 8007BE5C 0801EFD8 */  j     func_8007BF60
/* 07CA60 8007BE60 00000000 */   nop   

.L8007BE64:
/* 07CA64 8007BE64 83C20013 */  lb    $v0, 0x13($fp)
/* 07CA68 8007BE68 04410004 */  bgez  $v0, .L8007BE7C
/* 07CA6C 8007BE6C 00000000 */   nop   
/* 07CA70 8007BE70 93C20013 */  lbu   $v0, 0x13($fp)
/* 07CA74 8007BE74 00021823 */  negu  $v1, $v0
/* 07CA78 8007BE78 A3C30013 */  sb    $v1, 0x13($fp)
.L8007BE7C:
/* 07CA7C 8007BE7C 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CA80 8007BE80 8FC30038 */  lw    $v1, 0x38($fp)
/* 07CA84 8007BE84 8FC4003C */  lw    $a0, 0x3c($fp)
/* 07CA88 8007BE88 8C850008 */  lw    $a1, 8($a0)
/* 07CA8C 8007BE8C 8C63001C */  lw    $v1, 0x1c($v1)
/* 07CA90 8007BE90 8CA400D8 */  lw    $a0, 0xd8($a1)
/* 07CA94 8007BE94 00641821 */  addu  $v1, $v1, $a0
/* 07CA98 8007BE98 AC430004 */  sw    $v1, 4($v0)
/* 07CA9C 8007BE9C 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CAA0 8007BEA0 AC400000 */  sw    $zero, ($v0)
/* 07CAA4 8007BEA4 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CAA8 8007BEA8 2403000D */  li    $v1, 13
/* 07CAAC 8007BEAC A4430008 */  sh    $v1, 8($v0)
/* 07CAB0 8007BEB0 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CAB4 8007BEB4 8FC3003C */  lw    $v1, 0x3c($fp)
/* 07CAB8 8007BEB8 9464001A */  lhu   $a0, 0x1a($v1)
/* 07CABC 8007BEBC A444000A */  sh    $a0, 0xa($v0)
/* 07CAC0 8007BEC0 3C02800F */  lui   $v0, %hi(D_800ECB2C) # $v0, 0x800f
/* 07CAC4 8007BEC4 9042CB2C */  lbu   $v0, %lo(D_800ECB2C)($v0)
/* 07CAC8 8007BEC8 30430001 */  andi  $v1, $v0, 1
/* 07CACC 8007BECC 306200FF */  andi  $v0, $v1, 0xff
/* 07CAD0 8007BED0 10400005 */  beqz  $v0, .L8007BEE8
/* 07CAD4 8007BED4 00000000 */   nop   
/* 07CAD8 8007BED8 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CADC 8007BEDC 24030040 */  li    $v1, 64
/* 07CAE0 8007BEE0 0801EFBD */  j     func_8007BEF4
/* 07CAE4 8007BEE4 A0430012 */   sb    $v1, 0x12($v0)

.L8007BEE8:
/* 07CAE8 8007BEE8 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CAEC 8007BEEC 93C30012 */  lbu   $v1, 0x12($fp)
/* 07CAF0 8007BEF0 A0430012 */  sb    $v1, 0x12($v0)
glabel func_8007BEF4
/* 07CAF4 8007BEF4 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CAF8 8007BEF8 97C30010 */  lhu   $v1, 0x10($fp)
/* 07CAFC 8007BEFC A4430010 */  sh    $v1, 0x10($v0)
/* 07CB00 8007BF00 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CB04 8007BF04 93C30013 */  lbu   $v1, 0x13($fp)
/* 07CB08 8007BF08 A0430013 */  sb    $v1, 0x13($v0)
/* 07CB0C 8007BF0C 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CB10 8007BF10 C7C00044 */  lwc1  $f0, 0x44($fp)
/* 07CB14 8007BF14 E440000C */  swc1  $f0, 0xc($v0)
/* 07CB18 8007BF18 8FC40038 */  lw    $a0, 0x38($fp)
/* 07CB1C 8007BF1C 0C023DE3 */  jal   func_8008F78C
/* 07CB20 8007BF20 8FC50054 */   lw    $a1, 0x54($fp)
/* 07CB24 8007BF24 8FC30014 */  lw    $v1, 0x14($fp)
/* 07CB28 8007BF28 AC620014 */  sw    $v0, 0x14($v1)
/* 07CB2C 8007BF2C 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CB30 8007BF30 8FC30040 */  lw    $v1, 0x40($fp)
/* 07CB34 8007BF34 AC430018 */  sw    $v1, 0x18($v0)
/* 07CB38 8007BF38 8FC2003C */  lw    $v0, 0x3c($fp)
/* 07CB3C 8007BF3C 8C430008 */  lw    $v1, 8($v0)
/* 07CB40 8007BF40 8C62000C */  lw    $v0, 0xc($v1)
/* 07CB44 8007BF44 AFC20018 */  sw    $v0, 0x18($fp)
/* 07CB48 8007BF48 8FC30018 */  lw    $v1, 0x18($fp)
/* 07CB4C 8007BF4C 8C620008 */  lw    $v0, 8($v1)
/* 07CB50 8007BF50 8FC40018 */  lw    $a0, 0x18($fp)
/* 07CB54 8007BF54 24050003 */  li    $a1, 3
/* 07CB58 8007BF58 0040F809 */  jalr  $v0
/* 07CB5C 8007BF5C 8FC60014 */  lw    $a2, 0x14($fp)
glabel func_8007BF60
.L8007BF60:
/* 07CB60 8007BF60 03C0E821 */  addu  $sp, $fp, $zero
/* 07CB64 8007BF64 8FBF0030 */  lw    $ra, 0x30($sp)
/* 07CB68 8007BF68 8FBE002C */  lw    $fp, 0x2c($sp)
/* 07CB6C 8007BF6C 8FB20028 */  lw    $s2, 0x28($sp)
/* 07CB70 8007BF70 8FB10024 */  lw    $s1, 0x24($sp)
/* 07CB74 8007BF74 8FB00020 */  lw    $s0, 0x20($sp)
/* 07CB78 8007BF78 03E00008 */  jr    $ra
/* 07CB7C 8007BF7C 27BD0038 */   addiu $sp, $sp, 0x38

glabel func_8007BF80
/* 07CB80 8007BF80 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 07CB84 8007BF84 AFBF0028 */  sw    $ra, 0x28($sp)
/* 07CB88 8007BF88 AFBE0024 */  sw    $fp, 0x24($sp)
/* 07CB8C 8007BF8C AFB00020 */  sw    $s0, 0x20($sp)
/* 07CB90 8007BF90 03A0F021 */  addu  $fp, $sp, $zero
/* 07CB94 8007BF94 AFC40030 */  sw    $a0, 0x30($fp)
/* 07CB98 8007BF98 AFC50034 */  sw    $a1, 0x34($fp)
/* 07CB9C 8007BF9C 00C08021 */  addu  $s0, $a2, $zero
/* 07CBA0 8007BFA0 A3D00010 */  sb    $s0, 0x10($fp)
/* 07CBA4 8007BFA4 8FC20034 */  lw    $v0, 0x34($fp)
/* 07CBA8 8007BFA8 8C430008 */  lw    $v1, 8($v0)
/* 07CBAC 8007BFAC 1060002D */  beqz  $v1, .L8007C064
/* 07CBB0 8007BFB0 00000000 */   nop   
/* 07CBB4 8007BFB4 0C023D9B */  jal   func_8008F66C
/* 07CBB8 8007BFB8 00000000 */   nop   
/* 07CBBC 8007BFBC AFC20014 */  sw    $v0, 0x14($fp)
/* 07CBC0 8007BFC0 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CBC4 8007BFC4 14400003 */  bnez  $v0, .L8007BFD4
/* 07CBC8 8007BFC8 00000000 */   nop   
/* 07CBCC 8007BFCC 0801F019 */  j     func_8007C064
/* 07CBD0 8007BFD0 00000000 */   nop   

.L8007BFD4:
/* 07CBD4 8007BFD4 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CBD8 8007BFD8 8FC30030 */  lw    $v1, 0x30($fp)
/* 07CBDC 8007BFDC 8FC40034 */  lw    $a0, 0x34($fp)
/* 07CBE0 8007BFE0 8C850008 */  lw    $a1, 8($a0)
/* 07CBE4 8007BFE4 8C63001C */  lw    $v1, 0x1c($v1)
/* 07CBE8 8007BFE8 8CA400D8 */  lw    $a0, 0xd8($a1)
/* 07CBEC 8007BFEC 00641821 */  addu  $v1, $v1, $a0
/* 07CBF0 8007BFF0 AC430004 */  sw    $v1, 4($v0)
/* 07CBF4 8007BFF4 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CBF8 8007BFF8 2403000C */  li    $v1, 12
/* 07CBFC 8007BFFC A4430008 */  sh    $v1, 8($v0)
/* 07CC00 8007C000 3C02800F */  lui   $v0, %hi(D_800ECB2C) # $v0, 0x800f
/* 07CC04 8007C004 9042CB2C */  lbu   $v0, %lo(D_800ECB2C)($v0)
/* 07CC08 8007C008 30430001 */  andi  $v1, $v0, 1
/* 07CC0C 8007C00C 306200FF */  andi  $v0, $v1, 0xff
/* 07CC10 8007C010 10400005 */  beqz  $v0, .L8007C028
/* 07CC14 8007C014 00000000 */   nop   
/* 07CC18 8007C018 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CC1C 8007C01C 24030040 */  li    $v1, 64
/* 07CC20 8007C020 0801F00D */  j     func_8007C034
/* 07CC24 8007C024 AC43000C */   sw    $v1, 0xc($v0)

.L8007C028:
/* 07CC28 8007C028 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CC2C 8007C02C 93C30010 */  lbu   $v1, 0x10($fp)
/* 07CC30 8007C030 AC43000C */  sw    $v1, 0xc($v0)
glabel func_8007C034
/* 07CC34 8007C034 8FC20014 */  lw    $v0, 0x14($fp)
/* 07CC38 8007C038 AC400000 */  sw    $zero, ($v0)
/* 07CC3C 8007C03C 8FC20034 */  lw    $v0, 0x34($fp)
/* 07CC40 8007C040 8C430008 */  lw    $v1, 8($v0)
/* 07CC44 8007C044 8C62000C */  lw    $v0, 0xc($v1)
/* 07CC48 8007C048 AFC20018 */  sw    $v0, 0x18($fp)
/* 07CC4C 8007C04C 8FC30018 */  lw    $v1, 0x18($fp)
/* 07CC50 8007C050 8C620008 */  lw    $v0, 8($v1)
/* 07CC54 8007C054 8FC40018 */  lw    $a0, 0x18($fp)
/* 07CC58 8007C058 24050003 */  li    $a1, 3
/* 07CC5C 8007C05C 0040F809 */  jalr  $v0
/* 07CC60 8007C060 8FC60014 */  lw    $a2, 0x14($fp)
glabel func_8007C064
.L8007C064:
/* 07CC64 8007C064 03C0E821 */  addu  $sp, $fp, $zero
/* 07CC68 8007C068 8FBF0028 */  lw    $ra, 0x28($sp)
/* 07CC6C 8007C06C 8FBE0024 */  lw    $fp, 0x24($sp)
/* 07CC70 8007C070 8FB00020 */  lw    $s0, 0x20($sp)
/* 07CC74 8007C074 03E00008 */  jr    $ra
/* 07CC78 8007C078 27BD0030 */   addiu $sp, $sp, 0x30

/* 07CC7C 8007C07C 00000000 */  nop
