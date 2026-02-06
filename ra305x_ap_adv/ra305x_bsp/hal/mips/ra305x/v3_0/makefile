# eCos makefile

# This is a generated file - do not edit

export PREFIX := /workspace/mtk7628_eCos/ra305x_ap_adv/ra305x_bsp/install
export COMMAND_PREFIX := mipsisa32-elf-
export CC := $(COMMAND_PREFIX)gcc
export OBJCOPY := $(COMMAND_PREFIX)objcopy
export HOST := UNIX
export AR := $(COMMAND_PREFIX)ar

export REPOSITORY := /workspace/mtk7628_eCos/packages
PACKAGE := hal/mips/ra305x/v3_0
OBJECT_PREFIX := hal_mips_ra305x
CFLAGS := -Wall -Wpointer-arith -Wstrict-prototypes -Wundef -Wno-write-strings -EL -mips32 -msoft-float -g -O2 -ffunction-sections -fdata-sections -fno-rtti -fno-exceptions -G0 -DCONFIG_MT7628_ASIC
LDFLAGS := -EL -mips32 -msoft-float -g -nostdlib -Wl,--gc-sections -Wl,-static
VPATH := $(REPOSITORY)/$(PACKAGE)
INCLUDE_PATH := $(INCLUDE_PATH) -I$(PREFIX)/include $(foreach dir,$(VPATH),-I$(dir) -I$(dir)/src -I$(dir)/tests) -I.
MLT := $(wildcard $(REPOSITORY)/$(PACKAGE)/include/pkgconf/mlt*.ldi $(REPOSITORY)/$(PACKAGE)/include/pkgconf/mlt*.h)
TESTS := 

build: headers libtarget.a.stamp

LIBRARY := libtarget.a
COMPILE := src/hal_diag.c src/platform.S src/plf_misc.c src/ra_serial.c
OBJECTS := $(COMPILE:.cxx=.o.d)
OBJECTS := $(OBJECTS:.cpp=.o.d)
OBJECTS := $(OBJECTS:.c=.o.d)
OBJECTS := $(OBJECTS:.S=.o.d)

$(LIBRARY).stamp: $(OBJECTS)
	$(AR) rcs $(PREFIX)/lib/$(@:.stamp=) $(foreach obj,$?,$(if $(obj:%.o=),$(dir $(obj))$(OBJECT_PREFIX)_$(notdir $(obj:.o.d=.o)),$(obj)))
	@cat $(foreach obj,$^,$(obj:.o=.o.d)) > $(@:.stamp=.deps)
	@touch $@

$(PREFIX)/include/cyg/hal/plf_defs.inc: $(wildcard $(REPOSITORY)/$(PACKAGE)/src/plf_mk_defs.c)
	$(CC) $(CFLAGS) $(INCLUDE_PATH) -Wp,-MD,plf_defs.tmp -o plf_mk_defs.tmp -S $<
	fgrep .equ plf_mk_defs.tmp | sed s/#// > $@
	@echo $@ ": \\" > $(notdir $@).deps
	@tail -n +2 plf_defs.tmp >> $(notdir $@).deps
	@echo >> $(notdir $@).deps
	@rm plf_defs.tmp plf_mk_defs.tmp
	

headers: mlt_headers $(PREFIX)/include/cyg/hal/hal_diag.h $(PREFIX)/include/cyg/hal/plf_stub.h $(PREFIX)/include/cyg/hal/plf_io.h $(PREFIX)/include/cyg/hal/plf_cache.h $(PREFIX)/include/cyg/hal/plf_intr.h $(PREFIX)/include/cyg/hal/platform.inc

$(PREFIX)/include/cyg/hal/hal_diag.h: $(REPOSITORY)/$(PACKAGE)/include/hal_diag.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/hal/plf_stub.h: $(REPOSITORY)/$(PACKAGE)/include/plf_stub.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/hal/plf_io.h: $(REPOSITORY)/$(PACKAGE)/include/plf_io.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/hal/plf_cache.h: $(REPOSITORY)/$(PACKAGE)/include/plf_cache.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/hal/plf_intr.h: $(REPOSITORY)/$(PACKAGE)/include/plf_intr.h
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

$(PREFIX)/include/cyg/hal/platform.inc: $(REPOSITORY)/$(PACKAGE)/include/platform.inc
	@mkdir -p $(dir $@)
	@cp $< $@
	@chmod u+w $@

include $(REPOSITORY)/pkgconf/rules.mak

