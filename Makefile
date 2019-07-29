# Makefile to rebuild SM64 split image

################ Target Executable and Sources ###############

# BUILD_DIR is location where all build artifacts are placed
BUILD_DIR = build

# Directories containing source files
SRC_DIRS := src src/overlays
ASM_DIRS := asm asm/overlays

# If COMPARE is 1, check the output sha1sum when building 'all'
COMPARE = 1

# Source code files
C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))

# Object files
O_FILES := $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.o))

MIPSISET := -mips2 -32

##################### Compiler Options #######################
CROSS = mips-linux-gnu-
AS = $(CROSS)as
CC = $(CROSS)gcc
LD = $(CROSS)ld
OBJDUMP = $(CROSS)objdump
OBJCOPY = $(CROSS)objcopy --pad-to=0x2000000 --gap-fill=0xFF

ASFLAGS := -march=vr4300 -mabi=32 -I include
CFLAGS  := -O2 -G 0 $(MIPSISET) -c

LDFLAGS = undefined_syms.txt -T $(LD_SCRIPT) -Map $(BUILD_DIR)/sm64.map

####################### Other Tools #########################

# N64 tools
TOOLS_DIR = tools
MIO0TOOL = $(TOOLS_DIR)/mio0
N64CKSUM = $(TOOLS_DIR)/n64cksum
N64GRAPHICS = $(TOOLS_DIR)/n64graphics
EMULATOR = mupen64plus
EMU_FLAGS = --noosd
LOADER = loader64
LOADER_FLAGS = -vwf

SHA1SUM = sha1sum

######################## Targets #############################

build/libultra.o: MIPSISET := -mips3

default: all

# file dependencies generated by splitter
MAKEFILE_SPLIT = Makefile.split
include $(MAKEFILE_SPLIT)

all: $(BUILD_DIR)/$(TARGET).z64
ifeq ($(COMPARE),1)
	@$(SHA1SUM) -c $(TARGET).sha1
endif

clean:
	$(RM) -r $(BUILD_DIR)

$(MIO0_DIR)/%.mio0: $(MIO0_DIR)/%.bin
	$(MIO0TOOL) $< $@

$(BUILD_DIR):
	mkdir $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS))

$(BUILD_DIR)/%.o: %.s $(BUILD_DIR)
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/$(TARGET).elf: $(O_FILES) $(LD_SCRIPT)
	$(LD) $(LDFLAGS) -o $@ $(O_FILES) $(LIBS)

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(OBJCOPY) $< $@ -O binary

# final z64 updates checksum
$(BUILD_DIR)/$(TARGET).z64: $(BUILD_DIR)/$(TARGET).bin
	$(N64CKSUM) $< $@

$(BUILD_DIR)/$(TARGET).hex: $(TARGET).z64
	xxd $< > $@

$(BUILD_DIR)/$(TARGET).objdump: $(BUILD_DIR)/$(TARGET).elf
	$(OBJDUMP) -D $< > $@

test: $(TARGET).z64
	$(EMULATOR) $(EMU_FLAGS) $<

load: $(TARGET).z64
	$(LOADER) $(LOADER_FLAGS) $<

.PHONY: all clean default diff test load
