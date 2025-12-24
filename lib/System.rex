
namespace sys {
    i64 read(void* file,i8* cstr,i64 count){
        asm "mov rax,0";
        asm "mov rdi," file;
        asm "mov rsi," cstr;
        asm "mov rdx," count;
        asm "syscall";
        
        i64 status;
        asm "mov " status ",rax";
        return status;
    }
    void write(void* file,i8* cstr,i64 count){
        asm "mov rax,1";
        asm "mov rdi," file;
        asm "mov rsi," cstr;
        asm "mov rdx," count;
        asm "syscall";
    }  
    void* open(i8* filepath,i64 flags){
        asm "mov rax,2";
        asm "mov rdi," filepath;
        asm "mov rsi," flags;
        asm "mov rdx,0o644";
        asm "syscall";
        
        void* ptr;
        asm "mov " ptr ",rax";
        return ptr;
    }        
    void close(void* file){
        asm "mov rax,3";
        asm "mov rdi," file;
        asm "syscall";
    }
    
    struct Stat [
        pub u64 st_dev,
        pub u64 st_ino,
        pub u64 st_nlink,
        pub u32 st_mode,
        pub u32 st_uid,
        pub u32 st_gid,
        u32 padding1,
        pub u64 st_rdev,
        pub u64 st_size,
        pub u64 st_blksize,
        pub u64 st_blocks,
        pub u64 st_atime,
        pub u64 st_atime_nsec,
        pub u64 st_mtime,
        pub u64 st_mtime_nsec,
        pub u64 st_ctime,
        pub u64 st_ctime_nsec,
        u64 padding2,
        u64 padding3,
        u64 padding4
    ];

    void stat(i8* path,Stat* ptr){
        asm "mov rax,4";
        asm "mov rdi," path;
        asm "mov rsi," ptr;
        asm "syscall";
    }
    void fstat(void* file,Stat* ptr){
        asm "mov rax,5";
        asm "mov rdi," file;
        asm "mov rsi," ptr;
        asm "syscall";
    }
    
    struct Pollfd [
        pub i32 fd,     // Der File Descriptor
        pub i16 events, // Die Ereignisse, auf die du überwachen möchtest (z.B. POLLIN)
        pub i16 revents // Die Ereignisse, die tatsächlich eingetreten sind
    ];

    i32 poll(Pollfd* fds,i32 nfds,i32 timeout){
        asm "mov rax,7";
        asm "mov rdi," fds;
        asm "mov esi," nfds;
        asm "mov edx," timeout;
        asm "syscall";

        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    
    void lseek(void* file,i64 offset,u64 flags){
        asm "mov rax,8";
        asm "mov rdi," file;
        asm "mov rsi," offset;
        asm "mov rdx," flags;
        asm "syscall";
    }

    void* mmap(i64 size){// mmap syscall
        asm "mov rax,9";
        asm "mov rdi,0";
        asm "mov rsi," size;
        asm "mov rdx,3";
        asm "mov r10,0x22";//34h
        asm "mov r8,0";//-1
        asm "mov r9,0";
        asm "syscall";
        
        void* ptr;
        asm "mov " ptr ",rax";
        return ptr;
    }
    void munmap(void* ptr,i64 size){// munmap syscall
        asm "mov rax,11";
        asm "mov rdi," ptr;
        asm "mov rsi," size;
        asm "syscall";
    }
    void* brk(i64 size){// brk syscall
        asm "mov rax,12";
        asm "mov rdi,0";
        asm "syscall";
        
        void* ptr;
        asm "mov " ptr ",rax";
        asm "mov rdi,rax";
        asm "add rdi," size;
        asm "mov rax,12";
        asm "syscall";
        return ptr;
    }

    i64 rt_sigaction(i64 signal,void* new_action,void* old_action,u64 sigsize){
        asm "mov rax,13";
        asm "mov rdi," signal; 
        asm "mov rsi," new_action;
        asm "mov rdx," old_action;
        asm "mov rcx," sigsize;
        asm "syscall";

        i64 code;
        asm "mov " code ",rax";
        return code;
    }

    i64 ioctl(i64 fd,i64 cmd,void* t,i64 ap){
        asm "mov rax,16";
        asm "mov rdi," fd;
        asm "mov rsi," cmd;
        asm "mov rdx," t;
        asm "mov rcx," ap;
        asm "syscall";
        
        i64 code;
        asm "mov " code ",rax";
        return code;
    }
    
    void pause(){
        asm "mov rax,34";
        asm "syscall";
    }
    
    struct Timespec [
        pub i64 tv_sec, // Sekunden
        pub i64 tv_nsec // Nanosekunden (0 - 999999999)
    ];
    
    void nanosleep(Timespec* tsp1,Timespec* tsp2){
        asm "mov rax,35";
        asm "mov rdi," tsp1;
        asm "mov rsi," tsp2;
        asm "syscall";
    }
    
    i64 getpid(){
        asm "mov rax,39";
        asm "syscall";
        
        i64 pid;
        asm "mov " pid ",rax";
        return pid;
    }

    /*
    struct Sockaddr[
        u16     sin_family,
        u16     sin_port,
        u32     sin_addr,
        u64     padd
    ];

    impl Sockaddr{
        pub void init(Sockaddr* self,u16 port_c,u32 ip_c){
            self->sin_family = (u16)2;       // AF_INET (IPv4)
            self->sin_port = port_c;    // Port (Netzwerk-Byte-Reihenfolge)
            self->sin_addr = ip_c;      // IP   (Netzwerk-Byte-Reihenfolge)
            self->padd = (u64)0;
        }
        pub Sockaddr new(u16 port,u8 a1,u8 a2,u8 a3,u8 a4){
            Sockaddr addr;
            u16 port_c = (port >> 8) | (port << 8);
            u32 ip_c = ((u32)a4 << 24) | ((u32)a3 << 16) | ((u32)a2 << 8) | (u32)a1;
            addr.init(port_c,ip_c);
            return addr;
        }
    }

    void* socket(u64 addrfam,u64 socktype,u64 protocol){
        asm "mov rax,41";
        asm "mov rdi," addrfam;
        asm "mov rsi," socktype;
        asm "mov rdx," protocol;
        asm "syscall";
        
        void* sd;
        asm "mov " sd ",rax";
        return sd;
    }
    i32 bind(void* sd,Sockaddr* socketptr,u64 socketlen){
        asm "mov rax,49";
        asm "mov rdi," sd;
        asm "mov rsi," socketptr;
        asm "mov rdx," socketlen;
        asm "syscall";
        
        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    i32 listen(void* sd,u64 backlog){
        asm "mov rax,50";
        asm "mov rdi," sd;
        asm "mov rsi," backlog;
        asm "syscall";
        
        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    void* accept(void* sd,Sockaddr* socketptr,u64* socketlen){
        asm "mov rax,43";
        asm "mov rdi," sd;
        asm "mov rsi," socketptr;
        asm "mov rdx," socketlen;
        asm "syscall";
        
        void* od;
        asm "mov " od ",rax";
        return od;
    }
    i32 connect(void* sd,Sockaddr* addr,u64 len){
        asm "mov rax,42";
        asm "mov rdi," sd;
        asm "mov rsi," addr;
        asm "mov rdx," len;
        asm "syscall";

        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    i32 send(void* sd,i8* buff,u64 len,u64 flags){
        asm "mov rax,44";
        asm "mov rdi," sd;
        asm "mov rsi," buff;
        asm "mov rdx," len;
        asm "mov r10," flags;
        asm "syscall";

        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    i32 recv(void* sd,i8* buff,u64 len,u64 flags){
        asm "mov rax,45";
        asm "mov rdi," sd;
        asm "mov rsi," buff;
        asm "mov rdx," len;
        asm "mov r10," flags;
        asm "syscall";

        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    */

    i32 shutdown(void* sd,i64 flag){
        asm "mov rax,48";
        asm "mov rdi," sd;
        asm "mov rsi," flag;
        asm "syscall";
        
        i32 status;
        asm "mov " status ",eax";
        return status;
    }
    i32 setsockopt(void* sd,i64 level,i64 optname,void* optval,u64 optlen){
        asm "mov rax,54";
        asm "mov rdi," sd;
        asm "mov rsi," level;
        asm "mov rdx," optname;
        asm "mov r10," optval;
        asm "mov r8," optlen;
        asm "syscall";
        
        i32 status;
        asm "mov " status ",eax";
        return status;
    }

    i64 clone(u64 flags,void* child_stack,i32* parent_tid,i32* child_tid,void* args){//u64 flags,void* child_stack,i32* parent_tid,i32* child_tid,void* args       void* func,void* child_stack,u64 flags,void* args
        //asm "mov rax,56";
        //asm "mov rsi," func;
        //asm "mov rdx," child_stack;
        //asm "mov r10," flags;          //0x11 CLONE_VM | CLONE_FS | CLONE_FILES
        //asm "mov r8," args; 
        //asm "syscall";
        
        asm "mov rax,56";
        asm "mov rdi," flags;           //0x11 CLONE_VM | CLONE_FS | CLONE_FILES
        asm "mov rsi," child_stack;
        asm "mov rdx," parent_tid;
        asm "mov r10," child_tid;          
        asm "mov r8,0"; 
        asm "syscall";

        //asm "mov rax,56";
        //asm "mov rdi," child_stack;           //0x11 CLONE_VM | CLONE_FS | CLONE_FILES
        //asm "mov rsi," func;
        //asm "mov rdx,0";
        //asm "mov rcx,0";
        //asm "mov r8, " flags;
        //asm "mov r9,0";
        //asm "syscall";
        
        i64 pid;
        asm "mov " pid ",rax";
        return pid;
    }
    i64 fork(){
        asm "mov rax,57";
        asm "syscall";
        
        i64 pid;
        asm "mov " pid ",rax";
        return pid;
    }
    i64 execve(i8* path,i8** argv,i8** envp){
        asm "mov rax,59";
        asm "mov rdi," path;
        asm "mov rsi," argv;
        asm "mov rdx," envp;
        asm "syscall";
        
        i64 status;
        asm "mov " status ",rax";
        return status;
    }
    void exit(i32 exit){
        asm "mov rax,60";
        asm "mov edi," exit;
        asm "syscall";
    }
    i64 waitpid(i64 pid,i32* status,i32 options){
        asm "mov rax,61";
        asm "mov rdi," pid;
        asm "mov rsi," status;
        asm "mov edx," options;
        asm "syscall";

        i64 status;
        asm "mov " status ",rax";
        return status;
    }
    i32 kill(i64 pid,i64 flags){ // 0 -> success, <0 -> Error
        asm "mov rax,62";
        asm "mov rdi," pid;
        asm "mov rsi," flags;//SANFT: 15 
        asm "syscall";

        i32 status;
        asm "mov " status ",eax";
        return status;
    }

    i32 fcntl(i64 fd,i64 cmd,i64 flags){ // 0 -> success, <0 -> Error
        asm "mov rax,72";
        asm "mov rdi," fd;
        asm "mov rsi," cmd;
        asm "mov rdx," flags;
        asm "syscall";

        i32 status;
        asm "mov " status ",eax";
        return status;
    }

    i64 rt_sigqueueinfo(i64 pid,i64 signal,void* value){
        asm "mov rax,129";
        asm "mov rdi," pid; 
        asm "mov rsi," signal;
        asm "mov rdx," value;
        asm "syscall";

        i64 code;
        asm "mov " code ",rax";
        return code;
    }

    void clock_gettime(i64 clock_id,Timespec* tsp){
        asm "mov rax,228";
        asm "mov rdi," clock_id;
        asm "mov rsi," tsp;
        asm "syscall";
    }

    i64 select(i64 pid){
        asm "mov rax,323"; //; sys_select (Systemaufrufnummer)
        asm "mov rdi,1";   //; Maximaler Dateideskriptor + 1 (in diesem Fall 1, da wir nur einen überwachen)
        asm "mov rsi," pid; //; Pointer auf den Read Set (File Descriptors)
        asm "mov rdx,0";    //; Timeout auf NULL setzen (unbegrenzt warten)
        asm "syscall";      //; sys_select

        i64 status;
        asm "mov " status ",rax";
        return status;
    }
}
