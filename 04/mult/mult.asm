// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

@R2
M=0

// If R1 == 0, skip the loop
@R1
D=M
@END
D;JEQ

// Initialize loop counter
@R1
D=M       // D = R1 (number of times to add R0)
@counter
M=D       // counter = R1

(LOOP)
// Check if counter == 0, if so, exit the loop
@counter
D=M
@END
D;JEQ     // If counter == 0, jump to END

// Add R0 to R2
@R0
D=M       // D = R0
@R2
M=M+D     // R2 = R2 + R0

// Decrement counter
@counter
M=M-1     // counter = counter - 1

// Repeat the loop
@LOOP
0;JMP

(END)
// End program - infinite loop
@END
0;JMP

// Variables
(counter)  // Define variable "counter"
