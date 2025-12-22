;|
;| SuperALX by codeleaded
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
GLOBAL_STR37: db "Hello ",0
GLOBAL_STR38: db "World: ",0
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
    mov edi,DWORD[rsp + 32]
    mov rsi,QWORD[rsp + 24]
    mov rdx,QWORD[rsp + 16]
    mov rcx,QWORD[rsp + 8]
    syscall
    sub rsp,4
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov DWORD[rsp + 40],eax
    add rsp,4
    ret
    add rsp,4
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
    setne BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,91
    setl BYTE[rsp + 0]
    sub rsp,1
    mov al,BYTE[rsp + 2]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 12]
    cmp rax,97
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 13]
    cmp rax,123
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 10]
    cmp rax,58
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,10
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,10
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,16
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,8
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,2
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,58
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,58
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,71
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,103
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,56
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 11]
    cmp rax,50
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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

f.math.int.min:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,QWORD[rsp + 10]
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_19
    l.0_IF2_19:
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 24],rax
    ret
    l.1_LOG2_19:
    l.1_IF2_19:
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 24],rax
    ret
    ret

f.math.int.max:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,QWORD[rsp + 10]
    setg BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_21
    l.0_IF2_21:
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
    l.1_LOG2_21:
    l.1_IF2_21:
    l.0_WHILE2_22:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_22
    mov rax,QWORD[rsp + 0]
    mov rbx,QWORD[rsp + 24]
    imul rbx
    mov QWORD[rsp + 0],rax
    sub QWORD[rsp + 16],1
    jmp l.0_WHILE2_22
    l.1_WHILE2_22:
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
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_23
    l.0_IF2_23:
    mov rax,4607182418800017408
    mov QWORD[rsp + 16],rax
    ret
    jmp l.1_LOG2_23
    l.1_IF2_23:
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
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF2_23_1
    l.0_ELIF2_23_1:
    mov rax,2429
    mov QWORD[rsp + 16],rax
    ret
    l.1_LOG2_23:
    l.1_ELIF2_23_1:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_24
    l.0_IF2_24:
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
    jmp l.1_LOG2_24
    l.1_IF2_24:
    sub rsp,1
    sub rsp,1
    mov al,BYTE[rsp + 10]
    cmp al,1
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF2_24_2
    l.0_ELIF2_24_2:
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
    jmp l.1_LOG2_24
    l.1_ELIF2_24_2:
    l.0_ELSE2_24:
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
    l.1_LOG2_24:
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
    je l.1_IF2_25
    l.0_IF2_25:
    mov BYTE[rsp + 16],0
    ret
    l.1_LOG2_25:
    l.1_IF2_25:
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
    je l.1_IF2_26
    l.0_IF2_26:
    mov BYTE[rsp + 16],1
    ret
    l.1_LOG2_26:
    l.1_IF2_26:
    mov BYTE[rsp + 16],0
    ret
    ret

f.parse.boolean.by_s:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_27
    l.0_IF2_27:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_27:
    l.1_IF2_27:
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
    je l.1_IF2_28
    l.0_IF2_28:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    mov BYTE[rsp + 24],1
    ret
    l.1_LOG2_28:
    l.1_IF2_28:
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
    je l.1_IF2_29
    l.0_IF2_29:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],1
    add rsp,8
    mov BYTE[rsp + 24],1
    ret
    l.1_LOG2_29:
    l.1_IF2_29:
    mov BYTE[rsp + 24],0
    ret
    ret

f.parse.uint.get:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_30
    l.0_IF2_30:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    jmp l.1_LOG2_30
    l.1_IF2_30:
    l.0_ELSE2_30:
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
    setge BYTE[rsp + 0]
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
    l.1_LOG2_30:
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
    l.0_WHILE2_31:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_31
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    setle BYTE[rsp + 0]
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
    jmp l.0_WHILE2_31
    l.1_WHILE2_31:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_32
    l.0_IF2_32:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_32:
    l.1_IF2_32:
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
    l.0_WHILE2_33:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,0
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_33
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    setle BYTE[rsp + 0]
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
    jmp l.0_WHILE2_33
    l.1_WHILE2_33:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_34
    l.0_IF2_34:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],48
    add rsp,8
    jmp l.1_LOG2_34
    l.1_IF2_34:
    l.0_ELSE2_34:
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    l.1_LOG2_34:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_35
    l.0_IF2_35:
    mov QWORD[rsp + 0],1
    l.1_LOG2_35:
    l.1_IF2_35:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_36:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_36
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    setle BYTE[rsp + 0]
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
    jmp l.0_WHILE2_36
    l.1_WHILE2_36:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_37
    l.0_IF2_37:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG2_37:
    l.1_IF2_37:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_38
    l.0_IF2_38:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_38:
    l.1_IF2_38:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 17],al
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_39
    l.0_IF2_39:
    mov QWORD[rsp + 0],1
    l.1_LOG2_39:
    l.1_IF2_39:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    sub rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_40:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,QWORD[rsp + 10]
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_40
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
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,57
    setle BYTE[rsp + 0]
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
    jmp l.0_WHILE2_40
    l.1_WHILE2_40:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    cmp rax,0
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_41
    l.0_IF2_41:
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG2_41:
    l.1_IF2_41:
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
    setl BYTE[rsp + 0]
    sub rsp,8
    fld QWORD[rsp + 26]
    fistp QWORD[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,0
    sete BYTE[rsp + 0]
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
    je l.1_IF2_42
    l.0_IF2_42:
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
    l.1_LOG2_42:
    l.1_IF2_42:
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
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_43
    l.0_IF2_43:
    sub rsp,8
    fld QWORD[rsp + 40]
    fchs
    fstp QWORD[rsp + 0]
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 40],rax
    add rsp,8
    l.1_LOG2_43:
    l.1_IF2_43:
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
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_44
    l.0_IF2_44:
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
    l.1_LOG2_44:
    l.1_IF2_44:
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
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_45
    l.0_IF2_45:
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
    setne BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    l.1_LOG2_45:
    l.1_IF2_45:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_46
    l.0_IF2_46:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_46:
    l.1_IF2_46:
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
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_47
    l.0_IF2_47:
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
    l.1_LOG2_47:
    l.1_IF2_47:
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
    setne BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 2],al
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_48
    l.0_IF2_48:
    mov BYTE[rsp + 48],0
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG2_48:
    l.1_IF2_48:
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
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_49
    l.0_IF2_49:
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
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    l.1_LOG2_49:
    l.1_IF2_49:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_50
    l.0_IF2_50:
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
    jmp l.1_LOG2_50
    l.1_IF2_50:
    l.0_ELSE2_50:
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
    setge BYTE[rsp + 0]
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
    l.1_LOG2_50:
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
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    je l.1_IF2_51
    l.0_IF2_51:
    mov QWORD[rsp + 16],0
    ret
    l.1_LOG2_51:
    l.1_IF2_51:
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
    l.0_WHILE2_52:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_52
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_52
    l.1_WHILE2_52:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_53
    l.0_IF2_53:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_53:
    l.1_IF2_53:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    je l.1_IF2_54
    l.0_IF2_54:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_54:
    l.1_IF2_54:
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
    l.0_WHILE2_55:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_55
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_55
    l.1_WHILE2_55:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_56
    l.0_IF2_56:
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
    jmp l.1_LOG2_56
    l.1_IF2_56:
    l.0_ELSE2_56:
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
    setge BYTE[rsp + 0]
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
    l.1_LOG2_56:
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
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    je l.1_IF2_57
    l.0_IF2_57:
    mov QWORD[rsp + 16],0
    ret
    l.1_LOG2_57:
    l.1_IF2_57:
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
    l.0_WHILE2_58:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_58
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_58
    l.1_WHILE2_58:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_59
    l.0_IF2_59:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_59:
    l.1_IF2_59:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    je l.1_IF2_60
    l.0_IF2_60:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_60:
    l.1_IF2_60:
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
    l.0_WHILE2_61:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_61
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_61
    l.1_WHILE2_61:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_62
    l.0_IF2_62:
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
    jmp l.1_LOG2_62
    l.1_IF2_62:
    l.0_ELSE2_62:
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
    setge BYTE[rsp + 0]
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
    l.1_LOG2_62:
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
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    je l.1_IF2_63
    l.0_IF2_63:
    mov QWORD[rsp + 16],0
    ret
    l.1_LOG2_63:
    l.1_IF2_63:
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
    l.0_WHILE2_64:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_64
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_64
    l.1_WHILE2_64:
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
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_65
    l.0_IF2_65:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_65:
    l.1_IF2_65:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov al,BYTE[r10]
    cmp eax,48
    setne BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    je l.1_IF2_66
    l.0_IF2_66:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_66:
    l.1_IF2_66:
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
    l.0_WHILE2_67:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 2]
    cmp rax,2
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_67
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_67
    l.1_WHILE2_67:
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
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_68
    l.0_IF2_68:
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
    l.1_LOG2_68:
    l.1_IF2_68:
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
    setne BYTE[rsp + 0]
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
    l.1_LOG2_69:
    l.1_IF2_69:
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
    l.0_WHILE2_70:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_70
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
    setg BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,0
    mov r10,QWORD[rsp + 1]
    mov eax,DWORD[r10]
    cmp rax,QWORD[rsp + 43]
    setge BYTE[rsp + 0]
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
    setle BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setle BYTE[rsp + 0]
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
    jmp l.0_WHILE2_70
    l.1_WHILE2_70:
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
    sete BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,0
    sete BYTE[rsp + 0]
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
    je l.1_IF2_71
    l.0_IF2_71:
    ret
    l.1_LOG2_71:
    l.1_IF2_71:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    je l.1_IF2_72
    l.0_IF2_72:
    ret
    l.1_LOG2_72:
    l.1_IF2_72:
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
    l.0_WHILE2_73:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_73
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
    setg BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setle BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    jmp l.0_WHILE2_73
    l.1_WHILE2_73:
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    je l.1_IF2_74
    l.0_IF2_74:
    mov QWORD[rsp + 32],0
    ret
    l.1_LOG2_74:
    l.1_IF2_74:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_75:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_75
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
    setg BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    jmp l.0_WHILE2_75
    l.1_WHILE2_75:
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
    l.0_WHILE2_76:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 161]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,1
    mov rax,QWORD[rsp + 10]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setge BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    je l.1_WHILE2_76
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
    jmp l.0_WHILE2_76
    l.1_WHILE2_76:
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
    setl BYTE[rsp + 0]
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 19]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setge BYTE[rsp + 0]
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
    je l.1_IF2_77
    l.0_IF2_77:
    mov QWORD[rsp + 24],0
    ret
    l.1_LOG2_77:
    l.1_IF2_77:
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
    setge BYTE[rsp + 0]
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 27]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setl BYTE[rsp + 0]
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
    je l.1_IF2_78
    l.0_IF2_78:
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
    l.1_LOG2_78:
    l.1_IF2_78:
    ret

f.con.Vector.set_c:
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 18]
    cmp rax,0
    setne BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 27]
    cmp rax,0
    setge BYTE[rsp + 0]
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
    setle BYTE[rsp + 0]
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
    je l.1_IF2_79
    l.0_IF2_79:
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
    l.1_LOG2_79:
    l.1_IF2_79:
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
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_80
    l.0_IF2_80:
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
    setg BYTE[rsp + 0]
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
    l.1_LOG2_80:
    l.1_IF2_80:
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
    setle BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,5
    setg BYTE[rsp + 0]
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
    je l.1_IF2_81
    l.0_IF2_81:
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
    l.1_LOG2_81:
    l.1_IF2_81:
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
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_82
    l.0_IF2_82:
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 16],rax
    add rsp,8
    l.1_LOG2_82:
    l.1_IF2_82:
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 19]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setge BYTE[rsp + 0]
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
    je l.1_IF2_83
    l.0_IF2_83:
    mov QWORD[rsp + 24],0
    ret
    l.1_LOG2_83:
    l.1_IF2_83:
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
    setg BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 19]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setge BYTE[rsp + 0]
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
    setle BYTE[rsp + 0]
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
    je l.1_IF2_84
    l.0_IF2_84:
    mov QWORD[rsp + 24],0
    ret
    l.1_LOG2_84:
    l.1_IF2_84:
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
    setge BYTE[rsp + 0]
    sub rsp,8
    mov rax,QWORD[rsp + 42]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,1
    mov rax,QWORD[rsp + 35]
    mov r10,QWORD[rsp + 1]
    cmp rax,QWORD[r10]
    setl BYTE[rsp + 0]
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
    je l.1_IF2_85
    l.0_IF2_85:
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
    l.1_LOG2_85:
    l.1_IF2_85:
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
    setne BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_86
    l.0_IF2_86:
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
    l.1_LOG2_86:
    l.1_IF2_86:
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    mov r10,QWORD[rsp + 0]
    mov rax,QWORD[r10]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.close
    add rsp,8
    l.1_LOG2_87:
    l.1_IF2_87:
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
    setge BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_88
    l.0_IF2_88:
    mov BYTE[rsp + 24],0
    ret
    l.1_LOG2_88:
    l.1_IF2_88:
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
    setne BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 27]
    cmp rax,0
    setge BYTE[rsp + 0]
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
    setle BYTE[rsp + 0]
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
    je l.1_IF2_89
    l.0_IF2_89:
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
    l.1_LOG2_89:
    l.1_IF2_89:
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
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_90
    l.0_IF2_90:
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
    setg BYTE[rsp + 0]
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
    l.1_LOG2_90:
    l.1_IF2_90:
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
    setle BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 11]
    cmp rax,5
    setg BYTE[rsp + 0]
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
    je l.1_IF2_91
    l.0_IF2_91:
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
    l.1_LOG2_91:
    l.1_IF2_91:
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_92
    l.0_IF2_92:
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
    l.1_LOG2_92:
    l.1_IF2_92:
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
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_93
    l.0_IF2_93:
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
    l.1_LOG2_93:
    l.1_IF2_93:
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
    l.0_WHILE2_94:
    sub rsp,1
    mov al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_94
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    jmp l.0_WHILE2_94
    l.1_WHILE2_94:
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
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF2_95
    l.0_IF2_95:
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
    jmp l.1_LOG2_95
    l.1_IF2_95:
    l.0_ELSE2_95:
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
    l.1_LOG2_95:
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
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 24]
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
    mov QWORD[rsp + 0],GLOBAL_STR38
    call f.ios.OStream.cstr
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],69
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
