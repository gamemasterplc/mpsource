/* Mario Party (U) linker script */

OUTPUT_ARCH (mips)

SECTIONS
{
   rom_pos = 0;

   .boot 0 : AT(rom_pos)
   {
      build/asm/header.o(.text);
      build/asm/boot.o(.text);
   }
   rom_pos += SIZEOF(.boot);

   .main 0x80000400 : AT(rom_pos) SUBALIGN(16)
   {
      build/asm/entry.o(.text);
      build/src/main.o(.text);
      build/asm/code_80000530.o(.text);
      build/asm/code_80008DE0.o(.text);
      build/asm/code_8000AD80.o(.text);
      build/asm/code_80012CF0.o(.text);
      build/asm/code_80013770.o(.text);
      build/asm/code_80014220.o(.text);
      build/asm/code_80014AF0.o(.text);
      build/src/decode.o(.text);
      build/asm/code_800174C0.o(.text);
      build/asm/code_800178A0.o(.text);
      build/asm/code_80018870.o(.text);
      build/asm/code_800196A0.o(.text);
      build/asm/code_8001A0F0.o(.text);
      build/asm/code_8001A600.o(.text);
      build/asm/code_8001D240.o(.text);
      build/asm/code_8001DE70.o(.text);
      build/asm/code_80022390.o(.text);
      build/asm/code_80023040.o(.text);
      build/asm/code_800235F0.o(.text);
      build/asm/code_80023B40.o(.text);
      build/asm/code_80029090.o(.text);
      build/asm/code_8002B4C0.o(.text);
      build/asm/code_80034180.o(.text);
      build/asm/code_80037CE0.o(.text);
      build/asm/code_8003A060.o(.text);
      build/asm/code_8003B330.o(.text);
      build/src/heap_permanent.o(.text);
      build/src/heap_temporary.o(.text);
      build/asm/code_8003B820.o(.text);
      build/asm/code_8003C2D0.o(.text);
      build/asm/code_8003D2B0.o(.text);
      build/asm/code_8003D960.o(.text);
      build/asm/code_8003E9B0.o(.text);
      build/asm/code_800420A0.o(.text);
      build/asm/code_80042240.o(.text);
      build/asm/code_80042B60.o(.text);
      build/asm/code_80045500.o(.text);
      build/asm/code_80045BE0.o(.text);
      build/asm/code_80045EE0.o(.text);
      build/asm/code_80046720.o(.text);
      build/asm/code_80048190.o(.text);
      build/asm/code_8004B860.o(.text);
      build/asm/code_8004CB70.o(.text);
      build/asm/code_8004D930.o(.text);
      build/asm/code_80050600.o(.text);
      build/asm/code_80052A80.o(.text);
      build/asm/code_80053080.o(.text);
      build/asm/code_80053520.o(.text);
      build/asm/code_80058910.o(.text);
      build/asm/code_80058B10.o(.text);
      build/asm/code_80059280.o(.text);
      build/src/heap.o(.text);
      build/asm/code_80059B10.o(.text);
      build/asm/code_8005B6D0.o(.text);
      build/asm/code_8005B860.o(.text);
      build/asm/code_8005C1B0.o(.text);
      build/asm/code_80060F70.o(.text);
      build/asm/code_80061540.o(.text);
      build/asm/code_80061F60.o(.text);
      build/asm/code_80062140.o(.text);
      build/asm/code_80063060.o(.text);
      build/asm/code_800637C0.o(.text);
      build/asm/code_80063F40.o(.text);
      build/asm/code_800643D0.o(.text);
      build/asm/code_80064B70.o(.text);
      build/asm/code_80068410.o(.text);
      build/asm/code_8006C8E0.o(.text);
      build/asm/code_80072190.o(.text);
      build/asm/libs/code_8007BDF0.o(.text);
      build/asm/libs/code_8007C080.o(.text);
      build/asm/libs/code_8007C160.o(.text);
      build/asm/libs/code_8007FB70.o(.text);
      build/asm/libs/code_8007FFE0.o(.text);
      build/asm/libs/code_800815F0.o(.text);
      build/asm/libs/code_80081840.o(.text);
      build/asm/libs/code_80081990.o(.text);
      build/asm/libs/code_80081A80.o(.text);
      build/asm/libs/code_80081CC0.o(.text);
      build/asm/libs/code_80081EF0.o(.text);
      build/asm/libs/code_80082660.o(.text);
      build/asm/libs/code_800827C0.o(.text);
      build/asm/libs/code_80082890.o(.text);
      build/asm/libs/libs.o(.text);
      build/asm/mainrodata.o(.text);
   }
   rom_pos += SIZEOF(.main);

   OVERLAY 0x800F65E0 : NOCROSSREFS AT(rom_pos)
   {
      .ov000
      {
         build/asm/overlays/ov000.o(.text);
      }

      .ov001
      {
         build/asm/overlays/ov001.o(.text);
      }

      .ov002
      {
         build/asm/overlays/ov002.o(.text);
      }

      .ov003
      {
         build/asm/overlays/ov003.o(.text);
      }

      .ov004
      {
         build/asm/overlays/ov004.o(.text);
      }

      .ov005
      {
         build/asm/overlays/ov005.o(.text);
      }

      .ov006
      {
         build/asm/overlays/ov006.o(.text);
      }

      .ov007
      {
         build/asm/overlays/ov007.o(.text);
      }

      .ov008
      {
         build/asm/overlays/ov008.o(.text);
      }

      .ov009
      {
         build/asm/overlays/ov009.o(.text);
      }

      .ov010
      {
         build/asm/overlays/ov010.o(.text);
      }

      .ov011
      {
         build/asm/overlays/ov011.o(.text);
      }

      .ov012
      {
         build/asm/overlays/ov012.o(.text);
      }

      .ov013
      {
         build/asm/overlays/ov013.o(.text);
      }

      .ov014
      {
         build/asm/overlays/ov014.o(.text);
      }

      .ov015
      {
         build/asm/overlays/ov015.o(.text);
      }

      .ov016
      {
         build/asm/overlays/ov016.o(.text);
      }

      .ov017
      {
         build/asm/overlays/ov017.o(.text);
      }

      .ov018
      {
         build/asm/overlays/ov018.o(.text);
      }

      .ov019
      {
         build/asm/overlays/ov019.o(.text);
      }

      .ov020
      {
         build/asm/overlays/ov020.o(.text);
      }

      .ov021
      {
         build/asm/overlays/ov021.o(.text);
      }

      .ov022
      {
         build/asm/overlays/ov022.o(.text);
      }

      .ov023
      {
         build/asm/overlays/ov023.o(.text);
      }

      .ov024
      {
         build/asm/overlays/ov024.o(.text);
      }

      .ov025
      {
         build/asm/overlays/ov025.o(.text);
      }

      .ov026
      {
         build/asm/overlays/ov026.o(.text);
      }

      .ov027
      {
         build/asm/overlays/ov027.o(.text);
      }

      .ov028
      {
         build/asm/overlays/ov028.o(.text);
      }

      .ov029
      {
         build/asm/overlays/ov029.o(.text);
      }

      .ov030
      {
         build/asm/overlays/ov030.o(.text);
      }

      .ov031
      {
         build/asm/overlays/ov031.o(.text);
      }

      .ov032
      {
         build/asm/overlays/ov032.o(.text);
      }

      .ov033
      {
         build/asm/overlays/ov033.o(.text);
      }

      .ov034
      {
         build/asm/overlays/ov034.o(.text);
      }

      .ov035
      {
         build/asm/overlays/ov035.o(.text);
      }

      .ov036
      {
         build/asm/overlays/ov036.o(.text);
      }

      .ov037
      {
         build/asm/overlays/ov037.o(.text);
      }

      .ov038
      {
         build/asm/overlays/ov038.o(.text);
      }

      .ov039
      {
         build/asm/overlays/ov039.o(.text);
      }

      .ov040
      {
         build/asm/overlays/ov040.o(.text);
      }

      .ov041
      {
         build/asm/overlays/ov041.o(.text);
      }

      .ov042
      {
         build/asm/overlays/ov042.o(.text);
      }

      .ov043
      {
         build/asm/overlays/ov043.o(.text);
      }

      .ov044
      {
         build/asm/overlays/ov044.o(.text);
      }

      .ov045
      {
         build/asm/overlays/ov045.o(.text);
      }

      .ov046
      {
         build/asm/overlays/ov046.o(.text);
      }

      .ov047
      {
         build/asm/overlays/ov047.o(.text);
      }

      .ov048
      {
         build/asm/overlays/ov048.o(.text);
      }

      .ov049
      {
         build/asm/overlays/ov049.o(.text);
      }

      .ov050
      {
         build/asm/overlays/ov050.o(.text);
      }

      .ov051
      {
         build/asm/overlays/ov051.o(.text);
      }

      .ov052
      {
         build/asm/overlays/ov052.o(.text);
      }

      .ov053
      {
         build/asm/overlays/ov053.o(.text);
      }

      .ov054
      {
         build/src/overlays/ov054/main.o(.text);
         . = ALIGN (16);
         build/src/overlays/ov054/dk_jungle_adventure.o(.text);
         build/src/overlays/ov054/main.o(.rodata);
         build/asm/overlays/ov054rodata.o(.text);
         build/src/overlays/ov054/dk_jungle_adventure.o(.rodata);
      }

      .ov055
      {
         build/asm/overlays/ov055.o(.text);
      }

      .ov056
      {
         build/asm/overlays/ov056.o(.text);
      }

      .ov057
      {
         build/asm/overlays/ov057.o(.text);
      }

      .ov058
      {
         build/asm/overlays/ov058.o(.text);
      }

      .ov059
      {
         build/asm/overlays/ov059.o(.text);
      }

      .ov060
      {
         build/asm/overlays/ov060.o(.text);
      }

      .ov061
      {
         build/asm/overlays/ov061.o(.text);
      }

      .ov062
      {
         build/asm/overlays/ov062.o(.text);
      }

      .ov063
      {
         build/asm/overlays/ov063.o(.text);
      }

      .ov064
      {
         build/asm/overlays/ov064.o(.text);
      }

      .ov065
      {
         build/asm/overlays/ov065.o(.text);
      }

      .ov066
      {
         build/asm/overlays/ov066.o(.text);
      }

      .ov067
      {
         build/asm/overlays/ov067.o(.text);
      }

      .ov068
      {
         build/asm/overlays/ov068.o(.text);
      }

      .ov069
      {
         build/asm/overlays/ov069.o(.text);
      }

      .ov070
      {
         build/asm/overlays/ov070.o(.text);
      }

      .ov071
      {
         build/asm/overlays/ov071.o(.text);
      }

      .ov072
      {
         build/asm/overlays/ov072.o(.text);
      }

      .ov073
      {
         build/asm/overlays/ov073.o(.text);
      }

      .ov074
      {
         build/asm/overlays/ov074.o(.text);
      }

      .ov075
      {
         build/asm/overlays/ov075.o(.text);
      }

      .ov076
      {
         build/asm/overlays/ov076.o(.text);
      }

      .ov077
      {
         build/asm/overlays/ov077.o(.text);
      }

      .ov078
      {
         build/asm/overlays/ov078.o(.text);
      }

      .ov079
      {
         build/asm/overlays/ov079.o(.text);
      }

      .ov080
      {
         build/asm/overlays/ov080.o(.text);
      }

      .ov081
      {
         build/asm/overlays/ov081.o(.text);
      }

      .ov082
      {
         build/asm/overlays/ov082.o(.text);
      }

      .ov083
      {
         build/asm/overlays/ov083.o(.text);
      }

      .ov084
      {
         build/asm/overlays/ov084.o(.text);
      }

      .ov085
      {
         build/asm/overlays/ov085.o(.text);
      }

      .ov086
      {
         build/asm/overlays/ov086.o(.text);
      }

      .ov087
      {
         build/asm/overlays/ov087.o(.text);
      }

      .ov089
      {
         build/asm/overlays/ov089.o(.text);
      }

      .ov090
      {
         build/asm/overlays/ov090.o(.text);
      }

      .ov091
      {
         build/asm/overlays/ov091.o(.text);
      }

      .ov092
      {
         build/asm/overlays/ov092.o(.text);
      }

      .ov093
      {
         build/asm/overlays/ov093.o(.text);
      }

      .ov094
      {
         build/asm/overlays/ov094.o(.text);
      }

      .ov095
      {
         build/asm/overlays/ov095.o(.text);
      }

      .ov096
      {
         build/asm/overlays/ov096.o(.text);
      }

      .ov097
      {
         build/asm/overlays/ov097.o(.text);
      }

      .ov098
      {
         build/asm/overlays/ov098.o(.text);
      }

      .ov099
      {
         build/asm/overlays/ov099.o(.text);
      }

      .ov100
      {
         build/asm/overlays/ov100.o(.text);
      }

      .ov101
      {
         build/asm/overlays/ov101.o(.text);
      }

      .ov102
      {
         build/asm/overlays/ov102.o(.text);
      }

      .ov103
      {
         build/asm/overlays/ov103.o(.text);
      }

      .ov104
      {
         build/asm/overlays/ov104.o(.text);
      }

      .ov105
      {
         build/asm/overlays/ov105.o(.text);
      }

      .ov106
      {
         build/asm/overlays/ov106.o(.text);
      }

      .ov107
      {
         build/asm/overlays/ov107.o(.text);
      }

      .ov108
      {
         build/asm/overlays/ov108.o(.text);
      }

      .ov109
      {
         build/asm/overlays/ov109.o(.text);
      }

      .ov110
      {
         build/asm/overlays/ov110.o(.text);
      }

      .ov111
      {
         build/asm/overlays/ov111.o(.text);
      }

      .ov112
      {
         build/asm/overlays/ov112.o(.text);
      }

      .ov113
      {
         build/asm/overlays/ov113.o(.text);
      }

      .ov114
      {
         build/asm/overlays/ov114.o(.text);
      }

      .ov115
      {
         build/asm/overlays/ov115.o(.text);
      }

      .ov116
      {
         build/asm/overlays/ov116.o(.text);
      }

      .ov117
      {
         build/asm/overlays/ov117.o(.text);
      }

      .ov118
      {
         build/asm/overlays/ov118.o(.text);
      }

      .ov119
      {
         build/asm/overlays/ov119.o(.text);
      }

      .ov120
      {
         build/asm/overlays/ov120.o(.text);
      }

      .ov121
      {
         build/asm/overlays/ov121.o(.text);
      }

      .ov122
      {
         build/asm/overlays/ov122.o(.text);
      }

      .ov123
      {
         build/asm/overlays/ov123.o(.text);
      }

      .ov124
      {
         build/asm/overlays/ov124.o(.text);
      }

      .ov125
      {
         build/asm/overlays/ov125.o(.text);
      }

      .ov126
      {
         build/asm/overlays/ov126.o(.text);
      }

      .ov127
      {
         build/asm/overlays/ov127.o(.text);
      }

      .ov128
      {
         build/asm/overlays/ov128.o(.text);
      }

      .ov129
      {
         build/asm/overlays/ov129.o(.text);
      }

      .ov130
      {
         build/asm/overlays/ov130.o(.text);
      }

      .ov131
      {
         build/asm/overlays/ov131.o(.text);
      }
   }
   rom_pos += (__load_stop_ov131 - __load_start_ov000);

   .romdata 0x0 : AT(rom_pos)
   {
      build/asm/data.o(.text);
   }

   /* Discard everything not specifically mentioned above. */
   /DISCARD/ :
   {
      *(*);
   }
}
