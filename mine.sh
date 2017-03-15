#!/bin/bash
sizes=("1000" "10000" "100000" "1000000" "10000000" "100000000")
terms=("Wall clock time" "Instructions = " "Cycles = " "L1 data cache access = " "L1 data cache refill = " "L2 cache access = " "L2 cache refill = ")
terms_it=0
rand_experiments=("rand_read_test_register_offset_lsl_scaled_no_mem_access.res"
"rand_read_test_register_offset_lsl_scaled.res"
"rand_read_test_register_offset_multiply_no_mem_access.res"
"rand_read_test_register_offset_multiply.res"
"rand_read_test_register_offset_shift_no_mem_access.res"
"rand_read_test_register_offset_shift.res"
"rand_read_test_simple_no_mem_access.res"
"rand_read_test_simple.res"
"rand_write_test_register_offset_lsl_scaled_no_mem_access.res"
"rand_write_test_register_offset_lsl_scaled.res"
"rand_write_test_register_offset_multiply_no_mem_access.res"
"rand_write_test_register_offset_multiply.res"
"rand_write_test_register_offset_shift_no_mem_access.res"
"rand_write_test_register_offset_shift.res"
"rand_write_test_simple_no_mem_access.res"
"rand_write_test_simple.res")


output_dir=./rand

for i in "${sizes[@]}"
do
	for j in "${rand_experiments[@]}"
	do
		echo "mined results from $j with vector if $i in the following order:" > $j$i.mined
		echo "Wall clock time, Instructions, Cycles, L1 data cache access, L1 data cache refill, L2 cache access, L2 cache refill" >> $j$i.mined
		cat $output_dir$i/$j | while IFS='' read -r line || [[ -n "$line" ]]
		 do
			if [[ $line == *${terms[$terms_it]}* ]]
			then
				result=`echo -n $line | cut -d= -f2 | cut -d" " -f 2`
				echo -n "$result;" >> $j$i.mined
				if [ $terms_it -eq 6  ]
				then
					terms_it=0
					echo >> $j$i.mined
				else
					terms_it=$((terms_it+1))
				fi

			fi	
		done


	done
done

serial_experiments=("serial_read_test_2x_post_index_no_mem_access.res"
"serial_read_test_2x_post_index.res"
"serial_read_test_2x_pre_index_no_mem_access.res"
"serial_read_test_2x_pre_index.res"
"serial_read_test_2x_simple_no_mem_access.res"
"serial_read_test_2x_simple.res"
"serial_read_test_post_index_no_mem_access.res"
"serial_read_test_post_index.res"
"serial_read_test_pre_index_no_mem_access.res"
"serial_read_test_pre_index.res"
"serial_read_test_register_offset_lsl_scaled_no_mem_access.res"
"serial_read_test_register_offset_lsl_scaled.res"
"serial_read_test_register_offset_shift_no_mem_access.res"
"serial_read_test_register_offset_shift.res"
"serial_read_test_simple_no_mem_access.res"
"serial_read_test_simple.res"
"serial_write_test_2x_post_index_no_mem_access.res"
"serial_write_test_2x_post_index.res"
"serial_write_test_2x_pre_index_no_mem_access.res"
"serial_write_test_2x_pre_index.res"
"serial_write_test_2x_simple_no_mem_access.res"
"serial_write_test_2x_simple.res"
"serial_write_test_post_index_no_mem_access.res"
"serial_write_test_post_index.res"
"serial_write_test_pre_index_no_mem_access.res"
"serial_write_test_pre_index.res"
"serial_write_test_register_offset_lsl_scaled_no_mem_access.res"
"serial_write_test_register_offset_lsl_scaled.res"
"serial_write_test_register_offset_shift_no_mem_access.res"
"serial_write_test_register_offset_shift.res"
"serial_write_test_simple_no_mem_access.res"
"serial_write_test_simple.res")

output_dir=./serial

for i in "${sizes[@]}"
do
        for j in "${serial_experiments[@]}"
        do
                echo "mined results from $j with vector if $i in the following order:" > $j$i.mined
                echo "Wall clock time, Instructions, Cycles, L1 data cache access, L1 data cache refill, L2 cache access, L2 cache refill" >> $j$i.mined
                cat $output_dir$i/$j | while IFS='' read -r line || [[ -n "$line" ]]
                 do
                        if [[ $line == *${terms[$terms_it]}* ]]
                        then
                                result=`echo -n $line | cut -d= -f2 | cut -d" " -f 2`
                                echo -n "$result;" >> $j$i.mined
                                if [ $terms_it -eq 6  ]
                                then
                                        terms_it=0
                                        echo >> $j$i.mined
                                else
                                        terms_it=$((terms_it+1))
                                fi

                        fi      
                done


        done
done
