
CC=cc

all: qasm

minipeg: minipeg.c
	$(CC) minipeg.c -o minipeg

qasm.c: qasm.peg minipeg
	./minipeg qasm.peg > qasm.c

qasm: qasm.c
	$(CC) qasm.c -o qasm