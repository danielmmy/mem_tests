#!/bin/bash
size=1000
if [ "$#" -ge 1 ];then
        size="$1"
fi
executions=1
if [ "$#" -eq 2 ];then
	executions="$2"
fi

mkdir ./results
mkdir ./results/rand
mkdir ./results/serial

rand_read_experiments=("rand_read_test_simple" "rand_read_test_simple_11xadd" "rand_read_test_simple_11xbranch" "rand_read_test_simple_11xshift" "rand_read_test_register_offset_lsl_scaled" "rand_read_test_register_offset_lsl_scaled_11xbranch" "rand_read_test_register_offset_multiply" "rand_read_test_register_offset_multiply_11xbranch" "rand_read_test_register_offset_multiply_11xmultipy" "rand_read_test_register_offset_shift" "rand_read_test_register_offset_shift_11xbranch" "rand_read_test_register_offset_shift_11xshift")

for (( i=0; i<$executions ;i++ ))
do
	for j in "${rand_read_experiments[@]}"
	do
		echo "experiment "$j" with vector of "$size >> ./results/rand/$j.res
		./bin/$j ./bin/experiment$size $size >> ./results/rand/$j.res
		echo >> ./results/rand/$j.res
	done
done

serial_read_experiments=("serial_read_test_2x_post_index" "serial_read_test_2x_post_index_11xbranch" "serial_read_test_2x_post_index_11xsub" "serial_read_test_2x_pre_index" "serial_read_test_2x_pre_index_11xbranch" "serial_read_test_2x_pre_index_11xsub" "serial_read_test_2x_simple" "serial_read_test_2x_simple_11xadd" "serial_read_test_2x_simple_11xbranch" "serial_read_test_2x_simple_11xcmp" "serial_read_test_post_index" "serial_read_test_post_index_11xbranch" "serial_read_test_post_index_11xsub" "serial_read_test_pre_index" "serial_read_test_pre_index_11xbranch" "serial_read_test_pre_index_11xsub" "serial_read_test_register_offset_lsl_scaled" "serial_read_test_register_offset_shift" "serial_read_test_register_offset_shift_11xadd" "serial_read_test_register_offset_shift_11xbranch" "serial_read_test_register_offset_shift_11xcmp" "serial_read_test_register_offset_shift_11xshift" "serial_read_test_simple" "serial_read_test_simple_11xadd" "serial_read_test_simple_11xbranch" "serial_read_test_simple_11xcmp")


for (( i=0; i<$executions ;i++ ))
do
        for j in "${serial_read_experiments[@]}"
        do
                echo "experiment "$j" with vector of "$size >> ./results/serial/$j.res
                ./bin/$j ./bin/experiment$size $size >> ./results/serial/$j.res
                echo >> ./results/serial/$j.res
        done
done
