// This C code was automatically generated by Aixt Project
// Device = Emulator
// Board = Linux, Windows and Android
// Backend = c

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

void  main__init();
void  main__clear_screen();
long  main__average(long x, long y);

void  main__init() {
	
	printf("\033[1;37m"); 
	
}

void  main__clear_screen() {
	
	// linux
	system("clear");; 
	
}

inline long  main__average(long x, long y) {
	
	return (x + y) / 2; 
	
}

int main() {
	main__init();
	
	long a = 23;long b = 67;long c = 0; 
	c = main__average(a, b); 
	return 0;
}