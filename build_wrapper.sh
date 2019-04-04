#!/usr/bin/env bash
script_dir=${0%/*}
set -v
cd ${script_dir}
script_dir=$(pwd)
dmd source/libpng/*.d source/libpng/generated/*.d -Isource/ -c -od./d_obj -g -debug
cd c_obj
cc ../source/libpng/*.c ../source/libpng/generated/*.c -I../source/libpng/ -c
cd ${script_dir}
ar rcs lib/libd_wrapper_libpng.a c_obj/*.o d_obj/*.o
rm -f source/*.o
rm -f source/libpng/*.o
rm -f source/libpng/generated/*.o
rm -f c_obj/*.o
rm -f d_obj/*.o
