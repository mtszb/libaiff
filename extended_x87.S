/*      $Id: extended_x87.S,v 1.2 2008/08/18 15:16:03 toad32767 Exp $    */

/*-
 * Copyright (c) 2008 Marco Trillo
 *
 * Permission is hereby granted, free of charge, to any
 * person obtaining a copy of this software and associated
 * documentation files (the "Software"), to deal in the
 * Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the
 * Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice
 * shall be included in all copies or substantial portions of
 * the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
 * KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
 * PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
 * OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * Native routines to read/write 80-bit extended precision
 * values in Intel 80x87 FPUs.
 */

#include "c_label.h"

        .text
	
/*
 * double x87_read_extended(const unsigned char *);
 */
        .align 2,0x90
.globl _C_LABEL(x87_read_extended)
_C_LABEL(x87_read_extended):
	pushl	%ebp
	movl	%esp, %ebp
	movl    8(%ebp), %eax
        fldt    (%eax)
	leave
	ret

/*
 * void x87_write_extended(double, unsigned char *);
 */
        .align 2,0x90
.globl _C_LABEL(x87_write_extended)
_C_LABEL(x87_write_extended):
        pushl   %ebp
        movl    %esp, %ebp
        movl    16(%ebp), %eax
        fldl    8(%ebp)
        fstpt   (%eax)
        leave
        ret


