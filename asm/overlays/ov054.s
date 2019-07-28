.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches


/* 000000 800F65E0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000004 800F65E4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 000008 800F65E8 3C048010 */  lui   $a0, 0x8010
/* 00000C 800F65EC 24849890 */  addiu $a0, $a0, -0x6770
/* 000010 800F65F0 3C05800C */  lui   $a1, 0x800c
/* 000014 800F65F4 0C0161D4 */  jal   ExecBoardScene
/* 000018 800F65F8 84A5597A */   lh    $a1, 0x597a($a1)
/* 00001C 800F65FC 8FBF0010 */  lw    $ra, 0x10($sp)
/* 000020 800F6600 03E00008 */  jr    $ra
/* 000024 800F6604 27BD0018 */   addiu $sp, $sp, 0x18

/* 000028 800F6608 00000000 */  nop   
/* 00002C 800F660C 00000000 */  nop   
ov054_func_800F6610:
/* 000030 800F6610 3C02800F */  lui   $v0, 0x800f
/* 000034 800F6614 2442D5CA */  addiu $v0, $v0, -0x2a36
/* 000038 800F6618 84430000 */  lh    $v1, ($v0)
/* 00003C 800F661C 00031840 */  sll   $v1, $v1, 1
/* 000040 800F6620 00431021 */  addu  $v0, $v0, $v1
/* 000044 800F6624 84420002 */  lh    $v0, 2($v0)
/* 000048 800F6628 00021040 */  sll   $v0, $v0, 1
/* 00004C 800F662C 3C018010 */  lui   $at, 0x8010
/* 000050 800F6630 00220821 */  addu  $at, $at, $v0
/* 000054 800F6634 03E00008 */  jr    $ra
/* 000058 800F6638 84229910 */   lh    $v0, -0x66f0($at)

ov054_func_800F663C:
/* 00005C 800F663C 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 000060 800F6640 AFBF0028 */  sw    $ra, 0x28($sp)
/* 000064 800F6644 AFB50024 */  sw    $s5, 0x24($sp)
/* 000068 800F6648 AFB40020 */  sw    $s4, 0x20($sp)
/* 00006C 800F664C AFB3001C */  sw    $s3, 0x1c($sp)
/* 000070 800F6650 AFB20018 */  sw    $s2, 0x18($sp)
/* 000074 800F6654 AFB10014 */  sw    $s1, 0x14($sp)
/* 000078 800F6658 AFB00010 */  sw    $s0, 0x10($sp)
/* 00007C 800F665C 3C15800F */  lui   $s5, 0x800f
/* 000080 800F6660 26B5D5C0 */  addiu $s5, $s5, -0x2a40
/* 000084 800F6664 00008821 */  addu  $s1, $zero, $zero
/* 000088 800F6668 3C142492 */  lui   $s4, 0x2492
/* 00008C 800F666C 36944925 */  ori   $s4, $s4, 0x4925
/* 000090 800F6670 3C138010 */  lui   $s3, 0x8010
/* 000094 800F6674 267398E0 */  addiu $s3, $s3, -0x6720
/* 000098 800F6678 3C128010 */  lui   $s2, 0x8010
/* 00009C 800F667C 265298D0 */  addiu $s2, $s2, -0x6730
.ov054_L800F6680:
/* 0000A0 800F6680 0C005D63 */  jal   GetRandomByte
/* 0000A4 800F6684 00000000 */   nop   
/* 0000A8 800F6688 304200FF */  andi  $v0, $v0, 0xff
/* 0000AC 800F668C 00540019 */  multu $v0, $s4
/* 0000B0 800F6690 00002010 */  mfhi  $a0
/* 0000B4 800F6694 00441823 */  subu  $v1, $v0, $a0
/* 0000B8 800F6698 00031842 */  srl   $v1, $v1, 1
/* 0000BC 800F669C 00832021 */  addu  $a0, $a0, $v1
/* 0000C0 800F66A0 00042082 */  srl   $a0, $a0, 2
/* 0000C4 800F66A4 000418C0 */  sll   $v1, $a0, 3
/* 0000C8 800F66A8 00641823 */  subu  $v1, $v1, $a0
/* 0000CC 800F66AC 00431023 */  subu  $v0, $v0, $v1
/* 0000D0 800F66B0 0C005D63 */  jal   GetRandomByte
/* 0000D4 800F66B4 305000FF */   andi  $s0, $v0, 0xff
/* 0000D8 800F66B8 304200FF */  andi  $v0, $v0, 0xff
/* 0000DC 800F66BC 00540019 */  multu $v0, $s4
/* 0000E0 800F66C0 00002010 */  mfhi  $a0
/* 0000E4 800F66C4 00441823 */  subu  $v1, $v0, $a0
/* 0000E8 800F66C8 00031842 */  srl   $v1, $v1, 1
/* 0000EC 800F66CC 00832021 */  addu  $a0, $a0, $v1
/* 0000F0 800F66D0 00042082 */  srl   $a0, $a0, 2
/* 0000F4 800F66D4 000418C0 */  sll   $v1, $a0, 3
/* 0000F8 800F66D8 00641823 */  subu  $v1, $v1, $a0
/* 0000FC 800F66DC 00431023 */  subu  $v0, $v0, $v1
/* 000100 800F66E0 304400FF */  andi  $a0, $v0, 0xff
/* 000104 800F66E4 12040016 */  beq   $s0, $a0, .ov054_L800F6740
/* 000108 800F66E8 00041840 */   sll   $v1, $a0, 1
/* 00010C 800F66EC 00733821 */  addu  $a3, $v1, $s3
/* 000110 800F66F0 84E20000 */  lh    $v0, ($a3)
/* 000114 800F66F4 0202102A */  slt   $v0, $s0, $v0
/* 000118 800F66F8 54400012 */  bnezl $v0, .ov054_L800F6744
/* 00011C 800F66FC 26310001 */   addiu $s1, $s1, 1
/* 000120 800F6700 00102840 */  sll   $a1, $s0, 1
/* 000124 800F6704 00B33021 */  addu  $a2, $a1, $s3
/* 000128 800F6708 84C20000 */  lh    $v0, ($a2)
/* 00012C 800F670C 0082102A */  slt   $v0, $a0, $v0
/* 000130 800F6710 5440000C */  bnezl $v0, .ov054_L800F6744
/* 000134 800F6714 26310001 */   addiu $s1, $s1, 1
/* 000138 800F6718 00B22021 */  addu  $a0, $a1, $s2
/* 00013C 800F671C 84850000 */  lh    $a1, ($a0)
/* 000140 800F6720 00721821 */  addu  $v1, $v1, $s2
/* 000144 800F6724 94620000 */  lhu   $v0, ($v1)
/* 000148 800F6728 A4820000 */  sh    $v0, ($a0)
/* 00014C 800F672C A4650000 */  sh    $a1, ($v1)
/* 000150 800F6730 84C50000 */  lh    $a1, ($a2)
/* 000154 800F6734 94E20000 */  lhu   $v0, ($a3)
/* 000158 800F6738 A4C20000 */  sh    $v0, ($a2)
/* 00015C 800F673C A4E50000 */  sh    $a1, ($a3)
.ov054_L800F6740:
/* 000160 800F6740 26310001 */  addiu $s1, $s1, 1
.ov054_L800F6744:
/* 000164 800F6744 2A22001E */  slti  $v0, $s1, 0x1e
/* 000168 800F6748 1440FFCD */  bnez  $v0, .ov054_L800F6680
/* 00016C 800F674C 00000000 */   nop   
/* 000170 800F6750 00008821 */  addu  $s1, $zero, $zero
/* 000174 800F6754 3C048010 */  lui   $a0, 0x8010
/* 000178 800F6758 248498D0 */  addiu $a0, $a0, -0x6730
/* 00017C 800F675C 00111040 */  sll   $v0, $s1, 1
.ov054_L800F6760:
/* 000180 800F6760 00551821 */  addu  $v1, $v0, $s5
/* 000184 800F6764 00441021 */  addu  $v0, $v0, $a0
/* 000188 800F6768 94420000 */  lhu   $v0, ($v0)
/* 00018C 800F676C A462000C */  sh    $v0, 0xc($v1)
/* 000190 800F6770 26310001 */  addiu $s1, $s1, 1
/* 000194 800F6774 2A220007 */  slti  $v0, $s1, 7
/* 000198 800F6778 1440FFF9 */  bnez  $v0, .ov054_L800F6760
/* 00019C 800F677C 00111040 */   sll   $v0, $s1, 1
/* 0001A0 800F6780 8FBF0028 */  lw    $ra, 0x28($sp)
/* 0001A4 800F6784 8FB50024 */  lw    $s5, 0x24($sp)
/* 0001A8 800F6788 8FB40020 */  lw    $s4, 0x20($sp)
/* 0001AC 800F678C 8FB3001C */  lw    $s3, 0x1c($sp)
/* 0001B0 800F6790 8FB20018 */  lw    $s2, 0x18($sp)
/* 0001B4 800F6794 8FB10014 */  lw    $s1, 0x14($sp)
/* 0001B8 800F6798 8FB00010 */  lw    $s0, 0x10($sp)
/* 0001BC 800F679C 03E00008 */  jr    $ra
/* 0001C0 800F67A0 27BD0030 */   addiu $sp, $sp, 0x30

ov054_func_800F67A4:
/* 0001C4 800F67A4 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0001C8 800F67A8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0001CC 800F67AC AFB00010 */  sw    $s0, 0x10($sp)
/* 0001D0 800F67B0 3C02800F */  lui   $v0, 0x800f
/* 0001D4 800F67B4 9442D5CA */  lhu   $v0, -0x2a36($v0)
/* 0001D8 800F67B8 24420001 */  addiu $v0, $v0, 1
/* 0001DC 800F67BC 3C01800F */  lui   $at, 0x800f
/* 0001E0 800F67C0 A422D5CA */  sh    $v0, -0x2a36($at)
/* 0001E4 800F67C4 00021400 */  sll   $v0, $v0, 0x10
/* 0001E8 800F67C8 00021403 */  sra   $v0, $v0, 0x10
/* 0001EC 800F67CC 28420007 */  slti  $v0, $v0, 7
/* 0001F0 800F67D0 14400013 */  bnez  $v0, .ov054_L800F6820
/* 0001F4 800F67D4 00000000 */   nop   
/* 0001F8 800F67D8 3C10800F */  lui   $s0, 0x800f
/* 0001FC 800F67DC 8610D5D8 */  lh    $s0, -0x2a28($s0)
/* 000200 800F67E0 3C01800F */  lui   $at, 0x800f
/* 000204 800F67E4 A420D5CA */  sh    $zero, -0x2a36($at)
/* 000208 800F67E8 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 00020C 800F67EC 24040044 */   addiu $a0, $zero, 0x44
/* 000210 800F67F0 0C03D98F */  jal   ov054_func_800F663C
/* 000214 800F67F4 00000000 */   nop   
/* 000218 800F67F8 3C03800F */  lui   $v1, 0x800f
/* 00021C 800F67FC 8463D5CC */  lh    $v1, -0x2a34($v1)
/* 000220 800F6800 16030007 */  bne   $s0, $v1, .ov054_L800F6820
/* 000224 800F6804 00000000 */   nop   
/* 000228 800F6808 3C02800F */  lui   $v0, 0x800f
/* 00022C 800F680C 9442D5D8 */  lhu   $v0, -0x2a28($v0)
/* 000230 800F6810 3C01800F */  lui   $at, 0x800f
/* 000234 800F6814 A422D5CC */  sh    $v0, -0x2a34($at)
/* 000238 800F6818 3C01800F */  lui   $at, 0x800f
/* 00023C 800F681C A423D5D8 */  sh    $v1, -0x2a28($at)
.ov054_L800F6820:
/* 000240 800F6820 8FBF0014 */  lw    $ra, 0x14($sp)
/* 000244 800F6824 8FB00010 */  lw    $s0, 0x10($sp)
/* 000248 800F6828 03E00008 */  jr    $ra
/* 00024C 800F682C 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F6830:
/* 000250 800F6830 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 000254 800F6834 AFBF002C */  sw    $ra, 0x2c($sp)
/* 000258 800F6838 AFB40028 */  sw    $s4, 0x28($sp)
/* 00025C 800F683C AFB30024 */  sw    $s3, 0x24($sp)
/* 000260 800F6840 AFB20020 */  sw    $s2, 0x20($sp)
/* 000264 800F6844 AFB1001C */  sw    $s1, 0x1c($sp)
/* 000268 800F6848 AFB00018 */  sw    $s0, 0x18($sp)
/* 00026C 800F684C 3C12800F */  lui   $s2, 0x800f
/* 000270 800F6850 2652D5C0 */  addiu $s2, $s2, -0x2a40
/* 000274 800F6854 00008821 */  addu  $s1, $zero, $zero
/* 000278 800F6858 3C148010 */  lui   $s4, 0x8010
/* 00027C 800F685C 26949900 */  addiu $s4, $s4, -0x6700
/* 000280 800F6860 3C138010 */  lui   $s3, 0x8010
/* 000284 800F6864 267398F0 */  addiu $s3, $s3, -0x6710
/* 000288 800F6868 00118040 */  sll   $s0, $s1, 1
.ov054_L800F686C:
/* 00028C 800F686C 02141021 */  addu  $v0, $s0, $s4
/* 000290 800F6870 84440000 */  lh    $a0, ($v0)
/* 000294 800F6874 0C013123 */  jal   SetSpaceType
/* 000298 800F6878 24050001 */   addiu $a1, $zero, 1
/* 00029C 800F687C 02138021 */  addu  $s0, $s0, $s3
/* 0002A0 800F6880 86040000 */  lh    $a0, ($s0)
/* 0002A4 800F6884 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 0002A8 800F6888 26310001 */   addiu $s1, $s1, 1
/* 0002AC 800F688C 2A220007 */  slti  $v0, $s1, 7
/* 0002B0 800F6890 5440FFF6 */  bnezl $v0, .ov054_L800F686C
/* 0002B4 800F6894 00118040 */   sll   $s0, $s1, 1
/* 0002B8 800F6898 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 0002BC 800F689C 24040044 */   addiu $a0, $zero, 0x44
/* 0002C0 800F68A0 14400002 */  bnez  $v0, .ov054_L800F68AC
/* 0002C4 800F68A4 24100007 */   addiu $s0, $zero, 7
/* 0002C8 800F68A8 8650000A */  lh    $s0, 0xa($s2)
.ov054_L800F68AC:
/* 0002CC 800F68AC 1A00000F */  blez  $s0, .ov054_L800F68EC
/* 0002D0 800F68B0 00008821 */   addu  $s1, $zero, $zero
/* 0002D4 800F68B4 3C138010 */  lui   $s3, 0x8010
/* 0002D8 800F68B8 26739900 */  addiu $s3, $s3, -0x6700
/* 0002DC 800F68BC 00111040 */  sll   $v0, $s1, 1
.ov054_L800F68C0:
/* 0002E0 800F68C0 00521021 */  addu  $v0, $v0, $s2
/* 0002E4 800F68C4 8442000C */  lh    $v0, 0xc($v0)
/* 0002E8 800F68C8 00021040 */  sll   $v0, $v0, 1
/* 0002EC 800F68CC 00531021 */  addu  $v0, $v0, $s3
/* 0002F0 800F68D0 84440000 */  lh    $a0, ($v0)
/* 0002F4 800F68D4 0C013123 */  jal   SetSpaceType
/* 0002F8 800F68D8 24050006 */   addiu $a1, $zero, 6
/* 0002FC 800F68DC 26310001 */  addiu $s1, $s1, 1
/* 000300 800F68E0 0230102A */  slt   $v0, $s1, $s0
/* 000304 800F68E4 1440FFF6 */  bnez  $v0, .ov054_L800F68C0
/* 000308 800F68E8 00111040 */   sll   $v0, $s1, 1
.ov054_L800F68EC:
/* 00030C 800F68EC 8642000A */  lh    $v0, 0xa($s2)
/* 000310 800F68F0 00021040 */  sll   $v0, $v0, 1
/* 000314 800F68F4 00521021 */  addu  $v0, $v0, $s2
/* 000318 800F68F8 8442000C */  lh    $v0, 0xc($v0)
/* 00031C 800F68FC 00021040 */  sll   $v0, $v0, 1
/* 000320 800F6900 3C048010 */  lui   $a0, 0x8010
/* 000324 800F6904 00822021 */  addu  $a0, $a0, $v0
/* 000328 800F6908 84849900 */  lh    $a0, -0x6700($a0)
/* 00032C 800F690C 0C013123 */  jal   SetSpaceType
/* 000330 800F6910 24050005 */   addiu $a1, $zero, 5
/* 000334 800F6914 8642000A */  lh    $v0, 0xa($s2)
/* 000338 800F6918 00021040 */  sll   $v0, $v0, 1
/* 00033C 800F691C 00521021 */  addu  $v0, $v0, $s2
/* 000340 800F6920 8442000C */  lh    $v0, 0xc($v0)
/* 000344 800F6924 00021040 */  sll   $v0, $v0, 1
/* 000348 800F6928 3C048010 */  lui   $a0, 0x8010
/* 00034C 800F692C 00822021 */  addu  $a0, $a0, $v0
/* 000350 800F6930 0C01660B */  jal   SetBoardFeatureDisabled
/* 000354 800F6934 848498F0 */   lh    $a0, -0x6710($a0)
/* 000358 800F6938 8FBF002C */  lw    $ra, 0x2c($sp)
/* 00035C 800F693C 8FB40028 */  lw    $s4, 0x28($sp)
/* 000360 800F6940 8FB30024 */  lw    $s3, 0x24($sp)
/* 000364 800F6944 8FB20020 */  lw    $s2, 0x20($sp)
/* 000368 800F6948 8FB1001C */  lw    $s1, 0x1c($sp)
/* 00036C 800F694C 8FB00018 */  lw    $s0, 0x18($sp)
/* 000370 800F6950 03E00008 */  jr    $ra
/* 000374 800F6954 27BD0030 */   addiu $sp, $sp, 0x30

ov054_func_800F6958:
/* 000378 800F6958 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 00037C 800F695C AFBF0020 */  sw    $ra, 0x20($sp)
/* 000380 800F6960 AFB1001C */  sw    $s1, 0x1c($sp)
/* 000384 800F6964 AFB00018 */  sw    $s0, 0x18($sp)
/* 000388 800F6968 3C11800F */  lui   $s1, 0x800f
/* 00038C 800F696C 2631D5C0 */  addiu $s1, $s1, -0x2a40
/* 000390 800F6970 00008021 */  addu  $s0, $zero, $zero
/* 000394 800F6974 3C058010 */  lui   $a1, 0x8010
/* 000398 800F6978 24A59900 */  addiu $a1, $a1, -0x6700
/* 00039C 800F697C 00042400 */  sll   $a0, $a0, 0x10
/* 0003A0 800F6980 00042403 */  sra   $a0, $a0, 0x10
/* 0003A4 800F6984 3C068010 */  lui   $a2, 0x8010
/* 0003A8 800F6988 24C698F0 */  addiu $a2, $a2, -0x6710
/* 0003AC 800F698C 00101840 */  sll   $v1, $s0, 1
.ov054_L800F6990:
/* 0003B0 800F6990 00651021 */  addu  $v0, $v1, $a1
/* 0003B4 800F6994 84420000 */  lh    $v0, ($v0)
/* 0003B8 800F6998 5482001E */  bnel  $a0, $v0, .ov054_L800F6A14
/* 0003BC 800F699C 26100001 */   addiu $s0, $s0, 1
/* 0003C0 800F69A0 8622000A */  lh    $v0, 0xa($s1)
/* 0003C4 800F69A4 00021040 */  sll   $v0, $v0, 1
/* 0003C8 800F69A8 00511021 */  addu  $v0, $v0, $s1
/* 0003CC 800F69AC 8442000C */  lh    $v0, 0xc($v0)
/* 0003D0 800F69B0 16020005 */  bne   $s0, $v0, .ov054_L800F69C8
/* 0003D4 800F69B4 00661021 */   addu  $v0, $v1, $a2
/* 0003D8 800F69B8 94420000 */  lhu   $v0, ($v0)
/* 0003DC 800F69BC A622001A */  sh    $v0, 0x1a($s1)
/* 0003E0 800F69C0 0803DA89 */  j     ov054_func_800F6A24
/* 0003E4 800F69C4 24020001 */   addiu $v0, $zero, 1

.ov054_L800F69C8:
/* 0003E8 800F69C8 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 0003EC 800F69CC 24040044 */   addiu $a0, $zero, 0x44
/* 0003F0 800F69D0 14400002 */  bnez  $v0, .ov054_L800F69DC
/* 0003F4 800F69D4 24040007 */   addiu $a0, $zero, 7
/* 0003F8 800F69D8 8624000A */  lh    $a0, 0xa($s1)
.ov054_L800F69DC:
/* 0003FC 800F69DC 18800010 */  blez  $a0, .ov054_L800F6A20
/* 000400 800F69E0 00001821 */   addu  $v1, $zero, $zero
/* 000404 800F69E4 00031040 */  sll   $v0, $v1, 1
.ov054_L800F69E8:
/* 000408 800F69E8 00511021 */  addu  $v0, $v0, $s1
/* 00040C 800F69EC 8442000C */  lh    $v0, 0xc($v0)
/* 000410 800F69F0 16020003 */  bne   $s0, $v0, .ov054_L800F6A00
/* 000414 800F69F4 24630001 */   addiu $v1, $v1, 1
/* 000418 800F69F8 0803DA89 */  j     ov054_func_800F6A24
/* 00041C 800F69FC 24020002 */   addiu $v0, $zero, 2

.ov054_L800F6A00:
/* 000420 800F6A00 0064102A */  slt   $v0, $v1, $a0
/* 000424 800F6A04 1440FFF8 */  bnez  $v0, .ov054_L800F69E8
/* 000428 800F6A08 00031040 */   sll   $v0, $v1, 1
/* 00042C 800F6A0C 0803DA89 */  j     ov054_func_800F6A24
/* 000430 800F6A10 00001021 */   addu  $v0, $zero, $zero

.ov054_L800F6A14:
/* 000434 800F6A14 2A020007 */  slti  $v0, $s0, 7
/* 000438 800F6A18 1440FFDD */  bnez  $v0, .ov054_L800F6990
/* 00043C 800F6A1C 00101840 */   sll   $v1, $s0, 1
.ov054_L800F6A20:
/* 000440 800F6A20 00001021 */  addu  $v0, $zero, $zero
ov054_func_800F6A24:
/* 000444 800F6A24 8FBF0020 */  lw    $ra, 0x20($sp)
/* 000448 800F6A28 8FB1001C */  lw    $s1, 0x1c($sp)
/* 00044C 800F6A2C 8FB00018 */  lw    $s0, 0x18($sp)
/* 000450 800F6A30 03E00008 */  jr    $ra
/* 000454 800F6A34 27BD0028 */   addiu $sp, $sp, 0x28

/* 000458 800F6A38 27BDFFB0 */  addiu $sp, $sp, -0x50
/* 00045C 800F6A3C AFBF001C */  sw    $ra, 0x1c($sp)
/* 000460 800F6A40 AFB20018 */  sw    $s2, 0x18($sp)
/* 000464 800F6A44 AFB10014 */  sw    $s1, 0x14($sp)
/* 000468 800F6A48 AFB00010 */  sw    $s0, 0x10($sp)
/* 00046C 800F6A4C F7BE0048 */  sdc1  $f30, 0x48($sp)
/* 000470 800F6A50 F7BC0040 */  sdc1  $f28, 0x40($sp)
/* 000474 800F6A54 F7BA0038 */  sdc1  $f26, 0x38($sp)
/* 000478 800F6A58 F7B80030 */  sdc1  $f24, 0x30($sp)
/* 00047C 800F6A5C F7B60028 */  sdc1  $f22, 0x28($sp)
/* 000480 800F6A60 0C018CEA */  jal   func_800633A8
/* 000484 800F6A64 F7B40020 */   sdc1  $f20, 0x20($sp)
/* 000488 800F6A68 8C50008C */  lw    $s0, 0x8c($v0)
/* 00048C 800F6A6C 0C0180AB */  jal   PlaySound
/* 000490 800F6A70 2404006D */   addiu $a0, $zero, 0x6d
/* 000494 800F6A74 24040040 */  addiu $a0, $zero, 0x40
/* 000498 800F6A78 0C00F6F8 */  jal   func_8003DBE0
/* 00049C 800F6A7C 00002821 */   addu  $a1, $zero, $zero
/* 0004A0 800F6A80 00408821 */  addu  $s1, $v0, $zero
/* 0004A4 800F6A84 9622000A */  lhu   $v0, 0xa($s1)
/* 0004A8 800F6A88 34420004 */  ori   $v0, $v0, 4
/* 0004AC 800F6A8C A622000A */  sh    $v0, 0xa($s1)
/* 0004B0 800F6A90 0C013373 */  jal   func_8004CDCC
/* 0004B4 800F6A94 02202021 */   addu  $a0, $s1, $zero
/* 0004B8 800F6A98 2624000C */  addiu $a0, $s1, 0xc
/* 0004BC 800F6A9C 0C028354 */  jal   func_800A0D50
/* 0004C0 800F6AA0 26050004 */   addiu $a1, $s0, 4
/* 0004C4 800F6AA4 3C0143FA */  lui   $at, 0x43fa
/* 0004C8 800F6AA8 44810000 */  mtc1  $at, $f0
/* 0004CC 800F6AAC 00000000 */  nop   
/* 0004D0 800F6AB0 E6200030 */  swc1  $f0, 0x30($s1)
/* 0004D4 800F6AB4 02202021 */  addu  $a0, $s1, $zero
/* 0004D8 800F6AB8 0C0109CA */  jal   func_80042728
/* 0004DC 800F6ABC 00002821 */   addu  $a1, $zero, $zero
/* 0004E0 800F6AC0 00409021 */  addu  $s2, $v0, $zero
/* 0004E4 800F6AC4 4480A000 */  mtc1  $zero, $f20
/* 0004E8 800F6AC8 00008021 */  addu  $s0, $zero, $zero
/* 0004EC 800F6ACC 3C013ECC */  lui   $at, 0x3ecc
/* 0004F0 800F6AD0 3421CCCD */  ori   $at, $at, 0xcccd
/* 0004F4 800F6AD4 4481B000 */  mtc1  $at, $f22
.ov054_L800F6AD8:
/* 0004F8 800F6AD8 4405A000 */  mfc1  $a1, $f20
/* 0004FC 800F6ADC 4406A000 */  mfc1  $a2, $f20
/* 000500 800F6AE0 4407A000 */  mfc1  $a3, $f20
/* 000504 800F6AE4 00000000 */  nop   
/* 000508 800F6AE8 0C028340 */  jal   func_800A0D00
/* 00050C 800F6AEC 26240024 */   addiu $a0, $s1, 0x24
/* 000510 800F6AF0 0C018D6D */  jal   SleepVProcess
/* 000514 800F6AF4 4616A500 */   add.s $f20, $f20, $f22
/* 000518 800F6AF8 26100001 */  addiu $s0, $s0, 1
/* 00051C 800F6AFC 2A020006 */  slti  $v0, $s0, 6
/* 000520 800F6B00 1440FFF5 */  bnez  $v0, .ov054_L800F6AD8
/* 000524 800F6B04 00000000 */   nop   
/* 000528 800F6B08 00008021 */  addu  $s0, $zero, $zero
/* 00052C 800F6B0C 3C013ECC */  lui   $at, 0x3ecc
/* 000530 800F6B10 3421CCCD */  ori   $at, $at, 0xcccd
/* 000534 800F6B14 4481B000 */  mtc1  $at, $f22
.ov054_L800F6B18:
/* 000538 800F6B18 4405A000 */  mfc1  $a1, $f20
/* 00053C 800F6B1C 4406A000 */  mfc1  $a2, $f20
/* 000540 800F6B20 4407A000 */  mfc1  $a3, $f20
/* 000544 800F6B24 00000000 */  nop   
/* 000548 800F6B28 0C028340 */  jal   func_800A0D00
/* 00054C 800F6B2C 26240024 */   addiu $a0, $s1, 0x24
/* 000550 800F6B30 0C018D6D */  jal   SleepVProcess
/* 000554 800F6B34 4616A501 */   sub.s $f20, $f20, $f22
/* 000558 800F6B38 26100001 */  addiu $s0, $s0, 1
/* 00055C 800F6B3C 2A020003 */  slti  $v0, $s0, 3
/* 000560 800F6B40 1440FFF5 */  bnez  $v0, .ov054_L800F6B18
/* 000564 800F6B44 00000000 */   nop   
/* 000568 800F6B48 0C018D54 */  jal   SleepProcess
/* 00056C 800F6B4C 2404001E */   addiu $a0, $zero, 0x1e
/* 000570 800F6B50 0C0180AB */  jal   PlaySound
/* 000574 800F6B54 24040044 */   addiu $a0, $zero, 0x44
/* 000578 800F6B58 4480B000 */  mtc1  $zero, $f22
/* 00057C 800F6B5C 3C0141A0 */  lui   $at, 0x41a0
/* 000580 800F6B60 4481F000 */  mtc1  $at, $f30
/* 000584 800F6B64 3C013CA3 */  lui   $at, 0x3ca3
/* 000588 800F6B68 3421D70A */  ori   $at, $at, 0xd70a
/* 00058C 800F6B6C 4481E000 */  mtc1  $at, $f28
/* 000590 800F6B70 4480D000 */  mtc1  $zero, $f26
/* 000594 800F6B74 3C0140C0 */  lui   $at, 0x40c0
/* 000598 800F6B78 4481C000 */  mtc1  $at, $f24
ov054_func_800F6B7C:
/* 00059C 800F6B7C 8E22003C */  lw    $v0, 0x3c($s1)
/* 0005A0 800F6B80 8C420040 */  lw    $v0, 0x40($v0)
/* 0005A4 800F6B84 84420000 */  lh    $v0, ($v0)
/* 0005A8 800F6B88 00022040 */  sll   $a0, $v0, 1
/* 0005AC 800F6B8C 00822021 */  addu  $a0, $a0, $v0
/* 0005B0 800F6B90 00042180 */  sll   $a0, $a0, 6
/* 0005B4 800F6B94 3C02800F */  lui   $v0, 0x800f
/* 0005B8 800F6B98 8C422B7C */  lw    $v0, 0x2b7c($v0)
/* 0005BC 800F6B9C 00822021 */  addu  $a0, $a0, $v0
/* 0005C0 800F6BA0 4405B000 */  mfc1  $a1, $f22
/* 0005C4 800F6BA4 00000000 */  nop   
/* 0005C8 800F6BA8 0C029034 */  jal   func_800A40D0
/* 0005CC 800F6BAC 2484007C */   addiu $a0, $a0, 0x7c
/* 0005D0 800F6BB0 461CA501 */  sub.s $f20, $f20, $f28
/* 0005D4 800F6BB4 461AA03C */  c.lt.s $f20, $f26
/* 0005D8 800F6BB8 00000000 */  nop   
/* 0005DC 800F6BBC 00000000 */  nop   
/* 0005E0 800F6BC0 4501000D */  bc1t  .ov054_L800F6BF8
/* 0005E4 800F6BC4 461EB580 */   add.s $f22, $f22, $f30
/* 0005E8 800F6BC8 4405A000 */  mfc1  $a1, $f20
/* 0005EC 800F6BCC 4406A000 */  mfc1  $a2, $f20
/* 0005F0 800F6BD0 4407A000 */  mfc1  $a3, $f20
/* 0005F4 800F6BD4 00000000 */  nop   
/* 0005F8 800F6BD8 0C028340 */  jal   func_800A0D00
/* 0005FC 800F6BDC 26240024 */   addiu $a0, $s1, 0x24
/* 000600 800F6BE0 C6200030 */  lwc1  $f0, 0x30($s1)
/* 000604 800F6BE4 46180001 */  sub.s $f0, $f0, $f24
/* 000608 800F6BE8 0C018D6D */  jal   SleepVProcess
/* 00060C 800F6BEC E6200030 */   swc1  $f0, 0x30($s1)
/* 000610 800F6BF0 0803DADF */  j     ov054_func_800F6B7C
/* 000614 800F6BF4 00000000 */   nop   

.ov054_L800F6BF8:
/* 000618 800F6BF8 0C0109F5 */  jal   func_800427D4
/* 00061C 800F6BFC 02402021 */   addu  $a0, $s2, $zero
/* 000620 800F6C00 0C018D54 */  jal   SleepProcess
/* 000624 800F6C04 2404001E */   addiu $a0, $zero, 0x1e
/* 000628 800F6C08 0C00F9A5 */  jal   func_8003E694
/* 00062C 800F6C0C 02202021 */   addu  $a0, $s1, $zero
/* 000630 800F6C10 0C017764 */  jal   EndProcess
/* 000634 800F6C14 00002021 */   addu  $a0, $zero, $zero
/* 000638 800F6C18 8FBF001C */  lw    $ra, 0x1c($sp)
/* 00063C 800F6C1C 8FB20018 */  lw    $s2, 0x18($sp)
/* 000640 800F6C20 8FB10014 */  lw    $s1, 0x14($sp)
/* 000644 800F6C24 8FB00010 */  lw    $s0, 0x10($sp)
/* 000648 800F6C28 D7BE0048 */  ldc1  $f30, 0x48($sp)
/* 00064C 800F6C2C D7BC0040 */  ldc1  $f28, 0x40($sp)
/* 000650 800F6C30 D7BA0038 */  ldc1  $f26, 0x38($sp)
/* 000654 800F6C34 D7B80030 */  ldc1  $f24, 0x30($sp)
/* 000658 800F6C38 D7B60028 */  ldc1  $f22, 0x28($sp)
/* 00065C 800F6C3C D7B40020 */  ldc1  $f20, 0x20($sp)
/* 000660 800F6C40 03E00008 */  jr    $ra
/* 000664 800F6C44 27BD0050 */   addiu $sp, $sp, 0x50

ov054_func_800F6C48:
/* 000668 800F6C48 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 00066C 800F6C4C AFBF0014 */  sw    $ra, 0x14($sp)
/* 000670 800F6C50 AFB00010 */  sw    $s0, 0x10($sp)
/* 000674 800F6C54 00808021 */  addu  $s0, $a0, $zero
/* 000678 800F6C58 8E020000 */  lw    $v0, ($s0)
/* 00067C 800F6C5C 3C0141A0 */  lui   $at, 0x41a0
/* 000680 800F6C60 44810000 */  mtc1  $at, $f0
/* 000684 800F6C64 00000000 */  nop   
/* 000688 800F6C68 E4400034 */  swc1  $f0, 0x34($v0)
/* 00068C 800F6C6C 3C01C040 */  lui   $at, 0xc040
/* 000690 800F6C70 44810000 */  mtc1  $at, $f0
/* 000694 800F6C74 00000000 */  nop   
/* 000698 800F6C78 E4400038 */  swc1  $f0, 0x38($v0)
/* 00069C 800F6C7C 8E040000 */  lw    $a0, ($s0)
/* 0006A0 800F6C80 00002821 */  addu  $a1, $zero, $zero
/* 0006A4 800F6C84 0C00FA07 */  jal   func_8003E81C
/* 0006A8 800F6C88 00003021 */   addu  $a2, $zero, $zero
/* 0006AC 800F6C8C 0C018D54 */  jal   SleepProcess
/* 0006B0 800F6C90 24040003 */   addiu $a0, $zero, 3
ov054_func_800F6C94:
/* 0006B4 800F6C94 8E040000 */  lw    $a0, ($s0)
/* 0006B8 800F6C98 0C00FA50 */  jal   func_8003E940
/* 0006BC 800F6C9C 00000000 */   nop   
/* 0006C0 800F6CA0 3042FFFF */  andi  $v0, $v0, 0xffff
/* 0006C4 800F6CA4 14400005 */  bnez  $v0, .ov054_L800F6CBC
/* 0006C8 800F6CA8 2405FFFF */   addiu $a1, $zero, -1
/* 0006CC 800F6CAC 0C018D6D */  jal   SleepVProcess
/* 0006D0 800F6CB0 00000000 */   nop   
/* 0006D4 800F6CB4 0803DB25 */  j     ov054_func_800F6C94
/* 0006D8 800F6CB8 00000000 */   nop   

.ov054_L800F6CBC:
/* 0006DC 800F6CBC 8E040000 */  lw    $a0, ($s0)
/* 0006E0 800F6CC0 0C00FA07 */  jal   func_8003E81C
/* 0006E4 800F6CC4 24060002 */   addiu $a2, $zero, 2
/* 0006E8 800F6CC8 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0006EC 800F6CCC 8FB00010 */  lw    $s0, 0x10($sp)
/* 0006F0 800F6CD0 03E00008 */  jr    $ra
/* 0006F4 800F6CD4 27BD0018 */   addiu $sp, $sp, 0x18

/* 0006F8 800F6CD8 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0006FC 800F6CDC AFBF001C */  sw    $ra, 0x1c($sp)
/* 000700 800F6CE0 AFB20018 */  sw    $s2, 0x18($sp)
/* 000704 800F6CE4 AFB10014 */  sw    $s1, 0x14($sp)
/* 000708 800F6CE8 AFB00010 */  sw    $s0, 0x10($sp)
/* 00070C 800F6CEC 3C12800F */  lui   $s2, 0x800f
/* 000710 800F6CF0 2652D5C0 */  addiu $s2, $s2, -0x2a40
/* 000714 800F6CF4 0C01804A */  jal   func_80060128
/* 000718 800F6CF8 2404002B */   addiu $a0, $zero, 0x2b
/* 00071C 800F6CFC 3C048010 */  lui   $a0, 0x8010
/* 000720 800F6D00 0C012089 */  jal   func_80048224
/* 000724 800F6D04 24849920 */   addiu $a0, $a0, -0x66e0
/* 000728 800F6D08 00408021 */  addu  $s0, $v0, $zero
/* 00072C 800F6D0C 24040002 */  addiu $a0, $zero, 2
/* 000730 800F6D10 0C01C991 */  jal   func_80072644
/* 000734 800F6D14 24050010 */   addiu $a1, $zero, 0x10
ov054_func_800F6D18:
/* 000738 800F6D18 0C01C9C6 */  jal   func_80072718
/* 00073C 800F6D1C 00000000 */   nop   
/* 000740 800F6D20 10400005 */  beqz  $v0, .ov054_L800F6D38
/* 000744 800F6D24 00000000 */   nop   
/* 000748 800F6D28 0C018D6D */  jal   SleepVProcess
/* 00074C 800F6D2C 00000000 */   nop   
/* 000750 800F6D30 0803DB46 */  j     ov054_func_800F6D18
/* 000754 800F6D34 00000000 */   nop   

.ov054_L800F6D38:
/* 000758 800F6D38 0C012948 */  jal   func_8004A520
/* 00075C 800F6D3C 00000000 */   nop   
/* 000760 800F6D40 3C014040 */  lui   $at, 0x4040
/* 000764 800F6D44 44816000 */  mtc1  $at, $f12
/* 000768 800F6D48 0C012D71 */  jal   func_8004B5C4
/* 00076C 800F6D4C 00000000 */   nop   
/* 000770 800F6D50 0C03DB12 */  jal   ov054_func_800F6C48
/* 000774 800F6D54 02002021 */   addu  $a0, $s0, $zero
/* 000778 800F6D58 8642000A */  lh    $v0, 0xa($s2)
/* 00077C 800F6D5C 14400006 */  bnez  $v0, .ov054_L800F6D78
/* 000780 800F6D60 240504EA */   addiu $a1, $zero, 0x4ea
/* 000784 800F6D64 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000788 800F6D68 24040044 */   addiu $a0, $zero, 0x44
/* 00078C 800F6D6C 54400002 */  bnezl $v0, .ov054_L800F6D78
/* 000790 800F6D70 240504EA */   addiu $a1, $zero, 0x4ea
/* 000794 800F6D74 240504E8 */  addiu $a1, $zero, 0x4e8
.ov054_L800F6D78:
/* 000798 800F6D78 86040008 */  lh    $a0, 8($s0)
/* 00079C 800F6D7C 2406FFFF */  addiu $a2, $zero, -1
/* 0007A0 800F6D80 0C01B5F6 */  jal   LoadStringIntoWindow
/* 0007A4 800F6D84 2407FFFF */   addiu $a3, $zero, -1
/* 0007A8 800F6D88 86040008 */  lh    $a0, 8($s0)
/* 0007AC 800F6D8C 0C01C723 */  jal   func_80071C8C
/* 0007B0 800F6D90 24050001 */   addiu $a1, $zero, 1
/* 0007B4 800F6D94 0C0180AB */  jal   PlaySound
/* 0007B8 800F6D98 24040465 */   addiu $a0, $zero, 0x465
/* 0007BC 800F6D9C 86040008 */  lh    $a0, 8($s0)
/* 0007C0 800F6DA0 0C013799 */  jal   WaitForTextConfirmation
/* 0007C4 800F6DA4 00000000 */   nop   
/* 0007C8 800F6DA8 86040008 */  lh    $a0, 8($s0)
/* 0007CC 800F6DAC 0C01C7A0 */  jal   func_80071E80
/* 0007D0 800F6DB0 24050001 */   addiu $a1, $zero, 1
/* 0007D4 800F6DB4 86040008 */  lh    $a0, 8($s0)
/* 0007D8 800F6DB8 0C01BAD0 */  jal   func_8006EB40
/* 0007DC 800F6DBC 00000000 */   nop   
/* 0007E0 800F6DC0 8642000A */  lh    $v0, 0xa($s2)
/* 0007E4 800F6DC4 00021040 */  sll   $v0, $v0, 1
/* 0007E8 800F6DC8 00521021 */  addu  $v0, $v0, $s2
/* 0007EC 800F6DCC 8442000C */  lh    $v0, 0xc($v0)
/* 0007F0 800F6DD0 00021040 */  sll   $v0, $v0, 1
/* 0007F4 800F6DD4 3C048010 */  lui   $a0, 0x8010
/* 0007F8 800F6DD8 00822021 */  addu  $a0, $a0, $v0
/* 0007FC 800F6DDC 0C01307B */  jal   GetSpaceData
/* 000800 800F6DE0 84849910 */   lh    $a0, -0x66f0($a0)
/* 000804 800F6DE4 00408821 */  addu  $s1, $v0, $zero
/* 000808 800F6DE8 0C012D77 */  jal   func_8004B5DC
/* 00080C 800F6DEC 26240004 */   addiu $a0, $s1, 4
/* 000810 800F6DF0 3C0140A0 */  lui   $at, 0x40a0
/* 000814 800F6DF4 44816000 */  mtc1  $at, $f12
/* 000818 800F6DF8 0C012E0E */  jal   func_8004B838
/* 00081C 800F6DFC 00000000 */   nop   
/* 000820 800F6E00 0C018D54 */  jal   SleepProcess
/* 000824 800F6E04 24040005 */   addiu $a0, $zero, 5
ov054_func_800F6E08:
/* 000828 800F6E08 0C012E14 */  jal   func_8004B850
/* 00082C 800F6E0C 00000000 */   nop   
/* 000830 800F6E10 10400005 */  beqz  $v0, .ov054_L800F6E28
/* 000834 800F6E14 00000000 */   nop   
/* 000838 800F6E18 0C018D6D */  jal   SleepVProcess
/* 00083C 800F6E1C 00000000 */   nop   
/* 000840 800F6E20 0803DB82 */  j     ov054_func_800F6E08
/* 000844 800F6E24 00000000 */   nop   

.ov054_L800F6E28:
/* 000848 800F6E28 0C018D54 */  jal   SleepProcess
/* 00084C 800F6E2C 24040005 */   addiu $a0, $zero, 5
/* 000850 800F6E30 3C04800F */  lui   $a0, 0x800f
/* 000854 800F6E34 24846A38 */  addiu $a0, $a0, 0x6a38
/* 000858 800F6E38 24054800 */  addiu $a1, $zero, 0x4800
/* 00085C 800F6E3C 00003021 */  addu  $a2, $zero, $zero
/* 000860 800F6E40 0C01770A */  jal   InitProcess
/* 000864 800F6E44 00003821 */   addu  $a3, $zero, $zero
/* 000868 800F6E48 AC51008C */  sw    $s1, 0x8c($v0)
/* 00086C 800F6E4C 0C018D54 */  jal   SleepProcess
/* 000870 800F6E50 2404001E */   addiu $a0, $zero, 0x1e
/* 000874 800F6E54 8642000A */  lh    $v0, 0xa($s2)
/* 000878 800F6E58 14400006 */  bnez  $v0, .ov054_L800F6E74
/* 00087C 800F6E5C 240504EB */   addiu $a1, $zero, 0x4eb
/* 000880 800F6E60 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000884 800F6E64 24040044 */   addiu $a0, $zero, 0x44
/* 000888 800F6E68 54400002 */  bnezl $v0, .ov054_L800F6E74
/* 00088C 800F6E6C 240504EB */   addiu $a1, $zero, 0x4eb
/* 000890 800F6E70 240504E9 */  addiu $a1, $zero, 0x4e9
.ov054_L800F6E74:
/* 000894 800F6E74 86040008 */  lh    $a0, 8($s0)
/* 000898 800F6E78 2406FFFF */  addiu $a2, $zero, -1
/* 00089C 800F6E7C 0C01B5F6 */  jal   LoadStringIntoWindow
/* 0008A0 800F6E80 2407FFFF */   addiu $a3, $zero, -1
/* 0008A4 800F6E84 86040008 */  lh    $a0, 8($s0)
/* 0008A8 800F6E88 0C01C723 */  jal   func_80071C8C
/* 0008AC 800F6E8C 24050001 */   addiu $a1, $zero, 1
/* 0008B0 800F6E90 86040008 */  lh    $a0, 8($s0)
/* 0008B4 800F6E94 0C013799 */  jal   WaitForTextConfirmation
/* 0008B8 800F6E98 00000000 */   nop   
/* 0008BC 800F6E9C 86040008 */  lh    $a0, 8($s0)
/* 0008C0 800F6EA0 0C01C7A0 */  jal   func_80071E80
/* 0008C4 800F6EA4 24050001 */   addiu $a1, $zero, 1
/* 0008C8 800F6EA8 0C018075 */  jal   func_800601D4
/* 0008CC 800F6EAC 2404005A */   addiu $a0, $zero, 0x5a
/* 0008D0 800F6EB0 0C018D54 */  jal   SleepProcess
/* 0008D4 800F6EB4 2404001E */   addiu $a0, $zero, 0x1e
/* 0008D8 800F6EB8 24040002 */  addiu $a0, $zero, 2
/* 0008DC 800F6EBC 0C01C9AB */  jal   func_800726AC
/* 0008E0 800F6EC0 24050010 */   addiu $a1, $zero, 0x10
/* 0008E4 800F6EC4 0C018D54 */  jal   SleepProcess
/* 0008E8 800F6EC8 24040011 */   addiu $a0, $zero, 0x11
/* 0008EC 800F6ECC 0C01211F */  jal   func_8004847C
/* 0008F0 800F6ED0 02002021 */   addu  $a0, $s0, $zero
/* 0008F4 800F6ED4 0C015ABD */  jal   func_80056AF4
/* 0008F8 800F6ED8 00000000 */   nop   
/* 0008FC 800F6EDC 0C0177EE */  jal   func_8005DFB8
/* 000900 800F6EE0 24040001 */   addiu $a0, $zero, 1
/* 000904 800F6EE4 0C0178EA */  jal   func_8005E3A8
/* 000908 800F6EE8 00000000 */   nop   
/* 00090C 800F6EEC 0C018D6D */  jal   SleepVProcess
/* 000910 800F6EF0 00000000 */   nop   
/* 000914 800F6EF4 8FBF001C */  lw    $ra, 0x1c($sp)
/* 000918 800F6EF8 8FB20018 */  lw    $s2, 0x18($sp)
/* 00091C 800F6EFC 8FB10014 */  lw    $s1, 0x14($sp)
/* 000920 800F6F00 8FB00010 */  lw    $s0, 0x10($sp)
/* 000924 800F6F04 03E00008 */  jr    $ra
/* 000928 800F6F08 27BD0020 */   addiu $sp, $sp, 0x20

/* 00092C 800F6F0C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000930 800F6F10 AFBF0010 */  sw    $ra, 0x10($sp)
/* 000934 800F6F14 3C01800F */  lui   $at, 0x800f
/* 000938 800F6F18 A420D5C2 */  sh    $zero, -0x2a3e($at)
/* 00093C 800F6F1C 2404000A */  addiu $a0, $zero, 0xa
/* 000940 800F6F20 0C0173CC */  jal   func_8005CF30
/* 000944 800F6F24 00002821 */   addu  $a1, $zero, $zero
/* 000948 800F6F28 24040035 */  addiu $a0, $zero, 0x35
/* 00094C 800F6F2C 00002821 */  addu  $a1, $zero, $zero
/* 000950 800F6F30 0C017811 */  jal   func_8005E044
/* 000954 800F6F34 24060092 */   addiu $a2, $zero, 0x92
/* 000958 800F6F38 8FBF0010 */  lw    $ra, 0x10($sp)
/* 00095C 800F6F3C 03E00008 */  jr    $ra
/* 000960 800F6F40 27BD0018 */   addiu $sp, $sp, 0x18

/* 000964 800F6F44 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000968 800F6F48 AFBF0010 */  sw    $ra, 0x10($sp)
/* 00096C 800F6F4C 2404000A */  addiu $a0, $zero, 0xa
/* 000970 800F6F50 0C0173CC */  jal   func_8005CF30
/* 000974 800F6F54 00002821 */   addu  $a1, $zero, $zero
/* 000978 800F6F58 00002021 */  addu  $a0, $zero, $zero
/* 00097C 800F6F5C 00002821 */  addu  $a1, $zero, $zero
/* 000980 800F6F60 0C0135F6 */  jal   SetPlayerOntoChain
/* 000984 800F6F64 00003021 */   addu  $a2, $zero, $zero
/* 000988 800F6F68 24040001 */  addiu $a0, $zero, 1
/* 00098C 800F6F6C 00002821 */  addu  $a1, $zero, $zero
/* 000990 800F6F70 0C0135F6 */  jal   SetPlayerOntoChain
/* 000994 800F6F74 00003021 */   addu  $a2, $zero, $zero
/* 000998 800F6F78 24040002 */  addiu $a0, $zero, 2
/* 00099C 800F6F7C 00002821 */  addu  $a1, $zero, $zero
/* 0009A0 800F6F80 0C0135F6 */  jal   SetPlayerOntoChain
/* 0009A4 800F6F84 00003021 */   addu  $a2, $zero, $zero
/* 0009A8 800F6F88 24040003 */  addiu $a0, $zero, 3
/* 0009AC 800F6F8C 00002821 */  addu  $a1, $zero, $zero
/* 0009B0 800F6F90 0C0135F6 */  jal   SetPlayerOntoChain
/* 0009B4 800F6F94 00003021 */   addu  $a2, $zero, $zero
/* 0009B8 800F6F98 3C03800F */  lui   $v1, 0x800f
/* 0009BC 800F6F9C 8463D5C0 */  lh    $v1, -0x2a40($v1)
/* 0009C0 800F6FA0 10600005 */  beqz  $v1, .ov054_L800F6FB8
/* 0009C4 800F6FA4 24020001 */   addiu $v0, $zero, 1
/* 0009C8 800F6FA8 1062000B */  beq   $v1, $v0, .ov054_L800F6FD8
/* 0009CC 800F6FAC 00000000 */   nop   
/* 0009D0 800F6FB0 0803DBFB */  j     ov054_func_800F6FEC
/* 0009D4 800F6FB4 00000000 */   nop   

.ov054_L800F6FB8:
/* 0009D8 800F6FB8 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 0009DC 800F6FBC 24040046 */   addiu $a0, $zero, 0x46
/* 0009E0 800F6FC0 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 0009E4 800F6FC4 24040047 */   addiu $a0, $zero, 0x47
/* 0009E8 800F6FC8 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 0009EC 800F6FCC 24040049 */   addiu $a0, $zero, 0x49
/* 0009F0 800F6FD0 0803DBF9 */  j     ov054_func_800F6FE4
/* 0009F4 800F6FD4 2404004B */   addiu $a0, $zero, 0x4b

.ov054_L800F6FD8:
/* 0009F8 800F6FD8 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 0009FC 800F6FDC 24040047 */   addiu $a0, $zero, 0x47
/* 000A00 800F6FE0 24040049 */  addiu $a0, $zero, 0x49
ov054_func_800F6FE4:
/* 000A04 800F6FE4 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 000A08 800F6FE8 00000000 */   nop   
ov054_func_800F6FEC:
/* 000A0C 800F6FEC 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 000A10 800F6FF0 24040043 */   addiu $a0, $zero, 0x43
/* 000A14 800F6FF4 0C03D98F */  jal   ov054_func_800F663C
/* 000A18 800F6FF8 00000000 */   nop   
/* 000A1C 800F6FFC 3C02800F */  lui   $v0, 0x800f
/* 000A20 800F7000 2442D154 */  addiu $v0, $v0, -0x2eac
/* 000A24 800F7004 A4400000 */  sh    $zero, ($v0)
/* 000A28 800F7008 A4400002 */  sh    $zero, 2($v0)
/* 000A2C 800F700C A4400004 */  sh    $zero, 4($v0)
/* 000A30 800F7010 0C0177EE */  jal   func_8005DFB8
/* 000A34 800F7014 24040001 */   addiu $a0, $zero, 1
/* 000A38 800F7018 8FBF0010 */  lw    $ra, 0x10($sp)
/* 000A3C 800F701C 03E00008 */  jr    $ra
/* 000A40 800F7020 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F7024:
/* 000A44 800F7024 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 000A48 800F7028 AFBF0018 */  sw    $ra, 0x18($sp)
/* 000A4C 800F702C AFB10014 */  sw    $s1, 0x14($sp)
/* 000A50 800F7030 AFB00010 */  sw    $s0, 0x10($sp)
/* 000A54 800F7034 24040050 */  addiu $a0, $zero, 0x50
/* 000A58 800F7038 0C0173CC */  jal   func_8005CF30
/* 000A5C 800F703C 24050028 */   addiu $a1, $zero, 0x28
/* 000A60 800F7040 0C018022 */  jal   func_80060088
/* 000A64 800F7044 00008821 */   addu  $s1, $zero, $zero
/* 000A68 800F7048 0C008D12 */  jal   func_80023448
/* 000A6C 800F704C 24040001 */   addiu $a0, $zero, 1
/* 000A70 800F7050 00002021 */  addu  $a0, $zero, $zero
/* 000A74 800F7054 24050078 */  addiu $a1, $zero, 0x78
/* 000A78 800F7058 24060078 */  addiu $a2, $zero, 0x78
/* 000A7C 800F705C 0C008D2E */  jal   func_800234B8
/* 000A80 800F7060 24070078 */   addiu $a3, $zero, 0x78
/* 000A84 800F7064 24040001 */  addiu $a0, $zero, 1
/* 000A88 800F7068 24050040 */  addiu $a1, $zero, 0x40
/* 000A8C 800F706C 24060040 */  addiu $a2, $zero, 0x40
/* 000A90 800F7070 0C008D2E */  jal   func_800234B8
/* 000A94 800F7074 24070060 */   addiu $a3, $zero, 0x60
/* 000A98 800F7078 3C05C2C8 */  lui   $a1, 0xc2c8
/* 000A9C 800F707C 3C0642C8 */  lui   $a2, 0x42c8
/* 000AA0 800F7080 3C074396 */  lui   $a3, 0x4396
/* 000AA4 800F7084 0C008D41 */  jal   func_80023504
/* 000AA8 800F7088 24040001 */   addiu $a0, $zero, 1
/* 000AAC 800F708C 00002021 */  addu  $a0, $zero, $zero
/* 000AB0 800F7090 24050045 */  addiu $a1, $zero, 0x45
/* 000AB4 800F7094 24060004 */  addiu $a2, $zero, 4
/* 000AB8 800F7098 0C015A82 */  jal   SetupDKBoard
/* 000ABC 800F709C 00003821 */   addu  $a3, $zero, $zero
/* 000AC0 800F70A0 0C014BA1 */  jal   func_80052E84
/* 000AC4 800F70A4 00002021 */   addu  $a0, $zero, $zero
/* 000AC8 800F70A8 0C014BA1 */  jal   func_80052E84
/* 000ACC 800F70AC 24040001 */   addiu $a0, $zero, 1
/* 000AD0 800F70B0 0C014BA1 */  jal   func_80052E84
/* 000AD4 800F70B4 24040002 */   addiu $a0, $zero, 2
/* 000AD8 800F70B8 0C014BA1 */  jal   func_80052E84
/* 000ADC 800F70BC 24040003 */   addiu $a0, $zero, 3
.ov054_L800F70C0:
/* 000AE0 800F70C0 0C014AA3 */  jal   GetPlayerStruct
/* 000AE4 800F70C4 02202021 */   addu  $a0, $s1, $zero
/* 000AE8 800F70C8 00408021 */  addu  $s0, $v0, $zero
/* 000AEC 800F70CC 8E040020 */  lw    $a0, 0x20($s0)
/* 000AF0 800F70D0 0C00F85D */  jal   func_8003E174
/* 000AF4 800F70D4 26310001 */   addiu $s1, $s1, 1
/* 000AF8 800F70D8 8E030020 */  lw    $v1, 0x20($s0)
/* 000AFC 800F70DC 9462000A */  lhu   $v0, 0xa($v1)
/* 000B00 800F70E0 34420002 */  ori   $v0, $v0, 2
/* 000B04 800F70E4 A462000A */  sh    $v0, 0xa($v1)
/* 000B08 800F70E8 2A220004 */  slti  $v0, $s1, 4
/* 000B0C 800F70EC 1440FFF4 */  bnez  $v0, .ov054_L800F70C0
/* 000B10 800F70F0 00000000 */   nop   
/* 000B14 800F70F4 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000B18 800F70F8 2404004E */   addiu $a0, $zero, 0x4e
/* 000B1C 800F70FC 10400005 */  beqz  $v0, .ov054_L800F7114
/* 000B20 800F7100 00000000 */   nop   
/* 000B24 800F7104 0C01660B */  jal   SetBoardFeatureDisabled
/* 000B28 800F7108 2404004E */   addiu $a0, $zero, 0x4e
/* 000B2C 800F710C 0C03D9E9 */  jal   ov054_func_800F67A4
/* 000B30 800F7110 00000000 */   nop   
.ov054_L800F7114:
/* 000B34 800F7114 0C03DA0C */  jal   ov054_func_800F6830
/* 000B38 800F7118 00000000 */   nop   
/* 000B3C 800F711C 0C03DD23 */  jal   ov054_func_800F748C
/* 000B40 800F7120 00000000 */   nop   
/* 000B44 800F7124 0C03DD9B */  jal   ov054_func_800F766C
/* 000B48 800F7128 00000000 */   nop   
/* 000B4C 800F712C 0C03DE37 */  jal   ov054_func_800F78DC
/* 000B50 800F7130 00000000 */   nop   
/* 000B54 800F7134 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000B58 800F7138 2404000E */   addiu $a0, $zero, 0xe
/* 000B5C 800F713C 14400003 */  bnez  $v0, .ov054_L800F714C
/* 000B60 800F7140 00000000 */   nop   
/* 000B64 800F7144 0C03DCDA */  jal   ov054_func_800F7368
/* 000B68 800F7148 00000000 */   nop   
.ov054_L800F714C:
/* 000B6C 800F714C 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000B70 800F7150 2404000F */   addiu $a0, $zero, 0xf
/* 000B74 800F7154 14400003 */  bnez  $v0, .ov054_L800F7164
/* 000B78 800F7158 00000000 */   nop   
/* 000B7C 800F715C 0C03DDEE */  jal   ov054_func_800F77B8
/* 000B80 800F7160 00000000 */   nop   
.ov054_L800F7164:
/* 000B84 800F7164 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000B88 800F7168 2404000D */   addiu $a0, $zero, 0xd
/* 000B8C 800F716C 14400003 */  bnez  $v0, .ov054_L800F717C
/* 000B90 800F7170 00000000 */   nop   
/* 000B94 800F7174 0C03DCB3 */  jal   ov054_func_800F72CC
/* 000B98 800F7178 00000000 */   nop   
.ov054_L800F717C:
/* 000B9C 800F717C 8FBF0018 */  lw    $ra, 0x18($sp)
/* 000BA0 800F7180 8FB10014 */  lw    $s1, 0x14($sp)
/* 000BA4 800F7184 8FB00010 */  lw    $s0, 0x10($sp)
/* 000BA8 800F7188 03E00008 */  jr    $ra
/* 000BAC 800F718C 27BD0020 */   addiu $sp, $sp, 0x20

/* 000BB0 800F7190 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000BB4 800F7194 AFBF0010 */  sw    $ra, 0x10($sp)
/* 000BB8 800F7198 0C01804A */  jal   func_80060128
/* 000BBC 800F719C 24040008 */   addiu $a0, $zero, 8
/* 000BC0 800F71A0 0C007490 */  jal   func_8001D240
/* 000BC4 800F71A4 24040002 */   addiu $a0, $zero, 2
/* 000BC8 800F71A8 0C03DC09 */  jal   ov054_func_800F7024
/* 000BCC 800F71AC 00000000 */   nop   
/* 000BD0 800F71B0 3C048010 */  lui   $a0, 0x8010
/* 000BD4 800F71B4 0C013240 */  jal   EventTableHydrate
/* 000BD8 800F71B8 2484A0CC */   addiu $a0, $a0, -0x5f34
/* 000BDC 800F71BC 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000BE0 800F71C0 2404000E */   addiu $a0, $zero, 0xe
/* 000BE4 800F71C4 14400004 */  bnez  $v0, .ov054_L800F71D8
/* 000BE8 800F71C8 00000000 */   nop   
/* 000BEC 800F71CC 3C048010 */  lui   $a0, 0x8010
/* 000BF0 800F71D0 0C013240 */  jal   EventTableHydrate
/* 000BF4 800F71D4 2484A1FC */   addiu $a0, $a0, -0x5e04
.ov054_L800F71D8:
/* 000BF8 800F71D8 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000BFC 800F71DC 2404000F */   addiu $a0, $zero, 0xf
/* 000C00 800F71E0 14400004 */  bnez  $v0, .ov054_L800F71F4
/* 000C04 800F71E4 00000000 */   nop   
/* 000C08 800F71E8 3C048010 */  lui   $a0, 0x8010
/* 000C0C 800F71EC 0C013240 */  jal   EventTableHydrate
/* 000C10 800F71F0 2484A20C */   addiu $a0, $a0, -0x5df4
.ov054_L800F71F4:
/* 000C14 800F71F4 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000C18 800F71F8 2404000D */   addiu $a0, $zero, 0xd
/* 000C1C 800F71FC 14400004 */  bnez  $v0, .ov054_L800F7210
/* 000C20 800F7200 00000000 */   nop   
/* 000C24 800F7204 3C048010 */  lui   $a0, 0x8010
/* 000C28 800F7208 0C013240 */  jal   EventTableHydrate
/* 000C2C 800F720C 2484A224 */   addiu $a0, $a0, -0x5ddc
.ov054_L800F7210:
/* 000C30 800F7210 0C01613C */  jal   func_800584F0
/* 000C34 800F7214 00002021 */   addu  $a0, $zero, $zero
/* 000C38 800F7218 8FBF0010 */  lw    $ra, 0x10($sp)
/* 000C3C 800F721C 03E00008 */  jr    $ra
/* 000C40 800F7220 27BD0018 */   addiu $sp, $sp, 0x18

/* 000C44 800F7224 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000C48 800F7228 AFBF0010 */  sw    $ra, 0x10($sp)
/* 000C4C 800F722C 0C007490 */  jal   func_8001D240
/* 000C50 800F7230 24040001 */   addiu $a0, $zero, 1
/* 000C54 800F7234 0C03DC09 */  jal   ov054_func_800F7024
/* 000C58 800F7238 00000000 */   nop   
/* 000C5C 800F723C 0C01613C */  jal   func_800584F0
/* 000C60 800F7240 24040001 */   addiu $a0, $zero, 1
/* 000C64 800F7244 8FBF0010 */  lw    $ra, 0x10($sp)
/* 000C68 800F7248 03E00008 */  jr    $ra
/* 000C6C 800F724C 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F7250:
/* 000C70 800F7250 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000C74 800F7254 AFBF0014 */  sw    $ra, 0x14($sp)
/* 000C78 800F7258 AFB00010 */  sw    $s0, 0x10($sp)
/* 000C7C 800F725C 3C028010 */  lui   $v0, 0x8010
/* 000C80 800F7260 8C42A300 */  lw    $v0, -0x5d00($v0)
/* 000C84 800F7264 14400015 */  bnez  $v0, .ov054_L800F72BC
/* 000C88 800F7268 2404003B */   addiu $a0, $zero, 0x3b
/* 000C8C 800F726C 0C00F6F8 */  jal   func_8003DBE0
/* 000C90 800F7270 00002821 */   addu  $a1, $zero, $zero
/* 000C94 800F7274 00408021 */  addu  $s0, $v0, $zero
/* 000C98 800F7278 0C00F85D */  jal   func_8003E174
/* 000C9C 800F727C 02002021 */   addu  $a0, $s0, $zero
/* 000CA0 800F7280 3C018010 */  lui   $at, 0x8010
/* 000CA4 800F7284 AC30A300 */  sw    $s0, -0x5d00($at)
/* 000CA8 800F7288 9602000A */  lhu   $v0, 0xa($s0)
/* 000CAC 800F728C 34420002 */  ori   $v0, $v0, 2
/* 000CB0 800F7290 A602000A */  sh    $v0, 0xa($s0)
/* 000CB4 800F7294 0C01307B */  jal   GetSpaceData
/* 000CB8 800F7298 24040070 */   addiu $a0, $zero, 0x70
/* 000CBC 800F729C 2604000C */  addiu $a0, $s0, 0xc
/* 000CC0 800F72A0 0C028354 */  jal   func_800A0D50
/* 000CC4 800F72A4 24450004 */   addiu $a1, $v0, 4
/* 000CC8 800F72A8 24040007 */  addiu $a0, $zero, 7
/* 000CCC 800F72AC 02002821 */  addu  $a1, $s0, $zero
/* 000CD0 800F72B0 2406FFFE */  addiu $a2, $zero, -2
/* 000CD4 800F72B4 0C00F0C5 */  jal   func_8003C314
/* 000CD8 800F72B8 00003821 */   addu  $a3, $zero, $zero
.ov054_L800F72BC:
/* 000CDC 800F72BC 8FBF0014 */  lw    $ra, 0x14($sp)
/* 000CE0 800F72C0 8FB00010 */  lw    $s0, 0x10($sp)
/* 000CE4 800F72C4 03E00008 */  jr    $ra
/* 000CE8 800F72C8 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F72CC:
/* 000CEC 800F72CC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000CF0 800F72D0 AFBF0010 */  sw    $ra, 0x10($sp)
/* 000CF4 800F72D4 3C018010 */  lui   $at, 0x8010
/* 000CF8 800F72D8 0C03DC94 */  jal   ov054_func_800F7250
/* 000CFC 800F72DC AC20A300 */   sw    $zero, -0x5d00($at)
/* 000D00 800F72E0 8FBF0010 */  lw    $ra, 0x10($sp)
/* 000D04 800F72E4 03E00008 */  jr    $ra
/* 000D08 800F72E8 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F72EC:
/* 000D0C 800F72EC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000D10 800F72F0 AFBF0014 */  sw    $ra, 0x14($sp)
/* 000D14 800F72F4 AFB00010 */  sw    $s0, 0x10($sp)
/* 000D18 800F72F8 3C028010 */  lui   $v0, 0x8010
/* 000D1C 800F72FC 8C42A304 */  lw    $v0, -0x5cfc($v0)
/* 000D20 800F7300 14400015 */  bnez  $v0, .ov054_L800F7358
/* 000D24 800F7304 24040039 */   addiu $a0, $zero, 0x39
/* 000D28 800F7308 0C00F6F8 */  jal   func_8003DBE0
/* 000D2C 800F730C 00002821 */   addu  $a1, $zero, $zero
/* 000D30 800F7310 00408021 */  addu  $s0, $v0, $zero
/* 000D34 800F7314 0C00F85D */  jal   func_8003E174
/* 000D38 800F7318 02002021 */   addu  $a0, $s0, $zero
/* 000D3C 800F731C 3C018010 */  lui   $at, 0x8010
/* 000D40 800F7320 AC30A304 */  sw    $s0, -0x5cfc($at)
/* 000D44 800F7324 9602000A */  lhu   $v0, 0xa($s0)
/* 000D48 800F7328 34420002 */  ori   $v0, $v0, 2
/* 000D4C 800F732C A602000A */  sh    $v0, 0xa($s0)
/* 000D50 800F7330 0C01307B */  jal   GetSpaceData
/* 000D54 800F7334 2404005D */   addiu $a0, $zero, 0x5d
/* 000D58 800F7338 2604000C */  addiu $a0, $s0, 0xc
/* 000D5C 800F733C 0C028354 */  jal   func_800A0D50
/* 000D60 800F7340 24450004 */   addiu $a1, $v0, 4
/* 000D64 800F7344 24040009 */  addiu $a0, $zero, 9
/* 000D68 800F7348 02002821 */  addu  $a1, $s0, $zero
/* 000D6C 800F734C 2406FFFF */  addiu $a2, $zero, -1
/* 000D70 800F7350 0C00F0C5 */  jal   func_8003C314
/* 000D74 800F7354 2407FFFD */   addiu $a3, $zero, -3
.ov054_L800F7358:
/* 000D78 800F7358 8FBF0014 */  lw    $ra, 0x14($sp)
/* 000D7C 800F735C 8FB00010 */  lw    $s0, 0x10($sp)
/* 000D80 800F7360 03E00008 */  jr    $ra
/* 000D84 800F7364 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F7368:
/* 000D88 800F7368 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 000D8C 800F736C AFBF0010 */  sw    $ra, 0x10($sp)
/* 000D90 800F7370 3C018010 */  lui   $at, 0x8010
/* 000D94 800F7374 0C03DCBB */  jal   ov054_func_800F72EC
/* 000D98 800F7378 AC20A304 */   sw    $zero, -0x5cfc($at)
/* 000D9C 800F737C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 000DA0 800F7380 03E00008 */  jr    $ra
/* 000DA4 800F7384 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F7388:
/* 000DA8 800F7388 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 000DAC 800F738C AFBF001C */  sw    $ra, 0x1c($sp)
/* 000DB0 800F7390 AFB20018 */  sw    $s2, 0x18($sp)
/* 000DB4 800F7394 AFB10014 */  sw    $s1, 0x14($sp)
/* 000DB8 800F7398 AFB00010 */  sw    $s0, 0x10($sp)
/* 000DBC 800F739C 00808021 */  addu  $s0, $a0, $zero
/* 000DC0 800F73A0 00042400 */  sll   $a0, $a0, 0x10
/* 000DC4 800F73A4 00042383 */  sra   $a0, $a0, 0xe
/* 000DC8 800F73A8 3C028010 */  lui   $v0, 0x8010
/* 000DCC 800F73AC 00441021 */  addu  $v0, $v0, $a0
/* 000DD0 800F73B0 8C42A310 */  lw    $v0, -0x5cf0($v0)
/* 000DD4 800F73B4 1440002F */  bnez  $v0, .ov054_L800F7474
/* 000DD8 800F73B8 00000000 */   nop   
/* 000DDC 800F73BC 3C028010 */  lui   $v0, 0x8010
/* 000DE0 800F73C0 8C42A308 */  lw    $v0, -0x5cf8($v0)
/* 000DE4 800F73C4 1440000B */  bnez  $v0, .ov054_L800F73F4
/* 000DE8 800F73C8 00000000 */   nop   
/* 000DEC 800F73CC 2404003A */  addiu $a0, $zero, 0x3a
/* 000DF0 800F73D0 0C00F6F8 */  jal   func_8003DBE0
/* 000DF4 800F73D4 00002821 */   addu  $a1, $zero, $zero
/* 000DF8 800F73D8 00409021 */  addu  $s2, $v0, $zero
/* 000DFC 800F73DC 0C00F85D */  jal   func_8003E174
/* 000E00 800F73E0 02402021 */   addu  $a0, $s2, $zero
/* 000E04 800F73E4 3C018010 */  lui   $at, 0x8010
/* 000E08 800F73E8 AC32A308 */  sw    $s2, -0x5cf8($at)
/* 000E0C 800F73EC 0803DD02 */  j     ov054_func_800F7408
/* 000E10 800F73F0 00108400 */   sll   $s0, $s0, 0x10

.ov054_L800F73F4:
/* 000E14 800F73F4 3C048010 */  lui   $a0, 0x8010
/* 000E18 800F73F8 8C84A308 */  lw    $a0, -0x5cf8($a0)
/* 000E1C 800F73FC 0C00F8C8 */  jal   func_8003E320
/* 000E20 800F7400 00108400 */   sll   $s0, $s0, 0x10
/* 000E24 800F7404 00409021 */  addu  $s2, $v0, $zero
ov054_func_800F7408:
/* 000E28 800F7408 00108403 */  sra   $s0, $s0, 0x10
/* 000E2C 800F740C 00108880 */  sll   $s1, $s0, 2
/* 000E30 800F7410 3C018010 */  lui   $at, 0x8010
/* 000E34 800F7414 00310821 */  addu  $at, $at, $s1
/* 000E38 800F7418 AC32A310 */  sw    $s2, -0x5cf0($at)
/* 000E3C 800F741C 9642000A */  lhu   $v0, 0xa($s2)
/* 000E40 800F7420 34420002 */  ori   $v0, $v0, 2
/* 000E44 800F7424 A642000A */  sh    $v0, 0xa($s2)
/* 000E48 800F7428 0C013373 */  jal   func_8004CDCC
/* 000E4C 800F742C 02402021 */   addu  $a0, $s2, $zero
/* 000E50 800F7430 00108040 */  sll   $s0, $s0, 1
/* 000E54 800F7434 3C048010 */  lui   $a0, 0x8010
/* 000E58 800F7438 00902021 */  addu  $a0, $a0, $s0
/* 000E5C 800F743C 0C01307B */  jal   GetSpaceData
/* 000E60 800F7440 84849928 */   lh    $a0, -0x66d8($a0)
/* 000E64 800F7444 2644000C */  addiu $a0, $s2, 0xc
/* 000E68 800F7448 0C028354 */  jal   func_800A0D50
/* 000E6C 800F744C 24450004 */   addiu $a1, $v0, 4
/* 000E70 800F7450 24040006 */  addiu $a0, $zero, 6
/* 000E74 800F7454 3C068010 */  lui   $a2, 0x8010
/* 000E78 800F7458 00D13021 */  addu  $a2, $a2, $s1
/* 000E7C 800F745C 84C69948 */  lh    $a2, -0x66b8($a2)
/* 000E80 800F7460 3C078010 */  lui   $a3, 0x8010
/* 000E84 800F7464 00F13821 */  addu  $a3, $a3, $s1
/* 000E88 800F7468 84E7994A */  lh    $a3, -0x66b6($a3)
/* 000E8C 800F746C 0C00F0C5 */  jal   func_8003C314
/* 000E90 800F7470 02402821 */   addu  $a1, $s2, $zero
.ov054_L800F7474:
/* 000E94 800F7474 8FBF001C */  lw    $ra, 0x1c($sp)
/* 000E98 800F7478 8FB20018 */  lw    $s2, 0x18($sp)
/* 000E9C 800F747C 8FB10014 */  lw    $s1, 0x14($sp)
/* 000EA0 800F7480 8FB00010 */  lw    $s0, 0x10($sp)
/* 000EA4 800F7484 03E00008 */  jr    $ra
/* 000EA8 800F7488 27BD0020 */   addiu $sp, $sp, 0x20

ov054_func_800F748C:
/* 000EAC 800F748C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 000EB0 800F7490 AFBF001C */  sw    $ra, 0x1c($sp)
/* 000EB4 800F7494 AFB20018 */  sw    $s2, 0x18($sp)
/* 000EB8 800F7498 AFB10014 */  sw    $s1, 0x14($sp)
/* 000EBC 800F749C AFB00010 */  sw    $s0, 0x10($sp)
/* 000EC0 800F74A0 3C018010 */  lui   $at, 0x8010
/* 000EC4 800F74A4 AC20A308 */  sw    $zero, -0x5cf8($at)
/* 000EC8 800F74A8 00008021 */  addu  $s0, $zero, $zero
/* 000ECC 800F74AC 3C128010 */  lui   $s2, 0x8010
/* 000ED0 800F74B0 2652A310 */  addiu $s2, $s2, -0x5cf0
/* 000ED4 800F74B4 3C118010 */  lui   $s1, 0x8010
/* 000ED8 800F74B8 26319938 */  addiu $s1, $s1, -0x66c8
/* 000EDC 800F74BC 00101080 */  sll   $v0, $s0, 2
.ov054_L800F74C0:
/* 000EE0 800F74C0 00521021 */  addu  $v0, $v0, $s2
/* 000EE4 800F74C4 AC400000 */  sw    $zero, ($v0)
/* 000EE8 800F74C8 00101040 */  sll   $v0, $s0, 1
/* 000EEC 800F74CC 00511021 */  addu  $v0, $v0, $s1
/* 000EF0 800F74D0 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 000EF4 800F74D4 84440000 */   lh    $a0, ($v0)
/* 000EF8 800F74D8 54400005 */  bnezl $v0, .ov054_L800F74F0
/* 000EFC 800F74DC 26100001 */   addiu $s0, $s0, 1
/* 000F00 800F74E0 00102400 */  sll   $a0, $s0, 0x10
/* 000F04 800F74E4 0C03DCE2 */  jal   ov054_func_800F7388
/* 000F08 800F74E8 00042403 */   sra   $a0, $a0, 0x10
/* 000F0C 800F74EC 26100001 */  addiu $s0, $s0, 1
.ov054_L800F74F0:
/* 000F10 800F74F0 2A020007 */  slti  $v0, $s0, 7
/* 000F14 800F74F4 1440FFF2 */  bnez  $v0, .ov054_L800F74C0
/* 000F18 800F74F8 00101080 */   sll   $v0, $s0, 2
/* 000F1C 800F74FC 8FBF001C */  lw    $ra, 0x1c($sp)
/* 000F20 800F7500 8FB20018 */  lw    $s2, 0x18($sp)
/* 000F24 800F7504 8FB10014 */  lw    $s1, 0x14($sp)
/* 000F28 800F7508 8FB00010 */  lw    $s0, 0x10($sp)
/* 000F2C 800F750C 03E00008 */  jr    $ra
/* 000F30 800F7510 27BD0020 */   addiu $sp, $sp, 0x20

ov054_func_800F7514:
/* 000F34 800F7514 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 000F38 800F7518 AFBF001C */  sw    $ra, 0x1c($sp)
/* 000F3C 800F751C AFB20018 */  sw    $s2, 0x18($sp)
/* 000F40 800F7520 AFB10014 */  sw    $s1, 0x14($sp)
/* 000F44 800F7524 AFB00010 */  sw    $s0, 0x10($sp)
/* 000F48 800F7528 00809021 */  addu  $s2, $a0, $zero
/* 000F4C 800F752C 00042400 */  sll   $a0, $a0, 0x10
/* 000F50 800F7530 00042383 */  sra   $a0, $a0, 0xe
/* 000F54 800F7534 3C028010 */  lui   $v0, 0x8010
/* 000F58 800F7538 00441021 */  addu  $v0, $v0, $a0
/* 000F5C 800F753C 8C42A330 */  lw    $v0, -0x5cd0($v0)
/* 000F60 800F7540 14400044 */  bnez  $v0, .ov054_L800F7654
/* 000F64 800F7544 00000000 */   nop   
/* 000F68 800F7548 3C028010 */  lui   $v0, 0x8010
/* 000F6C 800F754C 8C42A32C */  lw    $v0, -0x5cd4($v0)
/* 000F70 800F7550 1440000C */  bnez  $v0, .ov054_L800F7584
/* 000F74 800F7554 00000000 */   nop   
/* 000F78 800F7558 3C058010 */  lui   $a1, 0x8010
/* 000F7C 800F755C 24A59984 */  addiu $a1, $a1, -0x667c
/* 000F80 800F7560 0C00F6F8 */  jal   func_8003DBE0
/* 000F84 800F7564 2404000A */   addiu $a0, $zero, 0xa
/* 000F88 800F7568 00408821 */  addu  $s1, $v0, $zero
/* 000F8C 800F756C 0C00F85D */  jal   func_8003E174
/* 000F90 800F7570 02202021 */   addu  $a0, $s1, $zero
/* 000F94 800F7574 3C018010 */  lui   $at, 0x8010
/* 000F98 800F7578 AC31A32C */  sw    $s1, -0x5cd4($at)
/* 000F9C 800F757C 0803DD66 */  j     ov054_func_800F7598
/* 000FA0 800F7580 00128400 */   sll   $s0, $s2, 0x10

.ov054_L800F7584:
/* 000FA4 800F7584 3C048010 */  lui   $a0, 0x8010
/* 000FA8 800F7588 8C84A32C */  lw    $a0, -0x5cd4($a0)
/* 000FAC 800F758C 0C00F8C8 */  jal   func_8003E320
/* 000FB0 800F7590 00128400 */   sll   $s0, $s2, 0x10
/* 000FB4 800F7594 00408821 */  addu  $s1, $v0, $zero
ov054_func_800F7598:
/* 000FB8 800F7598 00108403 */  sra   $s0, $s0, 0x10
/* 000FBC 800F759C 00101080 */  sll   $v0, $s0, 2
/* 000FC0 800F75A0 3C018010 */  lui   $at, 0x8010
/* 000FC4 800F75A4 00220821 */  addu  $at, $at, $v0
/* 000FC8 800F75A8 AC31A330 */  sw    $s1, -0x5cd0($at)
/* 000FCC 800F75AC 26240024 */  addiu $a0, $s1, 0x24
/* 000FD0 800F75B0 3C053F4C */  lui   $a1, 0x3f4c
/* 000FD4 800F75B4 34A5CCCD */  ori   $a1, $a1, 0xcccd
/* 000FD8 800F75B8 00A03021 */  addu  $a2, $a1, $zero
/* 000FDC 800F75BC 0C028340 */  jal   func_800A0D00
/* 000FE0 800F75C0 00A03821 */   addu  $a3, $a1, $zero
/* 000FE4 800F75C4 9622000A */  lhu   $v0, 0xa($s1)
/* 000FE8 800F75C8 34420002 */  ori   $v0, $v0, 2
/* 000FEC 800F75CC A622000A */  sh    $v0, 0xa($s1)
/* 000FF0 800F75D0 00108040 */  sll   $s0, $s0, 1
/* 000FF4 800F75D4 3C028010 */  lui   $v0, 0x8010
/* 000FF8 800F75D8 00501021 */  addu  $v0, $v0, $s0
/* 000FFC 800F75DC 84429964 */  lh    $v0, -0x669c($v0)
/* 001000 800F75E0 00021040 */  sll   $v0, $v0, 1
/* 001004 800F75E4 3C01800F */  lui   $at, 0x800f
/* 001008 800F75E8 00220821 */  addu  $at, $at, $v0
/* 00100C 800F75EC 8422D154 */  lh    $v0, -0x2eac($at)
/* 001010 800F75F0 14400005 */  bnez  $v0, .ov054_L800F7608
/* 001014 800F75F4 00121400 */   sll   $v0, $s2, 0x10
/* 001018 800F75F8 3C048010 */  lui   $a0, 0x8010
/* 00101C 800F75FC 00902021 */  addu  $a0, $a0, $s0
/* 001020 800F7600 0803DD86 */  j     ov054_func_800F7618
/* 001024 800F7604 8484996C */   lh    $a0, -0x6694($a0)

.ov054_L800F7608:
/* 001028 800F7608 000213C3 */  sra   $v0, $v0, 0xf
/* 00102C 800F760C 3C048010 */  lui   $a0, 0x8010
/* 001030 800F7610 00822021 */  addu  $a0, $a0, $v0
/* 001034 800F7614 84849974 */  lh    $a0, -0x668c($a0)
ov054_func_800F7618:
/* 001038 800F7618 0C01307B */  jal   GetSpaceData
/* 00103C 800F761C 2630000C */   addiu $s0, $s1, 0xc
/* 001040 800F7620 02002021 */  addu  $a0, $s0, $zero
/* 001044 800F7624 0C028354 */  jal   func_800A0D50
/* 001048 800F7628 24450004 */   addiu $a1, $v0, 4
/* 00104C 800F762C 00121400 */  sll   $v0, $s2, 0x10
/* 001050 800F7630 000213C3 */  sra   $v0, $v0, 0xf
/* 001054 800F7634 3C048010 */  lui   $a0, 0x8010
/* 001058 800F7638 00822021 */  addu  $a0, $a0, $v0
/* 00105C 800F763C 0C01307B */  jal   GetSpaceData
/* 001060 800F7640 8484997C */   lh    $a0, -0x6684($a0)
/* 001064 800F7644 26240018 */  addiu $a0, $s1, 0x18
/* 001068 800F7648 24450004 */  addiu $a1, $v0, 4
/* 00106C 800F764C 0C0283A0 */  jal   func_800A0E80
/* 001070 800F7650 02003021 */   addu  $a2, $s0, $zero
.ov054_L800F7654:
/* 001074 800F7654 8FBF001C */  lw    $ra, 0x1c($sp)
/* 001078 800F7658 8FB20018 */  lw    $s2, 0x18($sp)
/* 00107C 800F765C 8FB10014 */  lw    $s1, 0x14($sp)
/* 001080 800F7660 8FB00010 */  lw    $s0, 0x10($sp)
/* 001084 800F7664 03E00008 */  jr    $ra
/* 001088 800F7668 27BD0020 */   addiu $sp, $sp, 0x20

ov054_func_800F766C:
/* 00108C 800F766C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001090 800F7670 AFBF0014 */  sw    $ra, 0x14($sp)
/* 001094 800F7674 AFB00010 */  sw    $s0, 0x10($sp)
/* 001098 800F7678 3C018010 */  lui   $at, 0x8010
/* 00109C 800F767C AC20A32C */  sw    $zero, -0x5cd4($at)
/* 0010A0 800F7680 00008021 */  addu  $s0, $zero, $zero
/* 0010A4 800F7684 00102400 */  sll   $a0, $s0, 0x10
.ov054_L800F7688:
/* 0010A8 800F7688 0C03DD45 */  jal   ov054_func_800F7514
/* 0010AC 800F768C 00042403 */   sra   $a0, $a0, 0x10
/* 0010B0 800F7690 26100001 */  addiu $s0, $s0, 1
/* 0010B4 800F7694 2A020003 */  slti  $v0, $s0, 3
/* 0010B8 800F7698 1440FFFB */  bnez  $v0, .ov054_L800F7688
/* 0010BC 800F769C 00102400 */   sll   $a0, $s0, 0x10
/* 0010C0 800F76A0 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0010C4 800F76A4 8FB00010 */  lw    $s0, 0x10($sp)
/* 0010C8 800F76A8 03E00008 */  jr    $ra
/* 0010CC 800F76AC 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F76B0:
/* 0010D0 800F76B0 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 0010D4 800F76B4 AFBF0018 */  sw    $ra, 0x18($sp)
/* 0010D8 800F76B8 AFB10014 */  sw    $s1, 0x14($sp)
/* 0010DC 800F76BC AFB00010 */  sw    $s0, 0x10($sp)
/* 0010E0 800F76C0 00808021 */  addu  $s0, $a0, $zero
/* 0010E4 800F76C4 00042400 */  sll   $a0, $a0, 0x10
/* 0010E8 800F76C8 00042383 */  sra   $a0, $a0, 0xe
/* 0010EC 800F76CC 3C028010 */  lui   $v0, 0x8010
/* 0010F0 800F76D0 00441021 */  addu  $v0, $v0, $a0
/* 0010F4 800F76D4 8C42A340 */  lw    $v0, -0x5cc0($v0)
/* 0010F8 800F76D8 14400032 */  bnez  $v0, .ov054_L800F77A4
/* 0010FC 800F76DC 00000000 */   nop   
/* 001100 800F76E0 3C028010 */  lui   $v0, 0x8010
/* 001104 800F76E4 8C42A33C */  lw    $v0, -0x5cc4($v0)
/* 001108 800F76E8 1440000A */  bnez  $v0, .ov054_L800F7714
/* 00110C 800F76EC 2404006A */   addiu $a0, $zero, 0x6a
/* 001110 800F76F0 0C00F6F8 */  jal   func_8003DBE0
/* 001114 800F76F4 00002821 */   addu  $a1, $zero, $zero
/* 001118 800F76F8 00408821 */  addu  $s1, $v0, $zero
/* 00111C 800F76FC 0C00F85D */  jal   func_8003E174
/* 001120 800F7700 02202021 */   addu  $a0, $s1, $zero
/* 001124 800F7704 3C018010 */  lui   $at, 0x8010
/* 001128 800F7708 AC31A33C */  sw    $s1, -0x5cc4($at)
/* 00112C 800F770C 0803DDCA */  j     ov054_func_800F7728
/* 001130 800F7710 00108400 */   sll   $s0, $s0, 0x10

.ov054_L800F7714:
/* 001134 800F7714 3C048010 */  lui   $a0, 0x8010
/* 001138 800F7718 8C84A33C */  lw    $a0, -0x5cc4($a0)
/* 00113C 800F771C 0C00F8C8 */  jal   func_8003E320
/* 001140 800F7720 00108400 */   sll   $s0, $s0, 0x10
/* 001144 800F7724 00408821 */  addu  $s1, $v0, $zero
ov054_func_800F7728:
/* 001148 800F7728 00108403 */  sra   $s0, $s0, 0x10
/* 00114C 800F772C 00101080 */  sll   $v0, $s0, 2
/* 001150 800F7730 3C018010 */  lui   $at, 0x8010
/* 001154 800F7734 00220821 */  addu  $at, $at, $v0
/* 001158 800F7738 AC31A340 */  sw    $s1, -0x5cc0($at)
/* 00115C 800F773C 9622000A */  lhu   $v0, 0xa($s1)
/* 001160 800F7740 34420002 */  ori   $v0, $v0, 2
/* 001164 800F7744 A622000A */  sh    $v0, 0xa($s1)
/* 001168 800F7748 26240024 */  addiu $a0, $s1, 0x24
/* 00116C 800F774C 3C053F19 */  lui   $a1, 0x3f19
/* 001170 800F7750 34A5999A */  ori   $a1, $a1, 0x999a
/* 001174 800F7754 00A03021 */  addu  $a2, $a1, $zero
/* 001178 800F7758 0C028340 */  jal   func_800A0D00
/* 00117C 800F775C 00A03821 */   addu  $a3, $a1, $zero
/* 001180 800F7760 3C0142C8 */  lui   $at, 0x42c8
/* 001184 800F7764 44810000 */  mtc1  $at, $f0
/* 001188 800F7768 00000000 */  nop   
/* 00118C 800F776C E6200030 */  swc1  $f0, 0x30($s1)
/* 001190 800F7770 00108040 */  sll   $s0, $s0, 1
/* 001194 800F7774 3C048010 */  lui   $a0, 0x8010
/* 001198 800F7778 00902021 */  addu  $a0, $a0, $s0
/* 00119C 800F777C 0C01307B */  jal   GetSpaceData
/* 0011A0 800F7780 8484998C */   lh    $a0, -0x6674($a0)
/* 0011A4 800F7784 2624000C */  addiu $a0, $s1, 0xc
/* 0011A8 800F7788 0C028354 */  jal   func_800A0D50
/* 0011AC 800F778C 24450004 */   addiu $a1, $v0, 4
/* 0011B0 800F7790 24040008 */  addiu $a0, $zero, 8
/* 0011B4 800F7794 02202821 */  addu  $a1, $s1, $zero
/* 0011B8 800F7798 00003021 */  addu  $a2, $zero, $zero
/* 0011BC 800F779C 0C00F0C5 */  jal   func_8003C314
/* 0011C0 800F77A0 00003821 */   addu  $a3, $zero, $zero
.ov054_L800F77A4:
/* 0011C4 800F77A4 8FBF0018 */  lw    $ra, 0x18($sp)
/* 0011C8 800F77A8 8FB10014 */  lw    $s1, 0x14($sp)
/* 0011CC 800F77AC 8FB00010 */  lw    $s0, 0x10($sp)
/* 0011D0 800F77B0 03E00008 */  jr    $ra
/* 0011D4 800F77B4 27BD0020 */   addiu $sp, $sp, 0x20

ov054_func_800F77B8:
/* 0011D8 800F77B8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0011DC 800F77BC AFBF0014 */  sw    $ra, 0x14($sp)
/* 0011E0 800F77C0 AFB00010 */  sw    $s0, 0x10($sp)
/* 0011E4 800F77C4 3C018010 */  lui   $at, 0x8010
/* 0011E8 800F77C8 AC20A33C */  sw    $zero, -0x5cc4($at)
/* 0011EC 800F77CC 00008021 */  addu  $s0, $zero, $zero
/* 0011F0 800F77D0 00102400 */  sll   $a0, $s0, 0x10
.ov054_L800F77D4:
/* 0011F4 800F77D4 0C03DDAC */  jal   ov054_func_800F76B0
/* 0011F8 800F77D8 00042403 */   sra   $a0, $a0, 0x10
/* 0011FC 800F77DC 26100001 */  addiu $s0, $s0, 1
/* 001200 800F77E0 2A020002 */  slti  $v0, $s0, 2
/* 001204 800F77E4 1440FFFB */  bnez  $v0, .ov054_L800F77D4
/* 001208 800F77E8 00102400 */   sll   $a0, $s0, 0x10
/* 00120C 800F77EC 8FBF0014 */  lw    $ra, 0x14($sp)
/* 001210 800F77F0 8FB00010 */  lw    $s0, 0x10($sp)
/* 001214 800F77F4 03E00008 */  jr    $ra
/* 001218 800F77F8 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F77FC:
/* 00121C 800F77FC 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 001220 800F7800 AFBF0018 */  sw    $ra, 0x18($sp)
/* 001224 800F7804 AFB10014 */  sw    $s1, 0x14($sp)
/* 001228 800F7808 AFB00010 */  sw    $s0, 0x10($sp)
/* 00122C 800F780C 00808021 */  addu  $s0, $a0, $zero
/* 001230 800F7810 00042400 */  sll   $a0, $a0, 0x10
/* 001234 800F7814 00042383 */  sra   $a0, $a0, 0xe
/* 001238 800F7818 3C028010 */  lui   $v0, 0x8010
/* 00123C 800F781C 00441021 */  addu  $v0, $v0, $a0
/* 001240 800F7820 8C42A34C */  lw    $v0, -0x5cb4($v0)
/* 001244 800F7824 14400028 */  bnez  $v0, .ov054_L800F78C8
/* 001248 800F7828 00000000 */   nop   
/* 00124C 800F782C 3C028010 */  lui   $v0, 0x8010
/* 001250 800F7830 8C42A348 */  lw    $v0, -0x5cb8($v0)
/* 001254 800F7834 1440000A */  bnez  $v0, .ov054_L800F7860
/* 001258 800F7838 00000000 */   nop   
/* 00125C 800F783C 24040029 */  addiu $a0, $zero, 0x29
/* 001260 800F7840 0C00F6F8 */  jal   func_8003DBE0
/* 001264 800F7844 00002821 */   addu  $a1, $zero, $zero
/* 001268 800F7848 00408821 */  addu  $s1, $v0, $zero
/* 00126C 800F784C 0C00F85D */  jal   func_8003E174
/* 001270 800F7850 02202021 */   addu  $a0, $s1, $zero
/* 001274 800F7854 3C018010 */  lui   $at, 0x8010
/* 001278 800F7858 0803DE1C */  j     ov054_func_800F7870
/* 00127C 800F785C AC31A348 */   sw    $s1, -0x5cb8($at)

.ov054_L800F7860:
/* 001280 800F7860 3C048010 */  lui   $a0, 0x8010
/* 001284 800F7864 0C00F8C8 */  jal   func_8003E320
/* 001288 800F7868 8C84A348 */   lw    $a0, -0x5cb8($a0)
/* 00128C 800F786C 00408821 */  addu  $s1, $v0, $zero
ov054_func_800F7870:
/* 001290 800F7870 9622000A */  lhu   $v0, 0xa($s1)
/* 001294 800F7874 34420002 */  ori   $v0, $v0, 2
/* 001298 800F7878 A622000A */  sh    $v0, 0xa($s1)
/* 00129C 800F787C 00108400 */  sll   $s0, $s0, 0x10
/* 0012A0 800F7880 00108403 */  sra   $s0, $s0, 0x10
/* 0012A4 800F7884 00101080 */  sll   $v0, $s0, 2
/* 0012A8 800F7888 3C018010 */  lui   $at, 0x8010
/* 0012AC 800F788C 00220821 */  addu  $at, $at, $v0
/* 0012B0 800F7890 AC31A34C */  sw    $s1, -0x5cb4($at)
/* 0012B4 800F7894 00108040 */  sll   $s0, $s0, 1
/* 0012B8 800F7898 3C048010 */  lui   $a0, 0x8010
/* 0012BC 800F789C 00902021 */  addu  $a0, $a0, $s0
/* 0012C0 800F78A0 0C01307B */  jal   GetSpaceData
/* 0012C4 800F78A4 84849990 */   lh    $a0, -0x6670($a0)
/* 0012C8 800F78A8 2624000C */  addiu $a0, $s1, 0xc
/* 0012CC 800F78AC 0C028354 */  jal   func_800A0D50
/* 0012D0 800F78B0 24450004 */   addiu $a1, $v0, 4
/* 0012D4 800F78B4 3C058010 */  lui   $a1, 0x8010
/* 0012D8 800F78B8 00B02821 */  addu  $a1, $a1, $s0
/* 0012DC 800F78BC 84A59994 */  lh    $a1, -0x666c($a1)
/* 0012E0 800F78C0 0C013352 */  jal   func_8004CD48
/* 0012E4 800F78C4 02202021 */   addu  $a0, $s1, $zero
.ov054_L800F78C8:
/* 0012E8 800F78C8 8FBF0018 */  lw    $ra, 0x18($sp)
/* 0012EC 800F78CC 8FB10014 */  lw    $s1, 0x14($sp)
/* 0012F0 800F78D0 8FB00010 */  lw    $s0, 0x10($sp)
/* 0012F4 800F78D4 03E00008 */  jr    $ra
/* 0012F8 800F78D8 27BD0020 */   addiu $sp, $sp, 0x20

ov054_func_800F78DC:
/* 0012FC 800F78DC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001300 800F78E0 AFBF0014 */  sw    $ra, 0x14($sp)
/* 001304 800F78E4 AFB00010 */  sw    $s0, 0x10($sp)
/* 001308 800F78E8 3C018010 */  lui   $at, 0x8010
/* 00130C 800F78EC AC20A348 */  sw    $zero, -0x5cb8($at)
/* 001310 800F78F0 00008021 */  addu  $s0, $zero, $zero
/* 001314 800F78F4 00102400 */  sll   $a0, $s0, 0x10
.ov054_L800F78F8:
/* 001318 800F78F8 0C03DDFF */  jal   ov054_func_800F77FC
/* 00131C 800F78FC 00042403 */   sra   $a0, $a0, 0x10
/* 001320 800F7900 26100001 */  addiu $s0, $s0, 1
/* 001324 800F7904 2A020002 */  slti  $v0, $s0, 2
/* 001328 800F7908 1440FFFB */  bnez  $v0, .ov054_L800F78F8
/* 00132C 800F790C 00102400 */   sll   $a0, $s0, 0x10
/* 001330 800F7910 8FBF0014 */  lw    $ra, 0x14($sp)
/* 001334 800F7914 8FB00010 */  lw    $s0, 0x10($sp)
/* 001338 800F7918 03E00008 */  jr    $ra
/* 00133C 800F791C 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F7920:
/* 001340 800F7920 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001344 800F7924 AFBF0010 */  sw    $ra, 0x10($sp)
ov054_func_800F7928:
/* 001348 800F7928 0C012E14 */  jal   func_8004B850
/* 00134C 800F792C 00000000 */   nop   
/* 001350 800F7930 10400005 */  beqz  $v0, .ov054_L800F7948
/* 001354 800F7934 00000000 */   nop   
/* 001358 800F7938 0C018D6D */  jal   SleepVProcess
/* 00135C 800F793C 00000000 */   nop   
/* 001360 800F7940 0803DE4A */  j     ov054_func_800F7928
/* 001364 800F7944 00000000 */   nop   

.ov054_L800F7948:
/* 001368 800F7948 0C018D6D */  jal   SleepVProcess
/* 00136C 800F794C 00000000 */   nop   
/* 001370 800F7950 00002021 */  addu  $a0, $zero, $zero
/* 001374 800F7954 24050092 */  addiu $a1, $zero, 0x92
/* 001378 800F7958 0C011761 */  jal   func_80045D84
/* 00137C 800F795C 24060001 */   addiu $a2, $zero, 1
/* 001380 800F7960 3C018010 */  lui   $at, 0x8010
/* 001384 800F7964 AC22A354 */  sw    $v0, -0x5cac($at)
/* 001388 800F7968 24040001 */  addiu $a0, $zero, 1
/* 00138C 800F796C 240500A0 */  addiu $a1, $zero, 0xa0
/* 001390 800F7970 0C011761 */  jal   func_80045D84
/* 001394 800F7974 24060001 */   addiu $a2, $zero, 1
/* 001398 800F7978 3C018010 */  lui   $at, 0x8010
/* 00139C 800F797C AC22A358 */  sw    $v0, -0x5ca8($at)
/* 0013A0 800F7980 24040003 */  addiu $a0, $zero, 3
/* 0013A4 800F7984 240500AE */  addiu $a1, $zero, 0xae
/* 0013A8 800F7988 0C011761 */  jal   func_80045D84
/* 0013AC 800F798C 24060001 */   addiu $a2, $zero, 1
/* 0013B0 800F7990 3C018010 */  lui   $at, 0x8010
/* 0013B4 800F7994 AC22A35C */  sw    $v0, -0x5ca4($at)
/* 0013B8 800F7998 2404000B */  addiu $a0, $zero, 0xb
/* 0013BC 800F799C 240500BC */  addiu $a1, $zero, 0xbc
/* 0013C0 800F79A0 0C011761 */  jal   func_80045D84
/* 0013C4 800F79A4 24060001 */   addiu $a2, $zero, 1
/* 0013C8 800F79A8 3C018010 */  lui   $at, 0x8010
/* 0013CC 800F79AC AC22A360 */  sw    $v0, -0x5ca0($at)
/* 0013D0 800F79B0 0C018D54 */  jal   SleepProcess
/* 0013D4 800F79B4 24040003 */   addiu $a0, $zero, 3
/* 0013D8 800F79B8 24020001 */  addiu $v0, $zero, 1
/* 0013DC 800F79BC 3C01800F */  lui   $at, 0x800f
/* 0013E0 800F79C0 A422E320 */  sh    $v0, -0x1ce0($at)
/* 0013E4 800F79C4 8FBF0010 */  lw    $ra, 0x10($sp)
/* 0013E8 800F79C8 03E00008 */  jr    $ra
/* 0013EC 800F79CC 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F79D0:
/* 0013F0 800F79D0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0013F4 800F79D4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 0013F8 800F79D8 3C01800F */  lui   $at, 0x800f
/* 0013FC 800F79DC A420E320 */  sh    $zero, -0x1ce0($at)
/* 001400 800F79E0 3C048010 */  lui   $a0, 0x8010
/* 001404 800F79E4 0C01179B */  jal   func_80045E6C
/* 001408 800F79E8 8C84A354 */   lw    $a0, -0x5cac($a0)
/* 00140C 800F79EC 3C048010 */  lui   $a0, 0x8010
/* 001410 800F79F0 0C01179B */  jal   func_80045E6C
/* 001414 800F79F4 8C84A358 */   lw    $a0, -0x5ca8($a0)
/* 001418 800F79F8 3C048010 */  lui   $a0, 0x8010
/* 00141C 800F79FC 0C01179B */  jal   func_80045E6C
/* 001420 800F7A00 8C84A35C */   lw    $a0, -0x5ca4($a0)
/* 001424 800F7A04 3C048010 */  lui   $a0, 0x8010
/* 001428 800F7A08 0C01179B */  jal   func_80045E6C
/* 00142C 800F7A0C 8C84A360 */   lw    $a0, -0x5ca0($a0)
/* 001430 800F7A10 8FBF0010 */  lw    $ra, 0x10($sp)
/* 001434 800F7A14 03E00008 */  jr    $ra
/* 001438 800F7A18 27BD0018 */   addiu $sp, $sp, 0x18

/* 00143C 800F7A1C 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 001440 800F7A20 AFBF0024 */  sw    $ra, 0x24($sp)
/* 001444 800F7A24 AFB20020 */  sw    $s2, 0x20($sp)
/* 001448 800F7A28 AFB1001C */  sw    $s1, 0x1c($sp)
/* 00144C 800F7A2C AFB00018 */  sw    $s0, 0x18($sp)
/* 001450 800F7A30 2404FFFF */  addiu $a0, $zero, -1
/* 001454 800F7A34 2405FFFF */  addiu $a1, $zero, -1
/* 001458 800F7A38 0C014AFA */  jal   func_80052BE8
/* 00145C 800F7A3C 24060002 */   addiu $a2, $zero, 2
/* 001460 800F7A40 0C018D6D */  jal   SleepVProcess
/* 001464 800F7A44 00000000 */   nop   
/* 001468 800F7A48 2404FFFF */  addiu $a0, $zero, -1
/* 00146C 800F7A4C 0C014AEE */  jal   PlayerHasCoins
/* 001470 800F7A50 2405000A */   addiu $a1, $zero, 0xa
/* 001474 800F7A54 10400041 */  beqz  $v0, .ov054_L800F7B5C
/* 001478 800F7A58 00000000 */   nop   
/* 00147C 800F7A5C 0C03DE48 */  jal   ov054_func_800F7920
/* 001480 800F7A60 00000000 */   nop   
/* 001484 800F7A64 3C058010 */  lui   $a1, 0x8010
/* 001488 800F7A68 24A59F5C */  addiu $a1, $a1, -0x60a4
/* 00148C 800F7A6C 0C00F086 */  jal   func_8003C218
/* 001490 800F7A70 2404FFFF */   addiu $a0, $zero, -1
/* 001494 800F7A74 00409021 */  addu  $s2, $v0, $zero
/* 001498 800F7A78 02402021 */  addu  $a0, $s2, $zero
/* 00149C 800F7A7C 2405FFFF */  addiu $a1, $zero, -1
/* 0014A0 800F7A80 0C00F018 */  jal   func_8003C060
/* 0014A4 800F7A84 00003021 */   addu  $a2, $zero, $zero
/* 0014A8 800F7A88 0C014AC8 */  jal   PlayerIsCPU
/* 0014AC 800F7A8C 2404FFFF */   addiu $a0, $zero, -1
/* 0014B0 800F7A90 10400011 */  beqz  $v0, .ov054_L800F7AD8
/* 0014B4 800F7A94 00000000 */   nop   
/* 0014B8 800F7A98 3C048010 */  lui   $a0, 0x8010
/* 0014BC 800F7A9C 24849ADC */  addiu $a0, $a0, -0x6524
/* 0014C0 800F7AA0 0C00FA6C */  jal   func_8003E9B0
/* 0014C4 800F7AA4 00008021 */   addu  $s0, $zero, $zero
/* 0014C8 800F7AA8 00021400 */  sll   $v0, $v0, 0x10
/* 0014CC 800F7AAC 00028C03 */  sra   $s1, $v0, 0x10
/* 0014D0 800F7AB0 1A200007 */  blez  $s1, .ov054_L800F7AD0
/* 0014D4 800F7AB4 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F7AB8:
/* 0014D8 800F7AB8 0C00EFA1 */  jal   func_8003BE84
/* 0014DC 800F7ABC 2405FFFE */   addiu $a1, $zero, -2
/* 0014E0 800F7AC0 26100001 */  addiu $s0, $s0, 1
/* 0014E4 800F7AC4 0211102A */  slt   $v0, $s0, $s1
/* 0014E8 800F7AC8 1440FFFB */  bnez  $v0, .ov054_L800F7AB8
/* 0014EC 800F7ACC 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F7AD0:
/* 0014F0 800F7AD0 0C00EFA1 */  jal   func_8003BE84
/* 0014F4 800F7AD4 2405FFFC */   addiu $a1, $zero, -4
.ov054_L800F7AD8:
/* 0014F8 800F7AD8 0C00F053 */  jal   DirectionPrompt
/* 0014FC 800F7ADC 02402021 */   addu  $a0, $s2, $zero
/* 001500 800F7AE0 00408021 */  addu  $s0, $v0, $zero
/* 001504 800F7AE4 0C00EE42 */  jal   func_8003B908
/* 001508 800F7AE8 02402021 */   addu  $a0, $s2, $zero
/* 00150C 800F7AEC 0C03DE74 */  jal   ov054_func_800F79D0
/* 001510 800F7AF0 00000000 */   nop   
/* 001514 800F7AF4 3C02800F */  lui   $v0, 0x800f
/* 001518 800F7AF8 8442D154 */  lh    $v0, -0x2eac($v0)
/* 00151C 800F7AFC 2C420001 */  sltiu $v0, $v0, 1
/* 001520 800F7B00 0010182B */  sltu  $v1, $zero, $s0
/* 001524 800F7B04 00431024 */  and   $v0, $v0, $v1
/* 001528 800F7B08 10400003 */  beqz  $v0, .ov054_L800F7B18
/* 00152C 800F7B0C 2404FFFF */   addiu $a0, $zero, -1
/* 001530 800F7B10 0803DF03 */  j     ov054_func_800F7C0C
/* 001534 800F7B14 24050003 */   addiu $a1, $zero, 3

.ov054_L800F7B18:
/* 001538 800F7B18 3C02800F */  lui   $v0, 0x800f
/* 00153C 800F7B1C 8442D154 */  lh    $v0, -0x2eac($v0)
/* 001540 800F7B20 0002102B */  sltu  $v0, $zero, $v0
/* 001544 800F7B24 2E030001 */  sltiu $v1, $s0, 1
/* 001548 800F7B28 00431024 */  and   $v0, $v0, $v1
/* 00154C 800F7B2C 14400037 */  bnez  $v0, .ov054_L800F7C0C
/* 001550 800F7B30 24050001 */   addiu $a1, $zero, 1
/* 001554 800F7B34 3C01800F */  lui   $at, 0x800f
/* 001558 800F7B38 A420D172 */  sh    $zero, -0x2e8e($at)
/* 00155C 800F7B3C 24040047 */  addiu $a0, $zero, 0x47
/* 001560 800F7B40 00002821 */  addu  $a1, $zero, $zero
/* 001564 800F7B44 0C0161FB */  jal   func_800587EC
/* 001568 800F7B48 24060001 */   addiu $a2, $zero, 1
/* 00156C 800F7B4C 0C0132C8 */  jal   func_8004CB20
/* 001570 800F7B50 24040001 */   addiu $a0, $zero, 1
/* 001574 800F7B54 0803DF05 */  j     ov054_func_800F7C14
/* 001578 800F7B58 00000000 */   nop   

ov054_func_800F7B5C:
.ov054_L800F7B5C:
/* 00157C 800F7B5C 0C012E14 */  jal   func_8004B850
/* 001580 800F7B60 00000000 */   nop   
/* 001584 800F7B64 10400005 */  beqz  $v0, .ov054_L800F7B7C
/* 001588 800F7B68 00000000 */   nop   
/* 00158C 800F7B6C 0C018D6D */  jal   SleepVProcess
/* 001590 800F7B70 00000000 */   nop   
/* 001594 800F7B74 0803DED7 */  j     ov054_func_800F7B5C
/* 001598 800F7B78 00000000 */   nop   

.ov054_L800F7B7C:
/* 00159C 800F7B7C 0C018D6D */  jal   SleepVProcess
/* 0015A0 800F7B80 00000000 */   nop   
/* 0015A4 800F7B84 24040032 */  addiu $a0, $zero, 0x32
/* 0015A8 800F7B88 2405003C */  addiu $a1, $zero, 0x3c
/* 0015AC 800F7B8C 2406000C */  addiu $a2, $zero, 0xc
/* 0015B0 800F7B90 0C01364C */  jal   CreateTextWindow
/* 0015B4 800F7B94 24070002 */   addiu $a3, $zero, 2
/* 0015B8 800F7B98 00028400 */  sll   $s0, $v0, 0x10
/* 0015BC 800F7B9C 00108403 */  sra   $s0, $s0, 0x10
/* 0015C0 800F7BA0 02002021 */  addu  $a0, $s0, $zero
/* 0015C4 800F7BA4 2405018B */  addiu $a1, $zero, 0x18b
/* 0015C8 800F7BA8 2406FFFF */  addiu $a2, $zero, -1
/* 0015CC 800F7BAC 0C01B5F6 */  jal   LoadStringIntoWindow
/* 0015D0 800F7BB0 2407FFFF */   addiu $a3, $zero, -1
/* 0015D4 800F7BB4 02002021 */  addu  $a0, $s0, $zero
/* 0015D8 800F7BB8 0C01B81C */  jal   SetTextCharsPerFrame
/* 0015DC 800F7BBC 00002821 */   addu  $a1, $zero, $zero
/* 0015E0 800F7BC0 0C013676 */  jal   ShowTextWindow
/* 0015E4 800F7BC4 02002021 */   addu  $a0, $s0, $zero
/* 0015E8 800F7BC8 0C0180AB */  jal   PlaySound
/* 0015EC 800F7BCC 2404008F */   addiu $a0, $zero, 0x8f
/* 0015F0 800F7BD0 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 0015F4 800F7BD4 00000000 */   nop   
/* 0015F8 800F7BD8 00021400 */  sll   $v0, $v0, 0x10
/* 0015FC 800F7BDC 02002021 */  addu  $a0, $s0, $zero
/* 001600 800F7BE0 0C0136F5 */  jal   func_8004DBD4
/* 001604 800F7BE4 00022C03 */   sra   $a1, $v0, 0x10
/* 001608 800F7BE8 0C0136B4 */  jal   HideTextWindow
/* 00160C 800F7BEC 02002021 */   addu  $a0, $s0, $zero
/* 001610 800F7BF0 3C02800F */  lui   $v0, 0x800f
/* 001614 800F7BF4 8442D154 */  lh    $v0, -0x2eac($v0)
/* 001618 800F7BF8 14400003 */  bnez  $v0, .ov054_L800F7C08
/* 00161C 800F7BFC 2404FFFF */   addiu $a0, $zero, -1
/* 001620 800F7C00 0803DF03 */  j     ov054_func_800F7C0C
/* 001624 800F7C04 24050003 */   addiu $a1, $zero, 3

.ov054_L800F7C08:
/* 001628 800F7C08 24050001 */  addiu $a1, $zero, 1
ov054_func_800F7C0C:
.ov054_L800F7C0C:
/* 00162C 800F7C0C 0C013611 */  jal   SetNextChainAndSpace
/* 001630 800F7C10 00003021 */   addu  $a2, $zero, $zero
ov054_func_800F7C14:
/* 001634 800F7C14 0C017764 */  jal   EndProcess
/* 001638 800F7C18 00002021 */   addu  $a0, $zero, $zero
/* 00163C 800F7C1C 8FBF0024 */  lw    $ra, 0x24($sp)
/* 001640 800F7C20 8FB20020 */  lw    $s2, 0x20($sp)
/* 001644 800F7C24 8FB1001C */  lw    $s1, 0x1c($sp)
/* 001648 800F7C28 8FB00018 */  lw    $s0, 0x18($sp)
/* 00164C 800F7C2C 03E00008 */  jr    $ra
/* 001650 800F7C30 27BD0028 */   addiu $sp, $sp, 0x28

/* 001654 800F7C34 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001658 800F7C38 AFBF0010 */  sw    $ra, 0x10($sp)
/* 00165C 800F7C3C 3C02800F */  lui   $v0, 0x800f
/* 001660 800F7C40 8442D154 */  lh    $v0, -0x2eac($v0)
/* 001664 800F7C44 10400003 */  beqz  $v0, .ov054_L800F7C54
/* 001668 800F7C48 2404FFFF */   addiu $a0, $zero, -1
/* 00166C 800F7C4C 0803DF16 */  j     ov054_func_800F7C58
/* 001670 800F7C50 24050001 */   addiu $a1, $zero, 1

.ov054_L800F7C54:
/* 001674 800F7C54 24050003 */  addiu $a1, $zero, 3
ov054_func_800F7C58:
/* 001678 800F7C58 0C013611 */  jal   SetNextChainAndSpace
/* 00167C 800F7C5C 00003021 */   addu  $a2, $zero, $zero
/* 001680 800F7C60 8FBF0010 */  lw    $ra, 0x10($sp)
/* 001684 800F7C64 03E00008 */  jr    $ra
/* 001688 800F7C68 27BD0018 */   addiu $sp, $sp, 0x18

/* 00168C 800F7C6C 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 001690 800F7C70 AFBF0024 */  sw    $ra, 0x24($sp)
/* 001694 800F7C74 AFB20020 */  sw    $s2, 0x20($sp)
/* 001698 800F7C78 AFB1001C */  sw    $s1, 0x1c($sp)
/* 00169C 800F7C7C AFB00018 */  sw    $s0, 0x18($sp)
/* 0016A0 800F7C80 2404FFFF */  addiu $a0, $zero, -1
/* 0016A4 800F7C84 2405FFFF */  addiu $a1, $zero, -1
/* 0016A8 800F7C88 0C014AFA */  jal   func_80052BE8
/* 0016AC 800F7C8C 24060002 */   addiu $a2, $zero, 2
/* 0016B0 800F7C90 0C018D6D */  jal   SleepVProcess
/* 0016B4 800F7C94 00000000 */   nop   
/* 0016B8 800F7C98 2404FFFF */  addiu $a0, $zero, -1
/* 0016BC 800F7C9C 0C014AEE */  jal   PlayerHasCoins
/* 0016C0 800F7CA0 2405000A */   addiu $a1, $zero, 0xa
/* 0016C4 800F7CA4 10400042 */  beqz  $v0, .ov054_L800F7DB0
/* 0016C8 800F7CA8 00000000 */   nop   
/* 0016CC 800F7CAC 0C03DE48 */  jal   ov054_func_800F7920
/* 0016D0 800F7CB0 00000000 */   nop   
/* 0016D4 800F7CB4 3C058010 */  lui   $a1, 0x8010
/* 0016D8 800F7CB8 24A59F7C */  addiu $a1, $a1, -0x6084
/* 0016DC 800F7CBC 0C00F086 */  jal   func_8003C218
/* 0016E0 800F7CC0 2404FFFF */   addiu $a0, $zero, -1
/* 0016E4 800F7CC4 00409021 */  addu  $s2, $v0, $zero
/* 0016E8 800F7CC8 02402021 */  addu  $a0, $s2, $zero
/* 0016EC 800F7CCC 2405FFFF */  addiu $a1, $zero, -1
/* 0016F0 800F7CD0 0C00F018 */  jal   func_8003C060
/* 0016F4 800F7CD4 00003021 */   addu  $a2, $zero, $zero
/* 0016F8 800F7CD8 0C014AC8 */  jal   PlayerIsCPU
/* 0016FC 800F7CDC 2404FFFF */   addiu $a0, $zero, -1
/* 001700 800F7CE0 10400011 */  beqz  $v0, .ov054_L800F7D28
/* 001704 800F7CE4 00000000 */   nop   
/* 001708 800F7CE8 3C048010 */  lui   $a0, 0x8010
/* 00170C 800F7CEC 24849C74 */  addiu $a0, $a0, -0x638c
/* 001710 800F7CF0 0C00FA6C */  jal   func_8003E9B0
/* 001714 800F7CF4 00008021 */   addu  $s0, $zero, $zero
/* 001718 800F7CF8 00021400 */  sll   $v0, $v0, 0x10
/* 00171C 800F7CFC 00028C03 */  sra   $s1, $v0, 0x10
/* 001720 800F7D00 1A200007 */  blez  $s1, .ov054_L800F7D20
/* 001724 800F7D04 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F7D08:
/* 001728 800F7D08 0C00EFA1 */  jal   func_8003BE84
/* 00172C 800F7D0C 2405FFFE */   addiu $a1, $zero, -2
/* 001730 800F7D10 26100001 */  addiu $s0, $s0, 1
/* 001734 800F7D14 0211102A */  slt   $v0, $s0, $s1
/* 001738 800F7D18 1440FFFB */  bnez  $v0, .ov054_L800F7D08
/* 00173C 800F7D1C 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F7D20:
/* 001740 800F7D20 0C00EFA1 */  jal   func_8003BE84
/* 001744 800F7D24 2405FFFC */   addiu $a1, $zero, -4
.ov054_L800F7D28:
/* 001748 800F7D28 0C00F053 */  jal   DirectionPrompt
/* 00174C 800F7D2C 02402021 */   addu  $a0, $s2, $zero
/* 001750 800F7D30 00408021 */  addu  $s0, $v0, $zero
/* 001754 800F7D34 0C00EE42 */  jal   func_8003B908
/* 001758 800F7D38 02402021 */   addu  $a0, $s2, $zero
/* 00175C 800F7D3C 0C03DE74 */  jal   ov054_func_800F79D0
/* 001760 800F7D40 00000000 */   nop   
/* 001764 800F7D44 3C02800F */  lui   $v0, 0x800f
/* 001768 800F7D48 8442D156 */  lh    $v0, -0x2eaa($v0)
/* 00176C 800F7D4C 2C420001 */  sltiu $v0, $v0, 1
/* 001770 800F7D50 0010182B */  sltu  $v1, $zero, $s0
/* 001774 800F7D54 00431024 */  and   $v0, $v0, $v1
/* 001778 800F7D58 10400003 */  beqz  $v0, .ov054_L800F7D68
/* 00177C 800F7D5C 2404FFFF */   addiu $a0, $zero, -1
/* 001780 800F7D60 0803DF98 */  j     ov054_func_800F7E60
/* 001784 800F7D64 2405000F */   addiu $a1, $zero, 0xf

.ov054_L800F7D68:
/* 001788 800F7D68 3C02800F */  lui   $v0, 0x800f
/* 00178C 800F7D6C 8442D156 */  lh    $v0, -0x2eaa($v0)
/* 001790 800F7D70 0002102B */  sltu  $v0, $zero, $v0
/* 001794 800F7D74 2E030001 */  sltiu $v1, $s0, 1
/* 001798 800F7D78 00431024 */  and   $v0, $v0, $v1
/* 00179C 800F7D7C 14400038 */  bnez  $v0, .ov054_L800F7E60
/* 0017A0 800F7D80 2405000E */   addiu $a1, $zero, 0xe
/* 0017A4 800F7D84 24020001 */  addiu $v0, $zero, 1
/* 0017A8 800F7D88 3C01800F */  lui   $at, 0x800f
/* 0017AC 800F7D8C A422D172 */  sh    $v0, -0x2e8e($at)
/* 0017B0 800F7D90 24040047 */  addiu $a0, $zero, 0x47
/* 0017B4 800F7D94 00002821 */  addu  $a1, $zero, $zero
/* 0017B8 800F7D98 0C0161FB */  jal   func_800587EC
/* 0017BC 800F7D9C 24060001 */   addiu $a2, $zero, 1
/* 0017C0 800F7DA0 0C0132C8 */  jal   func_8004CB20
/* 0017C4 800F7DA4 24040001 */   addiu $a0, $zero, 1
/* 0017C8 800F7DA8 0803DF9A */  j     ov054_func_800F7E68
/* 0017CC 800F7DAC 00000000 */   nop   

ov054_func_800F7DB0:
.ov054_L800F7DB0:
/* 0017D0 800F7DB0 0C012E14 */  jal   func_8004B850
/* 0017D4 800F7DB4 00000000 */   nop   
/* 0017D8 800F7DB8 10400005 */  beqz  $v0, .ov054_L800F7DD0
/* 0017DC 800F7DBC 00000000 */   nop   
/* 0017E0 800F7DC0 0C018D6D */  jal   SleepVProcess
/* 0017E4 800F7DC4 00000000 */   nop   
/* 0017E8 800F7DC8 0803DF6C */  j     ov054_func_800F7DB0
/* 0017EC 800F7DCC 00000000 */   nop   

.ov054_L800F7DD0:
/* 0017F0 800F7DD0 0C018D6D */  jal   SleepVProcess
/* 0017F4 800F7DD4 00000000 */   nop   
/* 0017F8 800F7DD8 24040032 */  addiu $a0, $zero, 0x32
/* 0017FC 800F7DDC 2405003C */  addiu $a1, $zero, 0x3c
/* 001800 800F7DE0 2406000C */  addiu $a2, $zero, 0xc
/* 001804 800F7DE4 0C01364C */  jal   CreateTextWindow
/* 001808 800F7DE8 24070002 */   addiu $a3, $zero, 2
/* 00180C 800F7DEC 00028400 */  sll   $s0, $v0, 0x10
/* 001810 800F7DF0 00108403 */  sra   $s0, $s0, 0x10
/* 001814 800F7DF4 02002021 */  addu  $a0, $s0, $zero
/* 001818 800F7DF8 2405018B */  addiu $a1, $zero, 0x18b
/* 00181C 800F7DFC 2406FFFF */  addiu $a2, $zero, -1
/* 001820 800F7E00 0C01B5F6 */  jal   LoadStringIntoWindow
/* 001824 800F7E04 2407FFFF */   addiu $a3, $zero, -1
/* 001828 800F7E08 02002021 */  addu  $a0, $s0, $zero
/* 00182C 800F7E0C 0C01B81C */  jal   SetTextCharsPerFrame
/* 001830 800F7E10 00002821 */   addu  $a1, $zero, $zero
/* 001834 800F7E14 0C013676 */  jal   ShowTextWindow
/* 001838 800F7E18 02002021 */   addu  $a0, $s0, $zero
/* 00183C 800F7E1C 0C0180AB */  jal   PlaySound
/* 001840 800F7E20 2404008F */   addiu $a0, $zero, 0x8f
/* 001844 800F7E24 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 001848 800F7E28 00000000 */   nop   
/* 00184C 800F7E2C 00021400 */  sll   $v0, $v0, 0x10
/* 001850 800F7E30 02002021 */  addu  $a0, $s0, $zero
/* 001854 800F7E34 0C0136F5 */  jal   func_8004DBD4
/* 001858 800F7E38 00022C03 */   sra   $a1, $v0, 0x10
/* 00185C 800F7E3C 0C0136B4 */  jal   HideTextWindow
/* 001860 800F7E40 02002021 */   addu  $a0, $s0, $zero
/* 001864 800F7E44 3C02800F */  lui   $v0, 0x800f
/* 001868 800F7E48 8442D156 */  lh    $v0, -0x2eaa($v0)
/* 00186C 800F7E4C 14400003 */  bnez  $v0, .ov054_L800F7E5C
/* 001870 800F7E50 2404FFFF */   addiu $a0, $zero, -1
/* 001874 800F7E54 0803DF98 */  j     ov054_func_800F7E60
/* 001878 800F7E58 2405000F */   addiu $a1, $zero, 0xf

.ov054_L800F7E5C:
/* 00187C 800F7E5C 2405000E */  addiu $a1, $zero, 0xe
ov054_func_800F7E60:
.ov054_L800F7E60:
/* 001880 800F7E60 0C013611 */  jal   SetNextChainAndSpace
/* 001884 800F7E64 00003021 */   addu  $a2, $zero, $zero
ov054_func_800F7E68:
/* 001888 800F7E68 0C017764 */  jal   EndProcess
/* 00188C 800F7E6C 00002021 */   addu  $a0, $zero, $zero
/* 001890 800F7E70 8FBF0024 */  lw    $ra, 0x24($sp)
/* 001894 800F7E74 8FB20020 */  lw    $s2, 0x20($sp)
/* 001898 800F7E78 8FB1001C */  lw    $s1, 0x1c($sp)
/* 00189C 800F7E7C 8FB00018 */  lw    $s0, 0x18($sp)
/* 0018A0 800F7E80 03E00008 */  jr    $ra
/* 0018A4 800F7E84 27BD0028 */   addiu $sp, $sp, 0x28

/* 0018A8 800F7E88 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0018AC 800F7E8C AFBF0010 */  sw    $ra, 0x10($sp)
/* 0018B0 800F7E90 3C02800F */  lui   $v0, 0x800f
/* 0018B4 800F7E94 8442D156 */  lh    $v0, -0x2eaa($v0)
/* 0018B8 800F7E98 10400003 */  beqz  $v0, .ov054_L800F7EA8
/* 0018BC 800F7E9C 2404FFFF */   addiu $a0, $zero, -1
/* 0018C0 800F7EA0 0803DFAB */  j     ov054_func_800F7EAC
/* 0018C4 800F7EA4 2405000E */   addiu $a1, $zero, 0xe

.ov054_L800F7EA8:
/* 0018C8 800F7EA8 2405000F */  addiu $a1, $zero, 0xf
ov054_func_800F7EAC:
/* 0018CC 800F7EAC 0C013611 */  jal   SetNextChainAndSpace
/* 0018D0 800F7EB0 00003021 */   addu  $a2, $zero, $zero
/* 0018D4 800F7EB4 8FBF0010 */  lw    $ra, 0x10($sp)
/* 0018D8 800F7EB8 03E00008 */  jr    $ra
/* 0018DC 800F7EBC 27BD0018 */   addiu $sp, $sp, 0x18

/* 0018E0 800F7EC0 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 0018E4 800F7EC4 AFBF0024 */  sw    $ra, 0x24($sp)
/* 0018E8 800F7EC8 AFB20020 */  sw    $s2, 0x20($sp)
/* 0018EC 800F7ECC AFB1001C */  sw    $s1, 0x1c($sp)
/* 0018F0 800F7ED0 AFB00018 */  sw    $s0, 0x18($sp)
/* 0018F4 800F7ED4 2404FFFF */  addiu $a0, $zero, -1
/* 0018F8 800F7ED8 2405FFFF */  addiu $a1, $zero, -1
/* 0018FC 800F7EDC 0C014AFA */  jal   func_80052BE8
/* 001900 800F7EE0 24060002 */   addiu $a2, $zero, 2
/* 001904 800F7EE4 0C018D6D */  jal   SleepVProcess
/* 001908 800F7EE8 00000000 */   nop   
/* 00190C 800F7EEC 2404FFFF */  addiu $a0, $zero, -1
/* 001910 800F7EF0 0C014AEE */  jal   PlayerHasCoins
/* 001914 800F7EF4 2405000A */   addiu $a1, $zero, 0xa
/* 001918 800F7EF8 10400042 */  beqz  $v0, .ov054_L800F8004
/* 00191C 800F7EFC 00000000 */   nop   
/* 001920 800F7F00 0C03DE48 */  jal   ov054_func_800F7920
/* 001924 800F7F04 00000000 */   nop   
/* 001928 800F7F08 3C058010 */  lui   $a1, 0x8010
/* 00192C 800F7F0C 24A59F9C */  addiu $a1, $a1, -0x6064
/* 001930 800F7F10 0C00F086 */  jal   func_8003C218
/* 001934 800F7F14 2404FFFF */   addiu $a0, $zero, -1
/* 001938 800F7F18 00409021 */  addu  $s2, $v0, $zero
/* 00193C 800F7F1C 02402021 */  addu  $a0, $s2, $zero
/* 001940 800F7F20 2405FFFF */  addiu $a1, $zero, -1
/* 001944 800F7F24 0C00F018 */  jal   func_8003C060
/* 001948 800F7F28 00003021 */   addu  $a2, $zero, $zero
/* 00194C 800F7F2C 0C014AC8 */  jal   PlayerIsCPU
/* 001950 800F7F30 2404FFFF */   addiu $a0, $zero, -1
/* 001954 800F7F34 10400011 */  beqz  $v0, .ov054_L800F7F7C
/* 001958 800F7F38 00000000 */   nop   
/* 00195C 800F7F3C 3C048010 */  lui   $a0, 0x8010
/* 001960 800F7F40 24849D7C */  addiu $a0, $a0, -0x6284
/* 001964 800F7F44 0C00FA6C */  jal   func_8003E9B0
/* 001968 800F7F48 00008021 */   addu  $s0, $zero, $zero
/* 00196C 800F7F4C 00021400 */  sll   $v0, $v0, 0x10
/* 001970 800F7F50 00028C03 */  sra   $s1, $v0, 0x10
/* 001974 800F7F54 1A200007 */  blez  $s1, .ov054_L800F7F74
/* 001978 800F7F58 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F7F5C:
/* 00197C 800F7F5C 0C00EFA1 */  jal   func_8003BE84
/* 001980 800F7F60 2405FFFE */   addiu $a1, $zero, -2
/* 001984 800F7F64 26100001 */  addiu $s0, $s0, 1
/* 001988 800F7F68 0211102A */  slt   $v0, $s0, $s1
/* 00198C 800F7F6C 1440FFFB */  bnez  $v0, .ov054_L800F7F5C
/* 001990 800F7F70 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F7F74:
/* 001994 800F7F74 0C00EFA1 */  jal   func_8003BE84
/* 001998 800F7F78 2405FFFC */   addiu $a1, $zero, -4
.ov054_L800F7F7C:
/* 00199C 800F7F7C 0C00F053 */  jal   DirectionPrompt
/* 0019A0 800F7F80 02402021 */   addu  $a0, $s2, $zero
/* 0019A4 800F7F84 00408021 */  addu  $s0, $v0, $zero
/* 0019A8 800F7F88 0C00EE42 */  jal   func_8003B908
/* 0019AC 800F7F8C 02402021 */   addu  $a0, $s2, $zero
/* 0019B0 800F7F90 0C03DE74 */  jal   ov054_func_800F79D0
/* 0019B4 800F7F94 00000000 */   nop   
/* 0019B8 800F7F98 3C02800F */  lui   $v0, 0x800f
/* 0019BC 800F7F9C 8442D158 */  lh    $v0, -0x2ea8($v0)
/* 0019C0 800F7FA0 2C420001 */  sltiu $v0, $v0, 1
/* 0019C4 800F7FA4 2E030001 */  sltiu $v1, $s0, 1
/* 0019C8 800F7FA8 00431024 */  and   $v0, $v0, $v1
/* 0019CC 800F7FAC 10400003 */  beqz  $v0, .ov054_L800F7FBC
/* 0019D0 800F7FB0 2404FFFF */   addiu $a0, $zero, -1
/* 0019D4 800F7FB4 0803E02D */  j     ov054_func_800F80B4
/* 0019D8 800F7FB8 24050006 */   addiu $a1, $zero, 6

.ov054_L800F7FBC:
/* 0019DC 800F7FBC 3C02800F */  lui   $v0, 0x800f
/* 0019E0 800F7FC0 8442D158 */  lh    $v0, -0x2ea8($v0)
/* 0019E4 800F7FC4 0002102B */  sltu  $v0, $zero, $v0
/* 0019E8 800F7FC8 0010182B */  sltu  $v1, $zero, $s0
/* 0019EC 800F7FCC 00431024 */  and   $v0, $v0, $v1
/* 0019F0 800F7FD0 14400038 */  bnez  $v0, .ov054_L800F80B4
/* 0019F4 800F7FD4 24050005 */   addiu $a1, $zero, 5
/* 0019F8 800F7FD8 24020002 */  addiu $v0, $zero, 2
/* 0019FC 800F7FDC 3C01800F */  lui   $at, 0x800f
/* 001A00 800F7FE0 A422D172 */  sh    $v0, -0x2e8e($at)
/* 001A04 800F7FE4 24040047 */  addiu $a0, $zero, 0x47
/* 001A08 800F7FE8 00002821 */  addu  $a1, $zero, $zero
/* 001A0C 800F7FEC 0C0161FB */  jal   func_800587EC
/* 001A10 800F7FF0 24060001 */   addiu $a2, $zero, 1
/* 001A14 800F7FF4 0C0132C8 */  jal   func_8004CB20
/* 001A18 800F7FF8 24040001 */   addiu $a0, $zero, 1
/* 001A1C 800F7FFC 0803E02F */  j     ov054_func_800F80BC
/* 001A20 800F8000 00000000 */   nop   

ov054_func_800F8004:
.ov054_L800F8004:
/* 001A24 800F8004 0C012E14 */  jal   func_8004B850
/* 001A28 800F8008 00000000 */   nop   
/* 001A2C 800F800C 10400005 */  beqz  $v0, .ov054_L800F8024
/* 001A30 800F8010 00000000 */   nop   
/* 001A34 800F8014 0C018D6D */  jal   SleepVProcess
/* 001A38 800F8018 00000000 */   nop   
/* 001A3C 800F801C 0803E001 */  j     ov054_func_800F8004
/* 001A40 800F8020 00000000 */   nop   

.ov054_L800F8024:
/* 001A44 800F8024 0C018D6D */  jal   SleepVProcess
/* 001A48 800F8028 00000000 */   nop   
/* 001A4C 800F802C 24040032 */  addiu $a0, $zero, 0x32
/* 001A50 800F8030 2405003C */  addiu $a1, $zero, 0x3c
/* 001A54 800F8034 2406000C */  addiu $a2, $zero, 0xc
/* 001A58 800F8038 0C01364C */  jal   CreateTextWindow
/* 001A5C 800F803C 24070002 */   addiu $a3, $zero, 2
/* 001A60 800F8040 00028400 */  sll   $s0, $v0, 0x10
/* 001A64 800F8044 00108403 */  sra   $s0, $s0, 0x10
/* 001A68 800F8048 02002021 */  addu  $a0, $s0, $zero
/* 001A6C 800F804C 2405018B */  addiu $a1, $zero, 0x18b
/* 001A70 800F8050 2406FFFF */  addiu $a2, $zero, -1
/* 001A74 800F8054 0C01B5F6 */  jal   LoadStringIntoWindow
/* 001A78 800F8058 2407FFFF */   addiu $a3, $zero, -1
/* 001A7C 800F805C 02002021 */  addu  $a0, $s0, $zero
/* 001A80 800F8060 0C01B81C */  jal   SetTextCharsPerFrame
/* 001A84 800F8064 00002821 */   addu  $a1, $zero, $zero
/* 001A88 800F8068 0C013676 */  jal   ShowTextWindow
/* 001A8C 800F806C 02002021 */   addu  $a0, $s0, $zero
/* 001A90 800F8070 0C0180AB */  jal   PlaySound
/* 001A94 800F8074 2404008F */   addiu $a0, $zero, 0x8f
/* 001A98 800F8078 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 001A9C 800F807C 00000000 */   nop   
/* 001AA0 800F8080 00021400 */  sll   $v0, $v0, 0x10
/* 001AA4 800F8084 02002021 */  addu  $a0, $s0, $zero
/* 001AA8 800F8088 0C0136F5 */  jal   func_8004DBD4
/* 001AAC 800F808C 00022C03 */   sra   $a1, $v0, 0x10
/* 001AB0 800F8090 0C0136B4 */  jal   HideTextWindow
/* 001AB4 800F8094 02002021 */   addu  $a0, $s0, $zero
/* 001AB8 800F8098 3C02800F */  lui   $v0, 0x800f
/* 001ABC 800F809C 8442D158 */  lh    $v0, -0x2ea8($v0)
/* 001AC0 800F80A0 14400003 */  bnez  $v0, .ov054_L800F80B0
/* 001AC4 800F80A4 2404FFFF */   addiu $a0, $zero, -1
/* 001AC8 800F80A8 0803E02D */  j     ov054_func_800F80B4
/* 001ACC 800F80AC 24050006 */   addiu $a1, $zero, 6

.ov054_L800F80B0:
/* 001AD0 800F80B0 24050005 */  addiu $a1, $zero, 5
ov054_func_800F80B4:
.ov054_L800F80B4:
/* 001AD4 800F80B4 0C013611 */  jal   SetNextChainAndSpace
/* 001AD8 800F80B8 00003021 */   addu  $a2, $zero, $zero
ov054_func_800F80BC:
/* 001ADC 800F80BC 0C017764 */  jal   EndProcess
/* 001AE0 800F80C0 00002021 */   addu  $a0, $zero, $zero
/* 001AE4 800F80C4 8FBF0024 */  lw    $ra, 0x24($sp)
/* 001AE8 800F80C8 8FB20020 */  lw    $s2, 0x20($sp)
/* 001AEC 800F80CC 8FB1001C */  lw    $s1, 0x1c($sp)
/* 001AF0 800F80D0 8FB00018 */  lw    $s0, 0x18($sp)
/* 001AF4 800F80D4 03E00008 */  jr    $ra
/* 001AF8 800F80D8 27BD0028 */   addiu $sp, $sp, 0x28

/* 001AFC 800F80DC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001B00 800F80E0 AFBF0010 */  sw    $ra, 0x10($sp)
/* 001B04 800F80E4 3C02800F */  lui   $v0, 0x800f
/* 001B08 800F80E8 8442D158 */  lh    $v0, -0x2ea8($v0)
/* 001B0C 800F80EC 10400003 */  beqz  $v0, .ov054_L800F80FC
/* 001B10 800F80F0 2404FFFF */   addiu $a0, $zero, -1
/* 001B14 800F80F4 0803E040 */  j     ov054_func_800F8100
/* 001B18 800F80F8 24050005 */   addiu $a1, $zero, 5

.ov054_L800F80FC:
/* 001B1C 800F80FC 24050006 */  addiu $a1, $zero, 6
ov054_func_800F8100:
/* 001B20 800F8100 0C013611 */  jal   SetNextChainAndSpace
/* 001B24 800F8104 00003021 */   addu  $a2, $zero, $zero
/* 001B28 800F8108 8FBF0010 */  lw    $ra, 0x10($sp)
/* 001B2C 800F810C 03E00008 */  jr    $ra
/* 001B30 800F8110 27BD0018 */   addiu $sp, $sp, 0x18

/* 001B34 800F8114 27BDFFC0 */  addiu $sp, $sp, -0x40
/* 001B38 800F8118 AFBF0038 */  sw    $ra, 0x38($sp)
/* 001B3C 800F811C AFB50034 */  sw    $s5, 0x34($sp)
/* 001B40 800F8120 AFB40030 */  sw    $s4, 0x30($sp)
/* 001B44 800F8124 AFB3002C */  sw    $s3, 0x2c($sp)
/* 001B48 800F8128 AFB20028 */  sw    $s2, 0x28($sp)
/* 001B4C 800F812C AFB10024 */  sw    $s1, 0x24($sp)
/* 001B50 800F8130 0C018CEA */  jal   func_800633A8
/* 001B54 800F8134 AFB00020 */   sw    $s0, 0x20($sp)
/* 001B58 800F8138 00409821 */  addu  $s3, $v0, $zero
/* 001B5C 800F813C 8E72008C */  lw    $s2, 0x8c($s3)
/* 001B60 800F8140 8E540000 */  lw    $s4, ($s2)
/* 001B64 800F8144 8E550004 */  lw    $s5, 4($s2)
/* 001B68 800F8148 02802021 */  addu  $a0, $s4, $zero
/* 001B6C 800F814C 00002821 */  addu  $a1, $zero, $zero
/* 001B70 800F8150 0C00FA07 */  jal   func_8003E81C
/* 001B74 800F8154 24060002 */   addiu $a2, $zero, 2
/* 001B78 800F8158 26B50004 */  addiu $s5, $s5, 4
/* 001B7C 800F815C 2691000C */  addiu $s1, $s4, 0xc
/* 001B80 800F8160 27A40010 */  addiu $a0, $sp, 0x10
/* 001B84 800F8164 02A02821 */  addu  $a1, $s5, $zero
/* 001B88 800F8168 0C0283A0 */  jal   func_800A0E80
/* 001B8C 800F816C 02203021 */   addu  $a2, $s1, $zero
/* 001B90 800F8170 26900018 */  addiu $s0, $s4, 0x18
/* 001B94 800F8174 02002021 */  addu  $a0, $s0, $zero
/* 001B98 800F8178 27A50010 */  addiu $a1, $sp, 0x10
/* 001B9C 800F817C 02003021 */  addu  $a2, $s0, $zero
/* 001BA0 800F8180 0C01347B */  jal   func_8004D1EC
/* 001BA4 800F8184 2407000A */   addiu $a3, $zero, 0xa
/* 001BA8 800F8188 02602021 */  addu  $a0, $s3, $zero
/* 001BAC 800F818C 0C018C9C */  jal   func_80063270
/* 001BB0 800F8190 00402821 */   addu  $a1, $v0, $zero
/* 001BB4 800F8194 0C018CD6 */  jal   func_80063358
/* 001BB8 800F8198 00000000 */   nop   
/* 001BBC 800F819C 27A40010 */  addiu $a0, $sp, 0x10
/* 001BC0 800F81A0 0C028354 */  jal   func_800A0D50
/* 001BC4 800F81A4 02202821 */   addu  $a1, $s1, $zero
/* 001BC8 800F81A8 27A40010 */  addiu $a0, $sp, 0x10
/* 001BCC 800F81AC 02A02821 */  addu  $a1, $s5, $zero
/* 001BD0 800F81B0 02203021 */  addu  $a2, $s1, $zero
/* 001BD4 800F81B4 0C0134FD */  jal   func_8004D3F4
/* 001BD8 800F81B8 24070019 */   addiu $a3, $zero, 0x19
/* 001BDC 800F81BC 02602021 */  addu  $a0, $s3, $zero
/* 001BE0 800F81C0 0C018C9C */  jal   func_80063270
/* 001BE4 800F81C4 00402821 */   addu  $a1, $v0, $zero
/* 001BE8 800F81C8 0C018CD6 */  jal   func_80063358
/* 001BEC 800F81CC 00000000 */   nop   
/* 001BF0 800F81D0 8E550008 */  lw    $s5, 8($s2)
/* 001BF4 800F81D4 27A40010 */  addiu $a0, $sp, 0x10
/* 001BF8 800F81D8 26A50004 */  addiu $a1, $s5, 4
/* 001BFC 800F81DC 0C0283A0 */  jal   func_800A0E80
/* 001C00 800F81E0 02203021 */   addu  $a2, $s1, $zero
/* 001C04 800F81E4 02002021 */  addu  $a0, $s0, $zero
/* 001C08 800F81E8 27A50010 */  addiu $a1, $sp, 0x10
/* 001C0C 800F81EC 02003021 */  addu  $a2, $s0, $zero
/* 001C10 800F81F0 0C01347B */  jal   func_8004D1EC
/* 001C14 800F81F4 2407000A */   addiu $a3, $zero, 0xa
/* 001C18 800F81F8 02602021 */  addu  $a0, $s3, $zero
/* 001C1C 800F81FC 0C018C9C */  jal   func_80063270
/* 001C20 800F8200 00402821 */   addu  $a1, $v0, $zero
/* 001C24 800F8204 0C018CD6 */  jal   func_80063358
/* 001C28 800F8208 00000000 */   nop   
/* 001C2C 800F820C 02802021 */  addu  $a0, $s4, $zero
/* 001C30 800F8210 2405FFFF */  addiu $a1, $zero, -1
/* 001C34 800F8214 0C00FA07 */  jal   func_8003E81C
/* 001C38 800F8218 24060002 */   addiu $a2, $zero, 2
/* 001C3C 800F821C 0C017764 */  jal   EndProcess
/* 001C40 800F8220 00002021 */   addu  $a0, $zero, $zero
/* 001C44 800F8224 8FBF0038 */  lw    $ra, 0x38($sp)
/* 001C48 800F8228 8FB50034 */  lw    $s5, 0x34($sp)
/* 001C4C 800F822C 8FB40030 */  lw    $s4, 0x30($sp)
/* 001C50 800F8230 8FB3002C */  lw    $s3, 0x2c($sp)
/* 001C54 800F8234 8FB20028 */  lw    $s2, 0x28($sp)
/* 001C58 800F8238 8FB10024 */  lw    $s1, 0x24($sp)
/* 001C5C 800F823C 8FB00020 */  lw    $s0, 0x20($sp)
/* 001C60 800F8240 03E00008 */  jr    $ra
/* 001C64 800F8244 27BD0040 */   addiu $sp, $sp, 0x40

/* 001C68 800F8248 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 001C6C 800F824C AFBF0020 */  sw    $ra, 0x20($sp)
/* 001C70 800F8250 AFB3001C */  sw    $s3, 0x1c($sp)
/* 001C74 800F8254 AFB20018 */  sw    $s2, 0x18($sp)
/* 001C78 800F8258 AFB10014 */  sw    $s1, 0x14($sp)
/* 001C7C 800F825C 0C0132CE */  jal   func_8004CB38
/* 001C80 800F8260 AFB00010 */   sw    $s0, 0x10($sp)
/* 001C84 800F8264 2404FFFF */  addiu $a0, $zero, -1
/* 001C88 800F8268 2442FFE6 */  addiu $v0, $v0, -0x1a
/* 001C8C 800F826C 00021400 */  sll   $v0, $v0, 0x10
/* 001C90 800F8270 00021C03 */  sra   $v1, $v0, 0x10
/* 001C94 800F8274 2C62002F */  sltiu $v0, $v1, 0x2f
/* 001C98 800F8278 10400026 */  beqz  $v0, .ov054_L800F8314
/* 001C9C 800F827C 00009021 */   addu  $s2, $zero, $zero
/* 001CA0 800F8280 00031080 */  sll   $v0, $v1, 2
/* 001CA4 800F8284 3C018010 */  lui   $at, 0x8010
/* 001CA8 800F8288 00220821 */  addu  $at, $at, $v0
/* 001CAC 800F828C 8C22A240 */  lw    $v0, -0x5dc0($at)
/* 001CB0 800F8290 00400008 */  jr    $v0
/* 001CB4 800F8294 00000000 */   nop   
/* 001CB8 800F8298 24040065 */  addiu $a0, $zero, 0x65
/* 001CBC 800F829C 24020001 */  addiu $v0, $zero, 1
/* 001CC0 800F82A0 3C01800F */  lui   $at, 0x800f
/* 001CC4 800F82A4 A422D154 */  sh    $v0, -0x2eac($at)
/* 001CC8 800F82A8 0803E0C5 */  j     ov054_func_800F8314
/* 001CCC 800F82AC 00009021 */   addu  $s2, $zero, $zero

/* 001CD0 800F82B0 24040068 */  addiu $a0, $zero, 0x68
/* 001CD4 800F82B4 3C01800F */  lui   $at, 0x800f
/* 001CD8 800F82B8 A420D154 */  sh    $zero, -0x2eac($at)
/* 001CDC 800F82BC 0803E0C5 */  j     ov054_func_800F8314
/* 001CE0 800F82C0 00009021 */   addu  $s2, $zero, $zero

/* 001CE4 800F82C4 24120001 */  addiu $s2, $zero, 1
/* 001CE8 800F82C8 3C01800F */  lui   $at, 0x800f
/* 001CEC 800F82CC A432D156 */  sh    $s2, -0x2eaa($at)
/* 001CF0 800F82D0 0803E0C5 */  j     ov054_func_800F8314
/* 001CF4 800F82D4 2404006C */   addiu $a0, $zero, 0x6c

/* 001CF8 800F82D8 24040066 */  addiu $a0, $zero, 0x66
/* 001CFC 800F82DC 3C01800F */  lui   $at, 0x800f
/* 001D00 800F82E0 A420D156 */  sh    $zero, -0x2eaa($at)
/* 001D04 800F82E4 0803E0C5 */  j     ov054_func_800F8314
/* 001D08 800F82E8 24120001 */   addiu $s2, $zero, 1

/* 001D0C 800F82EC 2404005E */  addiu $a0, $zero, 0x5e
/* 001D10 800F82F0 24020001 */  addiu $v0, $zero, 1
/* 001D14 800F82F4 3C01800F */  lui   $at, 0x800f
/* 001D18 800F82F8 A422D158 */  sh    $v0, -0x2ea8($at)
/* 001D1C 800F82FC 0803E0C5 */  j     ov054_func_800F8314
/* 001D20 800F8300 24120002 */   addiu $s2, $zero, 2

/* 001D24 800F8304 24040067 */  addiu $a0, $zero, 0x67
/* 001D28 800F8308 24120002 */  addiu $s2, $zero, 2
/* 001D2C 800F830C 3C01800F */  lui   $at, 0x800f
/* 001D30 800F8310 A420D158 */  sh    $zero, -0x2ea8($at)
ov054_func_800F8314:
.ov054_L800F8314:
/* 001D34 800F8314 00041400 */  sll   $v0, $a0, 0x10
/* 001D38 800F8318 00029C03 */  sra   $s3, $v0, 0x10
/* 001D3C 800F831C 1260001B */  beqz  $s3, .ov054_L800F838C
/* 001D40 800F8320 24054800 */   addiu $a1, $zero, 0x4800
/* 001D44 800F8324 3C048010 */  lui   $a0, 0x8010
/* 001D48 800F8328 24848114 */  addiu $a0, $a0, -0x7eec
/* 001D4C 800F832C 00003021 */  addu  $a2, $zero, $zero
/* 001D50 800F8330 0C01770A */  jal   InitProcess
/* 001D54 800F8334 24070040 */   addiu $a3, $zero, 0x40
/* 001D58 800F8338 00408021 */  addu  $s0, $v0, $zero
/* 001D5C 800F833C 8E040018 */  lw    $a0, 0x18($s0)
/* 001D60 800F8340 0C016628 */  jal   Malloc
/* 001D64 800F8344 2405000C */   addiu $a1, $zero, 0xc
/* 001D68 800F8348 00408821 */  addu  $s1, $v0, $zero
/* 001D6C 800F834C AE11008C */  sw    $s1, 0x8c($s0)
/* 001D70 800F8350 02408021 */  addu  $s0, $s2, $zero
/* 001D74 800F8354 00101080 */  sll   $v0, $s0, 2
/* 001D78 800F8358 3C018010 */  lui   $at, 0x8010
/* 001D7C 800F835C 00220821 */  addu  $at, $at, $v0
/* 001D80 800F8360 8C22A330 */  lw    $v0, -0x5cd0($at)
/* 001D84 800F8364 AE220000 */  sw    $v0, ($s1)
/* 001D88 800F8368 0C01307B */  jal   GetSpaceData
/* 001D8C 800F836C 02602021 */   addu  $a0, $s3, $zero
/* 001D90 800F8370 AE220004 */  sw    $v0, 4($s1)
/* 001D94 800F8374 00108040 */  sll   $s0, $s0, 1
/* 001D98 800F8378 3C048010 */  lui   $a0, 0x8010
/* 001D9C 800F837C 00902021 */  addu  $a0, $a0, $s0
/* 001DA0 800F8380 0C01307B */  jal   GetSpaceData
/* 001DA4 800F8384 8484997C */   lh    $a0, -0x6684($a0)
/* 001DA8 800F8388 AE220008 */  sw    $v0, 8($s1)
.ov054_L800F838C:
/* 001DAC 800F838C 0C017764 */  jal   EndProcess
/* 001DB0 800F8390 00002021 */   addu  $a0, $zero, $zero
/* 001DB4 800F8394 8FBF0020 */  lw    $ra, 0x20($sp)
/* 001DB8 800F8398 8FB3001C */  lw    $s3, 0x1c($sp)
/* 001DBC 800F839C 8FB20018 */  lw    $s2, 0x18($sp)
/* 001DC0 800F83A0 8FB10014 */  lw    $s1, 0x14($sp)
/* 001DC4 800F83A4 8FB00010 */  lw    $s0, 0x10($sp)
/* 001DC8 800F83A8 03E00008 */  jr    $ra
/* 001DCC 800F83AC 27BD0028 */   addiu $sp, $sp, 0x28

ov054_func_800F83B0:
/* 001DD0 800F83B0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001DD4 800F83B4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 001DD8 800F83B8 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 001DDC 800F83BC 2404000D */   addiu $a0, $zero, 0xd
/* 001DE0 800F83C0 14400008 */  bnez  $v0, .ov054_L800F83E4
/* 001DE4 800F83C4 00000000 */   nop   
/* 001DE8 800F83C8 0C01307B */  jal   GetSpaceData
/* 001DEC 800F83CC 2404006A */   addiu $a0, $zero, 0x6a
/* 001DF0 800F83D0 3C048010 */  lui   $a0, 0x8010
/* 001DF4 800F83D4 8C84A300 */  lw    $a0, -0x5d00($a0)
/* 001DF8 800F83D8 2484000C */  addiu $a0, $a0, 0xc
/* 001DFC 800F83DC 0C028354 */  jal   func_800A0D50
/* 001E00 800F83E0 24450004 */   addiu $a1, $v0, 4
.ov054_L800F83E4:
/* 001E04 800F83E4 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 001E08 800F83E8 24040048 */   addiu $a0, $zero, 0x48
/* 001E0C 800F83EC 14400008 */  bnez  $v0, .ov054_L800F8410
/* 001E10 800F83F0 00000000 */   nop   
/* 001E14 800F83F4 0C01307B */  jal   GetSpaceData
/* 001E18 800F83F8 24040069 */   addiu $a0, $zero, 0x69
/* 001E1C 800F83FC 3C048010 */  lui   $a0, 0x8010
/* 001E20 800F8400 8C84A318 */  lw    $a0, -0x5ce8($a0)
/* 001E24 800F8404 2484000C */  addiu $a0, $a0, 0xc
/* 001E28 800F8408 0C028354 */  jal   func_800A0D50
/* 001E2C 800F840C 24450004 */   addiu $a1, $v0, 4
.ov054_L800F8410:
/* 001E30 800F8410 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 001E34 800F8414 2404004A */   addiu $a0, $zero, 0x4a
/* 001E38 800F8418 14400008 */  bnez  $v0, .ov054_L800F843C
/* 001E3C 800F841C 00000000 */   nop   
/* 001E40 800F8420 0C01307B */  jal   GetSpaceData
/* 001E44 800F8424 2404006B */   addiu $a0, $zero, 0x6b
/* 001E48 800F8428 3C048010 */  lui   $a0, 0x8010
/* 001E4C 800F842C 8C84A320 */  lw    $a0, -0x5ce0($a0)
/* 001E50 800F8430 2484000C */  addiu $a0, $a0, 0xc
/* 001E54 800F8434 0C028354 */  jal   func_800A0D50
/* 001E58 800F8438 24450004 */   addiu $a1, $v0, 4
.ov054_L800F843C:
/* 001E5C 800F843C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 001E60 800F8440 03E00008 */  jr    $ra
/* 001E64 800F8444 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F8448:
/* 001E68 800F8448 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001E6C 800F844C AFBF0010 */  sw    $ra, 0x10($sp)
/* 001E70 800F8450 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 001E74 800F8454 2404000D */   addiu $a0, $zero, 0xd
/* 001E78 800F8458 14400008 */  bnez  $v0, .ov054_L800F847C
/* 001E7C 800F845C 00000000 */   nop   
/* 001E80 800F8460 0C01307B */  jal   GetSpaceData
/* 001E84 800F8464 24040070 */   addiu $a0, $zero, 0x70
/* 001E88 800F8468 3C048010 */  lui   $a0, 0x8010
/* 001E8C 800F846C 8C84A300 */  lw    $a0, -0x5d00($a0)
/* 001E90 800F8470 2484000C */  addiu $a0, $a0, 0xc
/* 001E94 800F8474 0C028354 */  jal   func_800A0D50
/* 001E98 800F8478 24450004 */   addiu $a1, $v0, 4
.ov054_L800F847C:
/* 001E9C 800F847C 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 001EA0 800F8480 24040048 */   addiu $a0, $zero, 0x48
/* 001EA4 800F8484 14400008 */  bnez  $v0, .ov054_L800F84A8
/* 001EA8 800F8488 00000000 */   nop   
/* 001EAC 800F848C 0C01307B */  jal   GetSpaceData
/* 001EB0 800F8490 2404006D */   addiu $a0, $zero, 0x6d
/* 001EB4 800F8494 3C048010 */  lui   $a0, 0x8010
/* 001EB8 800F8498 8C84A318 */  lw    $a0, -0x5ce8($a0)
/* 001EBC 800F849C 2484000C */  addiu $a0, $a0, 0xc
/* 001EC0 800F84A0 0C028354 */  jal   func_800A0D50
/* 001EC4 800F84A4 24450004 */   addiu $a1, $v0, 4
.ov054_L800F84A8:
/* 001EC8 800F84A8 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 001ECC 800F84AC 2404004A */   addiu $a0, $zero, 0x4a
/* 001ED0 800F84B0 14400008 */  bnez  $v0, .ov054_L800F84D4
/* 001ED4 800F84B4 00000000 */   nop   
/* 001ED8 800F84B8 0C01307B */  jal   GetSpaceData
/* 001EDC 800F84BC 24040071 */   addiu $a0, $zero, 0x71
/* 001EE0 800F84C0 3C048010 */  lui   $a0, 0x8010
/* 001EE4 800F84C4 8C84A320 */  lw    $a0, -0x5ce0($a0)
/* 001EE8 800F84C8 2484000C */  addiu $a0, $a0, 0xc
/* 001EEC 800F84CC 0C028354 */  jal   func_800A0D50
/* 001EF0 800F84D0 24450004 */   addiu $a1, $v0, 4
.ov054_L800F84D4:
/* 001EF4 800F84D4 8FBF0010 */  lw    $ra, 0x10($sp)
/* 001EF8 800F84D8 03E00008 */  jr    $ra
/* 001EFC 800F84DC 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F84E0:
/* 001F00 800F84E0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001F04 800F84E4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 001F08 800F84E8 24040004 */  addiu $a0, $zero, 4
/* 001F0C 800F84EC 0C01C9AB */  jal   func_800726AC
/* 001F10 800F84F0 24050010 */   addiu $a1, $zero, 0x10
/* 001F14 800F84F4 0C018D54 */  jal   SleepProcess
/* 001F18 800F84F8 24040010 */   addiu $a0, $zero, 0x10
/* 001F1C 800F84FC 0C03E0EC */  jal   ov054_func_800F83B0
/* 001F20 800F8500 00000000 */   nop   
/* 001F24 800F8504 0C0129F7 */  jal   func_8004A7DC
/* 001F28 800F8508 00000000 */   nop   
/* 001F2C 800F850C 0C0129E9 */  jal   func_8004A7A4
/* 001F30 800F8510 00000000 */   nop   
/* 001F34 800F8514 0C012E11 */  jal   func_8004B844
/* 001F38 800F8518 00000000 */   nop   
/* 001F3C 800F851C 3C018010 */  lui   $at, 0x8010
/* 001F40 800F8520 E420A364 */  swc1  $f0, -0x5c9c($at)
/* 001F44 800F8524 3C01BF80 */  lui   $at, 0xbf80
/* 001F48 800F8528 44816000 */  mtc1  $at, $f12
/* 001F4C 800F852C 0C012E0E */  jal   func_8004B838
/* 001F50 800F8530 00000000 */   nop   
/* 001F54 800F8534 0C012D74 */  jal   func_8004B5D0
/* 001F58 800F8538 00000000 */   nop   
/* 001F5C 800F853C 3C018010 */  lui   $at, 0x8010
/* 001F60 800F8540 E420A368 */  swc1  $f0, -0x5c98($at)
/* 001F64 800F8544 3C013F80 */  lui   $at, 0x3f80
/* 001F68 800F8548 44816000 */  mtc1  $at, $f12
/* 001F6C 800F854C 0C012D71 */  jal   func_8004B5C4
/* 001F70 800F8550 00000000 */   nop   
/* 001F74 800F8554 0C012944 */  jal   func_8004A510
/* 001F78 800F8558 00000000 */   nop   
/* 001F7C 800F855C 0C01307B */  jal   GetSpaceData
/* 001F80 800F8560 00002021 */   addu  $a0, $zero, $zero
/* 001F84 800F8564 0C012D77 */  jal   func_8004B5DC
/* 001F88 800F8568 24440004 */   addiu $a0, $v0, 4
/* 001F8C 800F856C 0C018D6D */  jal   SleepVProcess
/* 001F90 800F8570 00000000 */   nop   
/* 001F94 800F8574 0C012948 */  jal   func_8004A520
/* 001F98 800F8578 00000000 */   nop   
/* 001F9C 800F857C 3C018010 */  lui   $at, 0x8010
/* 001FA0 800F8580 0C012D71 */  jal   func_8004B5C4
/* 001FA4 800F8584 C42CA368 */   lwc1  $f12, -0x5c98($at)
/* 001FA8 800F8588 3C018010 */  lui   $at, 0x8010
/* 001FAC 800F858C 0C012E0E */  jal   func_8004B838
/* 001FB0 800F8590 C42CA364 */   lwc1  $f12, -0x5c9c($at)
/* 001FB4 800F8594 0C010878 */  jal   func_800421E0
/* 001FB8 800F8598 00000000 */   nop   
/* 001FBC 800F859C 24040004 */  addiu $a0, $zero, 4
/* 001FC0 800F85A0 0C01C991 */  jal   func_80072644
/* 001FC4 800F85A4 24050010 */   addiu $a1, $zero, 0x10
/* 001FC8 800F85A8 0C018D54 */  jal   SleepProcess
/* 001FCC 800F85AC 24040010 */   addiu $a0, $zero, 0x10
/* 001FD0 800F85B0 8FBF0010 */  lw    $ra, 0x10($sp)
/* 001FD4 800F85B4 03E00008 */  jr    $ra
/* 001FD8 800F85B8 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F85BC:
/* 001FDC 800F85BC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 001FE0 800F85C0 AFBF0010 */  sw    $ra, 0x10($sp)
/* 001FE4 800F85C4 24040004 */  addiu $a0, $zero, 4
/* 001FE8 800F85C8 0C01C9AB */  jal   func_800726AC
/* 001FEC 800F85CC 24050010 */   addiu $a1, $zero, 0x10
/* 001FF0 800F85D0 0C018D54 */  jal   SleepProcess
/* 001FF4 800F85D4 24040010 */   addiu $a0, $zero, 0x10
/* 001FF8 800F85D8 0C03E112 */  jal   ov054_func_800F8448
/* 001FFC 800F85DC 00000000 */   nop   
/* 002000 800F85E0 0C0129F7 */  jal   func_8004A7DC
/* 002004 800F85E4 00000000 */   nop   
/* 002008 800F85E8 0C0129E9 */  jal   func_8004A7A4
/* 00200C 800F85EC 00000000 */   nop   
/* 002010 800F85F0 0C012E11 */  jal   func_8004B844
/* 002014 800F85F4 00000000 */   nop   
/* 002018 800F85F8 3C018010 */  lui   $at, 0x8010
/* 00201C 800F85FC E420A364 */  swc1  $f0, -0x5c9c($at)
/* 002020 800F8600 3C01BF80 */  lui   $at, 0xbf80
/* 002024 800F8604 44816000 */  mtc1  $at, $f12
/* 002028 800F8608 0C012E0E */  jal   func_8004B838
/* 00202C 800F860C 00000000 */   nop   
/* 002030 800F8610 0C012D74 */  jal   func_8004B5D0
/* 002034 800F8614 00000000 */   nop   
/* 002038 800F8618 3C018010 */  lui   $at, 0x8010
/* 00203C 800F861C E420A368 */  swc1  $f0, -0x5c98($at)
/* 002040 800F8620 3C013F80 */  lui   $at, 0x3f80
/* 002044 800F8624 44816000 */  mtc1  $at, $f12
/* 002048 800F8628 0C012D71 */  jal   func_8004B5C4
/* 00204C 800F862C 00000000 */   nop   
/* 002050 800F8630 0C012944 */  jal   func_8004A510
/* 002054 800F8634 00000000 */   nop   
/* 002058 800F8638 0C014AA3 */  jal   GetPlayerStruct
/* 00205C 800F863C 2404FFFF */   addiu $a0, $zero, -1
/* 002060 800F8640 8C440020 */  lw    $a0, 0x20($v0)
/* 002064 800F8644 0C012D77 */  jal   func_8004B5DC
/* 002068 800F8648 2484000C */   addiu $a0, $a0, 0xc
/* 00206C 800F864C 0C018D6D */  jal   SleepVProcess
/* 002070 800F8650 00000000 */   nop   
/* 002074 800F8654 0C012948 */  jal   func_8004A520
/* 002078 800F8658 00000000 */   nop   
/* 00207C 800F865C 3C018010 */  lui   $at, 0x8010
/* 002080 800F8660 0C012D71 */  jal   func_8004B5C4
/* 002084 800F8664 C42CA368 */   lwc1  $f12, -0x5c98($at)
/* 002088 800F8668 3C018010 */  lui   $at, 0x8010
/* 00208C 800F866C 0C012E0E */  jal   func_8004B838
/* 002090 800F8670 C42CA364 */   lwc1  $f12, -0x5c9c($at)
/* 002094 800F8674 0C010883 */  jal   func_8004220C
/* 002098 800F8678 00000000 */   nop   
/* 00209C 800F867C 24040004 */  addiu $a0, $zero, 4
/* 0020A0 800F8680 0C01C991 */  jal   func_80072644
/* 0020A4 800F8684 24050010 */   addiu $a1, $zero, 0x10
/* 0020A8 800F8688 0C018D54 */  jal   SleepProcess
/* 0020AC 800F868C 24040010 */   addiu $a0, $zero, 0x10
/* 0020B0 800F8690 8FBF0010 */  lw    $ra, 0x10($sp)
/* 0020B4 800F8694 03E00008 */  jr    $ra
/* 0020B8 800F8698 27BD0018 */   addiu $sp, $sp, 0x18

/* 0020BC 800F869C 27BDFFA8 */  addiu $sp, $sp, -0x58
/* 0020C0 800F86A0 AFBF004C */  sw    $ra, 0x4c($sp)
/* 0020C4 800F86A4 AFBE0048 */  sw    $fp, 0x48($sp)
/* 0020C8 800F86A8 AFB70044 */  sw    $s7, 0x44($sp)
/* 0020CC 800F86AC AFB60040 */  sw    $s6, 0x40($sp)
/* 0020D0 800F86B0 AFB5003C */  sw    $s5, 0x3c($sp)
/* 0020D4 800F86B4 AFB40038 */  sw    $s4, 0x38($sp)
/* 0020D8 800F86B8 AFB30034 */  sw    $s3, 0x34($sp)
/* 0020DC 800F86BC AFB20030 */  sw    $s2, 0x30($sp)
/* 0020E0 800F86C0 AFB1002C */  sw    $s1, 0x2c($sp)
/* 0020E4 800F86C4 AFB00028 */  sw    $s0, 0x28($sp)
/* 0020E8 800F86C8 F7B40050 */  sdc1  $f20, 0x50($sp)
/* 0020EC 800F86CC 0C018CEA */  jal   func_800633A8
/* 0020F0 800F86D0 00009821 */   addu  $s3, $zero, $zero
/* 0020F4 800F86D4 8C51008C */  lw    $s1, 0x8c($v0)
/* 0020F8 800F86D8 8E320020 */  lw    $s2, 0x20($s1)
/* 0020FC 800F86DC 3C168010 */  lui   $s6, 0x8010
/* 002100 800F86E0 8ED6A370 */  lw    $s6, -0x5c90($s6)
/* 002104 800F86E4 0C018CEA */  jal   func_800633A8
/* 002108 800F86E8 26D0000C */   addiu $s0, $s6, 0xc
/* 00210C 800F86EC 0040F021 */  addu  $fp, $v0, $zero
/* 002110 800F86F0 92240018 */  lbu   $a0, 0x18($s1)
/* 002114 800F86F4 00002821 */  addu  $a1, $zero, $zero
/* 002118 800F86F8 0C016293 */  jal   func_80058A4C
/* 00211C 800F86FC 2406000A */   addiu $a2, $zero, 0xa
/* 002120 800F8700 AFA20024 */  sw    $v0, 0x24($sp)
/* 002124 800F8704 3C01439B */  lui   $at, 0x439b
/* 002128 800F8708 4481A000 */  mtc1  $at, $f20
ov054_func_800F870C:
/* 00212C 800F870C 9624000E */  lhu   $a0, 0xe($s1)
/* 002130 800F8710 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 002134 800F8714 96250010 */   lhu   $a1, 0x10($s1)
/* 002138 800F8718 00021400 */  sll   $v0, $v0, 0x10
/* 00213C 800F871C 0C01307B */  jal   GetSpaceData
/* 002140 800F8720 00022403 */   sra   $a0, $v0, 0x10
/* 002144 800F8724 24440004 */  addiu $a0, $v0, 4
/* 002148 800F8728 0C0284F0 */  jal   func_800A13C0
/* 00214C 800F872C 02002821 */   addu  $a1, $s0, $zero
/* 002150 800F8730 4614003C */  c.lt.s $f0, $f20
/* 002154 800F8734 00000000 */  nop   
/* 002158 800F8738 00000000 */  nop   
/* 00215C 800F873C 45010008 */  bc1t  .ov054_L800F8760
/* 002160 800F8740 2644000C */   addiu $a0, $s2, 0xc
/* 002164 800F8744 02002821 */  addu  $a1, $s0, $zero
/* 002168 800F8748 0C013334 */  jal   func_8004CCD0
/* 00216C 800F874C 26460018 */   addiu $a2, $s2, 0x18
/* 002170 800F8750 0C018D6D */  jal   SleepVProcess
/* 002174 800F8754 00000000 */   nop   
/* 002178 800F8758 0803E1C3 */  j     ov054_func_800F870C
/* 00217C 800F875C 00000000 */   nop   

.ov054_L800F8760:
/* 002180 800F8760 92250018 */  lbu   $a1, 0x18($s1)
/* 002184 800F8764 0C018186 */  jal   func_80060618
/* 002188 800F8768 2404045F */   addiu $a0, $zero, 0x45f
/* 00218C 800F876C 9624000E */  lhu   $a0, 0xe($s1)
/* 002190 800F8770 0C01308C */  jal   GetChainLength
/* 002194 800F8774 00000000 */   nop   
/* 002198 800F8778 96230010 */  lhu   $v1, 0x10($s1)
/* 00219C 800F877C 00438023 */  subu  $s0, $v0, $v1
/* 0021A0 800F8780 0200A021 */  addu  $s4, $s0, $zero
/* 0021A4 800F8784 92240018 */  lbu   $a0, 0x18($s1)
/* 0021A8 800F8788 24050001 */  addiu $a1, $zero, 1
/* 0021AC 800F878C 0C014AFA */  jal   func_80052BE8
/* 0021B0 800F8790 24060002 */   addiu $a2, $zero, 2
/* 0021B4 800F8794 00108400 */  sll   $s0, $s0, 0x10
/* 0021B8 800F8798 1A000061 */  blez  $s0, .ov054_L800F8920
/* 0021BC 800F879C 00141400 */   sll   $v0, $s4, 0x10
/* 0021C0 800F87A0 24170001 */  addiu $s7, $zero, 1
/* 0021C4 800F87A4 26550018 */  addiu $s5, $s2, 0x18
/* 0021C8 800F87A8 2650000C */  addiu $s0, $s2, 0xc
.ov054_L800F87AC:
/* 0021CC 800F87AC 00021403 */  sra   $v0, $v0, 0x10
/* 0021D0 800F87B0 14570006 */  bne   $v0, $s7, .ov054_L800F87CC
/* 0021D4 800F87B4 00131400 */   sll   $v0, $s3, 0x10
/* 0021D8 800F87B8 92240018 */  lbu   $a0, 0x18($s1)
/* 0021DC 800F87BC 24050009 */  addiu $a1, $zero, 9
/* 0021E0 800F87C0 0C013611 */  jal   SetNextChainAndSpace
/* 0021E4 800F87C4 24060001 */   addiu $a2, $zero, 1
/* 0021E8 800F87C8 00131400 */  sll   $v0, $s3, 0x10
.ov054_L800F87CC:
/* 0021EC 800F87CC 00021403 */  sra   $v0, $v0, 0x10
/* 0021F0 800F87D0 2403007C */  addiu $v1, $zero, 0x7c
/* 0021F4 800F87D4 1443000E */  bne   $v0, $v1, .ov054_L800F8810
/* 0021F8 800F87D8 00131400 */   sll   $v0, $s3, 0x10
/* 0021FC 800F87DC 3C014220 */  lui   $at, 0x4220
/* 002200 800F87E0 44810000 */  mtc1  $at, $f0
/* 002204 800F87E4 00000000 */  nop   
/* 002208 800F87E8 E6400034 */  swc1  $f0, 0x34($s2)
/* 00220C 800F87EC 3C01C0A0 */  lui   $at, 0xc0a0
/* 002210 800F87F0 44810000 */  mtc1  $at, $f0
/* 002214 800F87F4 00000000 */  nop   
/* 002218 800F87F8 E6400038 */  swc1  $f0, 0x38($s2)
/* 00221C 800F87FC 92240018 */  lbu   $a0, 0x18($s1)
/* 002220 800F8800 24050002 */  addiu $a1, $zero, 2
/* 002224 800F8804 0C014AFA */  jal   func_80052BE8
/* 002228 800F8808 00003021 */   addu  $a2, $zero, $zero
/* 00222C 800F880C 00131400 */  sll   $v0, $s3, 0x10
.ov054_L800F8810:
/* 002230 800F8810 00021403 */  sra   $v0, $v0, 0x10
/* 002234 800F8814 24030024 */  addiu $v1, $zero, 0x24
/* 002238 800F8818 14430013 */  bne   $v0, $v1, .ov054_L800F8868
/* 00223C 800F881C 2405FFFF */   addiu $a1, $zero, -1
/* 002240 800F8820 92240018 */  lbu   $a0, 0x18($s1)
/* 002244 800F8824 0C014AFA */  jal   func_80052BE8
/* 002248 800F8828 24060002 */   addiu $a2, $zero, 2
/* 00224C 800F882C 27A40010 */  addiu $a0, $sp, 0x10
/* 002250 800F8830 26C5000C */  addiu $a1, $s6, 0xc
/* 002254 800F8834 0C0283A0 */  jal   func_800A0E80
/* 002258 800F8838 2646000C */   addiu $a2, $s2, 0xc
/* 00225C 800F883C 02A02021 */  addu  $a0, $s5, $zero
/* 002260 800F8840 27A50010 */  addiu $a1, $sp, 0x10
/* 002264 800F8844 02A03021 */  addu  $a2, $s5, $zero
/* 002268 800F8848 0C01347B */  jal   func_8004D1EC
/* 00226C 800F884C 24070008 */   addiu $a3, $zero, 8
/* 002270 800F8850 0C018D54 */  jal   SleepProcess
/* 002274 800F8854 2404001E */   addiu $a0, $zero, 0x1e
/* 002278 800F8858 92240018 */  lbu   $a0, 0x18($s1)
/* 00227C 800F885C 24050001 */  addiu $a1, $zero, 1
/* 002280 800F8860 0C014AFA */  jal   func_80052BE8
/* 002284 800F8864 24060002 */   addiu $a2, $zero, 2
.ov054_L800F8868:
/* 002288 800F8868 8E220020 */  lw    $v0, 0x20($s1)
/* 00228C 800F886C 44801000 */  mtc1  $zero, $f2
/* 002290 800F8870 C4400038 */  lwc1  $f0, 0x38($v0)
/* 002294 800F8874 46020032 */  c.eq.s $f0, $f2
/* 002298 800F8878 00000000 */  nop   
/* 00229C 800F887C 45000008 */  bc1f  .ov054_L800F88A0
/* 0022A0 800F8880 00000000 */   nop   
/* 0022A4 800F8884 84420046 */  lh    $v0, 0x46($v0)
/* 0022A8 800F8888 10570005 */  beq   $v0, $s7, .ov054_L800F88A0
/* 0022AC 800F888C 00000000 */   nop   
/* 0022B0 800F8890 92240018 */  lbu   $a0, 0x18($s1)
/* 0022B4 800F8894 24050001 */  addiu $a1, $zero, 1
/* 0022B8 800F8898 0C014AFA */  jal   func_80052BE8
/* 0022BC 800F889C 24060002 */   addiu $a2, $zero, 2
.ov054_L800F88A0:
/* 0022C0 800F88A0 96240012 */  lhu   $a0, 0x12($s1)
/* 0022C4 800F88A4 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 0022C8 800F88A8 96250014 */   lhu   $a1, 0x14($s1)
/* 0022CC 800F88AC 00409821 */  addu  $s3, $v0, $zero
/* 0022D0 800F88B0 00132C00 */  sll   $a1, $s3, 0x10
/* 0022D4 800F88B4 92240018 */  lbu   $a0, 0x18($s1)
/* 0022D8 800F88B8 00052C03 */  sra   $a1, $a1, 0x10
/* 0022DC 800F88BC 0C0132DC */  jal   func_8004CB70
/* 0022E0 800F88C0 27A60010 */   addiu $a2, $sp, 0x10
/* 0022E4 800F88C4 02002021 */  addu  $a0, $s0, $zero
/* 0022E8 800F88C8 27A50010 */  addiu $a1, $sp, 0x10
/* 0022EC 800F88CC 0C013334 */  jal   func_8004CCD0
/* 0022F0 800F88D0 26460018 */   addiu $a2, $s2, 0x18
/* 0022F4 800F88D4 02002021 */  addu  $a0, $s0, $zero
/* 0022F8 800F88D8 27A50010 */  addiu $a1, $sp, 0x10
/* 0022FC 800F88DC 3C0741A0 */  lui   $a3, 0x41a0
/* 002300 800F88E0 0C013592 */  jal   func_8004D648
/* 002304 800F88E4 02003021 */   addu  $a2, $s0, $zero
/* 002308 800F88E8 03C02021 */  addu  $a0, $fp, $zero
/* 00230C 800F88EC 0C018C9C */  jal   func_80063270
/* 002310 800F88F0 00402821 */   addu  $a1, $v0, $zero
/* 002314 800F88F4 0C018CD6 */  jal   func_80063358
/* 002318 800F88F8 00000000 */   nop   
/* 00231C 800F88FC 92240018 */  lbu   $a0, 0x18($s1)
/* 002320 800F8900 86250012 */  lh    $a1, 0x12($s1)
/* 002324 800F8904 0C0135F6 */  jal   SetPlayerOntoChain
/* 002328 800F8908 86260014 */   lh    $a2, 0x14($s1)
/* 00232C 800F890C 2682FFFF */  addiu $v0, $s4, -1
/* 002330 800F8910 0040A021 */  addu  $s4, $v0, $zero
/* 002334 800F8914 00021400 */  sll   $v0, $v0, 0x10
/* 002338 800F8918 1C40FFA4 */  bgtz  $v0, .ov054_L800F87AC
/* 00233C 800F891C 00141400 */   sll   $v0, $s4, 0x10
.ov054_L800F8920:
/* 002340 800F8920 92240018 */  lbu   $a0, 0x18($s1)
/* 002344 800F8924 2405FFFF */  addiu $a1, $zero, -1
/* 002348 800F8928 0C014AFA */  jal   func_80052BE8
/* 00234C 800F892C 24060002 */   addiu $a2, $zero, 2
/* 002350 800F8930 8FA40024 */  lw    $a0, 0x24($sp)
/* 002354 800F8934 0C0162B4 */  jal   func_80058AD0
/* 002358 800F8938 00000000 */   nop   
/* 00235C 800F893C 0C017764 */  jal   EndProcess
/* 002360 800F8940 00002021 */   addu  $a0, $zero, $zero
/* 002364 800F8944 8FBF004C */  lw    $ra, 0x4c($sp)
/* 002368 800F8948 8FBE0048 */  lw    $fp, 0x48($sp)
/* 00236C 800F894C 8FB70044 */  lw    $s7, 0x44($sp)
/* 002370 800F8950 8FB60040 */  lw    $s6, 0x40($sp)
/* 002374 800F8954 8FB5003C */  lw    $s5, 0x3c($sp)
/* 002378 800F8958 8FB40038 */  lw    $s4, 0x38($sp)
/* 00237C 800F895C 8FB30034 */  lw    $s3, 0x34($sp)
/* 002380 800F8960 8FB20030 */  lw    $s2, 0x30($sp)
/* 002384 800F8964 8FB1002C */  lw    $s1, 0x2c($sp)
/* 002388 800F8968 8FB00028 */  lw    $s0, 0x28($sp)
/* 00238C 800F896C D7B40050 */  ldc1  $f20, 0x50($sp)
/* 002390 800F8970 03E00008 */  jr    $ra
/* 002394 800F8974 27BD0058 */   addiu $sp, $sp, 0x58

/* 002398 800F8978 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 00239C 800F897C AFBF0014 */  sw    $ra, 0x14($sp)
/* 0023A0 800F8980 0C015B8F */  jal   func_80056E3C
/* 0023A4 800F8984 AFB00010 */   sw    $s0, 0x10($sp)
/* 0023A8 800F8988 00408021 */  addu  $s0, $v0, $zero
/* 0023AC 800F898C 0C015B8C */  jal   func_80056E30
/* 0023B0 800F8990 00002021 */   addu  $a0, $zero, $zero
/* 0023B4 800F8994 0C03E138 */  jal   ov054_func_800F84E0
/* 0023B8 800F8998 00000000 */   nop   
/* 0023BC 800F899C 3C028010 */  lui   $v0, 0x8010
/* 0023C0 800F89A0 8C42A370 */  lw    $v0, -0x5c90($v0)
/* 0023C4 800F89A4 1040000B */  beqz  $v0, .ov054_L800F89D4
/* 0023C8 800F89A8 00000000 */   nop   
.ov054_L800F89AC:
/* 0023CC 800F89AC 3C048010 */  lui   $a0, 0x8010
/* 0023D0 800F89B0 8C84A370 */  lw    $a0, -0x5c90($a0)
/* 0023D4 800F89B4 0C012D77 */  jal   func_8004B5DC
/* 0023D8 800F89B8 2484000C */   addiu $a0, $a0, 0xc
/* 0023DC 800F89BC 0C018D6D */  jal   SleepVProcess
/* 0023E0 800F89C0 00000000 */   nop   
/* 0023E4 800F89C4 3C028010 */  lui   $v0, 0x8010
/* 0023E8 800F89C8 8C42A370 */  lw    $v0, -0x5c90($v0)
/* 0023EC 800F89CC 1440FFF7 */  bnez  $v0, .ov054_L800F89AC
/* 0023F0 800F89D0 00000000 */   nop   
.ov054_L800F89D4:
/* 0023F4 800F89D4 0C03E16F */  jal   ov054_func_800F85BC
/* 0023F8 800F89D8 00000000 */   nop   
/* 0023FC 800F89DC 00102400 */  sll   $a0, $s0, 0x10
/* 002400 800F89E0 0C015B8C */  jal   func_80056E30
/* 002404 800F89E4 00042403 */   sra   $a0, $a0, 0x10
/* 002408 800F89E8 0C017764 */  jal   EndProcess
/* 00240C 800F89EC 00002021 */   addu  $a0, $zero, $zero
/* 002410 800F89F0 8FBF0014 */  lw    $ra, 0x14($sp)
/* 002414 800F89F4 8FB00010 */  lw    $s0, 0x10($sp)
/* 002418 800F89F8 03E00008 */  jr    $ra
/* 00241C 800F89FC 27BD0018 */   addiu $sp, $sp, 0x18

/* 002420 800F8A00 27BDFFB0 */  addiu $sp, $sp, -0x50
/* 002424 800F8A04 AFBF0044 */  sw    $ra, 0x44($sp)
/* 002428 800F8A08 AFBE0040 */  sw    $fp, 0x40($sp)
/* 00242C 800F8A0C AFB7003C */  sw    $s7, 0x3c($sp)
/* 002430 800F8A10 AFB60038 */  sw    $s6, 0x38($sp)
/* 002434 800F8A14 AFB50034 */  sw    $s5, 0x34($sp)
/* 002438 800F8A18 AFB40030 */  sw    $s4, 0x30($sp)
/* 00243C 800F8A1C AFB3002C */  sw    $s3, 0x2c($sp)
/* 002440 800F8A20 AFB20028 */  sw    $s2, 0x28($sp)
/* 002444 800F8A24 AFB10024 */  sw    $s1, 0x24($sp)
/* 002448 800F8A28 AFB00020 */  sw    $s0, 0x20($sp)
/* 00244C 800F8A2C F7B40048 */  sdc1  $f20, 0x48($sp)
/* 002450 800F8A30 0C018CEA */  jal   func_800633A8
/* 002454 800F8A34 00009821 */   addu  $s3, $zero, $zero
/* 002458 800F8A38 0040F021 */  addu  $fp, $v0, $zero
/* 00245C 800F8A3C 00008821 */  addu  $s1, $zero, $zero
/* 002460 800F8A40 24120011 */  addiu $s2, $zero, 0x11
.ov054_L800F8A44:
/* 002464 800F8A44 0C014AA3 */  jal   GetPlayerStruct
/* 002468 800F8A48 02602021 */   addu  $a0, $s3, $zero
/* 00246C 800F8A4C 00408021 */  addu  $s0, $v0, $zero
/* 002470 800F8A50 9604000E */  lhu   $a0, 0xe($s0)
/* 002474 800F8A54 0C013081 */  jal   GetAbsSpaceIndexFromChainSpaceIndex
/* 002478 800F8A58 96050010 */   lhu   $a1, 0x10($s0)
/* 00247C 800F8A5C 00021400 */  sll   $v0, $v0, 0x10
/* 002480 800F8A60 00022403 */  sra   $a0, $v0, 0x10
/* 002484 800F8A64 0C013093 */  jal   GetChainSpaceIndexFromAbsSpaceIndex
/* 002488 800F8A68 24050011 */   addiu $a1, $zero, 0x11
/* 00248C 800F8A6C 00401821 */  addu  $v1, $v0, $zero
/* 002490 800F8A70 00031400 */  sll   $v0, $v1, 0x10
/* 002494 800F8A74 0440000D */  bltz  $v0, .ov054_L800F8AAC
/* 002498 800F8A78 24620001 */   addiu $v0, $v1, 1
/* 00249C 800F8A7C A612000E */  sh    $s2, 0xe($s0)
/* 0024A0 800F8A80 A6030010 */  sh    $v1, 0x10($s0)
/* 0024A4 800F8A84 A6120012 */  sh    $s2, 0x12($s0)
/* 0024A8 800F8A88 A6020014 */  sh    $v0, 0x14($s0)
/* 0024AC 800F8A8C 3C048010 */  lui   $a0, 0x8010
/* 0024B0 800F8A90 2484869C */  addiu $a0, $a0, -0x7964
/* 0024B4 800F8A94 24054800 */  addiu $a1, $zero, 0x4800
/* 0024B8 800F8A98 00003021 */  addu  $a2, $zero, $zero
/* 0024BC 800F8A9C 0C01770A */  jal   InitProcess
/* 0024C0 800F8AA0 00003821 */   addu  $a3, $zero, $zero
/* 0024C4 800F8AA4 AC50008C */  sw    $s0, 0x8c($v0)
/* 0024C8 800F8AA8 26310001 */  addiu $s1, $s1, 1
.ov054_L800F8AAC:
/* 0024CC 800F8AAC 26730001 */  addiu $s3, $s3, 1
/* 0024D0 800F8AB0 2A620004 */  slti  $v0, $s3, 4
/* 0024D4 800F8AB4 1440FFE3 */  bnez  $v0, .ov054_L800F8A44
/* 0024D8 800F8AB8 00000000 */   nop   
/* 0024DC 800F8ABC 1620002E */  bnez  $s1, .ov054_L800F8B78
/* 0024E0 800F8AC0 00000000 */   nop   
/* 0024E4 800F8AC4 0C014AA3 */  jal   GetPlayerStruct
/* 0024E8 800F8AC8 2404FFFF */   addiu $a0, $zero, -1
/* 0024EC 800F8ACC 8C520020 */  lw    $s2, 0x20($v0)
/* 0024F0 800F8AD0 0C013361 */  jal   func_8004CD84
/* 0024F4 800F8AD4 27A40010 */   addiu $a0, $sp, 0x10
/* 0024F8 800F8AD8 27A40010 */  addiu $a0, $sp, 0x10
/* 0024FC 800F8ADC 0C00F545 */  jal   func_8003D514
/* 002500 800F8AE0 00002821 */   addu  $a1, $zero, $zero
/* 002504 800F8AE4 26460018 */  addiu $a2, $s2, 0x18
/* 002508 800F8AE8 00C02021 */  addu  $a0, $a2, $zero
/* 00250C 800F8AEC 27A50010 */  addiu $a1, $sp, 0x10
/* 002510 800F8AF0 0C01347B */  jal   func_8004D1EC
/* 002514 800F8AF4 24070006 */   addiu $a3, $zero, 6
/* 002518 800F8AF8 03C02021 */  addu  $a0, $fp, $zero
/* 00251C 800F8AFC 0C018C9C */  jal   func_80063270
/* 002520 800F8B00 00402821 */   addu  $a1, $v0, $zero
/* 002524 800F8B04 0C018CD6 */  jal   func_80063358
/* 002528 800F8B08 00000000 */   nop   
/* 00252C 800F8B0C 2404004B */  addiu $a0, $zero, 0x4b
/* 002530 800F8B10 24050040 */  addiu $a1, $zero, 0x40
/* 002534 800F8B14 2406000E */  addiu $a2, $zero, 0xe
/* 002538 800F8B18 0C01364C */  jal   CreateTextWindow
/* 00253C 800F8B1C 24070001 */   addiu $a3, $zero, 1
/* 002540 800F8B20 00028400 */  sll   $s0, $v0, 0x10
/* 002544 800F8B24 00108403 */  sra   $s0, $s0, 0x10
/* 002548 800F8B28 02002021 */  addu  $a0, $s0, $zero
/* 00254C 800F8B2C 24050194 */  addiu $a1, $zero, 0x194
/* 002550 800F8B30 2406FFFF */  addiu $a2, $zero, -1
/* 002554 800F8B34 0C01B5F6 */  jal   LoadStringIntoWindow
/* 002558 800F8B38 2407FFFF */   addiu $a3, $zero, -1
/* 00255C 800F8B3C 02002021 */  addu  $a0, $s0, $zero
/* 002560 800F8B40 0C01B81C */  jal   SetTextCharsPerFrame
/* 002564 800F8B44 00002821 */   addu  $a1, $zero, $zero
/* 002568 800F8B48 0C013676 */  jal   ShowTextWindow
/* 00256C 800F8B4C 02002021 */   addu  $a0, $s0, $zero
/* 002570 800F8B50 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 002574 800F8B54 00000000 */   nop   
/* 002578 800F8B58 00021400 */  sll   $v0, $v0, 0x10
/* 00257C 800F8B5C 02002021 */  addu  $a0, $s0, $zero
/* 002580 800F8B60 0C0136F5 */  jal   func_8004DBD4
/* 002584 800F8B64 00022C03 */   sra   $a1, $v0, 0x10
/* 002588 800F8B68 0C0136B4 */  jal   HideTextWindow
/* 00258C 800F8B6C 02002021 */   addu  $a0, $s0, $zero
/* 002590 800F8B70 0C017764 */  jal   EndProcess
/* 002594 800F8B74 00002021 */   addu  $a0, $zero, $zero
.ov054_L800F8B78:
/* 002598 800F8B78 3C018010 */  lui   $at, 0x8010
/* 00259C 800F8B7C A420A36C */  sh    $zero, -0x5c94($at)
/* 0025A0 800F8B80 3C018010 */  lui   $at, 0x8010
/* 0025A4 800F8B84 AC20A370 */  sw    $zero, -0x5c90($at)
/* 0025A8 800F8B88 3C048010 */  lui   $a0, 0x8010
/* 0025AC 800F8B8C 24848978 */  addiu $a0, $a0, -0x7688
/* 0025B0 800F8B90 24051003 */  addiu $a1, $zero, 0x1003
/* 0025B4 800F8B94 00003021 */  addu  $a2, $zero, $zero
/* 0025B8 800F8B98 0C01770A */  jal   InitProcess
/* 0025BC 800F8B9C 00003821 */   addu  $a3, $zero, $zero
/* 0025C0 800F8BA0 24040026 */  addiu $a0, $zero, 0x26
/* 0025C4 800F8BA4 0C00F6F8 */  jal   func_8003DBE0
/* 0025C8 800F8BA8 00002821 */   addu  $a1, $zero, $zero
/* 0025CC 800F8BAC 00409021 */  addu  $s2, $v0, $zero
/* 0025D0 800F8BB0 3C018010 */  lui   $at, 0x8010
/* 0025D4 800F8BB4 AC32A370 */  sw    $s2, -0x5c90($at)
/* 0025D8 800F8BB8 0C01307B */  jal   GetSpaceData
/* 0025DC 800F8BBC 00002021 */   addu  $a0, $zero, $zero
/* 0025E0 800F8BC0 2644000C */  addiu $a0, $s2, 0xc
/* 0025E4 800F8BC4 0C028354 */  jal   func_800A0D50
/* 0025E8 800F8BC8 24450004 */   addiu $a1, $v0, 4
/* 0025EC 800F8BCC 26440024 */  addiu $a0, $s2, 0x24
/* 0025F0 800F8BD0 3C053F4C */  lui   $a1, 0x3f4c
/* 0025F4 800F8BD4 34A5CCCD */  ori   $a1, $a1, 0xcccd
/* 0025F8 800F8BD8 00A03021 */  addu  $a2, $a1, $zero
/* 0025FC 800F8BDC 0C028340 */  jal   func_800A0D00
/* 002600 800F8BE0 00A03821 */   addu  $a3, $a1, $zero
/* 002604 800F8BE4 0C018D54 */  jal   SleepProcess
/* 002608 800F8BE8 2404001E */   addiu $a0, $zero, 0x1e
/* 00260C 800F8BEC 0C0180AB */  jal   PlaySound
/* 002610 800F8BF0 2404008B */   addiu $a0, $zero, 0x8b
/* 002614 800F8BF4 0040B821 */  addu  $s7, $v0, $zero
/* 002618 800F8BF8 3C028010 */  lui   $v0, 0x8010
/* 00261C 800F8BFC 84429FCC */  lh    $v0, -0x6034($v0)
/* 002620 800F8C00 04400055 */  bltz  $v0, .ov054_L800F8D58
/* 002624 800F8C04 00009821 */   addu  $s3, $zero, $zero
/* 002628 800F8C08 2655000C */  addiu $s5, $s2, 0xc
/* 00262C 800F8C0C 26560018 */  addiu $s6, $s2, 0x18
/* 002630 800F8C10 0013A040 */  sll   $s4, $s3, 1
.ov054_L800F8C14:
/* 002634 800F8C14 3C088010 */  lui   $t0, 0x8010
/* 002638 800F8C18 25089FCC */  addiu $t0, $t0, -0x6034
/* 00263C 800F8C1C 02888821 */  addu  $s1, $s4, $t0
/* 002640 800F8C20 0C01307B */  jal   GetSpaceData
/* 002644 800F8C24 86240000 */   lh    $a0, ($s1)
/* 002648 800F8C28 24500004 */  addiu $s0, $v0, 4
/* 00264C 800F8C2C 02A02021 */  addu  $a0, $s5, $zero
/* 002650 800F8C30 02002821 */  addu  $a1, $s0, $zero
/* 002654 800F8C34 0C013334 */  jal   func_8004CCD0
/* 002658 800F8C38 02C03021 */   addu  $a2, $s6, $zero
/* 00265C 800F8C3C 02A02021 */  addu  $a0, $s5, $zero
/* 002660 800F8C40 02002821 */  addu  $a1, $s0, $zero
/* 002664 800F8C44 3C0741A0 */  lui   $a3, 0x41a0
/* 002668 800F8C48 0C013592 */  jal   func_8004D648
/* 00266C 800F8C4C 02A03021 */   addu  $a2, $s5, $zero
/* 002670 800F8C50 03C02021 */  addu  $a0, $fp, $zero
/* 002674 800F8C54 0C018C9C */  jal   func_80063270
/* 002678 800F8C58 00402821 */   addu  $a1, $v0, $zero
/* 00267C 800F8C5C 0C018CD6 */  jal   func_80063358
/* 002680 800F8C60 00000000 */   nop   
/* 002684 800F8C64 86230000 */  lh    $v1, ($s1)
/* 002688 800F8C68 24020006 */  addiu $v0, $zero, 6
/* 00268C 800F8C6C 54620034 */  bnel  $v1, $v0, .ov054_L800F8D40
/* 002690 800F8C70 26730001 */   addiu $s3, $s3, 1
/* 002694 800F8C74 3C088010 */  lui   $t0, 0x8010
/* 002698 800F8C78 25089FCE */  addiu $t0, $t0, -0x6032
/* 00269C 800F8C7C 02881021 */  addu  $v0, $s4, $t0
/* 0026A0 800F8C80 0C01307B */  jal   GetSpaceData
/* 0026A4 800F8C84 84440000 */   lh    $a0, ($v0)
/* 0026A8 800F8C88 27A40010 */  addiu $a0, $sp, 0x10
/* 0026AC 800F8C8C 24450004 */  addiu $a1, $v0, 4
/* 0026B0 800F8C90 0C0283A0 */  jal   func_800A0E80
/* 0026B4 800F8C94 02A03021 */   addu  $a2, $s5, $zero
/* 0026B8 800F8C98 02C02021 */  addu  $a0, $s6, $zero
/* 0026BC 800F8C9C 27A50010 */  addiu $a1, $sp, 0x10
/* 0026C0 800F8CA0 02C03021 */  addu  $a2, $s6, $zero
/* 0026C4 800F8CA4 0C01347B */  jal   func_8004D1EC
/* 0026C8 800F8CA8 24070014 */   addiu $a3, $zero, 0x14
/* 0026CC 800F8CAC 3C014218 */  lui   $at, 0x4218
/* 0026D0 800F8CB0 44810000 */  mtc1  $at, $f0
/* 0026D4 800F8CB4 00000000 */  nop   
/* 0026D8 800F8CB8 E6400034 */  swc1  $f0, 0x34($s2)
/* 0026DC 800F8CBC 3C01C000 */  lui   $at, 0xc000
/* 0026E0 800F8CC0 44810000 */  mtc1  $at, $f0
/* 0026E4 800F8CC4 00000000 */  nop   
/* 0026E8 800F8CC8 E6400038 */  swc1  $f0, 0x38($s2)
/* 0026EC 800F8CCC 0C0180AB */  jal   PlaySound
/* 0026F0 800F8CD0 2404008D */   addiu $a0, $zero, 0x8d
/* 0026F4 800F8CD4 0C0181D6 */  jal   func_80060758
/* 0026F8 800F8CD8 2404008B */   addiu $a0, $zero, 0x8b
/* 0026FC 800F8CDC C6400038 */  lwc1  $f0, 0x38($s2)
/* 002700 800F8CE0 46000021 */  cvt.d.s $f0, $f0
/* 002704 800F8CE4 44801000 */  mtc1  $zero, $f2
/* 002708 800F8CE8 44801800 */  mtc1  $zero, $f3
/* 00270C 800F8CEC 00000000 */  nop   
/* 002710 800F8CF0 46220032 */  c.eq.d $f0, $f2
/* 002714 800F8CF4 00000000 */  nop   
/* 002718 800F8CF8 4501000B */  bc1t  .ov054_L800F8D28
/* 00271C 800F8CFC 00000000 */   nop   
/* 002720 800F8D00 4480A000 */  mtc1  $zero, $f20
/* 002724 800F8D04 4480A800 */  mtc1  $zero, $f21
.ov054_L800F8D08:
/* 002728 800F8D08 0C018D6D */  jal   SleepVProcess
/* 00272C 800F8D0C 00000000 */   nop   
/* 002730 800F8D10 C6400038 */  lwc1  $f0, 0x38($s2)
/* 002734 800F8D14 46000021 */  cvt.d.s $f0, $f0
/* 002738 800F8D18 46340032 */  c.eq.d $f0, $f20
/* 00273C 800F8D1C 00000000 */  nop   
/* 002740 800F8D20 4500FFF9 */  bc1f  .ov054_L800F8D08
/* 002744 800F8D24 00000000 */   nop   
.ov054_L800F8D28:
/* 002748 800F8D28 0C0180AB */  jal   PlaySound
/* 00274C 800F8D2C 2404008D */   addiu $a0, $zero, 0x8d
/* 002750 800F8D30 0C0180AB */  jal   PlaySound
/* 002754 800F8D34 2404008B */   addiu $a0, $zero, 0x8b
/* 002758 800F8D38 0040B821 */  addu  $s7, $v0, $zero
/* 00275C 800F8D3C 26730001 */  addiu $s3, $s3, 1
.ov054_L800F8D40:
/* 002760 800F8D40 00131040 */  sll   $v0, $s3, 1
/* 002764 800F8D44 3C018010 */  lui   $at, 0x8010
/* 002768 800F8D48 00220821 */  addu  $at, $at, $v0
/* 00276C 800F8D4C 84229FCC */  lh    $v0, -0x6034($at)
/* 002770 800F8D50 0441FFB0 */  bgez  $v0, .ov054_L800F8C14
/* 002774 800F8D54 0013A040 */   sll   $s4, $s3, 1
.ov054_L800F8D58:
/* 002778 800F8D58 00172400 */  sll   $a0, $s7, 0x10
/* 00277C 800F8D5C 00042403 */  sra   $a0, $a0, 0x10
/* 002780 800F8D60 0C0182F2 */  jal   func_80060BC8
/* 002784 800F8D64 2405001E */   addiu $a1, $zero, 0x1e
/* 002788 800F8D68 0C00F9A5 */  jal   func_8003E694
/* 00278C 800F8D6C 02402021 */   addu  $a0, $s2, $zero
/* 002790 800F8D70 3C018010 */  lui   $at, 0x8010
/* 002794 800F8D74 AC20A370 */  sw    $zero, -0x5c90($at)
/* 002798 800F8D78 0C018D54 */  jal   SleepProcess
/* 00279C 800F8D7C 2404001E */   addiu $a0, $zero, 0x1e
/* 0027A0 800F8D80 24020001 */  addiu $v0, $zero, 1
/* 0027A4 800F8D84 3C018010 */  lui   $at, 0x8010
/* 0027A8 800F8D88 A422A36C */  sh    $v0, -0x5c94($at)
/* 0027AC 800F8D8C 0C017764 */  jal   EndProcess
/* 0027B0 800F8D90 00002021 */   addu  $a0, $zero, $zero
/* 0027B4 800F8D94 8FBF0044 */  lw    $ra, 0x44($sp)
/* 0027B8 800F8D98 8FBE0040 */  lw    $fp, 0x40($sp)
/* 0027BC 800F8D9C 8FB7003C */  lw    $s7, 0x3c($sp)
/* 0027C0 800F8DA0 8FB60038 */  lw    $s6, 0x38($sp)
/* 0027C4 800F8DA4 8FB50034 */  lw    $s5, 0x34($sp)
/* 0027C8 800F8DA8 8FB40030 */  lw    $s4, 0x30($sp)
/* 0027CC 800F8DAC 8FB3002C */  lw    $s3, 0x2c($sp)
/* 0027D0 800F8DB0 8FB20028 */  lw    $s2, 0x28($sp)
/* 0027D4 800F8DB4 8FB10024 */  lw    $s1, 0x24($sp)
/* 0027D8 800F8DB8 8FB00020 */  lw    $s0, 0x20($sp)
/* 0027DC 800F8DBC D7B40048 */  ldc1  $f20, 0x48($sp)
/* 0027E0 800F8DC0 03E00008 */  jr    $ra
/* 0027E4 800F8DC4 27BD0050 */   addiu $sp, $sp, 0x50

/* 0027E8 800F8DC8 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 0027EC 800F8DCC AFBF0014 */  sw    $ra, 0x14($sp)
/* 0027F0 800F8DD0 AFB00010 */  sw    $s0, 0x10($sp)
/* 0027F4 800F8DD4 F7B60020 */  sdc1  $f22, 0x20($sp)
/* 0027F8 800F8DD8 0C018CEA */  jal   func_800633A8
/* 0027FC 800F8DDC F7B40018 */   sdc1  $f20, 0x18($sp)
/* 002800 800F8DE0 8C50008C */  lw    $s0, 0x8c($v0)
/* 002804 800F8DE4 0C018D54 */  jal   SleepProcess
/* 002808 800F8DE8 24040005 */   addiu $a0, $zero, 5
/* 00280C 800F8DEC 0C0180AB */  jal   PlaySound
/* 002810 800F8DF0 24040092 */   addiu $a0, $zero, 0x92
/* 002814 800F8DF4 3C013F80 */  lui   $at, 0x3f80
/* 002818 800F8DF8 44811000 */  mtc1  $at, $f2
/* 00281C 800F8DFC C6000028 */  lwc1  $f0, 0x28($s0)
/* 002820 800F8E00 4602003C */  c.lt.s $f0, $f2
/* 002824 800F8E04 00000000 */  nop   
/* 002828 800F8E08 4500000F */  bc1f  .ov054_L800F8E48
/* 00282C 800F8E0C 00000000 */   nop   
/* 002830 800F8E10 3C013D4C */  lui   $at, 0x3d4c
/* 002834 800F8E14 3421CCCD */  ori   $at, $at, 0xcccd
/* 002838 800F8E18 4481B000 */  mtc1  $at, $f22
/* 00283C 800F8E1C 3C013F80 */  lui   $at, 0x3f80
/* 002840 800F8E20 4481A000 */  mtc1  $at, $f20
.ov054_L800F8E24:
/* 002844 800F8E24 0C018D6D */  jal   SleepVProcess
/* 002848 800F8E28 00000000 */   nop   
/* 00284C 800F8E2C C6000028 */  lwc1  $f0, 0x28($s0)
/* 002850 800F8E30 46160000 */  add.s $f0, $f0, $f22
/* 002854 800F8E34 4614003C */  c.lt.s $f0, $f20
/* 002858 800F8E38 00000000 */  nop   
/* 00285C 800F8E3C 00000000 */  nop   
/* 002860 800F8E40 4501FFF8 */  bc1t  .ov054_L800F8E24
/* 002864 800F8E44 E6000028 */   swc1  $f0, 0x28($s0)
.ov054_L800F8E48:
/* 002868 800F8E48 3C013F80 */  lui   $at, 0x3f80
/* 00286C 800F8E4C 44810000 */  mtc1  $at, $f0
/* 002870 800F8E50 00000000 */  nop   
/* 002874 800F8E54 E6000028 */  swc1  $f0, 0x28($s0)
/* 002878 800F8E58 0C0180AB */  jal   PlaySound
/* 00287C 800F8E5C 24040093 */   addiu $a0, $zero, 0x93
/* 002880 800F8E60 0C017764 */  jal   EndProcess
/* 002884 800F8E64 00002021 */   addu  $a0, $zero, $zero
/* 002888 800F8E68 8FBF0014 */  lw    $ra, 0x14($sp)
/* 00288C 800F8E6C 8FB00010 */  lw    $s0, 0x10($sp)
/* 002890 800F8E70 D7B60020 */  ldc1  $f22, 0x20($sp)
/* 002894 800F8E74 D7B40018 */  ldc1  $f20, 0x18($sp)
/* 002898 800F8E78 03E00008 */  jr    $ra
/* 00289C 800F8E7C 27BD0028 */   addiu $sp, $sp, 0x28

ov054_func_800F8E80:
/* 0028A0 800F8E80 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0028A4 800F8E84 AFBF0014 */  sw    $ra, 0x14($sp)
/* 0028A8 800F8E88 AFB00010 */  sw    $s0, 0x10($sp)
/* 0028AC 800F8E8C 00808021 */  addu  $s0, $a0, $zero
/* 0028B0 800F8E90 3C048010 */  lui   $a0, 0x8010
/* 0028B4 800F8E94 24848DC8 */  addiu $a0, $a0, -0x7238
/* 0028B8 800F8E98 24054800 */  addiu $a1, $zero, 0x4800
/* 0028BC 800F8E9C 00003021 */  addu  $a2, $zero, $zero
/* 0028C0 800F8EA0 0C01770A */  jal   InitProcess
/* 0028C4 800F8EA4 00003821 */   addu  $a3, $zero, $zero
/* 0028C8 800F8EA8 AC50008C */  sw    $s0, 0x8c($v0)
/* 0028CC 800F8EAC 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0028D0 800F8EB0 8FB00010 */  lw    $s0, 0x10($sp)
/* 0028D4 800F8EB4 03E00008 */  jr    $ra
/* 0028D8 800F8EB8 27BD0018 */   addiu $sp, $sp, 0x18

/* 0028DC 800F8EBC 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 0028E0 800F8EC0 AFBF0018 */  sw    $ra, 0x18($sp)
/* 0028E4 800F8EC4 AFB10014 */  sw    $s1, 0x14($sp)
/* 0028E8 800F8EC8 AFB00010 */  sw    $s0, 0x10($sp)
/* 0028EC 800F8ECC F7B60028 */  sdc1  $f22, 0x28($sp)
/* 0028F0 800F8ED0 0C018CEA */  jal   func_800633A8
/* 0028F4 800F8ED4 F7B40020 */   sdc1  $f20, 0x20($sp)
/* 0028F8 800F8ED8 8C50008C */  lw    $s0, 0x8c($v0)
/* 0028FC 800F8EDC 0C018D54 */  jal   SleepProcess
/* 002900 800F8EE0 24040005 */   addiu $a0, $zero, 5
/* 002904 800F8EE4 2404FFFF */  addiu $a0, $zero, -1
/* 002908 800F8EE8 00002821 */  addu  $a1, $zero, $zero
/* 00290C 800F8EEC 0C016293 */  jal   func_80058A4C
/* 002910 800F8EF0 2406000A */   addiu $a2, $zero, 0xa
/* 002914 800F8EF4 00408821 */  addu  $s1, $v0, $zero
/* 002918 800F8EF8 0C0180AB */  jal   PlaySound
/* 00291C 800F8EFC 24040092 */   addiu $a0, $zero, 0x92
/* 002920 800F8F00 44801000 */  mtc1  $zero, $f2
/* 002924 800F8F04 C6000028 */  lwc1  $f0, 0x28($s0)
/* 002928 800F8F08 4600103C */  c.lt.s $f2, $f0
/* 00292C 800F8F0C 00000000 */  nop   
/* 002930 800F8F10 00000000 */  nop   
/* 002934 800F8F14 4502000F */  bc1fl .ov054_L800F8F54
/* 002938 800F8F18 AE000028 */   sw    $zero, 0x28($s0)
/* 00293C 800F8F1C 3C013D4C */  lui   $at, 0x3d4c
/* 002940 800F8F20 3421CCCD */  ori   $at, $at, 0xcccd
/* 002944 800F8F24 4481B000 */  mtc1  $at, $f22
/* 002948 800F8F28 4480A000 */  mtc1  $zero, $f20
.ov054_L800F8F2C:
/* 00294C 800F8F2C 0C018D6D */  jal   SleepVProcess
/* 002950 800F8F30 00000000 */   nop   
/* 002954 800F8F34 C6000028 */  lwc1  $f0, 0x28($s0)
/* 002958 800F8F38 46160001 */  sub.s $f0, $f0, $f22
/* 00295C 800F8F3C 4600A03C */  c.lt.s $f20, $f0
/* 002960 800F8F40 00000000 */  nop   
/* 002964 800F8F44 00000000 */  nop   
/* 002968 800F8F48 4501FFF8 */  bc1t  .ov054_L800F8F2C
/* 00296C 800F8F4C E6000028 */   swc1  $f0, 0x28($s0)
/* 002970 800F8F50 AE000028 */  sw    $zero, 0x28($s0)
.ov054_L800F8F54:
/* 002974 800F8F54 0C0180AB */  jal   PlaySound
/* 002978 800F8F58 24040093 */   addiu $a0, $zero, 0x93
/* 00297C 800F8F5C 0C0162B4 */  jal   func_80058AD0
/* 002980 800F8F60 02202021 */   addu  $a0, $s1, $zero
/* 002984 800F8F64 0C017764 */  jal   EndProcess
/* 002988 800F8F68 00002021 */   addu  $a0, $zero, $zero
/* 00298C 800F8F6C 8FBF0018 */  lw    $ra, 0x18($sp)
/* 002990 800F8F70 8FB10014 */  lw    $s1, 0x14($sp)
/* 002994 800F8F74 8FB00010 */  lw    $s0, 0x10($sp)
/* 002998 800F8F78 D7B60028 */  ldc1  $f22, 0x28($sp)
/* 00299C 800F8F7C D7B40020 */  ldc1  $f20, 0x20($sp)
/* 0029A0 800F8F80 03E00008 */  jr    $ra
/* 0029A4 800F8F84 27BD0030 */   addiu $sp, $sp, 0x30

ov054_func_800F8F88:
/* 0029A8 800F8F88 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0029AC 800F8F8C AFBF0014 */  sw    $ra, 0x14($sp)
/* 0029B0 800F8F90 AFB00010 */  sw    $s0, 0x10($sp)
/* 0029B4 800F8F94 00808021 */  addu  $s0, $a0, $zero
/* 0029B8 800F8F98 3C048010 */  lui   $a0, 0x8010
/* 0029BC 800F8F9C 24848EBC */  addiu $a0, $a0, -0x7144
/* 0029C0 800F8FA0 24054800 */  addiu $a1, $zero, 0x4800
/* 0029C4 800F8FA4 00003021 */  addu  $a2, $zero, $zero
/* 0029C8 800F8FA8 0C01770A */  jal   InitProcess
/* 0029CC 800F8FAC 00003821 */   addu  $a3, $zero, $zero
/* 0029D0 800F8FB0 AC50008C */  sw    $s0, 0x8c($v0)
/* 0029D4 800F8FB4 8FBF0014 */  lw    $ra, 0x14($sp)
/* 0029D8 800F8FB8 8FB00010 */  lw    $s0, 0x10($sp)
/* 0029DC 800F8FBC 03E00008 */  jr    $ra
/* 0029E0 800F8FC0 27BD0018 */   addiu $sp, $sp, 0x18

/* 0029E4 800F8FC4 27BDFFD0 */  addiu $sp, $sp, -0x30
/* 0029E8 800F8FC8 AFBF0028 */  sw    $ra, 0x28($sp)
/* 0029EC 800F8FCC AFB30024 */  sw    $s3, 0x24($sp)
/* 0029F0 800F8FD0 AFB20020 */  sw    $s2, 0x20($sp)
/* 0029F4 800F8FD4 AFB1001C */  sw    $s1, 0x1c($sp)
/* 0029F8 800F8FD8 AFB00018 */  sw    $s0, 0x18($sp)
/* 0029FC 800F8FDC 0C014AA3 */  jal   GetPlayerStruct
/* 002A00 800F8FE0 2404FFFF */   addiu $a0, $zero, -1
/* 002A04 800F8FE4 00409821 */  addu  $s3, $v0, $zero
/* 002A08 800F8FE8 2404FFFF */  addiu $a0, $zero, -1
/* 002A0C 800F8FEC 2405FFFF */  addiu $a1, $zero, -1
/* 002A10 800F8FF0 0C014AFA */  jal   func_80052BE8
/* 002A14 800F8FF4 24060002 */   addiu $a2, $zero, 2
/* 002A18 800F8FF8 86620008 */  lh    $v0, 8($s3)
/* 002A1C 800F8FFC 28420014 */  slti  $v0, $v0, 0x14
/* 002A20 800F9000 10400027 */  beqz  $v0, .ov054_L800F90A0
/* 002A24 800F9004 00000000 */   nop   
ov054_func_800F9008:
/* 002A28 800F9008 0C012E14 */  jal   func_8004B850
/* 002A2C 800F900C 00000000 */   nop   
/* 002A30 800F9010 10400005 */  beqz  $v0, .ov054_L800F9028
/* 002A34 800F9014 00000000 */   nop   
/* 002A38 800F9018 0C018D6D */  jal   SleepVProcess
/* 002A3C 800F901C 00000000 */   nop   
/* 002A40 800F9020 0803E402 */  j     ov054_func_800F9008
/* 002A44 800F9024 00000000 */   nop   

.ov054_L800F9028:
/* 002A48 800F9028 0C018D6D */  jal   SleepVProcess
/* 002A4C 800F902C 00000000 */   nop   
/* 002A50 800F9030 2404003C */  addiu $a0, $zero, 0x3c
/* 002A54 800F9034 2405003C */  addiu $a1, $zero, 0x3c
/* 002A58 800F9038 24060011 */  addiu $a2, $zero, 0x11
/* 002A5C 800F903C 0C01364C */  jal   CreateTextWindow
/* 002A60 800F9040 24070002 */   addiu $a3, $zero, 2
/* 002A64 800F9044 00028400 */  sll   $s0, $v0, 0x10
/* 002A68 800F9048 00108403 */  sra   $s0, $s0, 0x10
/* 002A6C 800F904C 02002021 */  addu  $a0, $s0, $zero
/* 002A70 800F9050 24050186 */  addiu $a1, $zero, 0x186
/* 002A74 800F9054 2406FFFF */  addiu $a2, $zero, -1
/* 002A78 800F9058 0C01B5F6 */  jal   LoadStringIntoWindow
/* 002A7C 800F905C 2407FFFF */   addiu $a3, $zero, -1
/* 002A80 800F9060 02002021 */  addu  $a0, $s0, $zero
/* 002A84 800F9064 0C01B81C */  jal   SetTextCharsPerFrame
/* 002A88 800F9068 00002821 */   addu  $a1, $zero, $zero
/* 002A8C 800F906C 0C013676 */  jal   ShowTextWindow
/* 002A90 800F9070 02002021 */   addu  $a0, $s0, $zero
/* 002A94 800F9074 92650018 */  lbu   $a1, 0x18($s3)
/* 002A98 800F9078 0C0136F5 */  jal   func_8004DBD4
/* 002A9C 800F907C 02002021 */   addu  $a0, $s0, $zero
/* 002AA0 800F9080 0C0136B4 */  jal   HideTextWindow
/* 002AA4 800F9084 02002021 */   addu  $a0, $s0, $zero
/* 002AA8 800F9088 92640018 */  lbu   $a0, 0x18($s3)
/* 002AAC 800F908C 2405000A */  addiu $a1, $zero, 0xa
/* 002AB0 800F9090 0C013611 */  jal   SetNextChainAndSpace
/* 002AB4 800F9094 00003021 */   addu  $a2, $zero, $zero
/* 002AB8 800F9098 0803E464 */  j     ov054_func_800F9190
/* 002ABC 800F909C 00000000 */   nop   

.ov054_L800F90A0:
/* 002AC0 800F90A0 0C018CEA */  jal   func_800633A8
/* 002AC4 800F90A4 00000000 */   nop   
/* 002AC8 800F90A8 3C048010 */  lui   $a0, 0x8010
/* 002ACC 800F90AC 8C84A34C */  lw    $a0, -0x5cb4($a0)
/* 002AD0 800F90B0 0C03E3E2 */  jal   ov054_func_800F8F88
/* 002AD4 800F90B4 00408021 */   addu  $s0, $v0, $zero
/* 002AD8 800F90B8 02002021 */  addu  $a0, $s0, $zero
/* 002ADC 800F90BC 0C018C9C */  jal   func_80063270
/* 002AE0 800F90C0 00402821 */   addu  $a1, $v0, $zero
/* 002AE4 800F90C4 0C018CD6 */  jal   func_80063358
/* 002AE8 800F90C8 00000000 */   nop   
/* 002AEC 800F90CC 0C03DE48 */  jal   ov054_func_800F7920
/* 002AF0 800F90D0 00000000 */   nop   
/* 002AF4 800F90D4 3C058010 */  lui   $a1, 0x8010
/* 002AF8 800F90D8 24A59FEC */  addiu $a1, $a1, -0x6014
/* 002AFC 800F90DC 0C00F086 */  jal   func_8003C218
/* 002B00 800F90E0 2404FFFF */   addiu $a0, $zero, -1
/* 002B04 800F90E4 00409021 */  addu  $s2, $v0, $zero
/* 002B08 800F90E8 02402021 */  addu  $a0, $s2, $zero
/* 002B0C 800F90EC 2405FFFF */  addiu $a1, $zero, -1
/* 002B10 800F90F0 0C00F018 */  jal   func_8003C060
/* 002B14 800F90F4 00003021 */   addu  $a2, $zero, $zero
/* 002B18 800F90F8 0C014AC8 */  jal   PlayerIsCPU
/* 002B1C 800F90FC 2404FFFF */   addiu $a0, $zero, -1
/* 002B20 800F9100 10400011 */  beqz  $v0, .ov054_L800F9148
/* 002B24 800F9104 00000000 */   nop   
/* 002B28 800F9108 3C048010 */  lui   $a0, 0x8010
/* 002B2C 800F910C 24849E30 */  addiu $a0, $a0, -0x61d0
/* 002B30 800F9110 0C00FA6C */  jal   func_8003E9B0
/* 002B34 800F9114 00008021 */   addu  $s0, $zero, $zero
/* 002B38 800F9118 00021400 */  sll   $v0, $v0, 0x10
/* 002B3C 800F911C 00028C03 */  sra   $s1, $v0, 0x10
/* 002B40 800F9120 1A200007 */  blez  $s1, .ov054_L800F9140
/* 002B44 800F9124 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F9128:
/* 002B48 800F9128 0C00EFA1 */  jal   func_8003BE84
/* 002B4C 800F912C 2405FFFE */   addiu $a1, $zero, -2
/* 002B50 800F9130 26100001 */  addiu $s0, $s0, 1
/* 002B54 800F9134 0211102A */  slt   $v0, $s0, $s1
/* 002B58 800F9138 1440FFFB */  bnez  $v0, .ov054_L800F9128
/* 002B5C 800F913C 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F9140:
/* 002B60 800F9140 0C00EFA1 */  jal   func_8003BE84
/* 002B64 800F9144 2405FFFC */   addiu $a1, $zero, -4
.ov054_L800F9148:
/* 002B68 800F9148 0C00F053 */  jal   DirectionPrompt
/* 002B6C 800F914C 02402021 */   addu  $a0, $s2, $zero
/* 002B70 800F9150 00408021 */  addu  $s0, $v0, $zero
/* 002B74 800F9154 0C00EE42 */  jal   func_8003B908
/* 002B78 800F9158 02402021 */   addu  $a0, $s2, $zero
/* 002B7C 800F915C 0C03DE74 */  jal   ov054_func_800F79D0
/* 002B80 800F9160 00000000 */   nop   
/* 002B84 800F9164 16000004 */  bnez  $s0, .ov054_L800F9178
/* 002B88 800F9168 2405000A */   addiu $a1, $zero, 0xa
/* 002B8C 800F916C 92640018 */  lbu   $a0, 0x18($s3)
/* 002B90 800F9170 0803E45F */  j     ov054_func_800F917C
/* 002B94 800F9174 2405000B */   addiu $a1, $zero, 0xb

.ov054_L800F9178:
/* 002B98 800F9178 92640018 */  lbu   $a0, 0x18($s3)
ov054_func_800F917C:
/* 002B9C 800F917C 0C013611 */  jal   SetNextChainAndSpace
/* 002BA0 800F9180 00003021 */   addu  $a2, $zero, $zero
/* 002BA4 800F9184 3C048010 */  lui   $a0, 0x8010
/* 002BA8 800F9188 0C03E3A0 */  jal   ov054_func_800F8E80
/* 002BAC 800F918C 8C84A34C */   lw    $a0, -0x5cb4($a0)
ov054_func_800F9190:
/* 002BB0 800F9190 0C017764 */  jal   EndProcess
/* 002BB4 800F9194 00002021 */   addu  $a0, $zero, $zero
/* 002BB8 800F9198 8FBF0028 */  lw    $ra, 0x28($sp)
/* 002BBC 800F919C 8FB30024 */  lw    $s3, 0x24($sp)
/* 002BC0 800F91A0 8FB20020 */  lw    $s2, 0x20($sp)
/* 002BC4 800F91A4 8FB1001C */  lw    $s1, 0x1c($sp)
/* 002BC8 800F91A8 8FB00018 */  lw    $s0, 0x18($sp)
/* 002BCC 800F91AC 03E00008 */  jr    $ra
/* 002BD0 800F91B0 27BD0030 */   addiu $sp, $sp, 0x30

/* 002BD4 800F91B4 27BDFFD8 */  addiu $sp, $sp, -0x28
/* 002BD8 800F91B8 AFBF0024 */  sw    $ra, 0x24($sp)
/* 002BDC 800F91BC AFB20020 */  sw    $s2, 0x20($sp)
/* 002BE0 800F91C0 AFB1001C */  sw    $s1, 0x1c($sp)
/* 002BE4 800F91C4 AFB00018 */  sw    $s0, 0x18($sp)
/* 002BE8 800F91C8 0C014AA3 */  jal   GetPlayerStruct
/* 002BEC 800F91CC 2404FFFF */   addiu $a0, $zero, -1
/* 002BF0 800F91D0 00408821 */  addu  $s1, $v0, $zero
/* 002BF4 800F91D4 2404FFFF */  addiu $a0, $zero, -1
/* 002BF8 800F91D8 2405FFFF */  addiu $a1, $zero, -1
/* 002BFC 800F91DC 0C014AFA */  jal   func_80052BE8
/* 002C00 800F91E0 24060002 */   addiu $a2, $zero, 2
/* 002C04 800F91E4 86220008 */  lh    $v0, 8($s1)
/* 002C08 800F91E8 28420014 */  slti  $v0, $v0, 0x14
/* 002C0C 800F91EC 10400027 */  beqz  $v0, .ov054_L800F928C
/* 002C10 800F91F0 00000000 */   nop   
ov054_func_800F91F4:
/* 002C14 800F91F4 0C012E14 */  jal   func_8004B850
/* 002C18 800F91F8 00000000 */   nop   
/* 002C1C 800F91FC 10400005 */  beqz  $v0, .ov054_L800F9214
/* 002C20 800F9200 00000000 */   nop   
/* 002C24 800F9204 0C018D6D */  jal   SleepVProcess
/* 002C28 800F9208 00000000 */   nop   
/* 002C2C 800F920C 0803E47D */  j     ov054_func_800F91F4
/* 002C30 800F9210 00000000 */   nop   

.ov054_L800F9214:
/* 002C34 800F9214 0C018D6D */  jal   SleepVProcess
/* 002C38 800F9218 00000000 */   nop   
/* 002C3C 800F921C 2404003C */  addiu $a0, $zero, 0x3c
/* 002C40 800F9220 2405003C */  addiu $a1, $zero, 0x3c
/* 002C44 800F9224 24060011 */  addiu $a2, $zero, 0x11
/* 002C48 800F9228 0C01364C */  jal   CreateTextWindow
/* 002C4C 800F922C 24070002 */   addiu $a3, $zero, 2
/* 002C50 800F9230 00028400 */  sll   $s0, $v0, 0x10
/* 002C54 800F9234 00108403 */  sra   $s0, $s0, 0x10
/* 002C58 800F9238 02002021 */  addu  $a0, $s0, $zero
/* 002C5C 800F923C 24050186 */  addiu $a1, $zero, 0x186
/* 002C60 800F9240 2406FFFF */  addiu $a2, $zero, -1
/* 002C64 800F9244 0C01B5F6 */  jal   LoadStringIntoWindow
/* 002C68 800F9248 2407FFFF */   addiu $a3, $zero, -1
/* 002C6C 800F924C 02002021 */  addu  $a0, $s0, $zero
/* 002C70 800F9250 0C01B81C */  jal   SetTextCharsPerFrame
/* 002C74 800F9254 00002821 */   addu  $a1, $zero, $zero
/* 002C78 800F9258 0C013676 */  jal   ShowTextWindow
/* 002C7C 800F925C 02002021 */   addu  $a0, $s0, $zero
/* 002C80 800F9260 92250018 */  lbu   $a1, 0x18($s1)
/* 002C84 800F9264 0C0136F5 */  jal   func_8004DBD4
/* 002C88 800F9268 02002021 */   addu  $a0, $s0, $zero
/* 002C8C 800F926C 0C0136B4 */  jal   HideTextWindow
/* 002C90 800F9270 02002021 */   addu  $a0, $s0, $zero
/* 002C94 800F9274 2404FFFF */  addiu $a0, $zero, -1
/* 002C98 800F9278 24050010 */  addiu $a1, $zero, 0x10
/* 002C9C 800F927C 0C013611 */  jal   SetNextChainAndSpace
/* 002CA0 800F9280 00003021 */   addu  $a2, $zero, $zero
/* 002CA4 800F9284 0803E4DE */  j     ov054_func_800F9378
/* 002CA8 800F9288 00000000 */   nop   

.ov054_L800F928C:
/* 002CAC 800F928C 0C018CEA */  jal   func_800633A8
/* 002CB0 800F9290 00000000 */   nop   
/* 002CB4 800F9294 3C048010 */  lui   $a0, 0x8010
/* 002CB8 800F9298 8C84A350 */  lw    $a0, -0x5cb0($a0)
/* 002CBC 800F929C 0C03E3E2 */  jal   ov054_func_800F8F88
/* 002CC0 800F92A0 00408021 */   addu  $s0, $v0, $zero
/* 002CC4 800F92A4 02002021 */  addu  $a0, $s0, $zero
/* 002CC8 800F92A8 0C018C9C */  jal   func_80063270
/* 002CCC 800F92AC 00402821 */   addu  $a1, $v0, $zero
/* 002CD0 800F92B0 0C018CD6 */  jal   func_80063358
/* 002CD4 800F92B4 00000000 */   nop   
/* 002CD8 800F92B8 0C03DE48 */  jal   ov054_func_800F7920
/* 002CDC 800F92BC 00000000 */   nop   
/* 002CE0 800F92C0 3C058010 */  lui   $a1, 0x8010
/* 002CE4 800F92C4 24A5A004 */  addiu $a1, $a1, -0x5ffc
/* 002CE8 800F92C8 0C00F086 */  jal   func_8003C218
/* 002CEC 800F92CC 2404FFFF */   addiu $a0, $zero, -1
/* 002CF0 800F92D0 00409021 */  addu  $s2, $v0, $zero
/* 002CF4 800F92D4 02402021 */  addu  $a0, $s2, $zero
/* 002CF8 800F92D8 2405FFFF */  addiu $a1, $zero, -1
/* 002CFC 800F92DC 0C00F018 */  jal   func_8003C060
/* 002D00 800F92E0 00003021 */   addu  $a2, $zero, $zero
/* 002D04 800F92E4 0C014AC8 */  jal   PlayerIsCPU
/* 002D08 800F92E8 2404FFFF */   addiu $a0, $zero, -1
/* 002D0C 800F92EC 10400011 */  beqz  $v0, .ov054_L800F9334
/* 002D10 800F92F0 00000000 */   nop   
/* 002D14 800F92F4 3C048010 */  lui   $a0, 0x8010
/* 002D18 800F92F8 24849F38 */  addiu $a0, $a0, -0x60c8
/* 002D1C 800F92FC 0C00FA6C */  jal   func_8003E9B0
/* 002D20 800F9300 00008021 */   addu  $s0, $zero, $zero
/* 002D24 800F9304 00021400 */  sll   $v0, $v0, 0x10
/* 002D28 800F9308 00028C03 */  sra   $s1, $v0, 0x10
/* 002D2C 800F930C 1A200007 */  blez  $s1, .ov054_L800F932C
/* 002D30 800F9310 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F9314:
/* 002D34 800F9314 0C00EFA1 */  jal   func_8003BE84
/* 002D38 800F9318 2405FFFE */   addiu $a1, $zero, -2
/* 002D3C 800F931C 26100001 */  addiu $s0, $s0, 1
/* 002D40 800F9320 0211102A */  slt   $v0, $s0, $s1
/* 002D44 800F9324 1440FFFB */  bnez  $v0, .ov054_L800F9314
/* 002D48 800F9328 02402021 */   addu  $a0, $s2, $zero
.ov054_L800F932C:
/* 002D4C 800F932C 0C00EFA1 */  jal   func_8003BE84
/* 002D50 800F9330 2405FFFC */   addiu $a1, $zero, -4
.ov054_L800F9334:
/* 002D54 800F9334 0C00F053 */  jal   DirectionPrompt
/* 002D58 800F9338 02402021 */   addu  $a0, $s2, $zero
/* 002D5C 800F933C 00408021 */  addu  $s0, $v0, $zero
/* 002D60 800F9340 0C00EE42 */  jal   func_8003B908
/* 002D64 800F9344 02402021 */   addu  $a0, $s2, $zero
/* 002D68 800F9348 0C03DE74 */  jal   ov054_func_800F79D0
/* 002D6C 800F934C 00000000 */   nop   
/* 002D70 800F9350 16000003 */  bnez  $s0, .ov054_L800F9360
/* 002D74 800F9354 2404FFFF */   addiu $a0, $zero, -1
/* 002D78 800F9358 0803E4D9 */  j     ov054_func_800F9364
/* 002D7C 800F935C 24050008 */   addiu $a1, $zero, 8

.ov054_L800F9360:
/* 002D80 800F9360 24050010 */  addiu $a1, $zero, 0x10
ov054_func_800F9364:
/* 002D84 800F9364 0C013611 */  jal   SetNextChainAndSpace
/* 002D88 800F9368 00003021 */   addu  $a2, $zero, $zero
/* 002D8C 800F936C 3C048010 */  lui   $a0, 0x8010
/* 002D90 800F9370 0C03E3A0 */  jal   ov054_func_800F8E80
/* 002D94 800F9374 8C84A350 */   lw    $a0, -0x5cb0($a0)
ov054_func_800F9378:
/* 002D98 800F9378 0C017764 */  jal   EndProcess
/* 002D9C 800F937C 00002021 */   addu  $a0, $zero, $zero
/* 002DA0 800F9380 8FBF0024 */  lw    $ra, 0x24($sp)
/* 002DA4 800F9384 8FB20020 */  lw    $s2, 0x20($sp)
/* 002DA8 800F9388 8FB1001C */  lw    $s1, 0x1c($sp)
/* 002DAC 800F938C 8FB00018 */  lw    $s0, 0x18($sp)
/* 002DB0 800F9390 03E00008 */  jr    $ra
/* 002DB4 800F9394 27BD0028 */   addiu $sp, $sp, 0x28

/* 002DB8 800F9398 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002DBC 800F939C AFBF0010 */  sw    $ra, 0x10($sp)
/* 002DC0 800F93A0 2404FFFF */  addiu $a0, $zero, -1
/* 002DC4 800F93A4 24050009 */  addiu $a1, $zero, 9
/* 002DC8 800F93A8 0C013611 */  jal   SetNextChainAndSpace
/* 002DCC 800F93AC 24060001 */   addiu $a2, $zero, 1
/* 002DD0 800F93B0 8FBF0010 */  lw    $ra, 0x10($sp)
/* 002DD4 800F93B4 03E00008 */  jr    $ra
/* 002DD8 800F93B8 27BD0018 */   addiu $sp, $sp, 0x18

/* 002DDC 800F93BC 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002DE0 800F93C0 AFBF0010 */  sw    $ra, 0x10($sp)
/* 002DE4 800F93C4 2404FFFF */  addiu $a0, $zero, -1
/* 002DE8 800F93C8 24050002 */  addiu $a1, $zero, 2
/* 002DEC 800F93CC 0C013611 */  jal   SetNextChainAndSpace
/* 002DF0 800F93D0 00003021 */   addu  $a2, $zero, $zero
/* 002DF4 800F93D4 8FBF0010 */  lw    $ra, 0x10($sp)
/* 002DF8 800F93D8 03E00008 */  jr    $ra
/* 002DFC 800F93DC 27BD0018 */   addiu $sp, $sp, 0x18

/* 002E00 800F93E0 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002E04 800F93E4 AFBF0010 */  sw    $ra, 0x10($sp)
/* 002E08 800F93E8 2404FFFF */  addiu $a0, $zero, -1
/* 002E0C 800F93EC 24050004 */  addiu $a1, $zero, 4
/* 002E10 800F93F0 0C013611 */  jal   SetNextChainAndSpace
/* 002E14 800F93F4 00003021 */   addu  $a2, $zero, $zero
/* 002E18 800F93F8 8FBF0010 */  lw    $ra, 0x10($sp)
/* 002E1C 800F93FC 03E00008 */  jr    $ra
/* 002E20 800F9400 27BD0018 */   addiu $sp, $sp, 0x18

/* 002E24 800F9404 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002E28 800F9408 AFBF0010 */  sw    $ra, 0x10($sp)
/* 002E2C 800F940C 2404FFFF */  addiu $a0, $zero, -1
/* 002E30 800F9410 24050009 */  addiu $a1, $zero, 9
/* 002E34 800F9414 0C013611 */  jal   SetNextChainAndSpace
/* 002E38 800F9418 00003021 */   addu  $a2, $zero, $zero
/* 002E3C 800F941C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 002E40 800F9420 03E00008 */  jr    $ra
/* 002E44 800F9424 27BD0018 */   addiu $sp, $sp, 0x18

/* 002E48 800F9428 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002E4C 800F942C AFBF0010 */  sw    $ra, 0x10($sp)
/* 002E50 800F9430 2404FFFF */  addiu $a0, $zero, -1
/* 002E54 800F9434 24050007 */  addiu $a1, $zero, 7
/* 002E58 800F9438 0C013611 */  jal   SetNextChainAndSpace
/* 002E5C 800F943C 00003021 */   addu  $a2, $zero, $zero
/* 002E60 800F9440 8FBF0010 */  lw    $ra, 0x10($sp)
/* 002E64 800F9444 03E00008 */  jr    $ra
/* 002E68 800F9448 27BD0018 */   addiu $sp, $sp, 0x18

/* 002E6C 800F944C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002E70 800F9450 AFBF0010 */  sw    $ra, 0x10($sp)
/* 002E74 800F9454 2404FFFF */  addiu $a0, $zero, -1
/* 002E78 800F9458 00002821 */  addu  $a1, $zero, $zero
/* 002E7C 800F945C 0C013611 */  jal   SetNextChainAndSpace
/* 002E80 800F9460 24060001 */   addiu $a2, $zero, 1
/* 002E84 800F9464 8FBF0010 */  lw    $ra, 0x10($sp)
/* 002E88 800F9468 03E00008 */  jr    $ra
/* 002E8C 800F946C 27BD0018 */   addiu $sp, $sp, 0x18

ov054_func_800F9470:
/* 002E90 800F9470 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 002E94 800F9474 AFBF001C */  sw    $ra, 0x1c($sp)
/* 002E98 800F9478 AFB20018 */  sw    $s2, 0x18($sp)
/* 002E9C 800F947C AFB10014 */  sw    $s1, 0x14($sp)
/* 002EA0 800F9480 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 002EA4 800F9484 AFB00010 */   sw    $s0, 0x10($sp)
/* 002EA8 800F9488 00408821 */  addu  $s1, $v0, $zero
/* 002EAC 800F948C 00112400 */  sll   $a0, $s1, 0x10
/* 002EB0 800F9490 0C010177 */  jal   func_800405DC
/* 002EB4 800F9494 00042403 */   sra   $a0, $a0, 0x10
/* 002EB8 800F9498 2404FFFF */  addiu $a0, $zero, -1
/* 002EBC 800F949C 2405FFFF */  addiu $a1, $zero, -1
/* 002EC0 800F94A0 0C014AFA */  jal   func_80052BE8
/* 002EC4 800F94A4 24060002 */   addiu $a2, $zero, 2
/* 002EC8 800F94A8 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 002ECC 800F94AC 24040042 */   addiu $a0, $zero, 0x42
/* 002ED0 800F94B0 5440000F */  bnezl $v0, .ov054_L800F94F0
/* 002ED4 800F94B4 24040041 */   addiu $a0, $zero, 0x41
/* 002ED8 800F94B8 24040048 */  addiu $a0, $zero, 0x48
/* 002EDC 800F94BC 2405003C */  addiu $a1, $zero, 0x3c
/* 002EE0 800F94C0 24060010 */  addiu $a2, $zero, 0x10
/* 002EE4 800F94C4 0C01364C */  jal   CreateTextWindow
/* 002EE8 800F94C8 24070003 */   addiu $a3, $zero, 3
/* 002EEC 800F94CC 00408021 */  addu  $s0, $v0, $zero
/* 002EF0 800F94D0 00021400 */  sll   $v0, $v0, 0x10
/* 002EF4 800F94D4 00022403 */  sra   $a0, $v0, 0x10
/* 002EF8 800F94D8 24050239 */  addiu $a1, $zero, 0x239
/* 002EFC 800F94DC 2406FFFF */  addiu $a2, $zero, -1
/* 002F00 800F94E0 0C01B5F6 */  jal   LoadStringIntoWindow
/* 002F04 800F94E4 2407FFFF */   addiu $a3, $zero, -1
/* 002F08 800F94E8 0803E548 */  j     ov054_func_800F9520
/* 002F0C 800F94EC 2412000A */   addiu $s2, $zero, 0xa

.ov054_L800F94F0:
/* 002F10 800F94F0 2405003C */  addiu $a1, $zero, 0x3c
/* 002F14 800F94F4 24060011 */  addiu $a2, $zero, 0x11
/* 002F18 800F94F8 0C01364C */  jal   CreateTextWindow
/* 002F1C 800F94FC 24070003 */   addiu $a3, $zero, 3
/* 002F20 800F9500 00408021 */  addu  $s0, $v0, $zero
/* 002F24 800F9504 00021400 */  sll   $v0, $v0, 0x10
/* 002F28 800F9508 00022403 */  sra   $a0, $v0, 0x10
/* 002F2C 800F950C 2405023A */  addiu $a1, $zero, 0x23a
/* 002F30 800F9510 2406FFFF */  addiu $a2, $zero, -1
/* 002F34 800F9514 0C01B5F6 */  jal   LoadStringIntoWindow
/* 002F38 800F9518 2407FFFF */   addiu $a3, $zero, -1
/* 002F3C 800F951C 24120014 */  addiu $s2, $zero, 0x14
ov054_func_800F9520:
/* 002F40 800F9520 00108400 */  sll   $s0, $s0, 0x10
/* 002F44 800F9524 00108403 */  sra   $s0, $s0, 0x10
/* 002F48 800F9528 02002021 */  addu  $a0, $s0, $zero
/* 002F4C 800F952C 0C01B81C */  jal   SetTextCharsPerFrame
/* 002F50 800F9530 00002821 */   addu  $a1, $zero, $zero
/* 002F54 800F9534 0C013676 */  jal   ShowTextWindow
/* 002F58 800F9538 02002021 */   addu  $a0, $s0, $zero
/* 002F5C 800F953C 0C0180AB */  jal   PlaySound
/* 002F60 800F9540 24040432 */   addiu $a0, $zero, 0x432
/* 002F64 800F9544 00118C00 */  sll   $s1, $s1, 0x10
/* 002F68 800F9548 00118C03 */  sra   $s1, $s1, 0x10
/* 002F6C 800F954C 02002021 */  addu  $a0, $s0, $zero
/* 002F70 800F9550 0C0136F5 */  jal   func_8004DBD4
/* 002F74 800F9554 02202821 */   addu  $a1, $s1, $zero
/* 002F78 800F9558 0C0136B4 */  jal   HideTextWindow
/* 002F7C 800F955C 02002021 */   addu  $a0, $s0, $zero
/* 002F80 800F9560 02408021 */  addu  $s0, $s2, $zero
/* 002F84 800F9564 02202021 */  addu  $a0, $s1, $zero
/* 002F88 800F9568 0C015658 */  jal   func_80055960
/* 002F8C 800F956C 02002821 */   addu  $a1, $s0, $zero
/* 002F90 800F9570 02202021 */  addu  $a0, $s1, $zero
/* 002F94 800F9574 0C0115DE */  jal   func_80045778
/* 002F98 800F9578 02002821 */   addu  $a1, $s0, $zero
/* 002F9C 800F957C 0C018D54 */  jal   SleepProcess
/* 002FA0 800F9580 2404001E */   addiu $a0, $zero, 0x1e
/* 002FA4 800F9584 0C00FFBF */  jal   func_8003FEFC
/* 002FA8 800F9588 02202021 */   addu  $a0, $s1, $zero
/* 002FAC 800F958C 8FBF001C */  lw    $ra, 0x1c($sp)
/* 002FB0 800F9590 8FB20018 */  lw    $s2, 0x18($sp)
/* 002FB4 800F9594 8FB10014 */  lw    $s1, 0x14($sp)
/* 002FB8 800F9598 8FB00010 */  lw    $s0, 0x10($sp)
/* 002FBC 800F959C 03E00008 */  jr    $ra
/* 002FC0 800F95A0 27BD0020 */   addiu $sp, $sp, 0x20

ov054_func_800F95A4:
/* 002FC4 800F95A4 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 002FC8 800F95A8 AFBF0014 */  sw    $ra, 0x14($sp)
/* 002FCC 800F95AC AFB00010 */  sw    $s0, 0x10($sp)
/* 002FD0 800F95B0 3C10800F */  lui   $s0, 0x800f
/* 002FD4 800F95B4 2610D192 */  addiu $s0, $s0, -0x2e6e
/* 002FD8 800F95B8 96020000 */  lhu   $v0, ($s0)
/* 002FDC 800F95BC 24420001 */  addiu $v0, $v0, 1
/* 002FE0 800F95C0 A6020000 */  sh    $v0, ($s0)
/* 002FE4 800F95C4 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 002FE8 800F95C8 24040042 */   addiu $a0, $zero, 0x42
/* 002FEC 800F95CC 14400023 */  bnez  $v0, .ov054_L800F965C
/* 002FF0 800F95D0 3C036666 */   lui   $v1, 0x6666
/* 002FF4 800F95D4 96020000 */  lhu   $v0, ($s0)
/* 002FF8 800F95D8 00021400 */  sll   $v0, $v0, 0x10
/* 002FFC 800F95DC 00022403 */  sra   $a0, $v0, 0x10
/* 003000 800F95E0 34636667 */  ori   $v1, $v1, 0x6667
/* 003004 800F95E4 00830018 */  mult  $a0, $v1
/* 003008 800F95E8 00003810 */  mfhi  $a3
/* 00300C 800F95EC 00071883 */  sra   $v1, $a3, 2
/* 003010 800F95F0 000217C3 */  sra   $v0, $v0, 0x1f
/* 003014 800F95F4 00621823 */  subu  $v1, $v1, $v0
/* 003018 800F95F8 00031080 */  sll   $v0, $v1, 2
/* 00301C 800F95FC 00431021 */  addu  $v0, $v0, $v1
/* 003020 800F9600 00021040 */  sll   $v0, $v0, 1
/* 003024 800F9604 00822023 */  subu  $a0, $a0, $v0
/* 003028 800F9608 00042400 */  sll   $a0, $a0, 0x10
/* 00302C 800F960C 10800005 */  beqz  $a0, .ov054_L800F9624
/* 003030 800F9610 00000000 */   nop   
/* 003034 800F9614 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 003038 800F9618 2404004D */   addiu $a0, $zero, 0x4d
/* 00303C 800F961C 1440000F */  bnez  $v0, .ov054_L800F965C
/* 003040 800F9620 00000000 */   nop   
.ov054_L800F9624:
/* 003044 800F9624 0C0165E6 */  jal   IsBoardFeatureDisabled
/* 003048 800F9628 2404004D */   addiu $a0, $zero, 0x4d
/* 00304C 800F962C 10400003 */  beqz  $v0, .ov054_L800F963C
/* 003050 800F9630 2404FFFF */   addiu $a0, $zero, -1
/* 003054 800F9634 0C016244 */  jal   func_80058910
/* 003058 800F9638 24050001 */   addiu $a1, $zero, 1
.ov054_L800F963C:
/* 00305C 800F963C 0C0165F7 */  jal   SetBoardFeatureEnabled
/* 003060 800F9640 2404004D */   addiu $a0, $zero, 0x4d
/* 003064 800F9644 2404005F */  addiu $a0, $zero, 0x5f
/* 003068 800F9648 00002821 */  addu  $a1, $zero, $zero
/* 00306C 800F964C 0C0161FB */  jal   func_800587EC
/* 003070 800F9650 24060001 */   addiu $a2, $zero, 1
/* 003074 800F9654 0803E599 */  j     ov054_func_800F9664
/* 003078 800F9658 00000000 */   nop   

.ov054_L800F965C:
/* 00307C 800F965C 0C03E51C */  jal   ov054_func_800F9470
/* 003080 800F9660 00000000 */   nop   
ov054_func_800F9664:
/* 003084 800F9664 8FBF0014 */  lw    $ra, 0x14($sp)
/* 003088 800F9668 8FB00010 */  lw    $s0, 0x10($sp)
/* 00308C 800F966C 03E00008 */  jr    $ra
/* 003090 800F9670 27BD0018 */   addiu $sp, $sp, 0x18

/* 003094 800F9674 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 003098 800F9678 AFBF0010 */  sw    $ra, 0x10($sp)
/* 00309C 800F967C 2404FFFF */  addiu $a0, $zero, -1
/* 0030A0 800F9680 24050008 */  addiu $a1, $zero, 8
/* 0030A4 800F9684 0C0134A9 */  jal   func_8004D2A4
/* 0030A8 800F9688 2406005D */   addiu $a2, $zero, 0x5d
/* 0030AC 800F968C 0C03E569 */  jal   ov054_func_800F95A4
/* 0030B0 800F9690 00000000 */   nop   
/* 0030B4 800F9694 0C017764 */  jal   EndProcess
/* 0030B8 800F9698 00002021 */   addu  $a0, $zero, $zero
/* 0030BC 800F969C 8FBF0010 */  lw    $ra, 0x10($sp)
/* 0030C0 800F96A0 03E00008 */  jr    $ra
/* 0030C4 800F96A4 27BD0018 */   addiu $sp, $sp, 0x18

/* 0030C8 800F96A8 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0030CC 800F96AC AFBF0010 */  sw    $ra, 0x10($sp)
/* 0030D0 800F96B0 0C0132CE */  jal   func_8004CB38
/* 0030D4 800F96B4 00000000 */   nop   
/* 0030D8 800F96B8 00021400 */  sll   $v0, $v0, 0x10
/* 0030DC 800F96BC 0C03DA56 */  jal   ov054_func_800F6958
/* 0030E0 800F96C0 00022403 */   sra   $a0, $v0, 0x10
/* 0030E4 800F96C4 00021400 */  sll   $v0, $v0, 0x10
/* 0030E8 800F96C8 00021403 */  sra   $v0, $v0, 0x10
/* 0030EC 800F96CC 24030001 */  addiu $v1, $zero, 1
/* 0030F0 800F96D0 1443000B */  bne   $v0, $v1, .ov054_L800F9700
/* 0030F4 800F96D4 24040044 */   addiu $a0, $zero, 0x44
/* 0030F8 800F96D8 00002821 */  addu  $a1, $zero, $zero
/* 0030FC 800F96DC 0C0161FB */  jal   func_800587EC
/* 003100 800F96E0 24060002 */   addiu $a2, $zero, 2
/* 003104 800F96E4 0C03D984 */  jal   ov054_func_800F6610
/* 003108 800F96E8 00000000 */   nop   
/* 00310C 800F96EC 00021400 */  sll   $v0, $v0, 0x10
/* 003110 800F96F0 2404FFFF */  addiu $a0, $zero, -1
/* 003114 800F96F4 24050008 */  addiu $a1, $zero, 8
/* 003118 800F96F8 0C0134A9 */  jal   func_8004D2A4
/* 00311C 800F96FC 00023403 */   sra   $a2, $v0, 0x10
.ov054_L800F9700:
/* 003120 800F9700 8FBF0010 */  lw    $ra, 0x10($sp)
/* 003124 800F9704 03E00008 */  jr    $ra
/* 003128 800F9708 27BD0018 */   addiu $sp, $sp, 0x18

/* 00312C 800F970C 27BDFFE0 */  addiu $sp, $sp, -0x20
/* 003130 800F9710 AFBF0018 */  sw    $ra, 0x18($sp)
/* 003134 800F9714 AFB10014 */  sw    $s1, 0x14($sp)
/* 003138 800F9718 0C0132CE */  jal   func_8004CB38
/* 00313C 800F971C AFB00010 */   sw    $s0, 0x10($sp)
/* 003140 800F9720 00021400 */  sll   $v0, $v0, 0x10
/* 003144 800F9724 0C03DA56 */  jal   ov054_func_800F6958
/* 003148 800F9728 00022403 */   sra   $a0, $v0, 0x10
/* 00314C 800F972C 00021400 */  sll   $v0, $v0, 0x10
/* 003150 800F9730 00021403 */  sra   $v0, $v0, 0x10
/* 003154 800F9734 24030002 */  addiu $v1, $zero, 2
/* 003158 800F9738 14430012 */  bne   $v0, $v1, .ov054_L800F9784
/* 00315C 800F973C 00008821 */   addu  $s1, $zero, $zero
.ov054_L800F9740:
/* 003160 800F9740 0C014AA3 */  jal   GetPlayerStruct
/* 003164 800F9744 02202021 */   addu  $a0, $s1, $zero
/* 003168 800F9748 0C014AA0 */  jal   GetCurrentPlayerIndex
/* 00316C 800F974C 00408021 */   addu  $s0, $v0, $zero
/* 003170 800F9750 00021400 */  sll   $v0, $v0, 0x10
/* 003174 800F9754 00021403 */  sra   $v0, $v0, 0x10
/* 003178 800F9758 02221026 */  xor   $v0, $s1, $v0
/* 00317C 800F975C 0002102B */  sltu  $v0, $zero, $v0
/* 003180 800F9760 A2020000 */  sb    $v0, ($s0)
/* 003184 800F9764 26310001 */  addiu $s1, $s1, 1
/* 003188 800F9768 2A220004 */  slti  $v0, $s1, 4
/* 00318C 800F976C 1440FFF4 */  bnez  $v0, .ov054_L800F9740
/* 003190 800F9770 24040001 */   addiu $a0, $zero, 1
/* 003194 800F9774 00002821 */  addu  $a1, $zero, $zero
/* 003198 800F9778 24060005 */  addiu $a2, $zero, 5
/* 00319C 800F977C 0C0161EF */  jal   func_800587BC
/* 0031A0 800F9780 24070001 */   addiu $a3, $zero, 1
.ov054_L800F9784:
/* 0031A4 800F9784 8FBF0018 */  lw    $ra, 0x18($sp)
/* 0031A8 800F9788 8FB10014 */  lw    $s1, 0x14($sp)
/* 0031AC 800F978C 8FB00010 */  lw    $s0, 0x10($sp)
/* 0031B0 800F9790 03E00008 */  jr    $ra
/* 0031B4 800F9794 27BD0020 */   addiu $sp, $sp, 0x20

/* 0031B8 800F9798 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 0031BC 800F979C AFBF0010 */  sw    $ra, 0x10($sp)
/* 0031C0 800F97A0 0C0132CE */  jal   func_8004CB38
/* 0031C4 800F97A4 00000000 */   nop   
/* 0031C8 800F97A8 00021400 */  sll   $v0, $v0, 0x10
/* 0031CC 800F97AC 00021C03 */  sra   $v1, $v0, 0x10
/* 0031D0 800F97B0 2402000A */  addiu $v0, $zero, 0xa
/* 0031D4 800F97B4 10620007 */  beq   $v1, $v0, .ov054_L800F97D4
/* 0031D8 800F97B8 24020081 */   addiu $v0, $zero, 0x81
/* 0031DC 800F97BC 1462000B */  bne   $v1, $v0, .ov054_L800F97EC
/* 0031E0 800F97C0 24040065 */   addiu $a0, $zero, 0x65
/* 0031E4 800F97C4 2404FFFF */  addiu $a0, $zero, -1
/* 0031E8 800F97C8 24050008 */  addiu $a1, $zero, 8
/* 0031EC 800F97CC 0803E5F8 */  j     ov054_func_800F97E0
/* 0031F0 800F97D0 2406006F */   addiu $a2, $zero, 0x6f

.ov054_L800F97D4:
/* 0031F4 800F97D4 2404FFFF */  addiu $a0, $zero, -1
/* 0031F8 800F97D8 24050008 */  addiu $a1, $zero, 8
/* 0031FC 800F97DC 24060062 */  addiu $a2, $zero, 0x62
ov054_func_800F97E0:
/* 003200 800F97E0 0C0134A9 */  jal   func_8004D2A4
/* 003204 800F97E4 00000000 */   nop   
/* 003208 800F97E8 24040065 */  addiu $a0, $zero, 0x65
.ov054_L800F97EC:
/* 00320C 800F97EC 00002821 */  addu  $a1, $zero, $zero
/* 003210 800F97F0 0C0161FB */  jal   func_800587EC
/* 003214 800F97F4 24060001 */   addiu $a2, $zero, 1
/* 003218 800F97F8 8FBF0010 */  lw    $ra, 0x10($sp)
/* 00321C 800F97FC 03E00008 */  jr    $ra
/* 003220 800F9800 27BD0018 */   addiu $sp, $sp, 0x18

/* 003224 800F9804 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 003228 800F9808 AFBF0010 */  sw    $ra, 0x10($sp)
/* 00322C 800F980C 2404FFFF */  addiu $a0, $zero, -1
/* 003230 800F9810 24050008 */  addiu $a1, $zero, 8
/* 003234 800F9814 0C0134A9 */  jal   func_8004D2A4
/* 003238 800F9818 24060070 */   addiu $a2, $zero, 0x70
/* 00323C 800F981C 24040048 */  addiu $a0, $zero, 0x48
/* 003240 800F9820 00002821 */  addu  $a1, $zero, $zero
/* 003244 800F9824 24060003 */  addiu $a2, $zero, 3
/* 003248 800F9828 0C0161EF */  jal   func_800587BC
/* 00324C 800F982C 24070001 */   addiu $a3, $zero, 1
/* 003250 800F9830 8FBF0010 */  lw    $ra, 0x10($sp)
/* 003254 800F9834 03E00008 */  jr    $ra
/* 003258 800F9838 27BD0018 */   addiu $sp, $sp, 0x18

/* 00325C 800F983C 27BDFFE8 */  addiu $sp, $sp, -0x18
/* 003260 800F9840 AFBF0010 */  sw    $ra, 0x10($sp)
/* 003264 800F9844 0C007490 */  jal   func_8001D240
/* 003268 800F9848 24040002 */   addiu $a0, $zero, 2
/* 00326C 800F984C 3C058010 */  lui   $a1, 0x8010
/* 003270 800F9850 24A598C0 */  addiu $a1, $a1, -0x6740
/* 003274 800F9854 0C007535 */  jal   func_8001D4D4
/* 003278 800F9858 24040001 */   addiu $a0, $zero, 1
/* 00327C 800F985C 0C03DC09 */  jal   ov054_func_800F7024
/* 003280 800F9860 00000000 */   nop   
/* 003284 800F9864 0C01613C */  jal   func_800584F0
/* 003288 800F9868 24040002 */   addiu $a0, $zero, 2
/* 00328C 800F986C 3C04800F */  lui   $a0, 0x800f
/* 003290 800F9870 24846CD8 */  addiu $a0, $a0, 0x6cd8
/* 003294 800F9874 24051005 */  addiu $a1, $zero, 0x1005
/* 003298 800F9878 00003021 */  addu  $a2, $zero, $zero
/* 00329C 800F987C 0C01770A */  jal   InitProcess
/* 0032A0 800F9880 00003821 */   addu  $a3, $zero, $zero
/* 0032A4 800F9884 8FBF0010 */  lw    $ra, 0x10($sp)
/* 0032A8 800F9888 03E00008 */  jr    $ra
/* 0032AC 800F988C 27BD0018 */   addiu $sp, $sp, 0x18

overlay54_rodata:
.incbin "bin/marioparty.u.244B50.overlay54_rodata.bin"
overlay54_rodata_end: