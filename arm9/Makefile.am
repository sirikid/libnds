noinst_LIBRARIES = libnds9.a

libnds9_a_SOURCES = background.c boxtest.c default_font.bin.h		\
default_font.bin.s console.c dcache.s decompress.c dldi/dldi.c		\
dldi/dldi_stub.s dldi/nand.twl.c dldi/sd.twl.c dynamicArray.c		\
exceptionHandler.s exceptions.c firmware.c gl2d.c guitarGrip.c		\
gurumeditation.c heapfuncs.c icache.s image.c keyboard.c keys.c		\
linkedlist.c ndsmotion.c paddle.c pcx.c piano.c rumble.c sassert.c	\
shadowRegs.c sound.c sprite.c sprite_alloc.c system/IntrWait.s		\
system/cpu_clock.s system/initSystem.c system/mpu_setup.s		\
system/securearea.c system/timeSupport.c system.c touch.c trig.c	\
vectorbase.s video.c videoGL.c window.c ../common/biosCalls.s		\
../common/biosCalls.twl.s ../common/card.c ../common/cardEeprom.c	\
../common/debugprint.s ../common/fifosystem.c				\
../common/interruptDispatcher.s ../common/interrupts.c			\
../common/libnds_exit.arm.c ../common/libnds_internal.h			\
../common/reset.c ../common/rsa.c ../common/sha1.c			\
../common/swiSoftReset.s ../common/syscalls.c ../common/systemReset.c	\
../common/timers.c

AM_CFLAGS = -g -Wall -Os -ffunction-sections -fdata-sections	\
-fomit-frame-pointer -mthumb -mthumb-interwork -march=armv5te	\
-mcpu=arm9e -mtune=arm946e-s -DARM9				\
-L/usr/lib/devkitpro/arm-none-eabi/include

AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_srcdir)/common	\
-I$(top_srcdir)/arm9 -I/usr/lib/devkitpro/arm-none-eabi/include

AM_CCASFLAGS = $(AM_CFLAGS) $(AM_CPPFLAGS) -xassembler-with-cpp

default_font.bin.h default_font.bin.s: default_font.bin
	$(BIN2S) -a4 -H default_font.bin.h default_font.bin >default_font.bin.s

# %.bin.s %.bin.h: %.bin
# 	$(BIN2S) -a4 -H $<.h $< >$<.s

# %.png.s %.png.h: %.png %.grit
# 	$(GRIT) $< -fts -o $*
