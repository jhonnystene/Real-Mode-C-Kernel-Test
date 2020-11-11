void printchar(char character) {
	char c = character;
	asm("mov ah, 0Eh\nmov bh, 0\nint 10h");
}

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
}
