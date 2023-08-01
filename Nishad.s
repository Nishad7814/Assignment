{\rtf1\ansi\ansicpg1252\cocoartf2709
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 .global _start\
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