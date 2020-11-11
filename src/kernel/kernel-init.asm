; kernel-init.asm
; Boot2 for my test Real Mode OS Kernel written in C.
; This just holds call vectors and makes sure the computer is in the right state to start the OS.

BITS 16

; These can be used for doing OS calls in applications loaded by your OS.
; Obviously, this OS can't load applicaitons. It is still good practice though.
_call_vectors:
	jmp _start
	jmp _kernel_main
	jmp _printchar

; Actual 2nd stage of OS boot. 
_start:
	cli ; Clear inturrupts.
	
	; Setup stack.
	mov ax, 0
	mov ss, ax
	mov sp, [stack_top]
	
	; Jump to the kernel.
	jmp _kernel_main

%include "src/kernel/kernel-main.asm" ; This is compiled by SmallerC

; Stack
stack_bottom times 16384 db 0
stack_top db 0
