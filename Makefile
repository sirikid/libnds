#---------------------------------------------------------------------------------
.SUFFIXES:
#---------------------------------------------------------------------------------
ifeq ($(strip $(DEVKITARM)),)
$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

include $(DEVKITARM)/ds_rules

#---------------------------------------------------------------------------------
BUILD		:= build

ARM9SOURCES :=	source/arm9 source/common
ARM7SOURCES :=	source/arm7 source/common

DATESTRING	:=	$(shell date +%Y)$(shell date +%m)$(shell date +%d)

export PATH		:=	$(DEVKITARM)/bin:$(PATH)

export BASEDIR	:=	$(CURDIR)
export LIBDIR	:=	$(BASEDIR)/lib
export DEPENDS	:=	$(BASEDIR)/deps
export INCDIR	:=	$(BASEDIR)/include
export BUILDDIR	:=	$(BASEDIR)/$(BUILD)

ARM9CFILES	:=	$(foreach dir,$(ARM9SOURCES),$(notdir $(wildcard $(dir)/*.c)))
ARM9SFILES	:=	$(foreach dir,$(ARM9SOURCES),$(notdir $(wildcard $(dir)/*.s)))
ARM9BINFILES	:=	$(foreach dir,$(ARM9SOURCES),$(notdir $(wildcard $(dir)/*.bin)))

ARM7CFILES	:=	$(foreach dir,$(ARM7SOURCES),$(notdir $(wildcard $(dir)/*.c)))
ARM7SFILES	:=	$(foreach dir,$(ARM7SOURCES),$(notdir $(wildcard $(dir)/*.s)))

export ARM9_VPATH	:=	$(foreach dir,$(ARM9SOURCES),$(BASEDIR)/$(dir))
export ARM7_VPATH	:=	$(foreach dir,$(ARM7SOURCES),$(BASEDIR)/$(dir))

export ARM9OBJS :=	$(ARM9BINFILES:.bin=.o) $(ARM9CFILES:.c=.o) $(ARM9SFILES:.s=.o)
export ARM9INC	:=	-I$(BUILDDIR)/arm9
export ARM7OBJS :=	$(ARM7CFILES:.c=.o) $(ARM7SFILES:.s=.o)
export ARM7INC	:=	-I$(BUILDDIR)/arm7

export ARCH	:=	-mthumb -mthumb-interwork

export ARM9FLAGS	:=	$(ARCH) -march=armv5te -mtune=arm946e-s -DARM9
export ARM7FLAGS	:=	$(ARCH) -mcpu=arm7tdmi -mtune=arm7tdmi -DARM7

export BASEFLAGS	:=	-g -Wall -O2\
				-fomit-frame-pointer\
				-ffast-math \
				-I$(INCDIR)


.PHONY:	all libs dist docs clean

#---------------------------------------------------------------------------------
all:	default.arm7   
#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------
lib/libnds9.a: $(DEPENDS)/arm9 $(BUILD)/arm9
#---------------------------------------------------------------------------------
	@$(MAKE) -C $(BUILD)/arm9 -f $(BASEDIR)/Makefile.arm9

#---------------------------------------------------------------------------------
lib/libnds7.a: $(DEPENDS)/arm7 $(BUILD)/arm7
#---------------------------------------------------------------------------------
	@$(MAKE) -C $(BUILD)/arm7 -f $(BASEDIR)/Makefile.arm7
	@$(MAKE) -C defaultARM7 TARGET=$(CURDIR)/default LIBNDS=$(CURDIR)

#---------------------------------------------------------------------------------
$(BUILD)/arm7:
#---------------------------------------------------------------------------------
	mkdir -p $@
#---------------------------------------------------------------------------------
$(BUILD)/arm9:
#---------------------------------------------------------------------------------
	mkdir -p $@
#---------------------------------------------------------------------------------
$(DEPENDS)/arm7:
#---------------------------------------------------------------------------------
	mkdir -p $@/arm7
#---------------------------------------------------------------------------------
$(DEPENDS)/arm9:
#---------------------------------------------------------------------------------
	mkdir -p $@/arm9

#---------------------------------------------------------------------------------
lib:
#---------------------------------------------------------------------------------
	mkdir -p lib

#---------------------------------------------------------------------------------
clean:
#---------------------------------------------------------------------------------
	@$(MAKE) -C defaultARM7 clean
	rm -fr $(DEPENDS) $(BUILD) *.bz2 default.arm7

#---------------------------------------------------------------------------------
dist: all
#---------------------------------------------------------------------------------
	@tar --exclude=*CVS* -cvjf libnds-src-$(DATESTRING).tar.bz2 source include license.txt Makefile Makefile.arm9 Makefile.arm7
	@tar --exclude=*CVS* -cvjf libnds-$(DATESTRING).tar.bz2 include lib license.txt default.arm7

#---------------------------------------------------------------------------------
install: dist
#---------------------------------------------------------------------------------
	mkdir -p $(DEVKITPRO)/libnds
	bzip2 -cd libnds-$(DATESTRING).tar.bz2 | tar -xv -C $(DEVKITPRO)/libnds

#---------------------------------------------------------------------------------
docs:
#---------------------------------------------------------------------------------
	doxygen libnds.dox
	cat warn.log

#---------------------------------------------------------------------------------
default.arm7: lib/libnds9.a lib/libnds7.a
#---------------------------------------------------------------------------------
	@$(MAKE) -C defaultARM7 TARGET=$(CURDIR)/default LIBNDS=$(CURDIR)
