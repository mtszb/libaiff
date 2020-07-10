/*      $Id: c_label.h,v 1.1 2008/07/25 16:02:54 toad32767 Exp $    */

#ifdef __ELF__
# define _C_LABEL(x)    x
#else
# ifdef __STDC__
#  define _C_LABEL(x)   _ ## x
# else
#  define _C_LABEL(x)   _/**/x
# endif
#endif

