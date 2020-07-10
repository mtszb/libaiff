/*	$Id: swap_ppc.S,v 1.5 2008/09/16 16:31:07 toad32767 Exp $	*/

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

#include "c_label.h"
#include "asm_ppc.h"

	.text

/*
 * 	void lpcm_swap16(int16_t *dstSamples, 
 *	                 const int16_t *srcSamples,
 *	                 int nSamples);
 */
	.globl	_C_LABEL(lpcm_swap16)
	.align	2
_C_LABEL(lpcm_swap16):
	rlwinm	r6, r5, 1, 0, 30
	li	r8, 0
1:
	sub	r7, r6, r8
	cmpwi	r7, 4
	blt-	2f
	lwbrx	r9, r8, r4
	rlwinm	r10, r9, 16, 0, 31
	stwx	r10, r8, r3
	addi	r8, r8, 4
	b	1b
2:
	cmpwi	r7, 0
	beqlr
	lhbrx	r9, r8, r4
	sthx	r9, r8, r3
	blr


/*
 *	void lpcm_swap32(int32_t *dstSamples,
 *                       const int32_t *srcSamples,
 *                       int nSamples);
 */
	.globl _C_LABEL(lpcm_swap32)
	.align 2
_C_LABEL(lpcm_swap32):
	rlwinm	r6, r5, 2, 0, 29
	li	r8, 0
1:
	cmpw	r6, r8
	beqlr-
	lwbrx	r9, r8, r4
	stwx	r9, r8, r3
	addi	r8, r8, 4
	b	1b



