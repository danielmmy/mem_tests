BIN=./bin/

all: memtests

memtests: $(BIN)rand_generator_fastest $(BIN)rand_read_test

$(BIN)rand_generator_fastest: rand_generator_fastest.c
	gcc  -O3 rand_generator_fastest.c -o $(BIN)rand_generator_fastest

$(BIN)rand_read_test: rand_read_test.c
	gcc -w -S -O1 rand_read_test.c -o $(BIN)rand_read_test.s
	gcc -w -O1 rand_read_test.c -o $(BIN)rand_read_test

clean:
	rm $(BIN)rand_read_test $(BIN)rand_read_test.s $(BIN)rand_generator_fastest
