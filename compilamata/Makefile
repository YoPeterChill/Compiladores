all:
	flex lex.l
	bison -d sin.y -Wcounterexamples
	g++ *.c -o compilabaxo