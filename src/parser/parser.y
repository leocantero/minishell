{%
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(const char *s);

}%

/* Definición de Símbolos Terminales (Tokens) */
%token WORD
%token ASSIGNMENT_WORD
%token IO_NUMBER
%token AND_IF    /* '&&' */
%token OR_IF     /* '||' */
%token PIPE      /* '|'  */
%token SEMI      /* ';'  */
%token LESS      /* '<'  */
%token GREAT     /* '>'  */
%token DGREAT    /* '>>' */
%token DLESS     /* '<<' */
%token NEWLINE

%start program

%%

/* 1. Punto de entrada y gestión de líneas */
program
    : linebreak complete_commands linebreak
    | linebreak
    ;

complete_commands
    : complete_commands newline_list complete_command
    | complete_command
    ;

complete_command
    : and_or separator_op
    | and_or
    ;

/* 2. Jerarquía de Operadores (Precedencia Logica -> Pipes) */
and_or
    : pipeline
    | and_or AND_IF linebreak pipeline
    | and_or OR_IF  linebreak pipeline
    ;

pipeline
    : pipe_sequence
    ;

pipe_sequence
    : command
    | pipe_sequence PIPE linebreak command
    ;

command
    : simple_command
    ;

/* 3. Anatomía del Comando Simple (POSIX 2.10.2) */
simple_command
    : cmd_prefix cmd_word cmd_suffix
    | cmd_prefix cmd_word
    | cmd_prefix
    | cmd_word cmd_suffix
    | cmd_word
    ;

cmd_word 
    : WORD 
    ;

cmd_prefix
    : io_redirect
    | cmd_prefix io_redirect
    | ASSIGNMENT_WORD
    | cmd_prefix ASSIGNMENT_WORD
    ;

cmd_suffix
    : io_redirect
    | WORD
    | cmd_suffix io_redirect
    | cmd_suffix WORD
    ;

/* 4. Redirecciones y Manejo de E/S */
io_redirect
    : io_file
    | IO_NUMBER io_file
    ;

io_file
    : LESS  WORD
    | GREAT WORD
    | DGREAT WORD
    ;

/* 5. Elementos de Separación y Formato */
newline_list
    : NEWLINE
    | newline_list NEWLINE
    ;

linebreak
    : newline_list
    | /* empty */
    ;

separator_op
    : SEMI
    | '&'
    ;

%%