#!/bin/bash
size=1000
if [ "$#" -ge 1 ];then
        size="$1"
fi
executions=1
if [ "$#" -eq 2 ];then
	executions="$2"
fi

mkdir -p ./results/serial

serial_experiments=("serial_read_test_2x_post_index" "serial_read_test_2x_post_index_11xbranch" "serial_read_test_2x_post_index_11xsub" "serial_read_test_2x_pre_index" "serial_read_test_2x_pre_index_11xbranch" "serial_read_test_2x_pre_index_11xsub" "serial_read_test_2x_simple" "serial_read_test_2x_simple_11xadd" "serial_read_test_2x_simple_11xbranch" "serial_read_test_2x_simple_11xcmp" "serial_read_test_post_index" "serial_read_test_post_index_11xbranch" "serial_read_test_post_index_11xsub" "serial_read_test_pre_index" "serial_read_test_pre_index_11xbranch" "serial_read_test_pre_index_11xsub" "serial_read_test_register_offset_lsl_scaled" "serial_read_test_register_offset_shift" "serial_read_test_register_offset_shift_11xadd" "serial_read_test_register_offset_shift_11xbranch" "serial_read_test_register_offset_shift_11xcmp" "serial_read_test_register_offset_shift_11xshift" "serial_read_test_simple" "serial_read_test_simple_11xadd" "serial_read_test_simple_11xbranch" "serial_read_test_simple_11xcmp" "serial_write_test_2x_post_index" "serial_write_test_2x_post_index_11xbranch" "serial_write_test_2x_post_index_11xsub" "serial_write_test_2x_pre_index" "serial_write_test_2x_pre_index_11xbranch" "serial_write_test_2x_pre_index_11xsub" "serial_write_test_2x_simple" "serial_write_test_2x_simple_11xadd" "serial_write_test_2x_simple_11xbranch" "serial_write_test_2x_simple_11xcmp" "serial_write_test_post_index" "serial_write_test_post_index_11xbranch" "serial_write_test_post_index_11xsub" "serial_write_test_pre_index" "serial_write_test_pre_index_11xbranch" "serial_write_test_pre_index_11xsub" "serial_write_test_register_offset_lsl_scaled" "serial_write_test_register_offset_shift" "serial_write_test_register_offset_shift_11xadd" "serial_write_test_register_offset_shift_11xbranch" "serial_write_test_register_offset_shift_11xcmp" "serial_write_test_register_offset_shift_11xshift" "serial_write_test_simple" "serial_write_test_simple_11xadd" "serial_write_test_simple_11xbranch" "serial_write_test_simple_11xcmp" )


for (( i=0; i<$executions ;i++ ))
do
        for j in "${serial_experiments[@]}"
        do
                echo "experiment "$j" with vector of "$size >> ./results/serial/$j.res
                ./bin/$j $size >> ./results/serial/$j.res
                echo >> ./results/serial/$j.res
        done
done
