#!/bin/bash
size=1000
if [ "$#" -ge 1 ];then
        size="$1"
fi
executions=1
if [ "$#" -eq 2 ];then
	executions="$2"
fi

output=./results/rand$size

mkdir -p $output

rand_read_experiments=("rand_read_test_register_offset_lsl_scaled_no_mem_access"
"rand_read_test_register_offset_lsl_scaled"
"rand_read_test_register_offset_multiply_no_mem_access"
"rand_read_test_register_offset_multiply"
"rand_read_test_register_offset_shift_no_mem_access"
"rand_read_test_register_offset_shift"
"rand_read_test_simple_no_mem_access"
"rand_read_test_simple"
"rand_write_test_register_offset_lsl_scaled_no_mem_access"
"rand_write_test_register_offset_lsl_scaled"
"rand_write_test_register_offset_multiply_no_mem_access"
"rand_write_test_register_offset_multiply"
"rand_write_test_register_offset_shift_no_mem_access"
"rand_write_test_register_offset_shift"
"rand_write_test_simple_no_mem_access"
"rand_write_test_simple")

for (( i=0; i<$executions ;i++ ))
do
	for j in "${rand_read_experiments[@]}"
	do
		echo "experiment "$j" with vector of "$size >> $output/$j.res
		./bin/$j ./bin/experiment$size $size >> $output/$j.res
		echo >> $output/$j.res
	done
done

