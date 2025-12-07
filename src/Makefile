all: task1 task1.2 task2.1 task2.3

task1: task1.o asm_io.o driver.o
	gcc -m32 -o task1 driver.o task1.o asm_io.o

task1.o: Task1/task1.asm
	nasm -f elf Task1/task1.asm -o task1.o

task1.2: task1.2.o asm_io.o driver.o
	gcc -m32 -o task1.2 driver.o task1.2.o asm_io.o

task1.2.o: Task1/task1.2.asm
	nasm -f elf Task1/task1.2.asm -o task1.2.o

task2.1: task2.1.o asm_io.o driver.o
	gcc -m32 -o task2.1 driver.o task2.1.o asm_io.o

task2.1.o: Task2/task2.1.asm
	nasm -f elf Task2/task2.1.asm -o task2.1.o

task2.3: task2.3.o asm_io.o driver.o
	gcc -m32 -o task2.3 driver.o task2.3.o asm_io.o

task2.3.o: Task2/task2.3.asm
	nasm -f elf Task2/task2.3 -o task2.3.o

asm_io.o: asm_io.asm
	nasm -f elf asm_io.asm -o asm_io.o

driver.o: driver.c
	gcc -m32 -c driver.c -o driver.o

remove:
	find . -type f -name "*.o" -delete
	rm -f task1 task1.2 task2.1 task2.3
