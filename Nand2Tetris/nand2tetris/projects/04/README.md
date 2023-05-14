# Project 4: Machine Language

The objective of this project is to write in an assembly language and test the following two programs:

* **Mult.asm** (example of an arithmetic task):
	* The inputs of this program are the values stored in R0 and R1 (RAM[0] and RAM[1]).
	* The program computes the product R0 * R1, and stores the result in R2.
	* Assume that R0 ≥ 0, R1 ≥ 0, and R0 * R1 < 32768 (your program need not test these
	conditions).
* **Fill.asm** (example of input/output task):
	* This program runs an infinite loop that listens to the keyboard.
	* When a key is pressed (any key), the program blackens the screen by writing "black" in every pixel.
	* When no key is pressed, the program clears the screen by writing "white" in every pixel.
	* You may choose to blacken and clear the screen in any spatial pattern, as long as pressing a key continuously for long enough will result in a fully blackened screen, and not pressing any key for long enough will result in a cleared screen.

More information about this project is available on https://www.nand2tetris.org/course
