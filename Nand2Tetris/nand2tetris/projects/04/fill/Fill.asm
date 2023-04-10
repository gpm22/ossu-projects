// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


// Pseudocode
// black = 11111111111111111
// white = 0
// screenmax = SCREEN + 8191 // 8191 is 256x32-1
// START
//  w = SCREEN
//  b = SCREEN
// LOOP
//  if (KBD > 0) goto BLACK else goto WHITE
// WHITE
//  b = SCREEN
//  @w = white 
//  w = w + 1 
//  if (w > screenmax) goto START else goto LOOP
//
// BLACK
// w = SCREEN
// @b = black
// b = b +  1
// if (b > screenmax) goto START else goto LOOP

// Actual code

// black = 1111111111111111
@black
M=-1

// white = 0
@white
M=0

// screenmax = SCREEN + 8191 // 8191 is 256x32-1

@8191
D=A
@SCREEN
D=D+A

@screenmax
M=D

(START)
    //  w = SCREEN
    @SCREEN
    D=A
    @w
    M=D
    //  b = SCREEN
    @SCREEN
    D=A
    @b
    M=D
(LOOP)
//  if (KBD > 0) goto BLACK else goto WHITE
    @KBD
    D=M
    @BLACK
    D;JGT
    @WHITE
    0;JMP

(WHITE)
//  b = SCREEN
    @SCREEN
    D=A
    @b
    M=D   
//  @w = white
    @white
    D=M
    @w
    A=M
    M=D 
//  w = w + 1
    @w
    M=M+1
//  if (w > screenmax) goto START else goto LOOP
    @w
    D=M 
    @screenmax
    D=D-M 
    @START
    D;JGT
    @LOOP
    0;JMP
//
(BLACK)
// w = SCREEN
    @SCREEN
    D=A
    @w
    M=D
// @b = black
    @black
    D=M
    @b
    A=M
    M=D 
// b = b + 1
    @b
    M=M+1
// if (b > screenmax) goto START else goto LOOP
    @b
    D=M 
    @screenmax
    D=D-M 
    @START
    D;JGT
    @LOOP
    0;JMP