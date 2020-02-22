.include "globals.inc"
.include "macros.inc"

.set noat
.set noreorder

glabel CallProcess
/* 064210 80063610 27BDFFD0 */  addiu $29, $29, -0x30
/* 064214 80063614 AFBF0028 */  sw    $31, 0x28($29)
/* 064218 80063618 AFB30024 */  sw    $19, 0x24($29)
/* 06421C 8006361C AFB20020 */  sw    $18, 0x20($29)
/* 064220 80063620 AFB1001C */  sw    $17, 0x1c($29)
/* 064224 80063624 AFB00018 */  sw    $16, 0x18($29)
/* 064228 80063628 AFA40014 */  sw    $4, 0x14($29)
/* 06422C 8006362C 3C02800E */  lui   $2, %hi(D_800E23CC) # $2, 0x800e
/* 064230 80063630 8C4223CC */  lw    $2, %lo(D_800E23CC)($2)
/* 064234 80063634 3C01800E */  lui   $1, %hi(D_800E23D0) # $1, 0x800e
/* 064238 80063638 AC2223D0 */  sw    $2, %lo(D_800E23D0)($1)
/* 06423C 8006363C 3C04800E */  lui   $4, %hi(D_800E2370) # $4, 0x800e
/* 064240 80063640 0C01F020 */  jal   setjmp
/* 064244 80063644 24842370 */   addiu $4, %lo(D_800E2370) # addiu $4, $4, 0x2370
/* 064248 80063648 00408021 */  addu  $16, $2, $0
/* 06424C 8006364C 24130001 */  li    $19, 1
/* 064250 80063650 24120002 */  li    $18, 2
/* 064254 80063654 24110003 */  li    $17, 3
.L80063658:
/* 064258 80063658 12130007 */  beq   $16, $19, .L80063678
/* 06425C 8006365C 00000000 */   nop
/* 064260 80063660 1612000A */  bne   $16, $18, .L8006368C
/* 064264 80063664 00000000 */   nop
/* 064268 80063668 3C02800E */  lui   $2, %hi(D_800E23D0) # $2, 0x800e
/* 06426C 8006366C 8C4223D0 */  lw    $2, %lo(D_800E23D0)($2)
/* 064270 80063670 0C00EDB2 */  jal   FreePerm
/* 064274 80063674 8C440018 */   lw    $4, 0x18($2)
.L80063678:
/* 064278 80063678 3C02800E */  lui   $2, %hi(D_800E23D0) # $2, 0x800e
/* 06427C 8006367C 8C4223D0 */  lw    $2, %lo(D_800E23D0)($2)
/* 064280 80063680 8C420000 */  lw    $2, ($2)
/* 064284 80063684 3C01800E */  lui   $1, %hi(D_800E23D0) # $1, 0x800e
/* 064288 80063688 AC2223D0 */  sw    $2, %lo(D_800E23D0)($1)
.L8006368C:
/* 06428C 8006368C 3C04800E */  lui   $4, %hi(D_800E23D0) # $4, 0x800e
/* 064290 80063690 8C8423D0 */  lw    $4, %lo(D_800E23D0)($4)
/* 064294 80063694 1080002E */  beqz  $4, .L80063750
/* 064298 80063698 00000000 */   nop
/* 06429C 8006369C 9482001E */  lhu   $2, 0x1e($4)
/* 0642A0 800636A0 30420001 */  andi  $2, $2, 1
/* 0642A4 800636A4 10400004 */  beqz  $2, .L800636B8
/* 0642A8 800636A8 00000000 */   nop
/* 0642AC 800636AC 9482001C */  lhu   $2, 0x1c($4)
/* 0642B0 800636B0 5451FFE9 */  bnel  $2, $17, .L80063658
/* 0642B4 800636B4 24100001 */   li    $16, 1
.L800636B8:
/* 0642B8 800636B8 9483001C */  lhu   $3, 0x1c($4)
/* 0642BC 800636BC 1073000D */  beq   $3, $19, .L800636F4
/* 0642C0 800636C0 28620002 */   slti  $2, $3, 2
/* 0642C4 800636C4 10400005 */  beqz  $2, .L800636DC
/* 0642C8 800636C8 00000000 */   nop
/* 0642CC 800636CC 1060001E */  beqz  $3, .L80063748
/* 0642D0 800636D0 2484002C */   addiu $4, $4, 0x2c
/* 0642D4 800636D4 08018D96 */  j     .L80063658
/* 0642D8 800636D8 00000000 */   nop

.L800636DC:
/* 0642DC 800636DC 1072000F */  beq   $3, $18, .L8006371C
/* 0642E0 800636E0 00000000 */   nop
/* 0642E4 800636E4 10710014 */  beq   $3, $17, .L80063738
/* 0642E8 800636E8 00000000 */   nop
/* 0642EC 800636EC 08018D96 */  j     .L80063658
/* 0642F0 800636F0 00000000 */   nop

.L800636F4:
/* 0642F4 800636F4 8C820024 */  lw    $2, 0x24($4)
/* 0642F8 800636F8 1840FFD7 */  blez  $2, .L80063658
/* 0642FC 800636FC 24100001 */   li    $16, 1
/* 064300 80063700 8FA60014 */  lw    $6, 0x14($29)
/* 064304 80063704 00461023 */  subu  $2, $2, $6
/* 064308 80063708 1C40FFD3 */  bgtz  $2, .L80063658
/* 06430C 8006370C AC820024 */   sw    $2, 0x24($4)
/* 064310 80063710 AC800024 */  sw    $0, 0x24($4)
/* 064314 80063714 08018D96 */  j     .L80063658
/* 064318 80063718 A480001C */   sh    $0, 0x1c($4)

.L8006371C:
/* 06431C 8006371C 8C820008 */  lw    $2, 8($4)
/* 064320 80063720 50400003 */  beql  $2, $0, .L80063730
/* 064324 80063724 A480001C */   sh    $0, 0x1c($4)
/* 064328 80063728 08018D96 */  j     .L80063658
/* 06432C 8006372C 24100001 */   li    $16, 1

.L80063730:
/* 064330 80063730 08018D96 */  j     .L80063658
/* 064334 80063734 00008021 */   addu  $16, $0, $0

.L80063738:
/* 064338 80063738 3C028006 */  lui   $2, %hi(ExitProcess)
/* 06433C 8006373C 24423514 */  addiu $2, %lo(ExitProcess)
/* 064340 80063740 AC820030 */  sw    $2, 0x30($4)
/* 064344 80063744 2484002C */  addiu $4, $4, 0x2c
.L80063748:
/* 064348 80063748 0C01F039 */  jal   longjmp
/* 06434C 8006374C 24050001 */   li    $5, 1
.L80063750:
/* 064350 80063750 8FBF0028 */  lw    $31, 0x28($29)
/* 064354 80063754 8FB30024 */  lw    $19, 0x24($29)
/* 064358 80063758 8FB20020 */  lw    $18, 0x20($29)
/* 06435C 8006375C 8FB1001C */  lw    $17, 0x1c($29)
/* 064360 80063760 8FB00018 */  lw    $16, 0x18($29)
/* 064364 80063764 03E00008 */  jr    $31
/* 064368 80063768 27BD0030 */   addiu $29, $29, 0x30

.set at
.set reorder