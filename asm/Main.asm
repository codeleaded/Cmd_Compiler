;|
;| RexLang by codeleaded
;|

bits 64

section .bss

section .data
GLOBAL_STR0: db "false",0
GLOBAL_STR1: db "true",0
GLOBAL_STR2: db "none",0
GLOBAL_STR3: db "false",0
GLOBAL_STR4: db "0",0
GLOBAL_STR5: db "true",0
GLOBAL_STR6: db "1",0
GLOBAL_STR7: db "false",0
GLOBAL_STR8: db "0",0
GLOBAL_STR9: db "true",0
GLOBAL_STR10: db "1",0
GLOBAL_STR11: db "---------------------- Allocator ---------------------",10,0
GLOBAL_STR12: db "| Memory:",0
GLOBAL_STR13: db 10,0
GLOBAL_STR14: db "| Length:",0
GLOBAL_STR15: db 10,0
GLOBAL_STR16: db "| Block:",0
GLOBAL_STR17: db 10,0
GLOBAL_STR18: db "------------------------------------------------------",10,0
GLOBAL_STR19: db "------------------- Vector -------------------",10,0
GLOBAL_STR20: db 10,0
GLOBAL_STR21: db "| Header: ",0
GLOBAL_STR22: db "| Element: ",0
GLOBAL_STR23: db 10,0
GLOBAL_STR24: db "----------------------------------------------",10,0
GLOBAL_STR25: db "--------------------- List -------------------",10,0
GLOBAL_STR26: db 10,0
GLOBAL_STR27: db "| Header: ",0
GLOBAL_STR28: db "| Element: ",0
GLOBAL_STR29: db 10,0
GLOBAL_STR30: db "----------------------------------------------",10,0
GLOBAL_STR31: db "0123456789",0
GLOBAL_STR32: db "-0123456789",0
GLOBAL_STR33: db "-.0123456789",0
GLOBAL_STR34: db "x0123456789ABCDEFabcdef",0
GLOBAL_STR35: db "o01234567",0
GLOBAL_STR36: db "b01",0
GLOBAL_STR37: db "Fib(",0
GLOBAL_STR38: db ") = ",0
GLOBAL_STR39: db 10,0

section .text
global _start

f.sys.read:
    mov rax,0
    mov rdi,QWORD[rsp + 24]
    mov rsi,QWORD[rsp + 16]
    mov rdx,QWORD[rsp + 8]
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.write:
    mov rax,1
    mov rdi,QWORD[rsp + 24]
    mov rsi,QWORD[rsp + 16]
    mov rdx,QWORD[rsp + 8]
    syscall
    ret

f.sys.open:
    mov rax,2
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    mov rdx,0o644
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.close:
    mov rax,3
    mov rdi,QWORD[rsp + 8]
    syscall
    ret

f.sys.stat:
    mov rax,4
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    ret

f.sys.fstat:
    mov rax,5
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    ret

f.sys.poll:
    mov rax,7
    mov rdi,QWORD[rsp + 16]
    mov esi,DWORD[rsp + 12]
    mov edx,DWORD[rsp + 8]
    syscall
    sub rsp,4
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 28],eax
    add rsp,4
    ret
    add rsp,4
    ret

f.sys.lseek:
    mov rax,8
    mov rdi,QWORD[rsp + 24]
    mov rsi,QWORD[rsp + 16]
    mov rdx,QWORD[rsp + 8]
    syscall
    ret

f.sys.mmap:
    mov rax,9
    mov rdi,0
    mov rsi,QWORD[rsp + 8]
    mov rdx,3
    mov r10,0x22
    mov r8,0
    mov r9,0
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.munmap:
    mov rax,11
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    ret

f.sys.brk:
    mov rax,12
    mov rdi,0
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rdi,rax
    add rdi,QWORD[rsp + 16]
    mov rax,12
    syscall
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.rt_sigaction:
    mov rax,13
    mov rdi,QWORD[rsp + 32]
    mov rsi,QWORD[rsp + 24]
    mov rdx,QWORD[rsp + 16]
    mov rcx,QWORD[rsp + 8]
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 48],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.ioctl:
    mov rax,16
    mov rdi,QWORD[rsp + 32]
    mov rsi,QWORD[rsp + 24]
    mov rdx,QWORD[rsp + 16]
    mov rcx,QWORD[rsp + 8]
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 48],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.pause:
    mov rax,34
    syscall
    ret

f.sys.nanosleep:
    mov rax,35
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    ret

f.sys.getpid:
    mov rax,39
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.shutdown:
    mov rax,48
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    sub rsp,4
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 28],eax
    add rsp,4
    ret
    add rsp,4
    ret

f.sys.setsockopt:
    mov rax,54
    mov rdi,QWORD[rsp + 40]
    mov rsi,QWORD[rsp + 32]
    mov rdx,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 16]
    mov r8,QWORD[rsp + 8]
    syscall
    sub rsp,4
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 52],eax
    add rsp,4
    ret
    add rsp,4
    ret

f.sys.clone:
    mov rax,56
    mov rdi,QWORD[rsp + 40]
    mov rsi,QWORD[rsp + 32]
    mov rdx,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 16]
    mov r8,0
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 56],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.fork:
    mov rax,57
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.execve:
    mov rax,59
    mov rdi,QWORD[rsp + 24]
    mov rsi,QWORD[rsp + 16]
    mov rdx,QWORD[rsp + 8]
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.exit:
    mov rax,60
    mov edi,DWORD[rsp + 8]
    syscall
    ret

f.sys.waitpid:
    mov rax,61
    mov rdi,QWORD[rsp + 20]
    mov rsi,QWORD[rsp + 12]
    mov edx,DWORD[rsp + 8]
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 36],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.kill:
    mov rax,62
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    sub rsp,4
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 28],eax
    add rsp,4
    ret
    add rsp,4
    ret

f.sys.fcntl:
    mov rax,72
    mov rdi,QWORD[rsp + 24]
    mov rsi,QWORD[rsp + 16]
    mov rdx,QWORD[rsp + 8]
    syscall
    sub rsp,4
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 36],eax
    add rsp,4
    ret
    add rsp,4
    ret

f.sys.rt_sigqueueinfo:
    mov rax,129
    mov rdi,QWORD[rsp + 24]
    mov rsi,QWORD[rsp + 16]
    mov rdx,QWORD[rsp + 8]
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.sys.clock_gettime:
    mov rax,228
    mov rdi,QWORD[rsp + 16]
    mov rsi,QWORD[rsp + 8]
    syscall
    ret

f.sys.select:
    mov rax,323
    mov rdi,1
    mov rsi,QWORD[rsp + 8]
    mov rdx,0
    syscall
    sub rsp,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.cstr.len:
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    add rax,0
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    l.0_WHILE2_0:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp rax,0
    jne lcmp.0_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.1_END
    lcmp.0_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.1_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_0
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 9],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    jmp l.0_WHILE2_0
    l.1_WHILE2_0:
    mov rax,QWORD[rsp + 1]
    mov QWORD[rsp + 25],rax
    add rsp,1
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    ret

f.cstr.set:
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_WHILE2_1:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 18]
    jl lcmp.2_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.3_END
    lcmp.2_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.3_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov al,BYTE[rsp + 40]
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    jmp l.0_WHILE2_1
    l.1_WHILE2_1:
    add rsp,8
    ret

f.cstr.cpy:
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_WHILE2_2:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 18]
    jl lcmp.4_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.5_END
    lcmp.4_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.5_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_2
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 16]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    jmp l.0_WHILE2_2
    l.1_WHILE2_2:
    add rsp,8
    ret

f.cstr.mov:
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_0:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 18]
    jl lcmp.6_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.7_END
    lcmp.6_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.7_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 16]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_0
    l.1_FOR3_0:
    add rsp,8
    ret

f.cstr.cmp:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,QWORD[rsp + 2]
    jne lcmp.8_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.9_END
    lcmp.8_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.9_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_3
    l.0_IF2_3:
    mov BYTE[rsp + 40],0
    add rsp,8
    add rsp,8
    ret
    l.1_LOG2_3:
    l.1_IF2_3:
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_1:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 18]
    jl lcmp.10_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.11_END
    lcmp.10_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.11_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    add rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov r10,QWORD[rsp + 17]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 1]
    cmp al,BYTE[r10]
    jne lcmp.12_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.13_END
    lcmp.12_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.13_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 33],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_0
    l.0_IF4_0:
    mov BYTE[rsp + 48],0
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG4_0:
    l.1_IF4_0:
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_1
    l.1_FOR3_1:
    add rsp,8
    mov BYTE[rsp + 40],1
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    ret

f.cstr.find:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_2:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    jl lcmp.14_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.15_END
    lcmp.14_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.15_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_2
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp al,BYTE[rsp + 42]
    je lcmp.16_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.17_END
    lcmp.16_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.17_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_1
    l.0_IF4_1:
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 33],rax
    add rsp,8
    add rsp,8
    ret
    l.1_LOG4_1:
    l.1_IF4_1:
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_2
    l.1_FOR3_2:
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 25],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.cstr.findc:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_3:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    jl lcmp.18_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.19_END
    lcmp.18_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.19_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_3
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR5_0:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 27]
    jl lcmp.20_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.21_END
    lcmp.20_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.21_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR5_0
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 50]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov al,BYTE[rsp + 26]
    mov r10,QWORD[rsp + 1]
    cmp al,BYTE[r10]
    je lcmp.22_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.23_END
    lcmp.22_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.23_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF6_0
    l.0_IF6_0:
    mov rax,QWORD[rsp + 9]
    mov QWORD[rsp + 57],rax
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG6_0:
    l.1_IF6_0:
    add QWORD[rsp + 0],1
    jmp l.0_FOR5_0
    l.1_FOR5_0:
    add rsp,8
    add QWORD[rsp + 1],1
    add rsp,1
    jmp l.0_FOR3_3
    l.1_FOR3_3:
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    ret

f.cstr.findnot:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_4:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    jl lcmp.24_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.25_END
    lcmp.24_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.25_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_4
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR5_1:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 27]
    jl lcmp.26_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.27_END
    lcmp.26_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.27_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR5_1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 50]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov al,BYTE[rsp + 26]
    mov r10,QWORD[rsp + 1]
    cmp al,BYTE[r10]
    je lcmp.28_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.29_END
    lcmp.28_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.29_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF6_1
    l.0_IF6_1:
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    l.1_LOG6_1:
    l.1_IF6_1:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    sub rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,QWORD[rsp + 1]
    je lcmp.30_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.31_END
    lcmp.30_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.31_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF6_2
    l.0_IF6_2:
    mov rax,QWORD[rsp + 9]
    mov QWORD[rsp + 57],rax
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG6_2:
    l.1_IF6_2:
    add QWORD[rsp + 0],1
    jmp l.0_FOR5_1
    l.1_FOR5_1:
    add rsp,8
    add QWORD[rsp + 1],1
    add rsp,1
    jmp l.0_FOR3_4
    l.1_FOR3_4:
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    ret

f.ptr.set:
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_5:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 26]
    jl lcmp.32_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.33_END
    lcmp.32_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.33_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_5
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov al,BYTE[rsp + 48]
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_5
    l.1_FOR3_5:
    add rsp,8
    add rsp,8
    ret

f.ptr.cpy:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_6:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 34]
    jl lcmp.34_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.35_END
    lcmp.34_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.35_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_6
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 16]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_6
    l.1_FOR3_6:
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ptr.mov:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov rbx,8
    idiv rbx
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,8
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    sub rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_7:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 34]
    jl lcmp.36_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.37_END
    lcmp.36_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.37_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_7
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 16]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],8
    jmp l.0_FOR3_7
    l.1_FOR3_7:
    l.0_FOR3_8:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 66]
    jl lcmp.38_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.39_END
    lcmp.38_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.39_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 16]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_8
    l.1_FOR3_8:
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ptr.shl:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,8
    idiv rbx
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,8
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    sub rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_9:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 42]
    jl lcmp.40_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.41_END
    lcmp.40_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.41_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_9
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 16]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],8
    jmp l.0_FOR3_9
    l.1_FOR3_9:
    l.0_FOR3_10:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 66]
    jl lcmp.42_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.43_END
    lcmp.42_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.43_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_10
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 16]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],1
    jmp l.0_FOR3_10
    l.1_FOR3_10:
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ptr.shr:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,8
    idiv rbx
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,8
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    add rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_FOR3_11:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 42]
    jg lcmp.44_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.45_END
    lcmp.44_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.45_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_11
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov r10,QWORD[rsp + 16]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub QWORD[rsp + 0],1
    jmp l.0_FOR3_11
    l.1_FOR3_11:
    l.0_FOR3_12:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.46_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.47_END
    lcmp.46_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.47_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_12
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 16]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub QWORD[rsp + 0],8
    jmp l.0_FOR3_12
    l.1_FOR3_12:
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.char.alpha:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    cmp rax,65
    jge lcmp.48_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.49_END
    lcmp.48_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.49_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,91
    jl lcmp.50_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.51_END
    lcmp.50_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.51_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 12]
    cmp rax,97
    jge lcmp.52_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.53_END
    lcmp.52_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.53_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 13]
    cmp rax,123
    jl lcmp.54_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.55_END
    lcmp.54_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.55_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    sub rsp,1
    mov al,BYTE[rsp + 4]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 16],al
    add rsp,1
    add rsp,1
    add rsp,1
    add rsp,1
    add rsp,1
    add rsp,1
    add rsp,1
    ret
    ret

f.char.num:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    cmp rax,48
    jge lcmp.56_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.57_END
    lcmp.56_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.57_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,58
    jl lcmp.58_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.59_END
    lcmp.58_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.59_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 12],al
    add rsp,1
    add rsp,1
    add rsp,1
    ret
    ret

f.char.alphanum:
    sub rsp,1
    sub rsp,1
    mov al,BYTE[rsp + 10]
    mov BYTE[rsp + 0],al
    call f.char.alpha
    add rsp,1
    sub rsp,1
    sub rsp,1
    mov al,BYTE[rsp + 11]
    mov BYTE[rsp + 0],al
    call f.char.num
    add rsp,1
    sub rsp,1
    mov al,BYTE[rsp + 2]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 12],al
    add rsp,1
    add rsp,1
    add rsp,1
    ret
    ret

f.char.to.dec:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jge lcmp.60_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.61_END
    lcmp.60_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.61_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,10
    jl lcmp.62_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.63_END
    lcmp.62_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.63_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_4
    l.0_IF2_4:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    l.1_LOG2_4:
    l.1_IF2_4:
    mov BYTE[rsp + 16],0
    ret
    ret

f.char.to.hex:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jge lcmp.64_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.65_END
    lcmp.64_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.65_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,10
    jl lcmp.66_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.67_END
    lcmp.66_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.67_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_5
    l.0_IF2_5:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    l.1_LOG2_5:
    l.1_IF2_5:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,10
    jge lcmp.68_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.69_END
    lcmp.68_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.69_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,16
    jl lcmp.70_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.71_END
    lcmp.70_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.71_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_6
    l.0_IF2_6:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,55
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    l.1_LOG2_6:
    l.1_IF2_6:
    mov BYTE[rsp + 16],0
    ret
    ret

f.char.to.oct:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jge lcmp.72_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.73_END
    lcmp.72_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.73_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,8
    jl lcmp.74_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.75_END
    lcmp.74_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.75_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_7
    l.0_IF2_7:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    l.1_LOG2_7:
    l.1_IF2_7:
    mov BYTE[rsp + 16],0
    ret
    ret

f.char.to.bin:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jge lcmp.76_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.77_END
    lcmp.76_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.77_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,2
    jl lcmp.78_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.79_END
    lcmp.78_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.79_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_8
    l.0_IF2_8:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    l.1_LOG2_8:
    l.1_IF2_8:
    mov BYTE[rsp + 16],0
    ret
    ret

f.char.by.dec:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,48
    jge lcmp.80_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.81_END
    lcmp.80_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.81_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,58
    jl lcmp.82_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.83_END
    lcmp.82_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.83_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_9
    l.0_IF2_9:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    sub rax,48
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,1
    ret
    l.1_LOG2_9:
    l.1_IF2_9:
    mov QWORD[rsp + 9],0
    ret
    ret

f.char.by.hex:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,48
    jge lcmp.84_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.85_END
    lcmp.84_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.85_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,58
    jl lcmp.86_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.87_END
    lcmp.86_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.87_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_10
    l.0_IF2_10:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    sub rax,48
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,1
    ret
    l.1_LOG2_10:
    l.1_IF2_10:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,65
    jge lcmp.88_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.89_END
    lcmp.88_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.89_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,71
    jl lcmp.90_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.91_END
    lcmp.90_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.91_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_11
    l.0_IF2_11:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    sub rax,55
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,1
    ret
    l.1_LOG2_11:
    l.1_IF2_11:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,97
    jge lcmp.92_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.93_END
    lcmp.92_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.93_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,103
    jl lcmp.94_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.95_END
    lcmp.94_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.95_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_12
    l.0_IF2_12:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    sub rax,87
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,1
    ret
    l.1_LOG2_12:
    l.1_IF2_12:
    mov QWORD[rsp + 9],0
    ret
    ret

f.char.by.oct:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,48
    jge lcmp.96_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.97_END
    lcmp.96_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.97_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,56
    jl lcmp.98_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.99_END
    lcmp.98_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.99_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_13
    l.0_IF2_13:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    sub rax,48
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,1
    ret
    l.1_LOG2_13:
    l.1_IF2_13:
    mov QWORD[rsp + 9],0
    ret
    ret

f.char.by.bin:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,48
    jge lcmp.100_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.101_END
    lcmp.100_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.101_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,50
    jl lcmp.102_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.103_END
    lcmp.102_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.103_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_14
    l.0_IF2_14:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 9]
    sub rax,48
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,1
    ret
    l.1_LOG2_14:
    l.1_IF2_14:
    mov QWORD[rsp + 9],0
    ret
    ret

f.math.lib.sin:
    fld QWORD[rsp + 8]
    fsin
    fstp QWORD[rsp + 8]
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 16],rax
    ret
    ret

f.math.lib.cos:
    fld QWORD[rsp + 8]
    fcos
    fstp QWORD[rsp + 8]
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 16],rax
    ret
    ret

f.math.lib.tan:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.math.lib.sin
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.lib.cos
    add rsp,8
    sub rsp,8
    fld QWORD[rsp + 16]
    fdiv QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    ret

f.math.lib.atan:
    fld QWORD[rsp + 8]
    fpatan
    fstp QWORD[rsp + 8]
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 16],rax
    ret
    ret

f.math.lib.f2xm1:
    fld QWORD[rsp + 8]
    f2xm1
    fstp QWORD[rsp + 8]
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 16],rax
    ret
    ret

f.math.lib.yl2x:
    fld QWORD[rsp + 8]
    fld QWORD[rsp + 16]
    fyl2x
    fstp QWORD[rsp + 16]
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.lib.yl2xp1:
    fld QWORD[rsp + 8]
    fld QWORD[rsp + 16]
    fyl2xp1
    fstp QWORD[rsp + 16]
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.lib.sqrt:
    fld QWORD[rsp + 8]
    fsqrt
    fstp QWORD[rsp + 8]
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 16],rax
    ret
    ret

f.math.lib.ln2:
    sub rsp,8
    fldln2
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.lib.log2_e:
    sub rsp,8
    fldl2e
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.lib.log2_10:
    sub rsp,8
    fldl2t
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.lib.pi:
    sub rsp,8
    fldpi
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.lib.log10_2:
    sub rsp,8
    fldlg2
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.uint.pow:
    sub rsp,8
    mov QWORD[rsp + 0],1
    l.0_WHILE2_15:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jg lcmp.104_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.105_END
    lcmp.104_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.105_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_15
    mov rax,QWORD[rsp + 0]
    mov rbx,QWORD[rsp + 24]
    mul rbx
    mov QWORD[rsp + 0],rax
    sub QWORD[rsp + 16],1
    jmp l.0_WHILE2_15
    l.1_WHILE2_15:
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.uint.logb:
    sub rsp,8
    mov QWORD[rsp + 0],-1
    l.0_WHILE2_16:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jg lcmp.106_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.107_END
    lcmp.106_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.107_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_16
    mov rdx,0
    mov rax,QWORD[rsp + 16]
    mov rbx,QWORD[rsp + 24]
    div rbx
    mov QWORD[rsp + 16],rax
    add QWORD[rsp + 0],1
    jmp l.0_WHILE2_16
    l.1_WHILE2_16:
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.uint.log10:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.uint.logb
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.math.uint.min:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,QWORD[rsp + 10]
    jl lcmp.108_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.109_END
    lcmp.108_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.109_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_17
    l.0_IF2_17:
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    l.1_LOG2_17:
    l.1_IF2_17:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.uint.max:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,QWORD[rsp + 10]
    jg lcmp.110_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.111_END
    lcmp.110_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.111_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_18
    l.0_IF2_18:
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    l.1_LOG2_18:
    l.1_IF2_18:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.int.sign:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jg lcmp.112_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.113_END
    lcmp.112_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.113_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_19
    l.0_IF2_19:
    mov QWORD[rsp + 16],1
    ret
    jmp l.1_LOG2_19
    l.1_IF2_19:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jl lcmp.114_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.115_END
    lcmp.114_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.115_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF2_19_1
    l.0_ELIF2_19_1:
    mov QWORD[rsp + 16],-1
    ret
    l.1_LOG2_19:
    l.1_ELIF2_19_1:
    mov QWORD[rsp + 16],0
    ret
    ret

f.math.int.min:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,QWORD[rsp + 10]
    jl lcmp.116_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.117_END
    lcmp.116_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.117_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_20
    l.0_IF2_20:
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    l.1_LOG2_20:
    l.1_IF2_20:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.int.max:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,QWORD[rsp + 10]
    jg lcmp.118_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.119_END
    lcmp.118_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.119_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_21
    l.0_IF2_21:
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    l.1_LOG2_21:
    l.1_IF2_21:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.float.setmode:
    fldcw WORD[rsp + 8]
    ret

f.math.float.setstd:
    sub rsp,2
    mov WORD[rsp + 0],0x037F
    fldcw WORD[rsp + 0]
    add rsp,2
    ret

f.math.float.powi:
    sub rsp,8
    mov rax,4607182418800017408
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jl lcmp.120_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.121_END
    lcmp.120_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.121_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_22
    l.0_IF2_22:
    sub rsp,8
    mov rax,4607182418800017408
    push rax
    fld QWORD[rsp]
    add rsp,8
    fdiv QWORD[rsp + 32]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    l.1_LOG2_22:
    l.1_IF2_22:
    l.0_WHILE2_23:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jg lcmp.122_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.123_END
    lcmp.122_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.123_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_23
    mov rax,QWORD[rsp + 0]
    mov rbx,QWORD[rsp + 24]
    imul rbx
    mov QWORD[rsp + 0],rax
    sub QWORD[rsp + 16],1
    jmp l.0_WHILE2_23
    l.1_WHILE2_23:
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.math.float.sign:
    sub rsp,1
    sub rsp,1
    fld QWORD[rsp + 10]
    mov rax,0
    push rax
    fld QWORD[rsp]
    add rsp,8
    fcomp
    fstsw ax
    sahf
    fstp
    jg lcmp.124_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.125_END
    lcmp.124_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.125_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_24
    l.0_IF2_24:
    mov rax,4607182418800017408
    mov QWORD[rsp + 16],rax
    ret
    jmp l.1_LOG2_24
    l.1_IF2_24:
    sub rsp,1
    sub rsp,1
    fld QWORD[rsp + 10]
    mov rax,0
    push rax
    fld QWORD[rsp]
    add rsp,8
    fcomp
    fstsw ax
    sahf
    fstp
    jl lcmp.126_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.127_END
    lcmp.126_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.127_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF2_24_2
    l.0_ELIF2_24_2:
    mov rax,2429
    mov QWORD[rsp + 16],rax
    ret
    l.1_LOG2_24:
    l.1_ELIF2_24_2:
    mov rax,0
    mov QWORD[rsp + 16],rax
    ret
    ret

f.math.float.ylnx:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.lib.yl2x
    add rsp,8
    add rsp,8
    sub rsp,8
    call f.math.lib.ln2
    sub rsp,8
    fld QWORD[rsp + 16]
    fmul QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 48],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    ret

f.math.float.pow:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.lib.yl2x
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    fld QWORD[rsp + 16]
    fistp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    fild QWORD[rsp + 16]
    fstp QWORD[rsp + 0]
    sub rsp,8
    fld QWORD[rsp + 32]
    fsub QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,4611686018427387904
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.float.powi
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.lib.f2xm1
    add rsp,8
    sub rsp,8
    fld QWORD[rsp + 8]
    sub rsp,8
    mov QWORD[rsp],4607182418800017408
    fadd QWORD[rsp]
    add rsp,8
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    fld QWORD[rsp + 16]
    fmul QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 72],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.math.float.ln:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,4607182418800017408
    mov QWORD[rsp + 0],rax
    call f.math.float.ylnx
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.math.float.ex:
    sub rsp,8
    sub rsp,8
    mov rax,4613303445313851804
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.float.pow
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.parse.boolean.get:
    sub rsp,1
    sub rsp,1
    mov al,BYTE[rsp + 10]
    cmp al,0
    je lcmp.128_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.129_END
    lcmp.128_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.129_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_25
    l.0_IF2_25:
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR0
    sub rsp,8
    mov QWORD[rsp + 0],5
    call f.cstr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    jmp l.1_LOG2_25
    l.1_IF2_25:
    sub rsp,1
    sub rsp,1
    mov al,BYTE[rsp + 10]
    cmp al,1
    je lcmp.130_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.131_END
    lcmp.130_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.131_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF2_25_3
    l.0_ELIF2_25_3:
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR1
    sub rsp,8
    mov QWORD[rsp + 0],4
    call f.cstr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    jmp l.1_LOG2_25
    l.1_ELIF2_25_3:
    l.0_ELSE2_25:
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR2
    sub rsp,8
    mov QWORD[rsp + 0],4
    call f.cstr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_25:
    ret

f.parse.boolean.by:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR3
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 19]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR4
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 2]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_26
    l.0_IF2_26:
    mov BYTE[rsp + 16],0
    ret
    l.1_LOG2_26:
    l.1_IF2_26:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR5
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 19]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR6
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 2]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_27
    l.0_IF2_27:
    mov BYTE[rsp + 16],1
    ret
    l.1_LOG2_27:
    l.1_IF2_27:
    mov BYTE[rsp + 16],0
    ret
    ret

f.parse.boolean.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.132_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.133_END
    lcmp.132_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.133_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_28
    l.0_IF2_28:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_28:
    l.1_IF2_28:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR7
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 27]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR8
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 2]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_29
    l.0_IF2_29:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    mov BYTE[rsp + 24],1
    ret
    l.1_LOG2_29:
    l.1_IF2_29:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR9
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 27]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR10
    call f.cstr.cmp
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 2]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_30
    l.0_IF2_30:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],1
    add rsp,8
    mov BYTE[rsp + 24],1
    ret
    l.1_LOG2_30:
    l.1_IF2_30:
    mov BYTE[rsp + 24],0
    ret
    ret

f.parse.uint.get:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.134_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.135_END
    lcmp.134_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.135_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_31
    l.0_IF2_31:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    jmp l.1_LOG2_31
    l.1_IF2_31:
    l.0_ELSE2_31:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.uint.log10
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    l.0_FOR4_2:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.136_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.137_END
    lcmp.136_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.137_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR4_2
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov rbx,10
    div rbx
    mov QWORD[rsp + 0],rdx
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    mov rdx,0
    mov rax,QWORD[rsp + 32]
    mov rbx,10
    div rbx
    mov QWORD[rsp + 32],rax
    sub QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR4_2
    l.1_FOR4_2:
    add rsp,8
    add rsp,8
    l.1_LOG2_31:
    ret

f.parse.uint.by:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_32:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.138_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.139_END
    lcmp.138_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.139_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_32
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp rax,48
    jge lcmp.140_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.141_END
    lcmp.140_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.141_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    jle lcmp.142_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.143_END
    lcmp.142_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.143_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_13
    l.0_IF3_13:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 1]
    sub rax,48
    mov BYTE[rsp + 0],al
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 9]
    imul QWORD[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add QWORD[rsp + 35],rax
    add rsp,1
    add rsp,8
    add rsp,1
    add QWORD[rsp + 9],1
    sub QWORD[rsp + 1],1
    jmp l.1_LOG3_13
    l.1_IF3_13:
    l.0_ELSE3_13:
    mov QWORD[rsp + 57],0
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_13:
    add rsp,1
    jmp l.0_WHILE2_32
    l.1_WHILE2_32:
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.uint.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.144_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.145_END
    lcmp.144_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.145_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_33
    l.0_IF2_33:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_33:
    l.1_IF2_33:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_34:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.146_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.147_END
    lcmp.146_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.147_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_34
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp rax,48
    jge lcmp.148_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.149_END
    lcmp.148_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.149_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    jle lcmp.150_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.151_END
    lcmp.150_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.151_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_14
    l.0_IF3_14:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 1]
    sub rax,48
    mov BYTE[rsp + 0],al
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 9]
    imul QWORD[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add QWORD[rsp + 35],rax
    add rsp,1
    add rsp,8
    add rsp,1
    add QWORD[rsp + 9],1
    sub QWORD[rsp + 1],1
    jmp l.1_LOG3_14
    l.1_IF3_14:
    l.0_ELSE3_14:
    mov BYTE[rsp + 65],0
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_14:
    add rsp,1
    jmp l.0_WHILE2_34
    l.1_WHILE2_34:
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 32]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    mov BYTE[rsp + 64],1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.int.get:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.152_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.153_END
    lcmp.152_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.153_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_35
    l.0_IF2_35:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    jmp l.1_LOG2_35
    l.1_IF2_35:
    l.0_ELSE2_35:
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jl lcmp.154_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.155_END
    lcmp.154_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.155_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_15
    l.0_IF3_15:
    mov QWORD[rsp + 0],1
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,0
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,45
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    l.1_LOG3_15:
    l.1_IF3_15:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.uint.log10
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_FOR4_3:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 18]
    jge lcmp.156_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.157_END
    lcmp.156_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.157_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR4_3
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov rbx,10
    idiv rbx
    mov QWORD[rsp + 0],rdx
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    mov rdx,0
    mov rax,QWORD[rsp + 40]
    mov rbx,10
    idiv rbx
    mov QWORD[rsp + 40],rax
    sub QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR4_3
    l.1_FOR4_3:
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_35:
    ret

f.parse.int.by:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    add rax,0
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,45
    je lcmp.158_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.159_END
    lcmp.158_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.159_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_36
    l.0_IF2_36:
    mov QWORD[rsp + 0],1
    l.1_LOG2_36:
    l.1_IF2_36:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_37:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    jge lcmp.160_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.161_END
    lcmp.160_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.161_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_37
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp rax,48
    jge lcmp.162_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.163_END
    lcmp.162_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.163_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    jle lcmp.164_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.165_END
    lcmp.164_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.165_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_16
    l.0_IF3_16:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 1]
    sub rax,48
    mov BYTE[rsp + 0],al
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 9]
    imul QWORD[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add QWORD[rsp + 43],rax
    add rsp,1
    add rsp,8
    add rsp,1
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 1],1
    jmp l.1_LOG3_16
    l.1_IF3_16:
    l.0_ELSE3_16:
    mov QWORD[rsp + 65],0
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_16:
    add rsp,1
    jmp l.0_WHILE2_37
    l.1_WHILE2_37:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jg lcmp.166_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.167_END
    lcmp.166_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.167_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_38
    l.0_IF2_38:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG2_38:
    l.1_IF2_38:
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 64],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.int.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.168_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.169_END
    lcmp.168_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.169_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_39
    l.0_IF2_39:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_39:
    l.1_IF2_39:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,0
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,45
    je lcmp.170_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.171_END
    lcmp.170_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.171_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_40
    l.0_IF2_40:
    mov QWORD[rsp + 0],1
    l.1_LOG2_40:
    l.1_IF2_40:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_41:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    jge lcmp.172_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.173_END
    lcmp.172_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.173_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_41
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 73]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp rax,48
    jge lcmp.174_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.175_END
    lcmp.174_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.175_END:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    jle lcmp.176_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.177_END
    lcmp.176_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.177_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_17
    l.0_IF3_17:
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 1]
    sub rax,48
    mov BYTE[rsp + 0],al
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 9]
    imul QWORD[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add QWORD[rsp + 43],rax
    add rsp,1
    add rsp,8
    add rsp,1
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 1],1
    jmp l.1_LOG3_17
    l.1_IF3_17:
    l.0_ELSE3_17:
    mov BYTE[rsp + 73],0
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_17:
    add rsp,1
    jmp l.0_WHILE2_41
    l.1_WHILE2_41:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jg lcmp.178_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.179_END
    lcmp.178_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.179_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_42
    l.0_IF2_42:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG2_42:
    l.1_IF2_42:
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 40]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    mov BYTE[rsp + 72],1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.float.get:
    sub rsp,1
    sub rsp,1
    fld QWORD[rsp + 18]
    mov rax,0
    push rax
    fld QWORD[rsp]
    add rsp,8
    fcomp
    fstsw ax
    sahf
    fstp
    jl lcmp.180_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.181_END
    lcmp.180_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.181_END:
    sub rsp,8
    fld QWORD[rsp + 26]
    fistp QWORD[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,0
    je lcmp.182_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.183_END
    lcmp.182_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.183_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_43
    l.0_IF2_43:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,45
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    l.1_LOG2_43:
    l.1_IF2_43:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    fld QWORD[rsp + 40]
    fistp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.int.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,46
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add QWORD[rsp + 0],1
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],15
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.math.uint.min
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,15
    sub rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.math.uint.min
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    sub rsp,8
    fld QWORD[rsp + 40]
    fistp QWORD[rsp + 0]
    sub rsp,8
    fild QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    sub rsp,8
    fld QWORD[rsp + 56]
    fsub QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    fld QWORD[rsp + 34]
    mov rax,0
    push rax
    fld QWORD[rsp]
    add rsp,8
    fcomp
    fstsw ax
    sahf
    fstp
    jl lcmp.184_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.185_END
    lcmp.184_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.185_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_44
    l.0_IF2_44:
    sub rsp,8
    fld QWORD[rsp + 40]
    fchs
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG2_44:
    l.1_IF2_44:
    sub rsp,8
    sub rsp,8
    mov rax,4621819117588971520
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.math.float.powi
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 40]
    mov rbx,QWORD[rsp + 0]
    imul rbx
    mov QWORD[rsp + 40],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    fld QWORD[rsp + 56]
    fistp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.float.by:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov eax,46
    mov BYTE[rsp + 0],al
    call f.cstr.find
    add rsp,1
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.186_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.187_END
    lcmp.186_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.187_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_45
    l.0_IF2_45:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    l.1_LOG2_45:
    l.1_IF2_45:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.parse.int.by
    add rsp,8
    sub rsp,8
    fild QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],15
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.math.uint.min
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jge lcmp.188_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.189_END
    lcmp.188_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.189_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_46
    l.0_IF2_46:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    add rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.int.by
    add rsp,8
    sub rsp,8
    fild QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    sub rsp,8
    sub rsp,8
    mov rax,4591870180066957722
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.math.float.powi
    add rsp,8
    add rsp,8
    sub rsp,8
    fld QWORD[rsp + 16]
    fmul QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    fld QWORD[rsp + 18]
    mov rax,0
    push rax
    fld QWORD[rsp]
    add rsp,8
    fcomp
    fstsw ax
    sahf
    fstp
    jne lcmp.190_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.191_END
    lcmp.190_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.191_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_18
    l.0_IF3_18:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.float.sign
    add rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,QWORD[rsp + 0]
    imul rbx
    mov QWORD[rsp + 8],rax
    add rsp,8
    jmp l.1_LOG3_18
    l.1_IF3_18:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,45
    je lcmp.192_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.193_END
    lcmp.192_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.193_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF3_18_1
    l.0_ELIF3_18_1:
    sub rsp,8
    fld QWORD[rsp + 8]
    fchs
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.1_LOG3_18:
    l.1_ELIF3_18_1:
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 16],rax
    add rsp,8
    l.1_LOG2_46:
    l.1_IF2_46:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 48],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.float.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.194_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.195_END
    lcmp.194_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.195_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_47
    l.0_IF2_47:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_47:
    l.1_IF2_47:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov eax,46
    mov BYTE[rsp + 0],al
    call f.cstr.find
    add rsp,1
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.196_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.197_END
    lcmp.196_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.197_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_48
    l.0_IF2_48:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    l.1_LOG2_48:
    l.1_IF2_48:
    sub rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 50]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    lea rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.int.by_s
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 1]
    cmp al,1
    jne lcmp.198_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.199_END
    lcmp.198_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.199_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 2],al
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_49
    l.0_IF2_49:
    mov BYTE[rsp + 48],0
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG2_49:
    l.1_IF2_49:
    sub rsp,8
    sub rsp,8
    fild QWORD[rsp + 16]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],15
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.math.uint.min
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    add rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    cmp rax,0
    jge lcmp.200_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.201_END
    lcmp.200_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.201_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_50
    l.0_IF2_50:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    add rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.int.by_s
    add rsp,8
    add rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 1]
    cmp al,1
    jne lcmp.202_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.203_END
    lcmp.202_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.203_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 2],al
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_19
    l.0_IF3_19:
    mov BYTE[rsp + 64],0
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_19:
    l.1_IF3_19:
    sub rsp,8
    sub rsp,8
    fild QWORD[rsp + 32]
    fstp QWORD[rsp + 0]
    sub rsp,8
    sub rsp,8
    mov rax,4591870180066957722
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.float.powi
    add rsp,8
    add rsp,8
    sub rsp,8
    fld QWORD[rsp + 16]
    fmul QWORD[rsp + 8]
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    fld QWORD[rsp + 18]
    mov rax,0
    push rax
    fld QWORD[rsp]
    add rsp,8
    fcomp
    fstsw ax
    sahf
    fstp
    jne lcmp.204_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.205_END
    lcmp.204_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.205_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_20
    l.0_IF3_20:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.math.float.sign
    add rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,QWORD[rsp + 0]
    imul rbx
    mov QWORD[rsp + 8],rax
    add rsp,8
    jmp l.1_LOG3_20
    l.1_IF3_20:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 73]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,45
    je lcmp.206_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.207_END
    lcmp.206_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.207_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF3_20_2
    l.0_ELIF3_20_2:
    sub rsp,8
    fld QWORD[rsp + 8]
    fchs
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.1_LOG3_20:
    l.1_ELIF3_20_2:
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 16],rax
    add rsp,8
    l.1_LOG2_50:
    l.1_IF2_50:
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    mov BYTE[rsp + 64],1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.hex.get:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,120
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.208_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.209_END
    lcmp.208_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.209_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_51
    l.0_IF2_51:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    add rsp,8
    jmp l.1_LOG2_51
    l.1_IF2_51:
    l.0_ELSE2_51:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],16
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.uint.logb
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    l.0_FOR4_4:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.210_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.211_END
    lcmp.210_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.211_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR4_4
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov rbx,16
    div rbx
    mov QWORD[rsp + 0],rdx
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.char.to.hex
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    mov rdx,0
    mov rax,QWORD[rsp + 32]
    mov rbx,16
    div rbx
    mov QWORD[rsp + 32],rax
    sub QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR4_4
    l.1_FOR4_4:
    add rsp,8
    add rsp,8
    l.1_LOG2_51:
    ret

f.parse.hex.by:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    jne lcmp.212_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.213_END
    lcmp.212_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.213_END:
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,120
    jne lcmp.214_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.215_END
    lcmp.214_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.215_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_52
    l.0_IF2_52:
    mov QWORD[rsp + 16],0
    ret
    l.1_LOG2_52:
    l.1_IF2_52:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_53:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    jge lcmp.216_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.217_END
    lcmp.216_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.217_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_53
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 17]
    mov BYTE[rsp + 0],al
    call f.char.by.hex
    add rsp,1
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.218_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.219_END
    lcmp.218_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.219_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_21
    l.0_IF3_21:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],16
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 49],rax
    add rsp,8
    add rsp,8
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 9],1
    jmp l.1_LOG3_21
    l.1_IF3_21:
    l.0_ELSE3_21:
    mov QWORD[rsp + 65],0
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_21:
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_53
    l.1_WHILE2_53:
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.hex.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.220_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.221_END
    lcmp.220_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.221_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_54
    l.0_IF2_54:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_54:
    l.1_IF2_54:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    jne lcmp.222_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.223_END
    lcmp.222_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.223_END:
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,120
    jne lcmp.224_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.225_END
    lcmp.224_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.225_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_55
    l.0_IF2_55:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_55:
    l.1_IF2_55:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_56:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    jge lcmp.226_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.227_END
    lcmp.226_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.227_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_56
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 17]
    mov BYTE[rsp + 0],al
    call f.char.by.hex
    add rsp,1
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.228_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.229_END
    lcmp.228_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.229_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_22
    l.0_IF3_22:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],16
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 49],rax
    add rsp,8
    add rsp,8
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 9],1
    jmp l.1_LOG3_22
    l.1_IF3_22:
    l.0_ELSE3_22:
    mov BYTE[rsp + 73],0
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_22:
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_56
    l.1_WHILE2_56:
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 32]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    mov BYTE[rsp + 64],1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.oct.get:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,111
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.230_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.231_END
    lcmp.230_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.231_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_57
    l.0_IF2_57:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    add rsp,8
    jmp l.1_LOG2_57
    l.1_IF2_57:
    l.0_ELSE2_57:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.uint.logb
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    l.0_FOR4_5:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.232_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.233_END
    lcmp.232_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.233_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR4_5
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov rbx,8
    div rbx
    mov QWORD[rsp + 0],rdx
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.char.to.oct
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    mov rdx,0
    mov rax,QWORD[rsp + 32]
    mov rbx,8
    div rbx
    mov QWORD[rsp + 32],rax
    sub QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR4_5
    l.1_FOR4_5:
    add rsp,8
    add rsp,8
    l.1_LOG2_57:
    ret

f.parse.oct.by:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    jne lcmp.234_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.235_END
    lcmp.234_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.235_END:
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,111
    jne lcmp.236_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.237_END
    lcmp.236_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.237_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_58
    l.0_IF2_58:
    mov QWORD[rsp + 16],0
    ret
    l.1_LOG2_58:
    l.1_IF2_58:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_59:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    jge lcmp.238_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.239_END
    lcmp.238_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.239_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_59
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 17]
    mov BYTE[rsp + 0],al
    call f.char.by.oct
    add rsp,1
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.240_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.241_END
    lcmp.240_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.241_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_23
    l.0_IF3_23:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],8
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 49],rax
    add rsp,8
    add rsp,8
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 9],1
    jmp l.1_LOG3_23
    l.1_IF3_23:
    l.0_ELSE3_23:
    mov QWORD[rsp + 65],0
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_23:
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_59
    l.1_WHILE2_59:
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.oct.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.242_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.243_END
    lcmp.242_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.243_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_60
    l.0_IF2_60:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_60:
    l.1_IF2_60:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    jne lcmp.244_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.245_END
    lcmp.244_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.245_END:
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,111
    jne lcmp.246_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.247_END
    lcmp.246_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.247_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_61
    l.0_IF2_61:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_61:
    l.1_IF2_61:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_62:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    jge lcmp.248_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.249_END
    lcmp.248_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.249_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_62
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 17]
    mov BYTE[rsp + 0],al
    call f.char.by.oct
    add rsp,1
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.250_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.251_END
    lcmp.250_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.251_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_24
    l.0_IF3_24:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],8
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 49],rax
    add rsp,8
    add rsp,8
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 9],1
    jmp l.1_LOG3_24
    l.1_IF3_24:
    l.0_ELSE3_24:
    mov BYTE[rsp + 73],0
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_24:
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_62
    l.1_WHILE2_62:
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 32]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    mov BYTE[rsp + 64],1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.bin.get:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,48
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,98
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.252_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.253_END
    lcmp.252_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.253_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_63
    l.0_IF2_63:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    add rsp,8
    jmp l.1_LOG2_63
    l.1_IF2_63:
    l.0_ELSE2_63:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.math.uint.logb
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    l.0_FOR4_6:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.254_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.255_END
    lcmp.254_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.255_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR4_6
    sub rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov rbx,2
    div rbx
    mov QWORD[rsp + 0],rdx
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.char.to.bin
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    mov rdx,0
    mov rax,QWORD[rsp + 32]
    mov rbx,2
    div rbx
    mov QWORD[rsp + 32],rax
    sub QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR4_6
    l.1_FOR4_6:
    add rsp,8
    add rsp,8
    l.1_LOG2_63:
    ret

f.parse.bin.by:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    jne lcmp.256_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.257_END
    lcmp.256_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.257_END:
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,98
    jne lcmp.258_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.259_END
    lcmp.258_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.259_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_64
    l.0_IF2_64:
    mov QWORD[rsp + 16],0
    ret
    l.1_LOG2_64:
    l.1_IF2_64:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_65:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    jge lcmp.260_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.261_END
    lcmp.260_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.261_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_65
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 17]
    mov BYTE[rsp + 0],al
    call f.char.by.bin
    add rsp,1
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.262_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.263_END
    lcmp.262_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.263_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_25
    l.0_IF3_25:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 49],rax
    add rsp,8
    add rsp,8
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 9],1
    jmp l.1_LOG3_25
    l.1_IF3_25:
    l.0_ELSE3_25:
    mov QWORD[rsp + 65],0
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_25:
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_65
    l.1_WHILE2_65:
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.parse.bin.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    je lcmp.264_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.265_END
    lcmp.264_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.265_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_66
    l.0_IF2_66:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_66:
    l.1_IF2_66:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    jne lcmp.266_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.267_END
    lcmp.266_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.267_END:
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,98
    jne lcmp.268_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.269_END
    lcmp.268_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.269_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_67
    l.0_IF2_67:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_67:
    l.1_IF2_67:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_68:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    jge lcmp.270_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.271_END
    lcmp.270_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.271_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_68
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,1
    mov al,BYTE[rsp + 17]
    mov BYTE[rsp + 0],al
    call f.char.by.bin
    add rsp,1
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jge lcmp.272_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.273_END
    lcmp.272_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.273_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_26
    l.0_IF3_26:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    call f.math.uint.pow
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 49],rax
    add rsp,8
    add rsp,8
    add QWORD[rsp + 17],1
    sub QWORD[rsp + 9],1
    jmp l.1_LOG3_26
    l.1_IF3_26:
    l.0_ELSE3_26:
    mov BYTE[rsp + 73],0
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG3_26:
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_68
    l.1_WHILE2_68:
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 32]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    mov BYTE[rsp + 64],1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.input:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.sys.read
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.print:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.error:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.print_char:
    sub rsp,8
    mov QWORD[rsp + 0],1
    sub rsp,8
    sub rsp,8
    lea rax,BYTE[rsp + 32]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.print_int:
    sub rsp,8
    sub rsp,24
    mov QWORD[rsp + 24],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],24
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.parse.int.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,24
    ret

f.io.print_uint:
    sub rsp,8
    sub rsp,24
    mov QWORD[rsp + 24],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],24
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,24
    ret

f.io.print_float:
    sub rsp,8
    sub rsp,24
    mov QWORD[rsp + 24],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],24
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],6
    call f.parse.float.get
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,24
    ret

f.io.print_hex:
    sub rsp,8
    sub rsp,24
    mov QWORD[rsp + 24],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],24
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.parse.hex.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,24
    ret

f.io.File.init:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    ret

f.io.File.new:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.io.File.init
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 24 + 0],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.io.File.open:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.sys.open
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.io.File.new
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 40 + 0],rax
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    ret

f.io.File.close:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,2
    jg lcmp.274_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.275_END
    lcmp.274_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.275_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_69
    l.0_IF2_69:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.close
    add rsp,8
    l.1_LOG2_69:
    l.1_IF2_69:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    ret

f.io.File.size:
    sub rsp,144
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 168]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.fstat
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 160],rax
    add rsp,144
    ret
    add rsp,144
    ret

f.io.File.set_pos_start:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.File.set_pos_rel:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.File.set_pos_end:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.io.File.get_flags:
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],3
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.fcntl
    add rsp,8
    add rsp,8
    add rsp,8
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 20],eax
    add rsp,4
    ret
    ret

f.io.File.set_flags:
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],4
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.sys.fcntl
    add rsp,8
    add rsp,8
    add rsp,8
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 28],eax
    add rsp,4
    ret
    ret

f.io.File.read:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.sys.read
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 40],eax
    add rsp,8
    ret
    ret

f.io.File.write:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.mem.Allocator.init:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.sys.mmap
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    sub rax,8
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov DWORD[r10],eax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],0
    add rsp,8
    add rsp,8
    ret

f.mem.Allocator.delete:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,0
    jne lcmp.276_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.277_END
    lcmp.276_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.277_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_70
    l.0_IF2_70:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.munmap
    add rsp,8
    add rsp,8
    l.1_LOG2_70:
    l.1_IF2_70:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    ret

f.mem.Allocator.new:
    sub rsp,16
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10000
    call f.mem.Allocator.init
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 24 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 24 + 8],rax
    add rsp,16
    ret
    add rsp,16
    ret

f.mem.Allocator.make:
    sub rsp,16
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.init
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 32 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 32 + 8],rax
    add rsp,16
    ret
    add rsp,16
    ret

f.mem.Allocator.alloc:
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_71:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_71
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 25]
    cmp rax,QWORD[rsp + 1]
    jg lcmp.278_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.279_END
    lcmp.278_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.279_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_27
    l.0_IF3_27:
    mov QWORD[rsp + 40],0
    add rsp,8
    add rsp,8
    ret
    jmp l.1_LOG3_27
    l.1_IF3_27:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,0
    je lcmp.280_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.281_END
    lcmp.280_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.281_END:
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,QWORD[rsp + 43]
    jge lcmp.282_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.283_END
    lcmp.282_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.283_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 19],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF3_27_3
    l.0_ELIF3_27_3:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,4
    mov rax,0
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    sub rax,QWORD[rsp + 44]
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov QWORD[rsp + 12],rax
    add rsp,4
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,8
    jle lcmp.284_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.285_END
    lcmp.284_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.285_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_7
    l.0_IF4_7:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG4_7:
    l.1_IF4_7:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,0
    mov rax,QWORD[rsp + 40]
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],eax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,8
    jg lcmp.286_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.287_END
    lcmp.286_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.287_END:
    sub rsp,8
    mov rax,QWORD[rsp + 10]
    add rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 25]
    cmp rax,QWORD[rsp + 1]
    jle lcmp.288_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.289_END
    lcmp.288_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.289_END:
    sub rsp,1
    mov al,BYTE[rsp + 34]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 35],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_8
    l.0_IF4_8:
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    sub rax,8
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov DWORD[r10],eax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],0
    add rsp,8
    l.1_LOG4_8:
    l.1_IF4_8:
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    jmp l.1_LOG3_27
    l.1_ELIF3_27_3:
    l.0_ELSE3_27:
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG3_27:
    jmp l.0_WHILE2_71
    l.1_WHILE2_71:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 40],rax
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    ret

f.mem.Allocator.free:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    je lcmp.290_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.291_END
    lcmp.290_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.291_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,0
    je lcmp.292_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.293_END
    lcmp.292_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.293_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 3],al
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_72
    l.0_IF2_72:
    ret
    l.1_LOG2_72:
    l.1_IF2_72:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.294_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.295_END
    lcmp.294_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.295_END:
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 43]
    cmp rax,QWORD[rsp + 1]
    jg lcmp.296_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.297_END
    lcmp.296_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.297_END:
    sub rsp,1
    mov al,BYTE[rsp + 26]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 35],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_73
    l.0_IF2_73:
    ret
    l.1_LOG2_73:
    l.1_IF2_73:
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_74:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_74
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 73]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 81]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 25]
    cmp rax,QWORD[rsp + 1]
    jg lcmp.298_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.299_END
    lcmp.298_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.299_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 57],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_28
    l.0_IF3_28:
    add rsp,8
    add rsp,8
    ret
    jmp l.1_LOG3_28
    l.1_IF3_28:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    cmp rax,QWORD[rsp + 2]
    jge lcmp.300_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.301_END
    lcmp.300_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.301_END:
    sub rsp,8
    mov rax,QWORD[rsp + 10]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 59]
    cmp rax,QWORD[rsp + 1]
    jl lcmp.302_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.303_END
    lcmp.302_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.303_END:
    sub rsp,1
    mov al,BYTE[rsp + 34]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 35],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF3_28_4
    l.0_ELIF3_28_4:
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],0
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 57]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    cmp rax,QWORD[rsp + 1]
    jle lcmp.304_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.305_END
    lcmp.304_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.305_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 25],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_9
    l.0_IF4_9:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,0
    je lcmp.306_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.307_END
    lcmp.306_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.307_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF5_2
    l.0_IF5_2:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,8
    mov r10,QWORD[rsp + 8]
    add eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 16]
    add DWORD[r10],eax
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG5_2:
    l.1_IF5_2:
    l.1_LOG4_9:
    l.1_IF4_9:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jge lcmp.308_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.309_END
    lcmp.308_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.309_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_10
    l.0_IF4_10:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,0
    je lcmp.310_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.311_END
    lcmp.310_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.311_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF5_3
    l.0_IF5_3:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,8
    mov r10,QWORD[rsp + 8]
    add eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 16]
    add DWORD[r10],eax
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG5_3:
    l.1_IF5_3:
    l.1_LOG4_10:
    l.1_IF4_10:
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    jmp l.1_LOG3_28
    l.1_ELIF3_28_4:
    l.0_ELSE3_28:
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG3_28:
    jmp l.0_WHILE2_74
    l.1_WHILE2_74:
    add rsp,8
    add rsp,8
    ret

f.mem.Allocator.realloc:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.312_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.313_END
    lcmp.312_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.313_END:
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 50]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 51]
    cmp rax,QWORD[rsp + 1]
    jg lcmp.314_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.315_END
    lcmp.314_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.315_END:
    sub rsp,1
    mov al,BYTE[rsp + 26]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 35],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_75
    l.0_IF2_75:
    mov QWORD[rsp + 32],0
    ret
    l.1_LOG2_75:
    l.1_IF2_75:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_76:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_76
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 73]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 81]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 25]
    cmp rax,QWORD[rsp + 1]
    jg lcmp.316_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.317_END
    lcmp.316_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.317_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 57],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_29
    l.0_IF3_29:
    mov QWORD[rsp + 40],0
    add rsp,8
    ret
    jmp l.1_LOG3_29
    l.1_IF3_29:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    cmp rax,QWORD[rsp + 2]
    jge lcmp.318_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.319_END
    lcmp.318_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.319_END:
    sub rsp,8
    mov rax,QWORD[rsp + 10]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 8]
    add eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 51]
    cmp rax,QWORD[rsp + 1]
    jl lcmp.320_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.321_END
    lcmp.320_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.321_END:
    sub rsp,1
    mov al,BYTE[rsp + 26]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 27],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF3_29_5
    l.0_ELIF3_29_5:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,QWORD[rsp + 34]
    jg lcmp.322_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.323_END
    lcmp.322_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.323_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_11
    l.0_IF4_11:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,8
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jg lcmp.324_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.325_END
    lcmp.324_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.325_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF5_4
    l.0_IF5_4:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,0
    mov rax,QWORD[rsp + 40]
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,0
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],eax
    add rsp,8
    add rsp,8
    l.1_LOG5_4:
    l.1_IF5_4:
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    jmp l.1_LOG4_11
    l.1_IF4_11:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,0
    je lcmp.326_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.327_END
    lcmp.326_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.327_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF4_11_1
    l.0_ELIF4_11_1:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,4
    mov rax,0
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    add rax,8
    mov DWORD[rsp + 0],eax
    sub rsp,8
    mov rax,QWORD[rsp + 21]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,4
    mov eax,DWORD[rsp + 12]
    mov r10,QWORD[rsp + 4]
    add eax,DWORD[r10]
    mov DWORD[rsp + 0],eax
    sub rsp,1
    mov rax,0
    mov eax,DWORD[rsp + 1]
    cmp rax,QWORD[rsp + 50]
    jg lcmp.328_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.329_END
    lcmp.328_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.329_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 25],al
    add rsp,1
    add rsp,4
    add rsp,8
    add rsp,4
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF5_5
    l.0_IF5_5:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 48],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jg lcmp.330_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.331_END
    lcmp.330_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.331_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF6_3
    l.0_IF6_3:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,0
    mov rax,QWORD[rsp + 40]
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,0
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],eax
    add rsp,8
    add rsp,8
    jmp l.1_LOG6_3
    l.1_IF6_3:
    l.0_ELSE6_3:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,8
    mov r10,QWORD[rsp + 8]
    add eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 16]
    add DWORD[r10],eax
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG6_3:
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    l.1_LOG5_5:
    l.1_IF5_5:
    l.1_LOG4_11:
    l.1_ELIF4_11_1:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    jmp l.1_LOG3_29
    l.1_ELIF3_29_5:
    l.0_ELSE3_29:
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG3_29:
    jmp l.0_WHILE2_76
    l.1_WHILE2_76:
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 40],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.mem.Allocator.calloc:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    imul QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.mem.Allocator.print:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR11
    call f.io.print
    add rsp,8
    sub rsp,8
    sub rsp,128
    mov QWORD[rsp + 128],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],128
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR12
    sub rsp,8
    mov QWORD[rsp + 0],9
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    add rax,10
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 168]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.hex.get
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    add rax,53
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,124
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    add rax,125
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR13
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],128
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR14
    sub rsp,8
    mov QWORD[rsp + 0],9
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    add rax,10
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 168]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    add rax,53
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,124
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    add rax,125
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR15
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 136]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 160]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_77:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 161]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jge lcmp.332_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.333_END
    lcmp.332_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.333_END:
    sub rsp,8
    mov rax,QWORD[rsp + 170]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 178]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    add rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,QWORD[rsp + 35]
    cmp rax,QWORD[rsp + 1]
    jl lcmp.334_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.335_END
    lcmp.334_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.335_END:
    sub rsp,1
    mov al,BYTE[rsp + 26]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 35],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_77
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],128
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR16
    sub rsp,8
    mov QWORD[rsp + 0],8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 152]
    add rax,9
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.parse.hex.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 152]
    add rax,28
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 152]
    add rax,45
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.hex.get
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    add rax,53
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov eax,124
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 152]
    add rax,125
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR17
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 144]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    jmp l.0_WHILE2_77
    l.1_WHILE2_77:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR18
    call f.io.print
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,128
    ret

f.con.Vector.init:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    mov rax,QWORD[rsp + 32]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    imul QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    ret

f.con.Vector.delete:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    add rsp,8
    ret

f.con.Vector.new:
    sub rsp,40
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],5
    call f.con.Vector.init
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 64 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 64 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 64 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 64 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 64 + 32],rax
    add rsp,40
    ret
    add rsp,40
    ret

f.con.Vector.make:
    sub rsp,40
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.con.Vector.init
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 72 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 72 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 72 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 72 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 72 + 32],rax
    add rsp,40
    ret
    add rsp,40
    ret

f.con.Vector.get:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jl lcmp.336_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.337_END
    lcmp.336_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.337_END:
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 19]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jge lcmp.338_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.339_END
    lcmp.338_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.339_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_78
    l.0_IF2_78:
    mov QWORD[rsp + 24],0
    ret
    l.1_LOG2_78:
    l.1_IF2_78:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov r10,QWORD[rsp + 8]
    imul QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov r10,QWORD[rsp + 24]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    ret

f.con.Vector.set:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jge lcmp.340_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.341_END
    lcmp.340_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.341_END:
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 27]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.342_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.343_END
    lcmp.342_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.343_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_79
    l.0_IF2_79:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov r10,QWORD[rsp + 8]
    imul QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov r10,QWORD[rsp + 24]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_79:
    l.1_IF2_79:
    ret

f.con.Vector.set_c:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jne lcmp.344_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.345_END
    lcmp.344_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.345_END:
    sub rsp,1
    mov rax,QWORD[rsp + 27]
    cmp rax,0
    jge lcmp.346_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.347_END
    lcmp.346_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.347_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    add rax,QWORD[rsp + 20]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 52]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 9]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jle lcmp.348_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.349_END
    lcmp.348_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.349_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 21],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_80
    l.0_IF2_80:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov r10,QWORD[rsp + 8]
    imul QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov r10,QWORD[rsp + 24]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_80:
    l.1_IF2_80:
    ret

f.con.Vector.expand:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jg lcmp.350_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.351_END
    lcmp.350_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.351_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_81
    l.0_IF2_81:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE3_30:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,QWORD[rsp + 2]
    jg lcmp.352_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.353_END
    lcmp.352_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.353_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE3_30
    mov rax,QWORD[rsp + 0]
    mov rbx,2
    mul rbx
    mov QWORD[rsp + 0],rax
    jmp l.0_WHILE3_30
    l.1_WHILE3_30:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_81:
    l.1_IF2_81:
    add rsp,8
    ret

f.con.Vector.shrink:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rdx,0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov rbx,2
    div rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,QWORD[rsp + 10]
    jle lcmp.354_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.355_END
    lcmp.354_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.355_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,5
    jg lcmp.356_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.357_END
    lcmp.356_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.357_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_82
    l.0_IF2_82:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_82:
    l.1_IF2_82:
    add rsp,8
    ret

f.con.Vector.tozero:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    imul QWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    add rsp,8
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    ret

f.con.Vector.clear:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,5
    imul QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],5
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.con.Vector.get_data:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.con.Vector.get_size:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.con.Vector.push:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.con.Vector.expand
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    add QWORD[r10],1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.con.Vector.set
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.con.Vector.pop:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    sub QWORD[r10],1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.con.Vector.shrink
    add rsp,8
    add rsp,8
    ret

f.con.Vector.push_c:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.con.Vector.expand
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    add QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    sub rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.con.Vector.set_c
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.con.Vector.pop_c:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,QWORD[rsp + 18]
    jl lcmp.358_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.359_END
    lcmp.358_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.359_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_83
    l.0_IF2_83:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    l.1_LOG2_83:
    l.1_IF2_83:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    sub QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.con.Vector.shrink
    add rsp,8
    add rsp,8
    ret

f.con.Vector.print:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR19
    call f.io.print
    add rsp,8
    sub rsp,8
    sub rsp,50
    mov QWORD[rsp + 50],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],49
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR20
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR21
    sub rsp,8
    mov QWORD[rsp + 0],10
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    add rax,12
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.hex.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    add rax,30
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    add rax,40
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_31:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 83]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.360_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.361_END
    lcmp.360_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.361_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_31
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 98]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.con.Vector.get
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 82]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],49
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 82]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR22
    sub rsp,8
    mov QWORD[rsp + 0],11
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    add rax,14
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 99]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,1
    je lcmp.362_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.363_END
    lcmp.362_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.363_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_12
    l.0_IF4_12:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 82]
    add rax,18
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    add rsp,8
    jmp l.1_LOG4_12
    l.1_IF4_12:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 99]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,2
    je lcmp.364_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.365_END
    lcmp.364_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.365_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF4_12_2
    l.0_ELIF4_12_2:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,2
    mov r10,QWORD[rsp + 2]
    mov ax,WORD[r10]
    mov WORD[rsp + 0],ax
    mov ax,WORD[rsp + 0]
    mov QWORD[rsp + 18],rax
    add rsp,2
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    add rax,18
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    jmp l.1_LOG4_12
    l.1_ELIF4_12_2:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 99]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,4
    je lcmp.366_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.367_END
    lcmp.366_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.367_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF4_12_3
    l.0_ELIF4_12_3:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,4
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov QWORD[rsp + 20],rax
    add rsp,4
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    add rax,18
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    jmp l.1_LOG4_12
    l.1_ELIF4_12_3:
    l.0_ELSE4_12:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    add rax,18
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    l.1_LOG4_12:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    add rax,48
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR23
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 82]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    add QWORD[rsp + 16],1
    add rsp,8
    add rsp,8
    jmp l.0_FOR3_31
    l.1_FOR3_31:
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR24
    call f.io.print
    add rsp,8
    add rsp,8
    add rsp,50
    ret

f.con.List.init:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    ret

f.con.List.clear:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_32:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.368_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.369_END
    lcmp.368_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.369_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_32
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 24],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    add QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR3_32
    l.1_FOR3_32:
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    add rsp,8
    ret

f.con.List.delete:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.con.List.clear
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    ret

f.con.List.new:
    sub rsp,24
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.con.List.init
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 40 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 40 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 40 + 16],rax
    add rsp,24
    ret
    add rsp,24
    ret

f.con.List.find:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jl lcmp.370_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.371_END
    lcmp.370_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.371_END:
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 19]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jge lcmp.372_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.373_END
    lcmp.372_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.373_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_84
    l.0_IF2_84:
    mov QWORD[rsp + 24],0
    ret
    l.1_LOG2_84:
    l.1_IF2_84:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_FOR3_33:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jg lcmp.374_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.375_END
    lcmp.374_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.375_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_33
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub QWORD[rsp + 16],1
    jmp l.0_FOR3_33
    l.1_FOR3_33:
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.con.List.get:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    jl lcmp.376_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.377_END
    lcmp.376_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.377_END:
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 19]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jge lcmp.378_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.379_END
    lcmp.378_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.379_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,0
    jle lcmp.380_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.381_END
    lcmp.380_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.381_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 21],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_85
    l.0_IF2_85:
    mov QWORD[rsp + 24],0
    ret
    l.1_LOG2_85:
    l.1_IF2_85:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.con.List.find
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 40],rax
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    ret

f.con.List.set:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 26]
    cmp rax,0
    jge lcmp.382_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.383_END
    lcmp.382_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.383_END:
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 35]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.384_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.385_END
    lcmp.384_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.385_END:
    sub rsp,1
    mov al,BYTE[rsp + 10]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_86
    l.0_IF2_86:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.con.List.find
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 16]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_86:
    l.1_IF2_86:
    ret

f.con.List.size:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.con.List.push:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],24
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 16]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov r10,QWORD[rsp + 8]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    add QWORD[r10],1
    add rsp,8
    add rsp,8
    ret

f.con.List.pop:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,0
    jne lcmp.386_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.387_END
    lcmp.386_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.387_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_87
    l.0_IF2_87:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    sub QWORD[r10],1
    add rsp,8
    add rsp,8
    l.1_LOG2_87:
    l.1_IF2_87:
    add rsp,8
    ret

f.con.List.print:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR25
    call f.io.print
    add rsp,8
    sub rsp,8
    sub rsp,70
    mov QWORD[rsp + 70],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 78]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],69
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 86]
    add rax,68
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR26
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 78]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR27
    sub rsp,8
    mov QWORD[rsp + 0],10
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 86]
    add rax,40
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 110]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 78]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_34:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 103]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jl lcmp.388_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.389_END
    lcmp.388_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.389_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_34
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 118]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.con.List.find
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,1
    je lcmp.390_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.391_END
    lcmp.390_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.391_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_13
    l.0_IF4_13:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    jmp l.1_LOG4_13
    l.1_IF4_13:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,2
    je lcmp.392_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.393_END
    lcmp.392_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.393_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF4_13_4
    l.0_ELIF4_13_4:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov ax,WORD[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    jmp l.1_LOG4_13
    l.1_ELIF4_13_4:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,4
    je lcmp.394_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.395_END
    lcmp.394_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.395_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF4_13_5
    l.0_ELIF4_13_5:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov eax,DWORD[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    jmp l.1_LOG4_13
    l.1_ELIF4_13_5:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,8
    je lcmp.396_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.397_END
    lcmp.396_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.397_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF4_13_6
    l.0_ELIF4_13_6:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    l.1_LOG4_13:
    l.1_ELIF4_13_6:
    sub rsp,8
    mov rax,QWORD[rsp + 102]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],32
    sub rsp,8
    mov QWORD[rsp + 0],69
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 102]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR28
    sub rsp,8
    mov QWORD[rsp + 0],11
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 110]
    add rax,14
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 110]
    add rax,18
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 110]
    add rax,38
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 110]
    add rax,68
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR29
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 102]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    add QWORD[rsp + 16],1
    add rsp,8
    add rsp,8
    jmp l.0_FOR3_34
    l.1_FOR3_34:
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR30
    call f.io.print
    add rsp,8
    add rsp,8
    add rsp,70
    ret

f.ios.OStream.init:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],5
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],5
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov r10,QWORD[rsp + 8]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.delete:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,2
    jg lcmp.398_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.399_END
    lcmp.398_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.399_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_88
    l.0_IF2_88:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.close
    add rsp,8
    l.1_LOG2_88:
    l.1_IF2_88:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.new:
    sub rsp,40
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.init
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 64 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 64 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 64 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 64 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 64 + 32],rax
    add rsp,40
    ret
    add rsp,40
    ret

f.ios.OStream.open:
    sub rsp,40
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.sys.open
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ios.OStream.new
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 64 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 64 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 64 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 64 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 64 + 32],rax
    add rsp,40
    ret
    ret

f.ios.OStream.set_pos_start:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.set_pos_rel:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.set_pos_end:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.get:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jge lcmp.400_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.401_END
    lcmp.400_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.401_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_89
    l.0_IF2_89:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_89:
    l.1_IF2_89:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 48],al
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    ret

f.ios.OStream.set_c:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    jne lcmp.402_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.403_END
    lcmp.402_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.403_END:
    sub rsp,1
    mov rax,QWORD[rsp + 27]
    cmp rax,0
    jge lcmp.404_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.405_END
    lcmp.404_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.405_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    add rax,QWORD[rsp + 20]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 52]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 9]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jle lcmp.406_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.407_END
    lcmp.406_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.407_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 21],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_90
    l.0_IF2_90:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_90:
    l.1_IF2_90:
    ret

f.ios.OStream.expand:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    add rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    jg lcmp.408_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.409_END
    lcmp.408_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.409_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_91
    l.0_IF2_91:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE3_35:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,QWORD[rsp + 2]
    jg lcmp.410_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.411_END
    lcmp.410_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.411_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE3_35
    mov rax,QWORD[rsp + 0]
    mov rbx,2
    mul rbx
    mov QWORD[rsp + 0],rax
    jmp l.0_WHILE3_35
    l.1_WHILE3_35:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_91:
    l.1_IF2_91:
    add rsp,8
    ret

f.ios.OStream.shrink:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rdx,0
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov rbx,2
    div rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,QWORD[rsp + 10]
    jle lcmp.412_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.413_END
    lcmp.412_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.413_END:
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,5
    jg lcmp.414_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.415_END
    lcmp.414_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.415_END:
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 11],al
    add rsp,1
    add rsp,1
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_92
    l.0_IF2_92:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 64]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    add rsp,8
    l.1_LOG2_92:
    l.1_IF2_92:
    add rsp,8
    ret

f.ios.OStream.clear:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],5
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],16
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],5
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.push_c:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.expand
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    add QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    sub rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.set_c
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.char:
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    lea rax,BYTE[rsp + 32]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 9]
    mov QWORD[rsp + 17],rax
    ret
    ret

f.ios.OStream.cstr:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.ios.OStream.uint:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 88],rax
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.int:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.parse.int.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 88],rax
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.boolean:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 8],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],8
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov al,BYTE[rsp + 33]
    mov BYTE[rsp + 0],al
    call f.parse.boolean.get
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 41],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.float:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    call f.parse.float.get
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 96]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 96],rax
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.hex:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.parse.hex.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 88],rax
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.oct:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.parse.oct.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 88],rax
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.bin:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.parse.bin.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 72]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 88],rax
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.address:
    sub rsp,8
    sub rsp,48
    mov QWORD[rsp + 48],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],48
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,4
    mov DWORD[rsp + 0],0
    l.0_FOR3_36:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov eax,DWORD[rsp + 2]
    cmp rax,8
    jl lcmp.416_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.417_END
    lcmp.416_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.417_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_36
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 13]
    add eax,DWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 24],al
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,4
    mov eax,DWORD[rsp + 5]
    mov rbx,2
    imul rbx
    mov DWORD[rsp + 0],eax
    sub rsp,8
    mov rax,QWORD[rsp + 73]
    add eax,DWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 30]
    and rax,0xF0
    mov BYTE[rsp + 0],al
    sub rsp,8
    mov al,BYTE[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rcx,8
    shr rax,cl
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 17],rax
    add rsp,8
    add rsp,8
    add rsp,1
    call f.char.to.hex
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,4
    sub rsp,4
    mov eax,DWORD[rsp + 5]
    mov rbx,2
    imul rbx
    mov DWORD[rsp + 0],eax
    sub rsp,8
    mov rax,QWORD[rsp + 73]
    add eax,DWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 38]
    and rax,0xF
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 1],rax
    add rsp,1
    call f.char.to.hex
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,4
    add DWORD[rsp + 1],1
    add rsp,1
    jmp l.0_FOR3_36
    l.1_FOR3_36:
    add rsp,4
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 96]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 80]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 88]
    mov QWORD[rsp + 96],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,48
    ret
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,48
    ret

f.ios.OStream.mem:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov rbx,2
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,4
    mov DWORD[rsp + 0],0
    l.0_FOR3_37:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov eax,DWORD[rsp + 2]
    cmp rax,QWORD[rsp + 30]
    jl lcmp.418_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.419_END
    lcmp.418_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.419_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_37
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 45]
    add eax,DWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 24],al
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,4
    mov eax,DWORD[rsp + 5]
    mov rbx,2
    imul rbx
    mov DWORD[rsp + 0],eax
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    add eax,DWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 30]
    and rax,0xF0
    mov BYTE[rsp + 0],al
    sub rsp,8
    mov al,BYTE[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rcx,8
    shr rax,cl
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 17],rax
    add rsp,8
    add rsp,8
    add rsp,1
    call f.char.to.hex
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,4
    sub rsp,4
    mov eax,DWORD[rsp + 5]
    mov rbx,2
    imul rbx
    mov DWORD[rsp + 0],eax
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    add eax,DWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    sub rsp,8
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 38]
    and rax,0xF
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 1],rax
    add rsp,1
    call f.char.to.hex
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov r10,QWORD[rsp + 1]
    mov BYTE[r10],al
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,4
    add DWORD[rsp + 1],1
    add rsp,1
    jmp l.0_FOR3_37
    l.1_FOR3_37:
    add rsp,4
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],32
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 48],rax
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,8
    ret

f.ios.OStream.flush:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    jg lcmp.420_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.421_END
    lcmp.420_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.421_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_93
    l.0_IF2_93:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],24
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.sys.write
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.clear
    add rsp,8
    l.1_LOG2_93:
    l.1_IF2_93:
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.ios.IStream.init:
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov rax,QWORD[rsp + 16]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov rax,QWORD[rsp + 24]
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],rax
    add rsp,8
    ret

f.ios.IStream.new:
    sub rsp,16
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.init
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 40 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 40 + 8],rax
    add rsp,16
    ret
    add rsp,16
    ret

f.ios.IStream.open:
    sub rsp,16
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.open
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ios.IStream.new
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 40 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 40 + 8],rax
    add rsp,16
    ret
    ret

f.ios.IStream.delete:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 17]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov r10,QWORD[rsp + 1]
    mov rax,QWORD[r10]
    cmp rax,2
    jg lcmp.422_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.423_END
    lcmp.422_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.423_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_94
    l.0_IF2_94:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.close
    add rsp,8
    l.1_LOG2_94:
    l.1_IF2_94:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov QWORD[r10],0
    add rsp,8
    ret

f.ios.IStream.get_size:
    sub rsp,144
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 168]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.fstat
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 160],rax
    add rsp,144
    ret
    add rsp,144
    ret

f.ios.IStream.set_pos_start:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.set_pos_rel:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.set_pos_end:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.sys.lseek
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.line:
    sub rsp,40
    sub rsp,40
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 104]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.con.Vector.new
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 40 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 40 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 40 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 40 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 40 + 32],rax
    add rsp,40
    sub rsp,8
    sub rsp,16
    mov QWORD[rsp + 16],rsp
    sub rsp,1
    mov BYTE[rsp + 0],1
    l.0_WHILE2_95:
    sub rsp,1
    mov al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_95
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],16
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 105]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],15
    call f.sys.read
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 49]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.con.Vector.push_c
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,15
    jl lcmp.424_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.425_END
    lcmp.424_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.425_END:
    sub rsp,8
    mov rax,QWORD[rsp + 35]
    add rax,14
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp rax,10
    je lcmp.426_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.427_END
    lcmp.426_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.427_END:
    sub rsp,1
    mov al,BYTE[rsp + 18]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 19],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_38
    l.0_IF3_38:
    mov BYTE[rsp + 8],0
    l.1_LOG3_38:
    l.1_IF3_38:
    add rsp,8
    jmp l.0_WHILE2_95
    l.1_WHILE2_95:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 57]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.con.Vector.get_size
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 97]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    sub rsp,8
    mov r10,QWORD[rsp + 16]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.alloc
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 81]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.con.Vector.get_data
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 57]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.con.Vector.delete
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 97],rax
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,16
    add rsp,40
    ret
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,16
    add rsp,40
    ret

f.ios.IStream.char:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 9]
    add rax,0
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 16],al
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 25],al
    add rsp,1
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    ret

f.ios.IStream.buff:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 26]
    jl lcmp.428_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.429_END
    lcmp.428_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.429_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_96
    l.0_IF2_96:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    jmp l.1_LOG2_96
    l.1_IF2_96:
    l.0_ELSE2_96:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    l.1_LOG2_96:
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.cstr:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 32],rax
    add rsp,8
    ret
    add rsp,8
    ret

f.ios.IStream.uint:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR31
    call f.cstr.findnot
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 8],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.by
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 44],rax
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.int:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR32
    call f.cstr.findnot
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 8],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.parse.int.by
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 44],rax
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.boolean:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    call f.parse.boolean.by
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 33],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.float:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR33
    call f.cstr.findnot
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 8],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.parse.float.by
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 44],rax
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.hex:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR34
    call f.cstr.findnot
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 8],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.parse.hex.by
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 44],rax
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.oct:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR35
    call f.cstr.findnot
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 8],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.parse.oct.by
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 44],rax
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.bin:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 28]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR36
    call f.cstr.findnot
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 8],eax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    call f.parse.bin.by
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 44],rax
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret
    add rsp,8
    add rsp,4
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.uint_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.int_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.int.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.boolean_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.boolean.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.float_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.float.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.hex_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.hex.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.oct_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.oct.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.ios.IStream.bin_s:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.IStream.line
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    call f.parse.bin.by_s
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 41]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov r10,QWORD[rsp + 8]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    call f.mem.Allocator.free
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 41],al
    add rsp,1
    add rsp,8
    add rsp,8
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.fib:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,1
    jle lcmp.430_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.431_END
    lcmp.430_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.431_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_97
    l.0_IF2_97:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 16],rax
    ret
    l.1_LOG2_97:
    l.1_IF2_97:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.fib
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    sub rax,2
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.fib
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    ret

f.main:
    sub rsp,16
    sub rsp,16
    call f.mem.Allocator.new
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 16 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 16 + 8],rax
    add rsp,16
    sub rsp,40
    sub rsp,40
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 96]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.ios.OStream.new
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 40 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 40 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 40 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 40 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 40 + 32],rax
    add rsp,40
    sub rsp,8
    mov QWORD[rsp + 0],0
    l.0_FOR3_39:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,20
    jl lcmp.432_TRUE
    mov BYTE[rsp + 0],0
    jmp lcmp.433_END
    lcmp.432_TRUE:
    mov BYTE[rsp + 0],1
    lcmp.433_END:
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_FOR3_39
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    call f.fib
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 40]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR37
    call f.ios.OStream.cstr
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.int
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR38
    call f.ios.OStream.cstr
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.int
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR39
    call f.ios.OStream.cstr
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.ios.OStream.flush
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add QWORD[rsp + 8],1
    add rsp,8
    jmp l.0_FOR3_39
    l.1_FOR3_39:
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ios.OStream.delete
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.print
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 56]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.mem.Allocator.delete
    add rsp,8
    mov QWORD[rsp + 64],0
    add rsp,40
    add rsp,16
    ret
    add rsp,40
    add rsp,16
    ret


_start:
    mov rbp,rsp
    sub rsp,8
    call f.main
    mov rdi,QWORD[rsp + 0]
    add rsp,8
    mov rax,60
    syscall
