;|
;| SuperALX by codeleaded
;|

bits 64

section .bss

section .data

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
    mov rdx,QWORD[rsp + 0]
    mov al,BYTE[rdx]
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
    mov rdx,QWORD[rsp + 0]
    mov al,BYTE[rdx]
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
    mov rdx,QWORD[rsp + 0]
    mov BYTE[rdx],al
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
    mov rdx,QWORD[rsp + 0]
    mov al,BYTE[rdx]
    mov rdx,QWORD[rsp + 16]
    mov BYTE[rdx],al
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
    mov rdx,QWORD[rsp + 0]
    mov al,BYTE[rdx]
    mov rdx,QWORD[rsp + 16]
    mov BYTE[rdx],al
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
    mov rdx,QWORD[rsp + 0]
    mov BYTE[rdx],0
    add rsp,8
    add rsp,8
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
    cmp rax,QWORD[rsp + 26]
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
    mov rax,QWORD[rsp + 57]
    add rax,QWORD[rsp + 9]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 65]
    add rax,QWORD[rsp + 25]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov rdx,QWORD[rsp + 17]
    mov al,BYTE[rdx]
    mov rdx,QWORD[rsp + 1]
    cmp BYTE[rdx],al
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
    mov BYTE[rsp + 56],0
    add rsp,8
    add rsp,8
    add rsp,8
    ret
    l.1_LOG4_0:
    l.1_IF4_0:
    jmp l.0_FOR3_1
    l.1_FOR3_1:
    add rsp,8
    mov BYTE[rsp + 56],1
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
    mov rdx,QWORD[rsp + 1]
    mov al,BYTE[rdx]
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
    jmp l.0_FOR3_2
    l.1_FOR3_2:
    add rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 33],rax
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
    mov rdx,QWORD[rsp + 0]
    mov al,BYTE[rdx]
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
    mov rdx,QWORD[rsp + 1]
    cmp BYTE[rdx],al
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
    add QWORD[rsp + 17],1
    jmp l.0_FOR5_0
    l.1_FOR5_0:
    add rsp,8
    add rsp,1
    jmp l.0_FOR3_3
    l.1_FOR3_3:
    add rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 48],rax
    add rsp,8
    add rsp,8
    ret
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
    mov BYTE[rsp + 24],0
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
    mov rax,QWORD[rsp + 18]
    cmp rax,10
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,QWORD[rsp + 19]
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
    mov rax,QWORD[rsp + 24]
    add rax,55
    mov QWORD[rsp + 0],rax
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov BYTE[rsp + 32],al
    add rsp,8
    ret
    l.1_LOG2_6:
    l.1_IF2_6:
    mov BYTE[rsp + 32],0
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
    mov BYTE[rsp + 24],0
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
    mov BYTE[rsp + 24],0
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
    mov QWORD[rsp + 17],0
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
    mov al,BYTE[rsp + 18]
    cmp rax,65
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 19]
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
    mov al,BYTE[rsp + 17]
    sub rax,55
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 18],rax
    add rsp,1
    ret
    l.1_LOG2_11:
    l.1_IF2_11:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 26]
    cmp rax,97
    setge BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 27]
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
    mov al,BYTE[rsp + 25]
    sub rax,87
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov QWORD[rsp + 26],rax
    add rsp,1
    ret
    l.1_LOG2_12:
    l.1_IF2_12:
    mov QWORD[rsp + 33],0
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
    mov QWORD[rsp + 17],0
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
    mov QWORD[rsp + 17],0
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
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 32],rax
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
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 32],rax
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
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 32],rax
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
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 32],rax
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
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_ELIF2_23_1
    l.0_ELIF2_23_1:
    mov rax,2429
    mov QWORD[rsp + 24],rax
    ret
    l.1_LOG2_23:
    l.1_ELIF2_23_1:
    mov rax,0
    mov QWORD[rsp + 32],rax
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
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    call f.math.float.pow
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.main:
    mov QWORD[rsp + 8],0
    ret
    ret


_start:
    sub rsp,8
    call f.main
    mov rdi,QWORD[rsp + 0]
    add rsp,8
    mov rax,60
    syscall
