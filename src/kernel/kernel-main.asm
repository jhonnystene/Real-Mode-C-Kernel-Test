bits 16

; glb printchar : (
; prm     character : char
;     ) void
section .text
_printchar:
	push	bp
	mov	bp, sp
	 sub	sp,          2
; loc     character : (@4) : char
; loc     c : (@-2) : char
; RPN'ized expression: "c character = "
; Expanded expression: "(@-2) (@4) *(-1) =(-1) "
; Fused expression:    "=(167) *(@-2) *(@4) "
	mov	al, [bp+4]
	cbw
	mov	[bp-2], ax
mov ah, 0Eh
mov bh, 0
int 10h
L1:
	leave
	ret

; glb kernel_main : (void) void
section .text
_kernel_main:
	push	bp
	mov	bp, sp
	;sub	sp,          0
; RPN'ized expression: "( 72 printchar ) "
; Expanded expression: " 72  printchar ()2 "
; Fused expression:    "( 72 , printchar )2 "
	push	72
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 101 printchar ) "
; Expanded expression: " 101  printchar ()2 "
; Fused expression:    "( 101 , printchar )2 "
	push	101
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 108 printchar ) "
; Expanded expression: " 108  printchar ()2 "
; Fused expression:    "( 108 , printchar )2 "
	push	108
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 108 printchar ) "
; Expanded expression: " 108  printchar ()2 "
; Fused expression:    "( 108 , printchar )2 "
	push	108
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 111 printchar ) "
; Expanded expression: " 111  printchar ()2 "
; Fused expression:    "( 111 , printchar )2 "
	push	111
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 44 printchar ) "
; Expanded expression: " 44  printchar ()2 "
; Fused expression:    "( 44 , printchar )2 "
	push	44
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 32 printchar ) "
; Expanded expression: " 32  printchar ()2 "
; Fused expression:    "( 32 , printchar )2 "
	push	32
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 75 printchar ) "
; Expanded expression: " 75  printchar ()2 "
; Fused expression:    "( 75 , printchar )2 "
	push	75
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 101 printchar ) "
; Expanded expression: " 101  printchar ()2 "
; Fused expression:    "( 101 , printchar )2 "
	push	101
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 114 printchar ) "
; Expanded expression: " 114  printchar ()2 "
; Fused expression:    "( 114 , printchar )2 "
	push	114
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 110 printchar ) "
; Expanded expression: " 110  printchar ()2 "
; Fused expression:    "( 110 , printchar )2 "
	push	110
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 101 printchar ) "
; Expanded expression: " 101  printchar ()2 "
; Fused expression:    "( 101 , printchar )2 "
	push	101
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 108 printchar ) "
; Expanded expression: " 108  printchar ()2 "
; Fused expression:    "( 108 , printchar )2 "
	push	108
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 32 printchar ) "
; Expanded expression: " 32  printchar ()2 "
; Fused expression:    "( 32 , printchar )2 "
	push	32
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 87 printchar ) "
; Expanded expression: " 87  printchar ()2 "
; Fused expression:    "( 87 , printchar )2 "
	push	87
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 111 printchar ) "
; Expanded expression: " 111  printchar ()2 "
; Fused expression:    "( 111 , printchar )2 "
	push	111
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 114 printchar ) "
; Expanded expression: " 114  printchar ()2 "
; Fused expression:    "( 114 , printchar )2 "
	push	114
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 108 printchar ) "
; Expanded expression: " 108  printchar ()2 "
; Fused expression:    "( 108 , printchar )2 "
	push	108
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 100 printchar ) "
; Expanded expression: " 100  printchar ()2 "
; Fused expression:    "( 100 , printchar )2 "
	push	100
	call	_printchar
	sub	sp, -2
; RPN'ized expression: "( 33 printchar ) "
; Expanded expression: " 33  printchar ()2 "
; Fused expression:    "( 33 , printchar )2 "
	push	33
	call	_printchar
	sub	sp, -2
L3:
	leave
	ret


; Syntax/declaration table/stack:
; Bytes used: 115/15360


; Macro table:
; Macro __SMALLER_C__ = `0x0100`
; Macro __SMALLER_C_16__ = ``
; Macro __SMALLER_C_SCHAR__ = ``
; Macro __SMALLER_C_UWCHAR__ = ``
; Macro __SMALLER_C_WCHAR16__ = ``
; Bytes used: 110/5120


; Identifier table:
; Ident 
; Ident __floatsisf
; Ident __floatunsisf
; Ident __fixsfsi
; Ident __fixunssfsi
; Ident __addsf3
; Ident __subsf3
; Ident __negsf2
; Ident __mulsf3
; Ident __divsf3
; Ident __lesf2
; Ident __gesf2
; Ident printchar
; Ident character
; Ident kernel_main
; Ident <something>
; Bytes used: 171/5632

; Next label number: 5
; Compilation succeeded.
