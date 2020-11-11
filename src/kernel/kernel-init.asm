BITS 16

_call_vectors:
	jmp _start
	jmp _kernel_main
	jmp _printchar

_start:
	cli
	mov ax, 0
	mov ss, ax
	mov sp, [stack_top]
	
	call _kernel_main
	.halt:
		jmp .halt

%include "src/kernel/kernel-main.asm" ; This is compiled by SmallerC

stack_bottom times 16384 db 0
stack_top db 0
