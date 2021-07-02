#!/bin/bash
#. ./setenv.sh
basepath=$(cd `dirname $0`; pwd)

if [ ! -d $basepath/Bin/build ]
then
	echo "make build dir"
	mkdir $basepath/Bin/build
fi

cd $basepath/Bin/build
if [ "$1" == "rebuild" ]
then
	echo "**********rebuild makefile"
	rm -rf ./*
fi

echo "PATH:$PATH"
cmake -DPLATFORM=Linux -DVERSION=Release ../../
make -j8
