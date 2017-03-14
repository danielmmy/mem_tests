#!/bin/bash
sizes=("1000" "10000" "100000" "1000000" "10000000" "100000000")
executions=1
if [ "$#" -eq 1 ];then
	executions="$1"
fi

for (( i=0; i<$executions ;i++ ))
do
	for j in "${sizes[@]}"
	do
		./run_rand.sh
		./run_serial.sh $j
	done
done

