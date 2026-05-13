#!/bin/sh

MODULES="boot prometheus"

export MAKE=${MAKE:-make}
export HOST=i686-elf

export CC=${HOST}-gcc
export AS=${HOST}-as
export AR=${HOST}-ar
export OBJCOPY=${HOST}-objcopy
