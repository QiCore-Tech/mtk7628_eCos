# eCos makefile

# This is a generated file - do not edit

export PREFIX := /workspace/mtk7628_eCos/ra305x_ap_adv/ra305x_bsp/install
export COMMAND_PREFIX := mipsisa32-elf-
export CC := $(COMMAND_PREFIX)gcc
export OBJCOPY := $(COMMAND_PREFIX)objcopy
export HOST := UNIX
export AR := $(COMMAND_PREFIX)ar

export REPOSITORY := /workspace/mtk7628_eCos/packages
PACKAGE := io/pci/v3_0
OBJECT_PREFIX := io_pci
CFLAGS := -Wall -Wpointer-arith -Wstrict-prototypes -Wundef -Wno-write-strings -EL -mips32 -msoft-float -g -O2 -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -G0 -DCONFIG_MT7628_ASIC
LDFLAGS := -EL -mips32 -msoft-float -g -nostdlib -Wl,--gc-sections -Wl,-static
VPATH := $(REPOSITORY)/$(PACKAGE)
INCLUDE_PATH := $(INCLUDE_PATH) -I$(PREFIX)/include $(foreach dir,$(VPATH),-I$(dir) -I$(dir)/src -I$(dir)/tests) -I.
MLT := $(wildcard $(REPOSITORY)/$(PACKAGE)/include/pkgconf/mlt*.ldi $(REPOSITORY)/$(PACKAGE)/include/pkgconf/mlt*.h)
TESTS := tests/pci1 tests/pci2

build: headers libtarget.a.stamp

LIBRARY := libtarget.a
COMPILE := src/pci.c src/pci_hw.c
OBJECTS := $(COMPILE:.cxx=.o.d)
OBJECTS := $(OBJECTS:.cpp=.o.d)
OBJECTS := $(OBJECTS:.c=.o.d)
OBJECTS := $(OBJECTS:.S=.o.d)

$(LIBRARY).stamp: $(OBJECTS)
	$(AR) rcs $(PREFIX)/lib/$(@:.stamp=) $(foreach obj,$?,$(if $(obj:%.o=),$(dir $(obj))$(OBJECT_PREFIX)_$(notdir $(obj:.o.d=.o)),$(obj)))
	@cat $(foreach obj,$^,$(obj:.o=.o.d)) > $(@:.stamp=.deps)
	@touch $@

headers: mlt_headers $(PREFIX)/include/cyg/io/pci.h $(PREFIX)/include/cyg/io/pci_hw.h $(PREFIX)/include/cyg/io/pci_cfg.h

$(PREFIX)/include/cyg/io/pci.h: $(REPOSITORY)/$(PACKAGE)/include/pci.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/io/pci_hw.h: $(REPOSITORY)/$(PACKAGE)/include/pci_hw.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/io/pci_cfg.h: $(REPOSITORY)/$(PACKAGE)/include/pci_cfg.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

include $(REPOSITORY)/pkgconf/rules.mak

