# Implementation of setjmp / longjmp in assembly.
# These were not originally written in C.

.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches
.set gp=64

.include "globals.inc"
.include "macros.inc"

# 8007C080
glabel setjmp
  sw    $sp, ($a0)
  sw    $ra, 4($a0)
  sw    $s0, 8($a0)
  sw    $s1, 0xc($a0)
  sw    $s2, 0x10($a0)
  sw    $s3, 0x14($a0)
  sw    $s4, 0x18($a0)
  sw    $s5, 0x1c($a0)
  sw    $s6, 0x20($a0)
  sw    $s7, 0x24($a0)
  sw    $fp, 0x28($a0)
  swc1  $f20, 0x2c($a0)
  swc1  $f21, 0x30($a0)
  swc1  $f22, 0x34($a0)
  swc1  $f23, 0x38($a0)
  swc1  $f24, 0x3c($a0)
  swc1  $f25, 0x40($a0)
  swc1  $f26, 0x44($a0)
  swc1  $f27, 0x48($a0)
  swc1  $f28, 0x4c($a0)
  swc1  $f29, 0x50($a0)
  swc1  $f30, 0x54($a0)
  swc1  $f31, 0x58($a0)
  jr    $ra
   or  $v0, $zero, $zero

# 8007C0E4
glabel longjmp
  lw    $sp, ($a0)
  lw    $ra, 4($a0)
  lw    $s0, 8($a0)
  lw    $s1, 0xc($a0)
  lw    $s2, 0x10($a0)
  lw    $s3, 0x14($a0)
  lw    $s4, 0x18($a0)
  lw    $s5, 0x1c($a0)
  lw    $s6, 0x20($a0)
  lw    $s7, 0x24($a0)
  lw    $fp, 0x28($a0)
  lwc1  $f20, 0x2c($a0)
  lwc1  $f21, 0x30($a0)
  lwc1  $f22, 0x34($a0)
  lwc1  $f23, 0x38($a0)
  lwc1  $f24, 0x3c($a0)
  lwc1  $f25, 0x40($a0)
  lwc1  $f26, 0x44($a0)
  lwc1  $f27, 0x48($a0)
  lwc1  $f28, 0x4c($a0)
  lwc1  $f29, 0x50($a0)
  lwc1  $f30, 0x54($a0)
  lwc1  $f31, 0x58($a0)
  or  $v0, $a1, $zero
  bnez  $v0, .L8007C150_ret
   nop
  li    $v0, 1
.L8007C150_ret:
  jr    $ra
   nop
