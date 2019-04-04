#!/usr/bin/env bash
script_dir=${0%/*}
set -v
DFLAGS="-Isource -L-Llib -L-ld_wrapper_libpng -L-lpng -g -debug"
dmd source/examples/write_bars.d ${DFLAGS} -ofbin/examples/write_bars
rm -f bin/examples/*.o
