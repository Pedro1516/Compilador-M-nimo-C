%{
    #include "../Bison/parser.tab.h"
    #include <stdio.h>
    #include <stdlib.h>
    int yylex(void);
    void yyerror(const char *s);

%}

DIGITO    [0-9] 
CAR       [a-zA-Z_]

%%
"main"                                  {   return MAIN;}
"int"                                   {   return INTEIRO;}
"="                                     {   return ATRIBUICAO;}
";"                                     {   return PONTOEVIRGULA;}
{DIGITO}+                               {   yylval.numero = atoi(yytext);
                                            return NUMERO;}
{CAR}({CAR}|{DIGITO})*                  {   return ID;}
[ \t\n]+                                {   /* Ignora espaços */ }
.                                       {    printf("Caractere inválido: %s\n", yytext); }

%%
