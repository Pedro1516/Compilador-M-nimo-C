%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}

%union{
    int numero;
}

%token <numero> NUMERO 

%token PONTOEVIRGULA ID ATRIBUICAO MAIN INTEIRO

%%

comando:    ID ATRIBUICAO NUMERO PONTOEVIRGULA  {printf("%i\n", yylval.numero);};

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintatico: %s\n", s);
}

int main(){

    return yyparse();
}