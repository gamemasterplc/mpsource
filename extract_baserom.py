#!/usr/bin/python3

import os;
import sys;
import struct;

ROM_FILE_NAME = "baserom.u.z64"

def extract_rom_file(name, offset, size):
    try:
        with open(name, "wb") as f:
            f.write(romData[offset:offset+size])
    except IOError:
        print("failed to write output bin file " + name)

try:
    with open(ROM_FILE_NAME, "rb") as f:
        romData = f.read()
except IOError:
    print("failed to read file" + ROM_FILE_NAME)
    sys.exit(1)


ROM_MYSTERYFILE_START = 0x31BFE0
ROM_MAINFS_START = 0x31C7E0
ROM_STRINGS_START = 0xFCB860
ROM_HVQ_START = 0xFE2310
ROM_AUDIO_START = 0x15396A0

# Mystery File
extract_rom_file("bin/mysteryfile.u.bin", ROM_MYSTERYFILE_START, ROM_MAINFS_START - ROM_MYSTERYFILE_START)

# Main FS
extract_rom_file("bin/mainfs.u.bin", ROM_MAINFS_START, ROM_STRINGS_START - ROM_MAINFS_START)

# Strings
extract_rom_file("bin/strings.u.bin", ROM_STRINGS_START, ROM_HVQ_START - ROM_STRINGS_START)

# HVQ
extract_rom_file("bin/hvq.u.bin", ROM_HVQ_START, ROM_AUDIO_START - ROM_HVQ_START)

# Audio
extract_rom_file("bin/audio_S2_1.u.bin", ROM_AUDIO_START, 0x23F520)
extract_rom_file("bin/audio_S2_2.u.bin", 0x1778BC0, 0xB9F20)
extract_rom_file("bin/audio_T3_1.u.bin", 0x1832AE0, 0x385980)
extract_rom_file("bin/audio_T3_2.u.bin", 0x1BB8460, 0x134800)
extract_rom_file("bin/audio_FXD0.u.bin", 0x1CECC60, 0x830)
