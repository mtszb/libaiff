# Get extra m4 macros from the m4/ directory
ACLOCAL_AMFLAGS = -I m4

# Default C preprocessor (and by implication compiler) flags:
AM_CPPFLAGS = \
  @OPTIM_FLAGS@ \
  -I. -Ilibaiff
# Default C compiler flags:
#   Turn on essentially all warnings.
AM_CFLAGS = @WARN_CFLAGS@

# API headers
nobase_include_HEADERS = \
  libaiff/endian.h \
  libaiff/libaiff.h

# Generated API headers
nobase_nodist_include_HEADERS = libaiff/config.h

# Libtool libraries
lib_LTLIBRARIES = libaiff.la

libaiff_la_SOURCES = \
  aifx.c \
  asm_ppc.h \
  c_label.h \
  extended.c \
  float32.c \
  g711.c \
  iff.c \
  libaiff.c \
  lpcm.c \
  pascal.c \
  private.h
if LIBAIFF_PPC
libaiff_la_SOURCES += swap_ppc.S
endif
if LIBAIFF_X86
libaiff_la_SOURCES += extended_x87.S
endif

libaiff_la_LDFLAGS = \
  -export-symbols-regex '^AIFF_' \
  -version-info $(LIBAIFF_LIB_VERSION)

libaiff_la_LIBADD = $(OPTIM_FILES)
libaiff_la_DEPENDENCIES = $(OPTIM_FILES)
