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


@SCREEN
D=A
@screen_start
M=D       
D=A
@keyboard
M=D      
(LOOP)

    @keyboard
    D=M       
    @DRAW
    D;JNE     


    @CLEAR
    0;JMP

(DRAW)

    @screen_start
    D=M       
    @addr
    M=D       

    @8192     
    D=A       
    @counter
    M=D      

(BLACK_LOOP)
    @addr
    A=M      
    M=-1     
    @addr
    M=M+1     
    @counter
    M=M-1    
    D=M
    @BLACK_LOOP
    D;JGT    

    @LOOP
    0;JMP

(CLEAR)
 
    @screen_start
    D=M      
    @addr
    M=D      

    @8192    
    D=A
    @counter
    M=D     

(WHITE_LOOP)
    @addr
    A=M      
    M=0       

    @addr
    M=M+1     

    @counter
    M=M-1     
    D=M
    @WHITE_LOOP
    D;JGT    

    @LOOP
    0;JMP
