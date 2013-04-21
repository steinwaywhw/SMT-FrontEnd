
sfe : sfe.o

sfe.o : sfe.c





find:
	find ../../ -type f -iname *.smt
	find ../../ -type f -iname *.smt2 | xargs -n 1 time -f "%U" cvc4
