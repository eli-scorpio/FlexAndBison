default:
	clear
	bison -d calc.y
	flex calc.l
	cc -o calc calc.tab.c lex.yy.c -ll

clean:
	rm calc calc.tab.* lex.yy.c