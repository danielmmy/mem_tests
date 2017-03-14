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

serial_experiments=("serial_read_test_2x_post_index_2xbranch"
"serial_read_test_2x_post_index_2xsub"
"serial_read_test_2x_pre_index_2xbranch"
"serial_read_test_2x_pre_index_2xsub"
"serial_read_test_2x_simple_2xadd"
"serial_read_test_2x_simple_2xbranch"
"serial_read_test_2x_simple_2xcmp"
"serial_read_test_post_index_2xbranch"
"serial_read_test_post_index_2xsub"
"serial_read_test_pre_index_2xbranch"
"serial_read_test_pre_index_2xsub"
"serial_read_test_register_offset_lsl_scaled_2xadd"
"serial_read_test_register_offset_lsl_scaled_2xbranch"
"serial_read_test_register_offset_lsl_scaled_2xcmp"
"serial_read_test_register_offset_shift_2xadd"
"serial_read_test_register_offset_shift_2xbranch"
"serial_read_test_register_offset_shift_2xcmp"
"serial_read_test_register_offset_shift_2xshift"
"serial_read_test_simple_2xadd"
"serial_read_test_simple_2xbranch"
"serial_read_test_simple_2xcmp"
"serial_write_test_2x_post_index_2xbranch"
"serial_write_test_2x_post_index_2xsub"
"serial_write_test_2x_pre_index_2xbranch"
"serial_write_test_2x_pre_index_2xsub"
"serial_write_test_2x_simple_2xadd"
"serial_write_test_2x_simple_2xbranch"
"serial_write_test_2x_simple_2xcmp"
"serial_write_test_post_index_2xbranch"
"serial_write_test_post_index_2xsub"
"serial_write_test_pre_index_2xbranch"
"serial_write_test_pre_index_2xsub"
"serial_write_test_register_offset_lsl_scaled_2xadd"
"serial_write_test_register_offset_lsl_scaled_2xbranch"
"serial_write_test_register_offset_lsl_scaled_2xcmp"
"serial_write_test_register_offset_shift_2xadd"
"serial_write_test_register_offset_shift_2xbranch"
"serial_write_test_register_offset_shift_2xcmp"
"serial_write_test_register_offset_shift_2xshift"
"serial_write_test_simple_2xadd"
"serial_write_test_simple_2xbranch"
"serial_write_test_simple_2xcmp")

for (( i=0; i<$executions ;i++ ))
do
        for j in "${serial_experiments[@]}"
        do
                echo "experiment "$j" with vector of "$size >> $output/$j.res
                ./bin/$j $size >> $output/$j.res
                echo >> $output/$j.res
        done
done
