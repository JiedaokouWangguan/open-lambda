#!/bin/bash
git pull
kill $(ps aux | grep '.json' | awk '{print $2}')
make test-all
cd ~
./test_func.sh helloworld 2 10
cat ~/open-lambda/my-cluster/logs/worker-0.out
