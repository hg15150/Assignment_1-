stencil: stencil.c
	icc -std=c99 -Wall $^ -o $@#
	./stencil 1024 1024 100

gpr: stencil.c
	gcc -std=c99 -pg -fopenmp -g -o stream.gprof stencil.c
	./stream.gprof 1024 1024 100
	gprof -b -l stream.gprof gmon.out

gcc: stencil.c
	gcc -std=c99 -Wall -O5 $^ -o $@
	./stencil 1024 1024 100

check:
	python check.py --ref-stencil-file stencil_1024_1024_100.pgm --stencil-file stencil.pgm
