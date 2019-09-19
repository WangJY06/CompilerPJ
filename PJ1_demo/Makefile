GCC = @g++
LEX = @flex

demo: main.cpp lexer.o
			$(GCC) main.cpp lexer.o -o demo

lexer.o: lexer.c
			$(GCC) -c lexer.c -o lexer.o

lexer.c: lexer.lex
			$(LEX) -o lexer.c lexer.lex

clean:
			@-rm -f *.o *~ lexer.c demo
.PHONY: clean
