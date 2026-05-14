/* SPDX-License-Identifier: MIT */
/*
 *  boot/arch/x86/bootsector.S
 *
 *  Copyright (C) 2026  Alex Cross <alexcros@mtu.edu>
 *
 *  Bootsector code, first 512 bytes.
 *
 *  NOTE: To be moved into a seperate project later
 *
 */

.code16
.section .bootsector.text, "ax"
.global _start

_start:
    // Prepare stack pointer and segments
    cli
    xor %ax, %ax
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %ss
    mov $0x7C00, %sp
    sti

    mov %dl, boot_drive

    // CHS: Load sector 2 of size 512 bytes only. TODO: Look into 0x42 of int 0x13
    mov $0x02, %ah
    mov $0x02, %al
    mov $0x00, %ch
    mov $0x02, %cl
    mov $0x00, %dh
    mov boot_drive, %dl
    mov $0x7E00, %bx
    int $0x13

    jc disk_error

    // Long jump to new sector
    ljmp $0x0000, $0x7E00

disk_error:
    mov $'3', %al
    mov $0x0E, %ah
    int $0x10
    cli
    hlt

boot_drive:
    .byte 0

.fill 510 - (. - _start), 1, 0

.word 0xAA55
