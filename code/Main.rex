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
//++,--

*/

//import "../lib/Memory.rex";
//import "../lib/Stream.rex";

import IO;
import Pointer;
import CStr;

struct Human[
    pub i8* name,
    pub i64 age
];

impl Human{
    pub void init(Human* self,i8* name,i64 age){
        self->name = name;
        self->age = age;

        io::print("Human: Init -> \'");
        io::print(self->name);
        io::print("\'\n");
    }
    pub void delete(Human* self){
        io::print("Human: Delete -> \'");
        io::print(self->name);
        io::print("\'\n");
    }
    pub Human new(i8* name,i64 age){
        Human vec;
        vec.init(name,age);
        return vec;
    }
    pub void print(Human* self){
        io::print("Human: Print -> \'");
        io::print(self->name);
        io::print("\'\n");
    }
}

i64 main(){
    Human h = Human::new("Alex",19);
    h.print();
    h.delete();
    return 0;
}