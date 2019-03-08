#!/bin/bash

now=$(date +"%T")
echo "Current time : $now"

# send request

for i in $(seq 1 $3);
do
	index=$(($i%$2+1))
	echo $1-$index
        curl -X POST localhost:8080/runLambda/$1-$index -d '{"name": "Alice"}' &
done
