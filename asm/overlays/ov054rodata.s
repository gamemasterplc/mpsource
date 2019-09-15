.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

.include "globals.inc"
.include "macros.inc"

overlay54_rodata:
.incbin "bin/marioparty.u.244B50.overlay54_rodata.bin"
