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
GLOBAL_STR19: db 27,"[0m",0
GLOBAL_STR20: db 27,"[1m",0
GLOBAL_STR21: db 27,"[2m",0
GLOBAL_STR22: db 27,"[3m",0
GLOBAL_STR23: db 27,"[4m",0
GLOBAL_STR24: db 27,"[5m",0
GLOBAL_STR25: db 27,"[6m",0
GLOBAL_STR26: db 27,"[7m",0
GLOBAL_STR27: db 27,"[8m",0
GLOBAL_STR28: db 27,"[9m",0
GLOBAL_STR29: db 27,"[20m",0
GLOBAL_STR30: db 27,"[30m",0
GLOBAL_STR31: db 27,"[31m",0
GLOBAL_STR32: db 27,"[32m",0
GLOBAL_STR33: db 27,"[33m",0
GLOBAL_STR34: db 27,"[34m",0
GLOBAL_STR35: db 27,"[35m",0
GLOBAL_STR36: db 27,"[36m",0
GLOBAL_STR37: db 27,"[37m",0
GLOBAL_STR38: db 27,"[90m",0
GLOBAL_STR39: db 27,"[91m",0
GLOBAL_STR40: db 27,"[92m",0
GLOBAL_STR41: db 27,"[99m",0
GLOBAL_STR42: db 27,"[94m",0
GLOBAL_STR43: db 27,"[95m",0
GLOBAL_STR44: db 27,"[96m",0
GLOBAL_STR45: db 27,"[97m",0
GLOBAL_STR46: db 27,"[40m",0
GLOBAL_STR47: db 27,"[41m",0
GLOBAL_STR48: db 27,"[42m",0
GLOBAL_STR49: db 27,"[44m",0
GLOBAL_STR50: db 27,"[44m",0
GLOBAL_STR51: db 27,"[45m",0
GLOBAL_STR52: db 27,"[46m",0
GLOBAL_STR53: db 27,"[47m",0
GLOBAL_STR54: db 27,"[100m",0
GLOBAL_STR55: db 27,"[101m",0
GLOBAL_STR56: db 27,"[102m",0
GLOBAL_STR57: db 27,"[1010m",0
GLOBAL_STR58: db 27,"[104m",0
GLOBAL_STR59: db 27,"[105m",0
GLOBAL_STR60: db 27,"[106m",0
GLOBAL_STR61: db 27,"[107m",0
GLOBAL_STR62: db 27,"[",0
GLOBAL_STR63: db ";",0
GLOBAL_STR64: db "H",0
GLOBAL_STR65: db 27,"[s",0
GLOBAL_STR66: db 27,"[u",0
GLOBAL_STR67: db 27,"[6n",0
GLOBAL_STR68: db 27,"[?25l",0
GLOBAL_STR69: db 27,"[?25h",0
GLOBAL_STR70: db 27,"[K",0
GLOBAL_STR71: db 27,"[1K",0
GLOBAL_STR72: db 27,"[1J",0
GLOBAL_STR73: db 27,"[2K",0
GLOBAL_STR74: db 27,"[0J",0
GLOBAL_STR75: db 27,"[2J",0
GLOBAL_STR76: db 27,"[3J",0
GLOBAL_STR77: db 27,"[r",0
GLOBAL_STR78: db 27,"[?1049h",0
GLOBAL_STR79: db 27,"[?1049l",0
GLOBAL_STR80: db 27,"[7h",0
GLOBAL_STR81: db 27,"[7l",0
GLOBAL_STR82: db 27,"[c",0

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

f.math.int.sign:
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
    setl BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setl BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_37
    l.1_WHILE2_37:
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
    sete BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    jmp l.0_WHILE2_41
    l.1_WHILE2_41:
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
    setl BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    sete BYTE[rsp + 0]
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
    setge BYTE[rsp + 0]
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
    setg BYTE[rsp + 0]
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
    setne BYTE[rsp + 0]
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

f.esc.sgr.reset:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR19
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.bold:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR20
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.dimmed:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR21
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.italic:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR22
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.underlined:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR23
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.blink_s:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR24
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.blink_f:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR25
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.inverse:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR26
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.hidden:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR27
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.strikethrough:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR28
    call f.io.print
    add rsp,8
    ret

f.esc.sgr.fracture:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR29
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.black:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR30
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.red:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR31
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.green:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR32
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.yellow:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR33
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.blue:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR34
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.magenta:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR35
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.cyan:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR36
    call f.io.print
    add rsp,8
    ret

f.esc.fg.norm.white:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR37
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.black:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR38
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.red:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR39
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.green:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR40
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.yellow:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR41
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.blue:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR42
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.magenta:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR43
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.cyan:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR44
    call f.io.print
    add rsp,8
    ret

f.esc.fg.light.white:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR45
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.black:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR46
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.red:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR47
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.green:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR48
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.yellow:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR49
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.blue:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR50
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.magenta:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR51
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.cyan:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR52
    call f.io.print
    add rsp,8
    ret

f.esc.bg.norm.white:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR53
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.black:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR54
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.red:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR55
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.green:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR56
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.yellow:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR57
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.blue:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR58
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.magenta:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR59
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.cyan:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR60
    call f.io.print
    add rsp,8
    ret

f.esc.bg.light.white:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR61
    call f.io.print
    add rsp,8
    ret

f.esc.cursor.pos.set:
    sub rsp,8
    sub rsp,50
    mov QWORD[rsp + 50],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    mov QWORD[rsp + 0],rax
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],50
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR62
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 82]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR63
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 90]
    mov QWORD[rsp + 0],rax
    call f.parse.uint.get
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    mov QWORD[rsp + 0],rax
    call f.cstr.len
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR64
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    mov QWORD[rsp + 0],rax
    call f.io.print
    add rsp,8
    add rsp,8
    add rsp,50
    ret

f.esc.cursor.pos.save:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR65
    call f.io.print
    add rsp,8
    ret

f.esc.cursor.pos.reset:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR66
    call f.io.print
    add rsp,8
    ret

f.esc.cursor.pos.get:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR67
    call f.io.print
    add rsp,8
    ret

f.esc.cursor.invisible:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR68
    call f.io.print
    add rsp,8
    ret

f.esc.cursor.visible:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR69
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.cursorlineend:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR70
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.cursorlinestart:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR71
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.cursorend:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR72
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.row:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR73
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.relative:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR74
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.all:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR75
    call f.io.print
    add rsp,8
    ret

f.esc.screen.del.scrollback:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR76
    call f.io.print
    add rsp,8
    ret

f.esc.screen.scroll.all:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR77
    call f.io.print
    add rsp,8
    ret

f.esc.screen.buff.alternative:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR78
    call f.io.print
    add rsp,8
    ret

f.esc.screen.buff.normal:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR79
    call f.io.print
    add rsp,8
    ret

f.esc.screen.wrapping.on:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR80
    call f.io.print
    add rsp,8
    ret

f.esc.screen.wrapping.off:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR81
    call f.io.print
    add rsp,8
    ret

f.esc.screen.reset:
    sub rsp,8
    mov QWORD[rsp + 0],GLOBAL_STR82
    call f.io.print
    add rsp,8
    ret

f.ter.tcgetattr:
    sub rsp,8
    sub rsp,8
    mov eax,DWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],21505
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.ioctl
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 28],eax
    add rsp,8
    ret
    ret

f.ter.tcsetattr:
    sub rsp,8
    sub rsp,8
    mov eax,DWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],21506
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov eax,DWORD[rsp + 56]
    mov QWORD[rsp + 0],rax
    call f.sys.ioctl
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,0
    mov rax,QWORD[rsp + 0]
    mov DWORD[rsp + 32],eax
    add rsp,8
    ret
    ret

f.ter.Keyboard.init:
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,1
    mov BYTE[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],120
    call f.ptr.set
    add rsp,8
    add rsp,1
    add rsp,8
    sub rsp,8
    sub rsp,4
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],3
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.fcntl
    add rsp,8
    add rsp,8
    add rsp,8
    mov eax,DWORD[rsp + 0]
    mov QWORD[rsp + 4],rax
    add rsp,4
    sub rsp,4
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    or rax,2048
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.fcntl
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,4
    sub rsp,4
    sub rsp,4
    mov DWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.ter.tcgetattr
    add rsp,8
    add rsp,4
    add rsp,4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 32]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,[rsp + 8]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],56
    call f.ptr.cpy
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,4
    mov rax,0
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    and rax,-7169
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov r10,QWORD[rsp + 20]
    mov DWORD[r10],eax
    add rsp,4
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],4
    sub rsp,4
    mov rax,0
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    and rax,-2
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov r10,QWORD[rsp + 20]
    mov DWORD[r10],eax
    add rsp,4
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],8
    sub rsp,4
    mov rax,0
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    or rax,48
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov r10,QWORD[rsp + 20]
    mov DWORD[r10],eax
    add rsp,4
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],12
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],12
    sub rsp,4
    mov rax,0
    mov r10,QWORD[rsp + 4]
    mov eax,DWORD[r10]
    and rax,-32844
    mov DWORD[rsp + 0],eax
    mov eax,DWORD[rsp + 0]
    mov r10,QWORD[rsp + 20]
    mov DWORD[r10],eax
    add rsp,4
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    sub rsp,4
    sub rsp,4
    mov DWORD[rsp + 0],0
    sub rsp,4
    mov DWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 44]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],57
    sub rsp,8
    mov rax,[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.ter.tcsetattr
    add rsp,8
    add rsp,4
    add rsp,4
    add rsp,4
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],114
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],118
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],119
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    add rsp,8
    ret

f.ter.Keyboard.new:
    sub rsp,122
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 16]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ter.Keyboard.init
    add rsp,8
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 130 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 130 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 130 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 130 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 130 + 32],rax
    mov rax,QWORD[rsp + 0 + 40]
    mov QWORD[rsp + 130 + 40],rax
    mov rax,QWORD[rsp + 0 + 48]
    mov QWORD[rsp + 130 + 48],rax
    mov rax,QWORD[rsp + 0 + 56]
    mov QWORD[rsp + 130 + 56],rax
    mov rax,QWORD[rsp + 0 + 64]
    mov QWORD[rsp + 130 + 64],rax
    mov rax,QWORD[rsp + 0 + 72]
    mov QWORD[rsp + 130 + 72],rax
    mov rax,QWORD[rsp + 0 + 80]
    mov QWORD[rsp + 130 + 80],rax
    mov rax,QWORD[rsp + 0 + 88]
    mov QWORD[rsp + 130 + 88],rax
    mov rax,QWORD[rsp + 0 + 96]
    mov QWORD[rsp + 130 + 96],rax
    mov rax,QWORD[rsp + 0 + 104]
    mov QWORD[rsp + 130 + 104],rax
    mov rax,QWORD[rsp + 0 + 112]
    mov QWORD[rsp + 130 + 112],rax
    mov ax,WORD[rsp + 0 + 120]
    mov WORD[rsp + 130 + 120],ax
    add rsp,122
    ret
    add rsp,122
    ret

f.ter.Keyboard.delete:
    sub rsp,4
    sub rsp,4
    mov DWORD[rsp + 0],0
    sub rsp,4
    mov DWORD[rsp + 0],0
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],0
    sub rsp,8
    mov rax,[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 16],rax
    add rsp,8
    add rsp,8
    call f.ter.tcsetattr
    add rsp,8
    add rsp,4
    add rsp,4
    add rsp,4
    sub rsp,8
    sub rsp,4
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],3
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.sys.fcntl
    add rsp,8
    add rsp,8
    add rsp,8
    mov eax,DWORD[rsp + 0]
    mov QWORD[rsp + 4],rax
    add rsp,4
    sub rsp,4
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],4
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 36]
    and rax,-2049
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.sys.fcntl
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,4
    add rsp,8
    ret

f.ter.Keyboard.update:
    sub rsp,8
    sub rsp,16
    mov QWORD[rsp + 16],rsp
    sub rsp,8
    mov rax,QWORD[rsp + 24]
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
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],1
    call f.sys.read
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],114
    mov rax,0
    mov rax,QWORD[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov DWORD[r10],eax
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
    je l.1_IF2_78
    l.0_IF2_78:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 33]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 8],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],118
    mov al,BYTE[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],119
    mov al,BYTE[rsp + 8]
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],al
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],120
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],121
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp rax,0x1b
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_30
    l.0_IF3_30:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov rax,QWORD[rsp + 49]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.sys.read
    add rsp,8
    add rsp,8
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 9],rax
    add rsp,8
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 8],al
    add rsp,8
    sub rsp,1
    sub rsp,1
    mov rax,QWORD[rsp + 4]
    cmp rax,2
    sete BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp rax,0x5b
    sete BYTE[rsp + 0]
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
    je l.1_IF4_12
    l.0_IF4_12:
    sub rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 35]
    add rax,1
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
    cmp eax,65
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF5_6
    l.0_IF5_6:
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],120
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],1
    add rsp,8
    l.1_LOG5_6:
    l.1_IF5_6:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp eax,66
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF5_7
    l.0_IF5_7:
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],121
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],1
    add rsp,8
    l.1_LOG5_7:
    l.1_IF5_7:
    add rsp,1
    l.1_LOG4_12:
    l.1_IF4_12:
    add rsp,1
    l.1_LOG3_30:
    l.1_IF3_30:
    add rsp,1
    jmp l.1_LOG2_78
    l.1_IF2_78:
    l.0_ELSE2_78:
    sub rsp,8
    mov rax,QWORD[rsp + 48]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],118
    mov r10,QWORD[rsp + 0]
    mov BYTE[r10],0
    add rsp,8
    l.1_LOG2_78:
    add rsp,8
    add rsp,8
    add rsp,16
    ret

f.ter.Keyboard.getcurrent:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],118
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    ret

f.ter.Keyboard.getlast:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],119
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    ret

f.ter.Keyboard.getup:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],120
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
    ret

f.ter.Keyboard.getdown:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    add QWORD[rsp + 0],121
    mov r10,QWORD[rsp + 0]
    mov al,BYTE[r10]
    mov BYTE[rsp + 24],al
    add rsp,8
    ret
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

f.World_toScreen:
    mov rdx,0
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov rbx,100
    idiv rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.Screen_toWorld:
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov rbx,100
    imul rbx
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 24],rax
    add rsp,8
    ret
    ret

f.render:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,2
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,3
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,4
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,5
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,6
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,7
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,35
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.renderb:
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 40]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,79
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,1
    mov rax,0
    mov eax,79
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,8
    mov rax,QWORD[rsp + 16]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 24]
    add rax,1
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    sub rsp,1
    mov rax,0
    mov eax,79
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    sub rsp,1
    mov rax,0
    mov eax,79
    mov BYTE[rsp + 0],al
    call f.io.print_char
    add rsp,1
    add rsp,8
    add rsp,8
    ret

f.main:
    sub rsp,122
    sub rsp,122
    call f.ter.Keyboard.new
    mov rax,QWORD[rsp + 0 + 0]
    mov QWORD[rsp + 122 + 0],rax
    mov rax,QWORD[rsp + 0 + 8]
    mov QWORD[rsp + 122 + 8],rax
    mov rax,QWORD[rsp + 0 + 16]
    mov QWORD[rsp + 122 + 16],rax
    mov rax,QWORD[rsp + 0 + 24]
    mov QWORD[rsp + 122 + 24],rax
    mov rax,QWORD[rsp + 0 + 32]
    mov QWORD[rsp + 122 + 32],rax
    mov rax,QWORD[rsp + 0 + 40]
    mov QWORD[rsp + 122 + 40],rax
    mov rax,QWORD[rsp + 0 + 48]
    mov QWORD[rsp + 122 + 48],rax
    mov rax,QWORD[rsp + 0 + 56]
    mov QWORD[rsp + 122 + 56],rax
    mov rax,QWORD[rsp + 0 + 64]
    mov QWORD[rsp + 122 + 64],rax
    mov rax,QWORD[rsp + 0 + 72]
    mov QWORD[rsp + 122 + 72],rax
    mov rax,QWORD[rsp + 0 + 80]
    mov QWORD[rsp + 122 + 80],rax
    mov rax,QWORD[rsp + 0 + 88]
    mov QWORD[rsp + 122 + 88],rax
    mov rax,QWORD[rsp + 0 + 96]
    mov QWORD[rsp + 122 + 96],rax
    mov rax,QWORD[rsp + 0 + 104]
    mov QWORD[rsp + 122 + 104],rax
    mov rax,QWORD[rsp + 0 + 112]
    mov QWORD[rsp + 122 + 112],rax
    mov ax,WORD[rsp + 0 + 120]
    mov WORD[rsp + 122 + 120],ax
    add rsp,122
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],10
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],30
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],150
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],30
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],80
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],30
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],5
    sub rsp,8
    mov QWORD[rsp + 0],2
    sub rsp,1
    mov BYTE[rsp + 0],1
    call f.esc.screen.del.all
    call f.esc.cursor.invisible
    l.0_WHILE2_79:
    sub rsp,1
    mov al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_WHILE2_79
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 81]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ter.Keyboard.update
    add rsp,8
    sub rsp,1
    sub rsp,1
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 83]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ter.Keyboard.getlast
    add rsp,8
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 1],al
    add rsp,1
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp eax,81
    sete BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp eax,113
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
    je l.1_IF3_31
    l.0_IF3_31:
    mov BYTE[rsp + 1],0
    l.1_LOG3_31:
    l.1_IF3_31:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp eax,87
    sete BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp eax,119
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
    je l.1_IF3_32
    l.0_IF3_32:
    sub QWORD[rsp + 50],5
    l.1_LOG3_32:
    l.1_IF3_32:
    sub rsp,1
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 2]
    cmp eax,83
    sete BYTE[rsp + 0]
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 3]
    cmp eax,115
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
    je l.1_IF3_33
    l.0_IF3_33:
    add QWORD[rsp + 50],5
    l.1_LOG3_33:
    l.1_IF3_33:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 84]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ter.Keyboard.getup
    add rsp,8
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 1]
    cmp rax,1
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 2],al
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_34
    l.0_IF3_34:
    sub QWORD[rsp + 34],5
    l.1_LOG3_34:
    l.1_IF3_34:
    sub rsp,1
    sub rsp,1
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 84]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ter.Keyboard.getdown
    add rsp,8
    sub rsp,1
    mov rax,0
    mov al,BYTE[rsp + 1]
    cmp rax,1
    sete BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 2],al
    add rsp,1
    add rsp,1
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_35
    l.0_IF3_35:
    add QWORD[rsp + 34],5
    l.1_LOG3_35:
    l.1_IF3_35:
    mov rax,QWORD[rsp + 10]
    add QWORD[rsp + 26],rax
    mov rax,QWORD[rsp + 2]
    add QWORD[rsp + 18],rax
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 60]
    cmp rax,QWORD[rsp + 1]
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_36
    l.0_IF3_36:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 58],rax
    add rsp,8
    l.1_LOG3_36:
    l.1_IF3_36:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],60
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 60]
    cmp rax,QWORD[rsp + 1]
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_37
    l.0_IF3_37:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],60
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 58],rax
    add rsp,8
    l.1_LOG3_37:
    l.1_IF3_37:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 44]
    cmp rax,QWORD[rsp + 1]
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_38
    l.0_IF3_38:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 42],rax
    add rsp,8
    l.1_LOG3_38:
    l.1_IF3_38:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],60
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 44]
    cmp rax,QWORD[rsp + 1]
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_39
    l.0_IF3_39:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],60
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 42],rax
    add rsp,8
    l.1_LOG3_39:
    l.1_IF3_39:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 36]
    cmp rax,QWORD[rsp + 1]
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_40
    l.0_IF3_40:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],80
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 34],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],30
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 26],rax
    add rsp,8
    mov QWORD[rsp + 10],10
    mov QWORD[rsp + 2],5
    l.1_LOG3_40:
    l.1_IF3_40:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],160
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 36]
    cmp rax,QWORD[rsp + 1]
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_41
    l.0_IF3_41:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],80
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 34],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],30
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 26],rax
    add rsp,8
    mov QWORD[rsp + 10],10
    mov QWORD[rsp + 2],5
    l.1_LOG3_41:
    l.1_IF3_41:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 28]
    cmp rax,QWORD[rsp + 1]
    setl BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_42
    l.0_IF3_42:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 26],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 10]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    call f.math.int.sign
    add rsp,8
    sub rsp,8
    mov rax,1
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 18],rax
    add rsp,8
    add rsp,8
    l.1_LOG3_42:
    l.1_IF3_42:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],60
    call f.Screen_toWorld
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 28]
    cmp rax,QWORD[rsp + 1]
    setg BYTE[rsp + 0]
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 9],al
    add rsp,1
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_43
    l.0_IF3_43:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],60
    call f.Screen_toWorld
    add rsp,8
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 26],rax
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 10]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 10],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    mov QWORD[rsp + 0],rax
    call f.math.int.sign
    add rsp,8
    sub rsp,8
    mov rax,1
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 18],rax
    add rsp,8
    add rsp,8
    l.1_LOG3_43:
    l.1_IF3_43:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 75]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 9]
    cmp rax,QWORD[rsp + 1]
    sete BYTE[rsp + 0]
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 60]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 108]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,QWORD[rsp + 9]
    sete BYTE[rsp + 0]
    sub rsp,1
    mov al,BYTE[rsp + 26]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 43],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_44
    l.0_IF3_44:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 67]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,QWORD[rsp + 9]
    setge BYTE[rsp + 0]
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 92]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 76]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,QWORD[rsp + 9]
    setl BYTE[rsp + 0]
    sub rsp,1
    mov al,BYTE[rsp + 26]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 51],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_13
    l.0_IF4_13:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 74]
    add rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 42],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 18],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    call f.math.int.sign
    add rsp,8
    sub rsp,8
    mov rax,2
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 26],rax
    add rsp,8
    add rsp,8
    l.1_LOG4_13:
    l.1_IF4_13:
    l.1_LOG3_44:
    l.1_IF3_44:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 59]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 9]
    cmp rax,QWORD[rsp + 1]
    sete BYTE[rsp + 0]
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 60]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,1
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 92]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,QWORD[rsp + 9]
    sete BYTE[rsp + 0]
    sub rsp,1
    mov al,BYTE[rsp + 26]
    or al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 43],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF3_45
    l.0_IF3_45:
    sub rsp,1
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    sub rax,2
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 51]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,QWORD[rsp + 9]
    setge BYTE[rsp + 0]
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 76]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 8]
    add rax,8
    mov QWORD[rsp + 0],rax
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 76]
    mov QWORD[rsp + 0],rax
    call f.World_toScreen
    add rsp,8
    sub rsp,1
    mov rax,QWORD[rsp + 1]
    cmp rax,QWORD[rsp + 9]
    setl BYTE[rsp + 0]
    sub rsp,1
    mov al,BYTE[rsp + 26]
    and al,BYTE[rsp + 1]
    mov BYTE[rsp + 0],al
    mov al,BYTE[rsp + 0]
    mov BYTE[rsp + 51],al
    add rsp,1
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    mov al,BYTE[rsp + 0]
    add rsp,1
    cmp al,0
    je l.1_IF4_14
    l.0_IF4_14:
    sub rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.World_toScreen
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 58]
    sub rax,QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 42],rax
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 18]
    neg rax
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 18],rax
    add rsp,8
    sub rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 26]
    mov QWORD[rsp + 0],rax
    call f.math.int.sign
    add rsp,8
    sub rsp,8
    mov rax,2
    imul QWORD[rsp + 8]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    add QWORD[rsp + 26],rax
    add rsp,8
    add rsp,8
    l.1_LOG4_14:
    l.1_IF4_14:
    l.1_LOG3_45:
    l.1_IF3_45:
    call f.esc.screen.del.all
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 66]
    mov QWORD[rsp + 0],rax
    call f.render
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 50]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 50]
    mov QWORD[rsp + 0],rax
    call f.render
    add rsp,8
    add rsp,8
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    sub rsp,8
    mov rax,QWORD[rsp + 34]
    mov QWORD[rsp + 0],rax
    call f.renderb
    add rsp,8
    add rsp,8
    sub rsp,8
    mov QWORD[rsp + 0],2
    call f.time.msleep
    add rsp,8
    add rsp,1
    jmp l.0_WHILE2_79
    l.1_WHILE2_79:
    sub rsp,8
    mov QWORD[rsp + 0],0
    sub rsp,8
    mov QWORD[rsp + 0],0
    call f.esc.cursor.pos.set
    add rsp,8
    add rsp,8
    call f.esc.screen.del.all
    call f.esc.cursor.visible
    sub rsp,8
    sub rsp,8
    lea rax,[rsp + 81]
    mov QWORD[rsp + 0],rax
    mov rax,QWORD[rsp + 0]
    mov QWORD[rsp + 8],rax
    add rsp,8
    call f.ter.Keyboard.delete
    add rsp,8
    mov QWORD[rsp + 195],0
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,122
    ret
    add rsp,1
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,8
    add rsp,122
    ret


_start:
    mov rbp,rsp
    sub rsp,8
    call f.main
    mov rdi,QWORD[rsp + 0]
    add rsp,8
    mov rax,60
    syscall
