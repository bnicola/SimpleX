//Initialise Segments
//===================
//(Initialise_SP)
    li R1,  5000
    li R2, 0
    str R1, R2
    
//(Initialise_local)
    li R3, 40
    li R4, 1
    str R3, R4

//(Initialise_this)
    li R5, 1000
    li R6, 3
    str R5, R6

//(Initialise_that)
    li R7, 2000
    li R8, 4
    str R7, R8

//(Initialise_temp)
    li R9, 3000
    li R10, 5
    str R9, R10

//(Initialise_argument)
    li R11, 80
    li R12, 2
    str R11, R12
       
//(Initialise_static
    li R13, 3500
    li R14, 6
    str R13, R14
       
//(Initialise_pointer
    li R13, 4000
    li R14, 7
    str R13, R14
//===========================


//function Memory.mainTest 2 0
(Memory.mainTest)
//call Memory.init 0 0
     // push return address given as a number
     li R1, 0
     load R31, R1
     //replace the following li R2, return_address_
     li R2, _returnAddress0
     str R2, R31
     Incr R31
     str R31, R1

     // push local
     li R10, 1
     load R11, R10
     li R1, 0
     load R31, R1
     str R11, R31
     Incr R31
     str R31, R1
     
     // push argument
     li R10, 2
     load R11, R10
     li R1, 0
     load R31, R1
     str R11, R31
     Incr R31
     str R31, R1
     
     // push this
     li R10, 3
     load R11, R10
     li R1, 0
     load R31, R1
     str R11, R31
     Incr R31
     str R31, R1
     
     // push that
     li R10, 4
     load R11, R10
     li R1, 0
     load R31, R1
     str R11, R31
     Incr R31
     str R31, R1

    
     
     //New Arg = SP - 5 - nArgs -1
     li R2, 2
     li R1, 0
     load R31, R1
     li R4, 5
     // R3 = SP - 5- nArgs
     sub R3, R31, R4
     //R6 = nArgs
     li R6, 0
     sub R7, R3, R6
     // new Arg = SP - 5 - nArgs
     str R7, R2

    
     
     li R2, 1
     li R1, 0
     load R3, R1
     str R3, R2
     //push number of local variables
     // R2 = num_of_local_Variables
     li R2, 0
     li R3, 0
     li R1, 0
     load R31, R1

     
     (repeat_0)
     str R3, R31
     Incr R31
     str R31, R1

    (debug)
    jmp debug
     Decr R2
     li R4, 0
     cmp R2, R4
     jneq repeat_0
   
     
     jmp Memory.init
     
(_returnAddress0)

//pop local 0
     li R1, 0
     load R31, R1
     Decr R31
     str R31, R1
     load R2, R31
     li R3, 1
     load R4, R3
     li R5, 0
     add R7, R4, R5
     str R2, R7
(whileStatementStart_1)
//push constant 1
     li R1, 0
     load R31, R1

     li R2, 1
     str R2, R31
     Incr R31
     str R31, R1
//if-goto whileTrueStatement_1
     li R1, 0
     load R31, R1
     Decr R31
     load R12, R31
     str R31, R1
     li R1, 1
     cmp R12, R1
     jeq whileTrueStatement_1
//goto whileEndStatement_1
     jmp whileEndStatement_1
(whileTrueStatement_1)
//goto whileStatementStart_1
     jmp whileStatementStart_1
(whileEndStatement_1)
//function Memory.init 0 0
(Memory.init)
//push constant 7000
     li R1, 0
     load R31, R1

     li R2, 7000
     str R2, R31
     Incr R31
     str R31, R1
//push constant 0
     li R1, 0
     load R31, R1

     li R2, 0
     str R2, R31
     Incr R31
     str R31, R1
//return
    li R2, 2
    load R30, R2
    load R29, R2
    Incr R29
    li R1, 0
    load R31, R1
    Decr R31
    str R31, R1
    load R20, R31
    str R20, R30
    //SP = local0
    li R1, 0
    load R31, R1
    li R2, 1
    load R31, R2
    str R31, R1
    //pop that(SP -1) 'that' pointer
    li R1, 0
    load R31, R1
    li R2, 1
    sub R3, R31, R2
    load R4, R3
    li R5, 4
    str R4, R5
    //pop that(SP -2) 'this' pointer
    li R1, 0
    load R31, R1
    li R2, 2
    sub R3, R31, R2
    load R4, R3
    li R5, 3
    str R4, R5
    //pop that(SP -3) 'argument' pointer
    li R1, 0
    load R31, R1
    li R2, 3
    sub R3, R31, R2
    load R4, R3
    li R5, 2
    str R4, R5
    //pop that(SP -4) 'local' pointer
    li R1, 0
    load R31, R1
    li R2, 4
    sub R3, R31, R2
    load R4, R3
    li R5, 1
    str R4, R5
    //pop that(SP -5) 'return address'
    li R1, 0
    load R31, R1
    li R2, 5
    sub R3, R31, R2
    load R26, R3
    mov R31, R29
    str R31, R1
    return
