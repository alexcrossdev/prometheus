/* SPDX-License-Identifier: MIT */
/*
 *  boot/arch/x86/entry.S
 *
 *  Copyright (C) 2026  Alex Cross <alexcros@mtu.edu>
 *
 *  Bootsector code, first 512 bytes.
 *
 *  NOTE: To be moved into a seperate project later
 *
 */

.code16

.section .entry.text, "ax"
.global _entry

_entry:
    xor %ax, %ax

    cli
    hlt

.fill 510 - (. - _entry), 1, 0

.word 0xAA55
