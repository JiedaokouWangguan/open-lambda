#!/bin/bash
# $1 lambda name
# $2 num of dumps
# $3 num of requests

#restart openlambda
cd ~/open-lambda
./bin/admin kill -cluster=my-cluster
rm -r ./my-cluster
./bin/admin new -cluster my-cluster

## clean lambda code
#for i in $(seq 1 $2);
#do
#        rm -rf ~/open-lambda/my-cluster/registry/$1-$i
#done

# dump lambda code
for i in $(seq 1 $2);
do
	mkdir ~/open-lambda/my-cluster/registry/$1-$i
	cp ~/$1/* ~/open-lambda/my-cluster/registry/$1-$i
done

./bin/admin workers -cluster=my-cluster
./bin/admin status -cluster=my-cluster
cd ~

now=$(date +"%T")
echo "Current time : $now"

# send request

for i in $(seq 1 $3);
do
	index=$(($i%$2+1))
	echo $1-$index
        curl -X POST localhost:8080/runLambda/$1-$index -d '{"name": "Alice"}' &
done
