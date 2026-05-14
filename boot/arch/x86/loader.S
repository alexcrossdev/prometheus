/* SPDX-License-Identifier: MIT */
/*
 *  boot/arch/x86/loader.S
 *
 *  Copyright (C) 2026  Alex Cross <alexcros@mtu.edu>
 *
 *  Loader code, second stage in bootloader.
 *
 */

.code16

.section .loader.text, "ax"
.global _start

_start:
    // Set segments
    cli
    mov $0x07E0, %ax
    mov %ax, %ds
    mov %ax, %es
    xor %ax, %ax
    mov %ax, %ss
    mov $0x7C00, %sp
    sti

    call clear_screen

    mov $init_msg, %si
    call print

    cli
    hlt


init_msg:
.string "Initialized loader"

// Clear screen function
clear_screen:
    mov $0x06, %ah
    xor %al, %al
    mov $0x07, %bh
    xor %cx, %cx
    mov $0x184F, %dx
    int $0x10

    mov $0x02, %ah
    xor %bh, %bh
    xor %dx, %dx
    int $0x10
    ret

// Print to screen
print:
.loop:
    mov (%si), %al
    inc %si
    test %al, %al
    jz .done

    mov $0x0E, %ah
    xor %bh, %bh
    int $0x10

    jmp .loop
.done:
    ret

.fill 1024 - (. - _start), 1, 0
