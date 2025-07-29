bits 64

section .bss
section .data
section .text
global f.main
global _start

_start:
	mov rbp,rsp
	mov rdi,0
	mov rax,60
	syscall