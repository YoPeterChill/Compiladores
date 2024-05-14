all:
	flex cal.l
	bison -d cal.y
	gcc *.c -o calc