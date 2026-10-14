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
"return"                                {   return RETORNO;}
"int"                                   {   return INTEIRO;}
"="                                     {   return ATRIBUICAO;}
";"                                     {   return PONTOEVIRGULA;}
"*"                                     {   return MULTIPLICACAO;}
"+"                                     {   return SOMA;}
"-"                                     {   return SUBTRACAO;}
"/"                                     {   return DIVISAO;}
"("                                     {   return ABREPARENTESES;}
")"                                     {   return FECHAPARENTESES;}
"{"                                     {   return ABRECHAVES;}
"}"                                     {   return FECHACHAVES;}
{DIGITO}+                               {   yylval = atoi(yytext);
                                            return NUMERO;}
{CAR}({CAR}|{DIGITO})*                  {   return ID;}
[ \t\n\r]+                                {   /* Ignora espaços */ }
.                                       {    printf("Caractere inválido: %s\n", yytext); }

%%
