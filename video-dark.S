        .file "hello.s"
        .code16gcc
        .intel_syntax noprefix

        .global _start

        .text # @ 7c00
_start:
        movb al, 0x13
        xor ah, ah
        int 0x10

_halt:
        hlt
        jmp _halt

        .data # @ 7dfe
mbr_signature:
        .byte 0x55
        .byte 0xAA
