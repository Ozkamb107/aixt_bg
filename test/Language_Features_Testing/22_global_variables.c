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
float w = 3.1416;
long x;
long y = 10;
short z = 50;
char str1[] = "name";

void  main__init() {
	
	printf("\033[1;37m"); 
	
}

void  main__clear_screen() {
	
	// linux
	system("clear");; 
	
}

int main() {
	main__init();
	
	long a = 1; 
	x = 9; 
	y = 5; 
	a = x + y - z + a; 
	return 0;
}