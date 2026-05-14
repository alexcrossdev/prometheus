#!/bin/sh

set -e

qemu-system-i386 -drive format=raw,file=boot/bootloader.bin
