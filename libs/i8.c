#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALX.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALXASM.h"

Token I8_I8_Handler_Ass(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAss(ll,a,b,op,"mov","ASS");
}

Token I8_I8_Handler_Asd(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAss(ll,a,b,op,"add","ASD");
}
Token I8_I8_Handler_Asu(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAss(ll,a,b,op,"sub","ASU");
}
Token I8_I8_Handler_Asm(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAssA(ll,a,b,op,"imul","ASM");
}
Token I8_I8_Handler_Asv(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAssA(ll,a,b,op,"idiv","ASV");
}

Token I8_I8_Handler_Add(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"add","ADD",SuperALX_Function_Add);
}
Token I8_I8_Handler_Sub(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"sub","SUB",SuperALX_Function_Sub);
}
Token I8_I8_Handler_Mul(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteA(ll,a,b,op,"imul","IMUL",SuperALX_Function_Mul);
}
Token I8_I8_Handler_Div(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteA(ll,a,b,op,"idiv","IDIV",SuperALX_Function_Div);
}

Token I8_I8_Handler_Mod(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    SuperALX_Indentation_Appendf(ll,&ll->text,"mov rdx,0");
    return SuperALX_ExecuteAR(ll,a,b,op,"idiv","MOD",SuperALX_Function_Mod);
}

Token I8_Handler_Neg(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return SuperALX_ExecuteSingle(ll,a,op,"neg","NEG",SuperALX_Function_Neg);
}
Token I8_Handler_Inc(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return SuperALX_ExecuteAssSingle(ll,a,op,"inc","INC");
}
Token I8_Handler_Dec(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return SuperALX_ExecuteAssSingle(ll,a,op,"dec","DEC");
}

Token I8_I8_Handler_And(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"and","AND",SuperALX_Function_And);
}
Token I8_I8_Handler_Or(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"or","OR",SuperALX_Function_Or);
}
Token I8_I8_Handler_Xor(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"xor","XOR",SuperALX_Function_Xor);
}
Token I8_Handler_Not(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return SuperALX_ExecuteSingle(ll,a,op,"not","NOT",SuperALX_Function_Not);
}
Token I8_I8_Handler_Equ(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"sete","EQU",SuperALX_Function_Equ);
}
Token I8_I8_Handler_Neq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setne","NEQ",SuperALX_Function_Neq);
}
Token I8_I8_Handler_Les(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setl","LES",SuperALX_Function_Les);
}
Token I8_I8_Handler_Grt(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setg","GRT",SuperALX_Function_Grt);
}
Token I8_I8_Handler_Leq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setle","LEQ",SuperALX_Function_Leq);
}
Token I8_I8_Handler_Grq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setge","GRQ",SuperALX_Function_Grq);
}

Token I8_Handler_Adr(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[I8]: ADR: &%s\n",a->str);
    
    if(a->tt==TOKEN_NUMBER){
        Enviroment_ErrorHandler(&ll->ev,"Adr -> Error: can not get address of const: %s!",a->str);
        return Token_Null();
    }else if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        
        if(SuperALX_DrefType(ll,v->typename)){
            CStr type = CStr_Cpy(v->typename);
            type[CStr_Size(type) - 1] = '*';
            SuperALX_Variable_Build_Decl(ll,stack_name,type);
            CStr_Free(&type);
        }else{
            SuperALX_Variable_Build_Decl(ll,stack_name,I8_TYPE"*");
        }
        
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        SuperALX_AtReg(ll,a,SUPERALX_REG_A_64,"lea");
        SuperALX_IntoSet(ll,&stack_t,SUPERALX_REG_A_64);

        return stack_t;
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Adr: Error -> %s has no address!",a->str);
        return Token_Null();
    }
}

Token I8_Null_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[I8]: CAST: %s\n",a->str);

    String ret = String_New();

    if(a->tt==TOKEN_NUMBER){
        String_AppendNumber(&ret,Number_Parse(a->str));
    }else{
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
            String_Appendf(&ret,"T: %s,S:%d [&:%d,%d]",v->typename,sv->stack,sv->destroy,sv->sizeonstack);
        }else{
            Enviroment_ErrorHandler(&ll->ev,"Cast -> Error!");
            String_Append(&ret,"ERROR");
        }
    }

    CStr out = String_CStr(&ret);
    String_Free(&ret);
    return Token_Move(TOKEN_CONSTSTRING_DOUBLE,out);
}

Token I8_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[I8]: CAST: %s\n",a->str);

    if(op->str==NULL) return I8_Null_Handler_Cast(ll,op,args);
    return Token_Null();
}
Token I8_Handler_Size(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[I8]: SIZE: %s\n",a->str);
    return Token_Move(TOKEN_NUMBER,Number_Get(I8_SIZE));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(I8_TYPE,sizeof(SuperALXVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_NEG,(Token(*)(void*,Token*,Vector*))I8_Handler_Neg),
                OperatorDefiner_New(TOKEN_SUPERALX_INC,(Token(*)(void*,Token*,Vector*))I8_Handler_Inc),
                OperatorDefiner_New(TOKEN_SUPERALX_DEC,(Token(*)(void*,Token*,Vector*))I8_Handler_Dec),
                OperatorDefiner_New(TOKEN_SUPERALX_NOT,(Token(*)(void*,Token*,Vector*))I8_Handler_Not),
                OperatorDefiner_New(TOKEN_SUPERALX_ADR,(Token(*)(void*,Token*,Vector*))I8_Handler_Adr),
                OperatorDefiner_New(TOKEN_CAST,(Token(*)(void*,Token*,Vector*))I8_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,(Token(*)(void*,Token*,Vector*))SuperALX_Init),
                OperatorDefiner_New(TOKEN_SUPERALX_SIZE,(Token(*)(void*,Token*,Vector*))I8_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ I8_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ I16_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ I32_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ I64_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ U8_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ U16_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ U32_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ U64_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_MOD,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Mod),
                OperatorDefiner_New(TOKEN_SUPERALX_AND,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_And),
                OperatorDefiner_New(TOKEN_SUPERALX_OR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Or),
                OperatorDefiner_New(TOKEN_SUPERALX_XOR,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Xor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))I8_I8_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),SuperALX_Destroyer,SuperALX_Cpyer)
    );
}