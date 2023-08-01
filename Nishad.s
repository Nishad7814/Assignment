.global _start\
\
_start:\
    MOV R0, #10   /* First number */\
    MOV R1, #5    /* Second number */\
\
    MOV R5, #15   /* Decimal 15 in R5 */\
\
    CMP R0, R1    /* Compare R0 and R1 */\
\
    BLT lesser    /* If R0 < R1, branch to 'lesser' */\
    BGT greater   /* If R0 > R1, branch to 'greater' */\
    BAL equal     /* If R0 == R1, branch to 'equal' */\
\
end:\
    MOV R7, #1    /*  number for exit */\
    SWI 0         /*  system call */\
\
lesser:\
    LSR R5, R5, #1   /* If R0 < R1, perform one logical right shift on R5 */\
    B end            /* Jump to the end to terminate the program */\
\
greater:\
    LSL R5, R5, #2   /* If R0 > R1, perform two logical left shifts on R5 */\
    B end            /* Jump to the end to terminate the program */\
\
equal:\
    ROR R5, R5, #1   /* If R0 == R1, perform one right rotation on R5 */\
    B end            /* Jump to the end to terminate the program */\
}
