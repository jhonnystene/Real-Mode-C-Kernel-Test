/*
 * kernel.c
 * Real Mode Test OS written in C.
 * 
 * This introduces quite a lot of issues. It's probably not worth the
 * trouble.
 */
 
asm("section .text"); // Make sure we're in the text section

// Initialise stack
asm("mov ax, 0");
asm("mov ss, ax");
asm("mov sp, [stack]");

// Jump to kernel
asm("jmp _kernel_main");
 
// Normally, you'd write to 0xB8000. Because SmallerC doesn't like that,
// we use int 0x10 instead.
void printchar(char character) {
	// We need the character loaded into AL because when it's in the
	// stack, it causes issues.
	char c = character; 
	asm("mov ah, 0Eh\nmov bh, 0\nint 10h");
}

// Just print "Hello, Kernel World!" and halt.
void kernel_main(void) {
	printchar('H');
	printchar('e');
	printchar('l');
	printchar('l');
	printchar('o');
	printchar(',');
	printchar(' ');
	printchar('K');
	printchar('e');
	printchar('r');
	printchar('n');
	printchar('e');
	printchar('l');
	printchar(' ');
	printchar('W');
	printchar('o');
	printchar('r');
	printchar('l');
	printchar('d');
	printchar('!');
	
	while(1) {} // Halt
}

asm("stack:");
