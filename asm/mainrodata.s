.include "macros.inc"

# US: 0x800b1760

main_rodata:
.incbin "bin/marioparty.u.0B2360.main_rodata.bin", 0x0, 0x18788

# 0x800C9EE8
glabel jtbl_800C9EE8
    .word .L800083E8
    .word .L80008CF0
    .word .L80008434
    .word .L80008510
    .word .L800085F4
    .word .L800086D4
    .word .L800087B8
    .word .L80008890
    .word .L8000896C
    .word .L80008AB0
    .word .L80008BD0

# padding?
.word 0, 0, 0

.incbin "bin/marioparty.u.0B2360.main_rodata.bin", 0x187C0, 0x2F30

main_rodata_end:
