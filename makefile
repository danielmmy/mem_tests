BIN=./bin/

all: memtests

memtests: $(BIN)rand_generator_fastest $(BIN)rand_read_test $(BIN)rand_read_test_simple $(BIN)rand_read_test_register_offset $(BIN)rand_read_test_register_offset_lsl_scaled

$(BIN)rand_generator_fastest: rand_generator_fastest.c
	gcc  -O3 rand_generator_fastest.c -o $(BIN)rand_generator_fastest

$(BIN)rand_read_test: rand_read_test.c
	gcc -w -S -O1 rand_read_test.c -o $(BIN)rand_read_test.s
	gcc -w -O1 rand_read_test.c -o $(BIN)rand_read_test

$(BIN)rand_read_test_simple: rand_read_test_simple.s
	gcc -c rand_read_test_simple.s -o $(BIN)rand_read_test_simple.o
	gcc $(BIN)rand_read_test_simple.o -o $(BIN)rand_read_test_simple

$(BIN)rand_read_test_register_offset: rand_read_test_register_offset.s
	gcc -c rand_read_test_register_offset.s -o $(BIN)rand_read_test_register_offset.o
	gcc $(BIN)rand_read_test_register_offset.o -o $(BIN)rand_read_test_register_offset

$(BIN)rand_read_test_register_offset_lsl_scaled: rand_read_test_register_offset_lsl_scaled.s
	gcc -c rand_read_test_register_offset_lsl_scaled.s -o $(BIN)rand_read_test_register_offset_lsl_scaled.o
	gcc $(BIN)rand_read_test_register_offset_lsl_scaled.o -o $(BIN)rand_read_test_register_offset_lsl_scaled


clean:
	rm $(BIN)rand_read_test $(BIN)rand_read_test.s $(BIN)rand_generator_fastest $(BIN)rand_read_test_simple.o $(BIN)rand_read_test_simple $(BIN)rand_read_test_register_offset.o $(BIN)rand_read_test_register_offset $(BIN)rand_read_test_register_offset_lsl_scaled.o $(BIN)rand_read_test_register_offset_lsl_scaled
