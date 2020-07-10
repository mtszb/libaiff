#	$Id: configure.ac,v 1.5 2008/09/16 16:31:07 toad32767 Exp $
#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.60)
AC_INIT([libaiff], [4.99], [marcotrillo@gmail.com])
AC_CONFIG_HEADERS([libaiff/config.h])
AC_CONFIG_SRCDIR([./libaiff.c])

AC_CANONICAL_HOST

# Checks for programs.
AC_PROG_CC
AC_PROG_RANLIB

AC_LANG(C)

AC_C_BIGENDIAN

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([sys/types.h strings.h string.h])

# Checks for library functions.
AC_CHECK_FUNCS([memset bzero abort])

AC_TYPE_SIZE_T
AC_TYPE_INT8_T
AC_TYPE_UINT8_T
AC_TYPE_INT16_T
AC_TYPE_UINT16_T
AC_TYPE_INT32_T
AC_TYPE_UINT32_T
AC_TYPE_INT64_T
AC_TYPE_UINT64_T

case $host in
 powerpc*-*-*)	OPTIM_FLAGS="-DHAVE_OPTIMIZED_SWAP";
 		OPTIM_FILES="swap_ppc.o";
		;;
 i?86-*-*)	OPTIM_FLAGS="-DHAVE_INTEL_80x87";
 		OPTIM_FILES="extended_x87.o";
		;;
 *)		OPTIM_FLAGS="";
		OPTIM_FILES="";
		;;
esac
AC_SUBST([OPTIM_FLAGS])
AC_SUBST([OPTIM_FILES])

AC_CONFIG_FILES([
        Makefile
])

AC_OUTPUT
