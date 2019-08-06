#Mario Party 1 (U) ROM Header

.byte  0x80, 0x37, 0x12, 0x40 # PI BSD Domain 1 register
.word  0x0000000F # clock rate setting
.word  0x80000400 # entry point
.word  0x00001449 # release
.word  0x2829657E # checksum1
.word  0xA0621877 # checksum2
.word  0x00000000 # unknown
.word  0x00000000 # unknown
.ascii "MarioParty          " # ROM name: 20 bytes
.word  0x00000000 # unknown
.word  0x00000043 # cartridge
.ascii "LB"       # cartridge ID
.ascii "E"        # country
.byte  0x00       # version
