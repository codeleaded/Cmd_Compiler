;|
;| SuperALX by codeleaded
;|

bits 64

section .bss

section .data
GLOBAL_STR0: db "Hello World!!!",10,0

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

f.main:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR0
    call f.io.print
    add rsp,8
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
