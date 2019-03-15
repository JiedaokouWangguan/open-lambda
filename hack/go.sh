#!/bin/bash

# Wrapper around go that initializes the GOPATH to our go tree.
#
# This is inspired from docker's script:
# https://github.com/docker/docker/blob/master/hack/make.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export GOPATH=${DIR}'/go'
echo Using GOPATH=$GOPATH
go get github.com/shirou/gopsutil/mem
set -e -x

go ${@:1}
