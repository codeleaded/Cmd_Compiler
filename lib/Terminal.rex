import "../lib/System.rex";
import "../lib/IO.rex";
import "../lib/Memory.rex";
import "../lib/Math.rex";
import "../lib/Parser.rex";

define ICANON       2;
define ECHO         8;
define ISIG         1;
define IEXTEN       32768;
define CSIZE        768;
define CSTOPB       1024;
define CREAD        128;
define PARENB       4096;
define IXON         1024;
define IXOFF        4096;
define IXANY        2048;
define OPOST        1;
define CS8          48;
define ECHONL       64;
define TCIFLUSH     1;
define TCOFLUSH     2;
define TCIOFLUSH    3;
define TCSANOW      0;
define TCSADRAIN    1;
define TCSAFLUSH    2;
define TCGETS       21505;
define TCSETS       21506;
define KDGKBMETA    19298;


namespace esc {
    namespace sgr { // Select Graphic Rendition
        void reset(){
            io::print("\x1B[0m");
        }
        void bold(){
            io::print("\x1B[1m");
        }
        void dimmed(){
            io::print("\x1B[2m");
        }
        void italic(){
            io::print("\x1B[3m");
        }
        void underlined(){
            io::print("\x1B[4m");
        }
        void blink_s(){
            io::print("\x1B[5m");
        }
        void blink_f(){
            io::print("\x1B[6m");
        }
        void inverse(){
            io::print("\x1B[7m");
        }
        void hidden(){
            io::print("\x1B[8m");
        }
        void strikethrough(){
            io::print("\x1B[9m");
        }
        void fracture(){
            io::print("\x1B[20m");
        }
    }
    
    namespace fg {
        namespace norm {
            void black(){
                io::print("\x1B[30m");
            }
            void red(){
                io::print("\x1B[31m");
            }
            void green(){
                io::print("\x1B[32m");
            }
            void yellow(){
                io::print("\x1B[33m");
            }
            void blue(){
                io::print("\x1B[34m");
            }
            void magenta(){
                io::print("\x1B[35m");
            }
            void cyan(){
                io::print("\x1B[36m");
            }
            void white(){
                io::print("\x1B[37m");
            }
        }
        namespace light {
            void black(){
                io::print("\x1B[90m");
            }
            void red(){
                io::print("\x1B[91m");
            }
            void green(){
                io::print("\x1B[92m");
            }
            void yellow(){
                io::print("\x1B[99m");
            }
            void blue(){
                io::print("\x1B[94m");
            }
            void magenta(){
                io::print("\x1B[95m");
            }
            void cyan(){
                io::print("\x1B[96m");
            }
            void white(){
                io::print("\x1B[97m");
            }
        }
        /*
        void c256(u64 n){
            i8[50] cstr;
            ptr::set(cstr,0,50);
            ptr::cpy(cstr,"\x1B[38;5;",7);
            parse::uint::get(cstr+7,n);
            ptr::cpy(cstr+cstr::len(cstr),"m",1);
            io::print(cstr);
            //io::print("\x1B[48;5;<n>m");
        }
        void tcolor(u8 r,u8 g,u8 b){
            i8[50] cstr;
            ptr::set(cstr,0,50);
            ptr::cpy(cstr,"\x1B[38;2;",7);
            parse::uint::get(cstr+7,r);
            ptr::cpy(cstr+cstr::len(cstr),";",1);
            parse::uint::get(cstr+cstr::len(cstr),g);
            ptr::cpy(cstr+cstr::len(cstr),";",1);
            parse::uint::get(cstr+cstr::len(cstr),b);
            ptr::cpy(cstr+cstr::len(cstr),"m",1);
            io::print(cstr);
            //io::print("\x1B[48;2;<r>;<g>;<b>m");
        }
        */
    }
    namespace bg {
        namespace norm {
            void black(){
                io::print("\x1B[40m");
            }
            void red(){
                io::print("\x1B[41m");
            }
            void green(){
                io::print("\x1B[42m");
            }
            void yellow(){
                io::print("\x1B[44m");
            }
            void blue(){
                io::print("\x1B[44m");
            }
            void magenta(){
                io::print("\x1B[45m");
            }
            void cyan(){
                io::print("\x1B[46m");
            }
            void white(){
                io::print("\x1B[47m");
            }
        }
        namespace light {
            void black(){
                io::print("\x1B[100m");
            }
            void red(){
                io::print("\x1B[101m");
            }
            void green(){
                io::print("\x1B[102m");
            }
            void yellow(){
                io::print("\x1B[1010m");
            }
            void blue(){
                io::print("\x1B[104m");
            }
            void magenta(){
                io::print("\x1B[105m");
            }
            void cyan(){
                io::print("\x1B[106m");
            }
            void white(){
                io::print("\x1B[107m");
            }
        }
        /*
        void c256(u64 n){
            i8[50] cstr;
            ptr::set(cstr,0,50);
            ptr::cpy(cstr,"\x1B[48;5;",7);
            parse::uint::get(cstr+7,n);
            ptr::cpy(cstr+cstr::len(cstr),"m",1);
            io::print(cstr);
            //io::print("\x1B[48;5;<n>m");
        }
        void tcolor(u8 r,u8 g,u8 b){
            i8[50] cstr;
            ptr::set(cstr,0,50);
            ptr::cpy(cstr,"\x1B[48;2;",7);
            parse::uint::get(cstr+7,r);
            ptr::cpy(cstr+cstr::len(cstr),";",1);
            parse::uint::get(cstr+cstr::len(cstr),g);
            ptr::cpy(cstr+cstr::len(cstr),";",1);
            parse::uint::get(cstr+cstr::len(cstr),b);
            ptr::cpy(cstr+cstr::len(cstr),"m",1);
            io::print(cstr);
            //io::print("\x1B[48;2;<r>;<g>;<b>m");
        }
        */
    }

    namespace cursor {
        /*
        namespace row {
            void up(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"A",1);
                io::print(cstr);
                //io::print("\x1B[<n>A");
            }
            void down(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"B",1);
                io::print(cstr);
                //io::print("\x1B[<n>B");
            }
            void startafter(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"E",1);
                io::print(cstr);
                //io::print("\x1B[<n>E");
            }
            void startbefore(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"F",1);
                io::print(cstr);
                //io::print("\x1B[<n>F");
            }
        }
        namespace col { // column
            void toright(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"C",1);
                io::print(cstr);
                //io::print("\x1B[<n>C");
            }
            void toleft(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"D",1);
                io::print(cstr);
                //io::print("\x1B[<n>D");
            }
            void current(i64 n){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),n);
                ptr::cpy(cstr+cstr::len(cstr),"G",1);
                io::print(cstr);
                //io::print("\x1B[<n>G");
            }
        }
        */
        namespace pos {
            void set(i64 x,i64 y){
                i8[50] buffer;
                ptr::set(buffer,0,50);
                ptr::cpy(buffer,"\x1B[",2);
                parse::uint::get(buffer + cstr::len(buffer),y);
                ptr::cpy(buffer + cstr::len(buffer),";",1);
                parse::uint::get(buffer + cstr::len(buffer),x);
                ptr::cpy(buffer + cstr::len(buffer),"H",1);
                io::print(buffer);
                //io::print("\x1B[<n>;<m>H");
            }
            void save(){
                io::print("\x1B[s");
            }
            void reset(){
                io::print("\x1B[u");
            }
            void get(){ // Cursor-Position abfragen (Terminal antwortet mit \033[<row>;<col>R)
                io::print("\x1B[6n");
            }
        }
        
        void invisible(){
            io::print("\x1B[?25l");
        }
        void visible(){
            io::print("\x1B[?25h");
        }
    }

    namespace screen {
        namespace del {
            void cursorlineend(){
                io::print("\x1B[K");
            }
            void cursorlinestart(){
                io::print("\x1B[1K");
            }
            void cursorend(){
                io::print("\x1B[1J");
            }

            void row(){
                io::print("\x1B[2K");
            }
            void relative(){
                io::print("\x1B[0J");
            }
            void all(){
                io::print("\x1B[2J");
            }
            void scrollback(){
                io::print("\x1B[3J");
            }
        }
        namespace scroll {
            /*
            void set(i64 x,i64 y){
                i8[50] cstr;
                ptr::set(cstr,0,50);
                ptr::cpy(cstr,"\x1B[",2);
                parse::uint::get(cstr+cstr::len(cstr),y);
                ptr::cpy(cstr+cstr::len(cstr),";",1);
                parse::uint::get(cstr+cstr::len(cstr),x);
                ptr::cpy(cstr+cstr::len(cstr),"r",1);
                io::print(cstr);
                //io::print("\x1B[<n>;<m>r");
            }
            */
            void all(){
                io::print("\x1B[r");
            }
        }
        namespace buff {
            void alternative(){
                io::print("\x1B[?1049h");
            }
            void normal(){
                io::print("\x1B[?1049l");
            }
        }
        namespace wrapping {
            void on(){
                io::print("\x1B[7h");
            }
            void off(){
                io::print("\x1B[7l");
            }
        }
        
        void reset(){
            io::print("\x1B[c");
        }
    }
}

namespace ter {

    struct Terminos[
        pub u32 c_iflag,
        pub u32 c_oflag,
        pub u32 c_cflag,
        pub u32 c_lflag,
        pub u8  c_line,
        pub u8  c_cc0,
        pub u8  c_cc1,
        pub u8  c_cc2,
        pub u8  c_cc3,
        pub u8  c_cc4,
        pub u8  c_cc5,
        pub u8  c_cc6,
        pub u8  c_cc7,
        pub u8  c_cc8,
        pub u8  c_cc9,
        pub u8  c_cc10,
        pub u8  c_cc11,
        pub u8  c_cc12,
        pub u8  c_cc13,
        pub u8  c_cc14,
        pub u8  c_cc15,
        pub u8  c_cc16,
        pub u8  c_cc17,
        pub u8  c_cc18,
        pub u8  c_cc19,
        pub u8  c_cc20,
        pub u8  c_cc21,
        pub u8  c_cc22,
        pub u8  c_cc23,
        pub u8  c_cc24,
        pub u8  c_cc25,
        pub u8  c_cc26,
        pub u8  c_cc27,
        pub u8  c_cc28,
        pub u8  c_cc29,
        pub u8  c_cc30,
        pub u8  c_cc31,
        pub u32 c_ispeed,
        pub u32 c_ospeed
    ];

    i32 tcgetattr(i32 fd,Terminos* t){
        return sys::ioctl(fd,TCGETS,t,0);
    }
    i32 tcsetattr(i32 fd,i32 ap,Terminos* t){
        return sys::ioctl(fd,TCSETS,t,ap);
    }

    /*
    void ioctl(i32 fd,u64 request){
        asm "mov rax,16";
        asm "mov edi," fd;
        asm "mov rsi," request;
        asm "mov rdx,0";
        asm "syscall";
    }

    void cfmakeraw(Terminos* t){
        //t->c_lflag &= ~(ICANON | ECHO | ISIG | IEXTEN);
        //t->c_cc4 = 1;
        //t->c_cc5 = 0;
        t->c_iflag = t->c_iflag & ~(IXON | IXOFF | IXANY);
        t->c_oflag = t->c_oflag & ~OPOST;
        t->c_cflag = t->c_cflag | (CS8);
        t->c_lflag = t->c_lflag & ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);//ISIG
        //t->c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP | INLCR | IGNCR | ICRNL | IXON);
        //t->c_oflag &= ~OPOST;
        //t->c_lflag &= ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
        //t->c_cflag &= ~(CSIZE | PARENB);
        //t->c_cflag |= CS8;
    }
    void tcflush(i32 fd,i32 queue_selector){ // queue_selector -> ( 1 in / 2 out / 3 inout)
        asm "mov rax,16";
        asm "mov edi," fd;
        asm "mov esi," queue_selector;
        asm "mov rdx,0";
        asm "syscall";
    }
    */

    struct Keyboard[
        Terminos oldt,
        Terminos newt,
        i32 bytesread,
        i8 currentkey,
        i8 lastkey,
        i8 upkey,
        i8 downkey
    ];

    impl Keyboard {
        pub void init(Keyboard* self){
            ptr::set((i8*)self,0,120);
            
            i64 oldflags = sys::fcntl(STDIN,F_GETFL,0);
            sys::fcntl(STDIN,F_SETFL,oldflags | O_NONBLOCK);
            
            ter::tcgetattr(STDIN,&(self->oldt));
            ptr::cpy((i8*)(&(self->newt)),(i8*)(&(self->oldt)),56);

            self->newt.c_iflag = self->newt.c_iflag & ~(IXON | IXOFF | IXANY);
            self->newt.c_oflag = self->newt.c_oflag & ~OPOST;
            self->newt.c_cflag = self->newt.c_cflag | (CS8);
            self->newt.c_lflag = self->newt.c_lflag & ~(ECHO | ECHONL | ICANON | ISIG | IEXTEN);
    
            ter::tcsetattr(STDIN,TCSANOW,&(self->newt));
            
            self->bytesread = 0;
            self->currentkey = 0;
            self->lastkey = 0;
        }
        pub Keyboard new(){
            Keyboard kb;
            kb.init();
            return kb;
        }
        pub void delete(Keyboard* self){
            ter::tcsetattr(STDIN,TCSANOW,&(self->oldt));
            i64 oldflags = sys::fcntl(STDIN,F_GETFL,0);
            sys::fcntl(STDIN,F_SETFL,oldflags & ~O_NONBLOCK);
        }

        pub void update(Keyboard* self){
            i8[16] buffer;
            ptr::set(buffer,0,16);
            
            i64 read = sys::read(STDIN,buffer,1);
            self->bytesread = read;
            
            if read>0 {
                //buffer[read] = '\0';
                
                i8 ch = *buffer;
                self->currentkey = ch;
                self->lastkey = ch;
                self->upkey = 0;
                self->downkey = 0;

                if ch==0x1b {
                   read = sys::read(STDIN,buffer,2);
                   i8 bracket = *buffer;
                   if read==2 && bracket==0x5b {
                       i8 arr = *(buffer+1);
                       if arr=='A' {
                           self->upkey = 1;
                       }
                       if arr=='B' {
                           self->downkey = 1;
                       }
                   }
                }
            }else{
                self->currentkey = 0;
            }
        }

        pub i8 getcurrent(Keyboard* self){
            return self->currentkey;
        }
        pub i8 getlast(Keyboard* self){
            return self->lastkey;
        }
        pub i8 getup(Keyboard* self){
            return self->upkey;
        }
        pub i8 getdown(Keyboard* self){
            return self->downkey;
        }
    }
}