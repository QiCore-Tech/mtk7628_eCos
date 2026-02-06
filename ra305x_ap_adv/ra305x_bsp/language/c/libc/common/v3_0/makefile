# eCos makefile

# This is a generated file - do not edit

export PREFIX := /workspace/mtk7628_eCos/ra305x_ap_adv/ra305x_bsp/install
export COMMAND_PREFIX := mipsisa32-elf-
export CC := $(COMMAND_PREFIX)gcc
export OBJCOPY := $(COMMAND_PREFIX)objcopy
export HOST := UNIX
export AR := $(COMMAND_PREFIX)ar

export REPOSITORY := /workspace/mtk7628_eCos/packages
PACKAGE := language/c/libc/common/v3_0
OBJECT_PREFIX := language_c_libc_common
CFLAGS := -Wall -Wpointer-arith -Wstrict-prototypes -Wundef -Wno-write-strings -EL -mips32 -msoft-float -g -O2 -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -G0 -DCONFIG_MT7628_ASIC
LDFLAGS := -EL -mips32 -msoft-float -g -nostdlib -Wl,--gc-sections -Wl,-static
VPATH := $(REPOSITORY)/$(PACKAGE)
INCLUDE_PATH := $(INCLUDE_PATH) -I$(PREFIX)/include $(foreach dir,$(VPATH),-I$(dir) -I$(dir)/src -I$(dir)/tests) -I.
MLT := $(wildcard $(REPOSITORY)/$(PACKAGE)/include/pkgconf/mlt*.ldi $(REPOSITORY)/$(PACKAGE)/include/pkgconf/mlt*.h)
TESTS := 

build: headers

headers: mlt_headers

include $(REPOSITORY)/pkgconf/rules.mak

