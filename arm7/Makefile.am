noinst_LIBRARIES = libnds7.a

libnds7_a_SOURCES = audio.c card.twl.c clock.c codec.twl.c firmware.c	\
i2c.twl.c input.c microphone.c microphone.twl.c sdmmc.twl.c spi.c	\
system.c systemShutDown.c touch.c userSettings.c			\
../common/biosCalls.s ../common/biosCalls.twl.s ../common/card.c	\
../common/cardEeprom.c ../common/debugprint.s ../common/fifosystem.c	\
../common/interruptDispatcher.s ../common/interrupts.c			\
../common/libnds_exit.arm.c ../common/libnds_internal.h			\
../common/Makefile.am ../common/reset.c ../common/rsa.c			\
../common/sha1.c ../common/swiSoftReset.s ../common/syscalls.c		\
../common/systemReset.c ../common/timers.c

AM_CFLAGS = -g -Wall -Os -ffunction-sections -fdata-sections	\
-fomit-frame-pointer -ffast-math -mthumb -mthumb-interwork	\
-mcpu=arm7tdmi -mtune=arm7tdmi -DARM7

AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_srcdir)/common

AM_CCASFLAGS = $(AM_CPPFLAGS) -xassembler-with-cpp
