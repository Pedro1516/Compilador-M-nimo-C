%{
#include <stdio.h>

int yylex(void);
void yyerror(const char *s);
%}


%token NUMERO RETORNO PONTOEVIRGULA ID ATRIBUICAO MAIN INTEIRO MULTIPLICACAO DIVISAO SOMA SUBTRACAO ABREPARENTESES FECHAPARENTESES ABRECHAVES FECHACHAVES

%%
programa:         INTEIRO MAIN ABREPARENTESES FECHAPARENTESES ABRECHAVES principal FECHACHAVES;
atribuicao:       INTEIRO ID ATRIBUICAO soma PONTOEVIRGULA                       
retorno:          RETORNO soma PONTOEVIRGULA;
soma:             soma SOMA NUMERO
                | soma SOMA ID
                | NUMERO
                | ID;
principal:        principal retorno
                | principal atribuicao
                | ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintatico: %s\n", s);
}

int main(){
    return yyparse();
}