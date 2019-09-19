GCC = @g++
LEX = @flex

demo: demo.cpp demo.o
			$(GCC) demo.cpp demo.o -o demo

demo.o: demo.c
			$(GCC) -c demo.c

demo.c: demo.lex
			$(LEX) -o demo.c demo.lex

clean:
			@-rm -f *.o *~ demo.c demo
.PHONY: clean
