#!/bin/bash
size=1000
if [ "$#" -ge 1 ];then
        size="$1"
fi
executions=1
if [ "$#" -eq 2 ];then
	executions="$2"
fi

output=./results/serial$size

mkdir -p $output

serial_experiments=("serial_read_test_2x_post_index_no_mem_access"
"serial_read_test_2x_post_index"
"serial_read_test_2x_pre_index_no_mem_access"
"serial_read_test_2x_pre_index"
"serial_read_test_2x_simple_no_mem_access"
"serial_read_test_2x_simple"
"serial_read_test_post_index_no_mem_access"
"serial_read_test_post_index"
"serial_read_test_pre_index_no_mem_access"
"serial_read_test_pre_index"
"serial_read_test_register_offset_lsl_scaled_no_mem_access"
"serial_read_test_register_offset_lsl_scaled"
"serial_read_test_register_offset_shift_no_mem_access"
"serial_read_test_register_offset_shift"
"serial_read_test_simple_no_mem_access"
"serial_read_test_simple"
"serial_write_test_2x_post_index_no_mem_access"
"serial_write_test_2x_post_index"
"serial_write_test_2x_pre_index_no_mem_access"
"serial_write_test_2x_pre_index"
"serial_write_test_2x_simple_no_mem_access"
"serial_write_test_2x_simple"
"serial_write_test_post_index_no_mem_access"
"serial_write_test_post_index"
"serial_write_test_pre_index_no_mem_access"
"serial_write_test_pre_index"
"serial_write_test_register_offset_lsl_scaled_no_mem_access"
"serial_write_test_register_offset_lsl_scaled"
"serial_write_test_register_offset_shift_no_mem_access"
"serial_write_test_register_offset_shift"
"serial_write_test_simple_no_mem_access"
"serial_write_test_simple")

for (( i=0; i<$executions ;i++ ))
do
        for j in "${serial_experiments[@]}"
        do
                echo "experiment "$j" with vector of "$size >> $output/$j.res
                ./bin/$j $size >> $output/$j.res
                echo >> $output/$j.res
        done
done
