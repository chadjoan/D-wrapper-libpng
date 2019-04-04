#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
dmd source/generator/wrapper_generator.d -ofbin/generator/wrapper_generator
RESULT=$?
if [ $RESULT -ne 0 ]; then
	rm -f source/libpng/generated/*.c
	rm -f source/libpng/generated/*.h
	rm -f source/libpng/generated/*.d
	exit $RESULT
fi
rm -f bin/generator/*.o
