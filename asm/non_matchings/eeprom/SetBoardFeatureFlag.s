.set noat      # allow manual use of $1
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

glabel SetBoardFeatureFlag
/* 05A3DC 800597DC 04810002 */  bgez  $4, .L800597E8
/* 05A3E0 800597E0 00801021 */   addu  $2, $4, $0
/* 05A3E4 800597E4 24820007 */  addiu $2, $4, 7
.L800597E8:
/* 05A3E8 800597E8 000228C3 */  sra   $5, $2, 3
/* 05A3EC 800597EC 04810002 */  bgez  $4, .L800597F8
/* 05A3F0 800597F0 00801021 */   addu  $2, $4, $0
/* 05A3F4 800597F4 24820007 */  addiu $2, $4, 7
.L800597F8:
/* 05A3F8 800597F8 000210C3 */  sra   $2, $2, 3
/* 05A3FC 800597FC 000210C0 */  sll   $2, $2, 3
/* 05A400 80059800 00821023 */  subu  $2, $4, $2
/* 05A404 80059804 24030001 */  li    $3, 1
/* 05A408 80059808 00431804 */  sllv  $3, $3, $2
/* 05A40C 8005980C 3C02800F */  lui   $2, 0x800f
/* 05A410 80059810 00451021 */  addu  $2, $2, $5
/* 05A414 80059814 9042D148 */  lbu   $2, -0x2eb8($2)
/* 05A418 80059818 00431025 */  or    $2, $2, $3
/* 05A41C 8005981C 3C01800F */  lui   $1, 0x800f
/* 05A420 80059820 00250821 */  addu  $1, $1, $5
/* 05A424 80059824 03E00008 */  jr    $31
/* 05A428 80059828 A022D148 */   sb    $2, -0x2eb8($1)

.set at
.set reorder
