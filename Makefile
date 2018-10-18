stencil: stencil.c
	icc -std=c99 -Wall $^ -o $@

gpr: stencil.c
	icc -std=c99 -pg -fopenmp -g -o stream.gprof stencil.c
	./stream.gprof 1024 1024 100
	gprof -b -l stream.gprof gmon.out

0: stencil2.c
	gcc -std=c99 -Wall -O5 stencil2.c -o zero
	./zero 1024 1024 100

Uno: stencil2.c
	icc -std=c99 -Wall stencil2.c -o uno
	./uno 1024 1024 100

gcc: stencil.c
	gcc -std=c99 -Wall -O5 $^ -o $@
	./stencil 1024 1024 100

3: stencil3.c
	gcc -std=c99 -Wall -O5 stencil3.c -o stencil3
	./stencil3 1024 1024 100

check:
	python check.py --ref-stencil-file stencil_1024_1024_100.pgm --stencil-file stencil.pgm
