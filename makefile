BIN=./bin/

all: rand_read_tests serial_read_tests

rand_read_tests: $(BIN)rand_generator_fastest $(BIN)rand_read_test $(BIN)rand_read_test_simple $(BIN)rand_read_test_register_offset_shift $(BIN)rand_read_test_register_offset_multiply $(BIN)rand_read_test_register_offset_lsl_scaled

$(BIN)rand_generator_fastest: rand_generator_fastest.c
	gcc  -O3 rand_generator_fastest.c -o $(BIN)rand_generator_fastest

$(BIN)rand_read_test: rand_read_test.c
	gcc -w -S -O3 rand_read_test.c -o $(BIN)rand_read_test.s
	gcc -w -O3 rand_read_test.c -o $(BIN)rand_read_test

$(BIN)rand_read_test_simple: rand_read_test_simple.s
	gcc -c rand_read_test_simple.s -o $(BIN)rand_read_test_simple.o
	gcc $(BIN)rand_read_test_simple.o -o $(BIN)rand_read_test_simple

$(BIN)rand_read_test_register_offset_shift: rand_read_test_register_offset_shift.s
	gcc -c rand_read_test_register_offset_shift.s -o $(BIN)rand_read_test_register_offset_shift.o
	gcc $(BIN)rand_read_test_register_offset_shift.o -o $(BIN)rand_read_test_register_offset_shift

$(BIN)rand_read_test_register_offset_multiply: rand_read_test_register_offset_multiply.s
	gcc -c rand_read_test_register_offset_multiply.s -o $(BIN)rand_read_test_register_offset_multiply.o
	gcc $(BIN)rand_read_test_register_offset_multiply.o -o $(BIN)rand_read_test_register_offset_multiply

$(BIN)rand_read_test_register_offset_lsl_scaled: rand_read_test_register_offset_lsl_scaled.s
	gcc -c rand_read_test_register_offset_lsl_scaled.s -o $(BIN)rand_read_test_register_offset_lsl_scaled.o
	gcc $(BIN)rand_read_test_register_offset_lsl_scaled.o -o $(BIN)rand_read_test_register_offset_lsl_scaled

serial_read_tests: $(BIN)serial_read_test $(BIN)serial_read_test_register_offset_lsl_scaled

$(BIN)serial_read_test: serial_read_test.c
	gcc -w -S -O2 serial_read_test.c -o $(BIN)serial_read_test.s
	gcc -w -O2 serial_read_test.c -o $(BIN)serial_read_test

$(BIN)serial_read_test_register_offset_lsl_scaled: serial_read_test_register_offset_lsl_scaled.s
	gcc -c serial_read_test_register_offset_lsl_scaled.s -o $(BIN)serial_read_test_register_offset_lsl_scaled.o
	gcc $(BIN)serial_read_test_register_offset_lsl_scaled.o -o $(BIN)serial_read_test_register_offset_lsl_scaled

clean:
	rm $(BIN)rand_read_test $(BIN)rand_read_test.s $(BIN)rand_generator_fastest 
	rm $(BIN)rand_read_test_simple.o $(BIN)rand_read_test_simple 
	rm $(BIN)rand_read_test_register_offset_shift.o $(BIN)rand_read_test_register_offset_shift 
	rm $(BIN)rand_read_test_register_offset_multiply.o $(BIN)rand_read_test_register_offset_multiply
	rm $(BIN)rand_read_test_register_offset_lsl_scaled.o $(BIN)rand_read_test_register_offset_lsl_scaled
	rm $(BIN)serial_read_test.s $(BIN)serial_read_test
	rm $(BIN)serial_read_test_register_offset_lsl_scaled.o $(BIN)serial_read_test_register_offset_lsl_scaled
	
