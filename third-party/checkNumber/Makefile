TARGET = checkan


$(TARGET):	main.o libcheckan.a
	gcc $^ -o $@

main.o: main.c
	gcc -c $< -o $@

libcheckan.a: checkNumber.o
	ar rcs $@ $^

checkPrimeNumber.o: checkNumber.c checkNumber.h
	gcc -c -o $@ $<

test:
	echo 37 | ./checkan

clean:
	rm -f *.o *.a $(TARGET)
