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
GLOBAL_STR11: db "Time: ",0
GLOBAL_STR12: db " |",10,0

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

f.time.nget:
    sub rsp,16
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.clock_gettime
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,1000000000
    imul rbx
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 56],rax
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,16
    ret
    add rsp,16
    ret

f.time.msleep:
    sub rsp,16
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,1000
    idiv rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,1000
    idiv rbx
    mov QWORD[rsp + 0],rdx
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,1000000
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.nanosleep
    add rsp,8
    add rsp,8
    add rsp,16
    ret

f.time.usleep:
    sub rsp,16
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,1000000
    idiv rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,1000000
    idiv rbx
    mov QWORD[rsp + 0],rdx
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,1000
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.nanosleep
    add rsp,8
    add rsp,8
    add rsp,16
    ret

f.time.nsleep:
    sub rsp,16
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,1000000000
    idiv rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov rbx,1000000000
    idiv rbx
    mov QWORD[rsp + 0],rdx
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.nanosleep
    add rsp,8
    add rsp,8
    add rsp,16
    ret

f.main:
    sub rsp,8
    sub rsp,8
    call f.time.nget
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    l.0_WHILE2_68:
    sub rsp,1
    mov BYTE[rsp + 0],1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_68
    sub rsp,8
    sub rsp,8
    call f.time.nget
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR11
    call f.io.print
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    sub rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov rbx,1000000
    div rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.io.print_uint
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR12
    call f.io.print
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],100
    call f.time.msleep
    add rsp,8
    add rsp,8
    jmp l.0_WHILE2_68
    l.1_WHILE2_68:
    mov QWORD[rsp + 16],0
    add rsp,8
    ret
    add rsp,8
    ret


_start:
    mov rbp,rsp
    sub rsp,8
    call f.main
    mov rdi,QWORD[rsp + 0]
    add rsp,8
    mov rax,60
    syscall
