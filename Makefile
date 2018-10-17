stencil: stencil.c
	gcc -std=c99 -Wall -O5 $^ -o $@
