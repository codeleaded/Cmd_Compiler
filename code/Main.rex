/*

Types:      i8,i16,i32,i64 | u8,u16,u32,u64 | bool | void | struct | * | &
Keywords:   if, elif, else, while, for, return

Fehlt:
//- pub AM
//- f32, f64
//- = Operatoren
//- break,continue
//- function pointer
//- casts
- struct constructor: T[...]
//- 1. Error at PP
/stack und struct arrays
++,--

*/

//import "../lib/Memory.rex";
//import "../lib/Stream.rex";
import Memory;
import Stream;

i64 fib(i64 n){
    if n <= 1 {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

i64 main(){
    mem::Allocator alloc = mem::Allocator::new();
    ios::OStream stdout = ios::OStream::new(&alloc,1);
    
    for i64 i = 0,i<20,++i {
        i64 num = fib(i);
        stdout.cstr("Fib(")->int(i)->cstr(") = ")->int(num)->cstr("\n")->flush();
    }
    
    stdout.delete();
    alloc.print();
    alloc.delete();
    return 0;
}