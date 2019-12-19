GCC = @g++
LEX = @flex
YACC = @bison

demo: main.cpp parser.o tree.o
		$(GCC) main.cpp parser.o tree.o -o demo

parser.o: parser.c tree.h
		$(GCC) -c parser.c -o parser.o

parser.c: parser.y lex.c
		$(YACC) -o parser.c -d parser.y

tree.o: tree.cpp tree.h
		$(GCC) -c -c tree.cpp

lex.c: lex.lex
		$(LEX) -o lex.c lex.lex

clean:
		@-rm -f *.o *~ *.c parser.h demo
.PHONY: clean
