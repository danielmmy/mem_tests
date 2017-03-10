#!/bin/bash
size=1000
if [ "$#" -ge 1 ];then
        size="$1"
fi
executions=1
if [ "$#" -eq 2 ];then
	executions="$2"
fi

mkdir -p ./results/rand

rand_read_experiments=("rand_read_test_simple" "rand_write_test_simple" "rand_read_test_simple_11xadd" "rand_read_test_simple_11xbranch" "rand_read_test_simple_11xshift" "rand_read_test_register_offset_lsl_scaled" "rand_write_test_register_offset_lsl_scaled" "rand_read_test_register_offset_lsl_scaled_11xbranch" "rand_read_test_register_offset_multiply" "rand_write_test_register_offset_multiply" "rand_read_test_register_offset_multiply_11xbranch" "rand_read_test_register_offset_multiply_11xmultipy" "rand_read_test_register_offset_shift" "rand_write_test_register_offset_shift" "rand_read_test_register_offset_shift_11xbranch" "rand_read_test_register_offset_shift_11xshift")

for (( i=0; i<$executions ;i++ ))
do
	for j in "${rand_read_experiments[@]}"
	do
		echo "experiment "$j" with vector of "$size >> ./results/rand/$j.res
		./bin/$j ./bin/experiment$size $size >> ./results/rand/$j.res
		echo >> ./results/rand/$j.res
	done
done

