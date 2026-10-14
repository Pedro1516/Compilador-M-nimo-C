
# Ferramentas
CC = gcc
FLEX = flex
BISON = bison

# Arquivos
PARSER = Bison/parser.y
LEXER = Flex/main.flex

PARSER_C = Bison/parser.tab.c
PARSER_H = Bison/parser.tab.h
LEXER_C = Flex/lex.yy.c

EXEC = compilador

# Flags
CFLAGS = -Wall -Wextra -g
LDFLAGS = -lfl

.PHONY: all clean run

# Compila tudo
all: $(EXEC)

# Gera o executável
$(EXEC): $(PARSER_C) $(LEXER_C)
	$(CC) $(CFLAGS) $(PARSER_C) $(LEXER_C) -o $(EXEC) $(LDFLAGS)

# Gera o parser do Bison e seu cabeçalho
$(PARSER_C) $(PARSER_H) &: $(PARSER)
	$(BISON) -d -o $(PARSER_C) $(PARSER)

# Gera o analisador léxico
$(LEXER_C): $(LEXER) $(PARSER_H)
	$(FLEX) -o $(LEXER_C) $(LEXER)

# Executa o compilador
run: $(EXEC)
	./$(EXEC)

# Remove arquivos gerados
clean:
	rm -f $(EXEC) $(PARSER_C) $(PARSER_H) $(LEXER_C)
