AC_INIT([libnds],[1.8.0],[https://github.com/devkitpro/libnds/issues],[],[https://devkitpro.org])

AC_CONFIG_MACRO_DIRS([m4])

AM_INIT_AUTOMAKE([foreign subdir-objects])

AC_CANONICAL_BUILD
AC_CANONICAL_HOST

AM_PROG_AS
AC_PROG_CC
AC_PROG_CXX
AC_PROG_RANLIB

AC_CHECK_TOOL([GRIT], [grit], [:])
AC_CHECK_TOOL([BIN2S], [bin2s], [:])

AC_CONFIG_FILES([Makefile arm7/Makefile arm9/Makefile example/Makefile])
AC_OUTPUT
