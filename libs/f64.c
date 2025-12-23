#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALX.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALXASMF.h"

Token F64_F64_Handler_Ass(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAss(ll,a,b,op,"mov","ASS");
}

Token F64_F64_Handler_Asd(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAss(ll,a,b,op,"add","ASD");
}
Token F64_F64_Handler_Asu(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAss(ll,a,b,op,"sub","ASU");
}
Token F64_F64_Handler_Asm(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAssA(ll,a,b,op,"imul","ASM");
}
Token F64_F64_Handler_Asv(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteAssA(ll,a,b,op,"idiv","ASV");
}

Token F64_F64_Handler_Add(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteF(ll,a,b,op,"add","FADD",SuperALX_Function_FAdd);
}
Token F64_F64_Handler_Sub(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteF(ll,a,b,op,"sub","FSUB",SuperALX_Function_FSub);
}
Token F64_F64_Handler_Mul(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteF(ll,a,b,op,"mul","FMUL",SuperALX_Function_FMul);
}
Token F64_F64_Handler_Div(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteF(ll,a,b,op,"div","FDIV",SuperALX_Function_FDiv);
}

Token F64_Handler_Neg(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return SuperALX_ExecuteFSingle(ll,a,op,"fchs","FNEG",SuperALX_Function_FNeg);
}
Token F64_Handler_Inc(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token b = Token_By(TOKEN_FLOAT,"1");
    Token ret = SuperALX_ExecuteFAss(ll,a,&b,op,"add","FINC");
    Token_Free(&b);
    return ret;
}
Token F64_Handler_Dec(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token b = Token_By(TOKEN_FLOAT,"1");
    Token ret = SuperALX_ExecuteFAss(ll,a,&b,op,"sub","FDEC");
    Token_Free(&b);
    return ret;
}

Token F64_F64_Handler_Equ(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteFCmp(ll,a,b,op,"sete","FEQU",SuperALX_Function_FEqu);
}
Token F64_F64_Handler_Neq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteFCmp(ll,a,b,op,"setne","FNEQ",SuperALX_Function_FNeq);
}
Token F64_F64_Handler_Les(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteFCmp(ll,a,b,op,"setl","FLES",SuperALX_Function_FLes);
}
Token F64_F64_Handler_Grt(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteFCmp(ll,a,b,op,"setg","FGRT",SuperALX_Function_FGrt);
}
Token F64_F64_Handler_Leq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteFCmp(ll,a,b,op,"setle","FLEQ",SuperALX_Function_FLeq);
}
Token F64_F64_Handler_Grq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteFCmp(ll,a,b,op,"setge","FGRQ",SuperALX_Function_FGrq);
}

Token F64_Handler_Adr(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(a->tt==TOKEN_FLOAT){
        Enviroment_ErrorHandler(&ll->ev,"Adr -> Error: can not get address of const: %s!",a->str);
        return Token_Null();
    }else if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
        if(SuperALX_DrefType(ll,v->typename)){
            CStr type = CStr_Cpy(v->typename);
            type[CStr_Size(type) - 1] = '*';
            SuperALX_Variable_Build_Decl(ll,stack_name,type);
            CStr_Free(&type);

            SuperALX_AtReg(ll,a,SUPERALX_REG_A_64,"mov");
            SuperALX_IntoSet(ll,&stack_t,SUPERALX_REG_A_64);
        }else{
            SuperALX_Variable_Build_Decl(ll,stack_name,F64_TYPE"*");

            SuperALX_AtReg(ll,a,SUPERALX_REG_A_64,"lea");
            SuperALX_IntoSet(ll,&stack_t,SUPERALX_REG_A_64);
        }

        return stack_t;
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Adr: Error -> %s has no address!",a->str);
        return Token_Null();
    }
}

Token F64_Null_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[F64]: CAST: %s\n",a->str);

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
Token F64_I64_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(a->tt==TOKEN_FLOAT){
        CStr nstr = Number_Get((Number)Double_Parse(a->str,1));
        return Token_Move(TOKEN_NUMBER,nstr);
    }else if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        
        SuperALX_Variable_Build_Decl(ll,stack_name,I64_TYPE);
        
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        SuperALX_AtFPU(ll,a);
        SuperALX_FromFPU(ll,&stack_t);
        return stack_t;
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Cast(f64 -> i64): Error -> %s is from no possible type!",a->str);
        return Token_Null();
    }
}

Token F64_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(op->str==NULL)               return F64_Null_Handler_Cast(ll,op,args);
    if(CStr_Cmp(op->str,I64_TYPE))  return F64_I64_Handler_Cast(ll,op,args);
    return Token_Null();
}
Token F64_Handler_Size(SuperALX* ll,Token* op,Vector* args){
    //Token* a = (Token*)Vector_Get(args,0);
    //printf("[F64]: SIZE: %s\n",a->str);
    return Token_Move(TOKEN_NUMBER,Number_Get(F64_SIZE));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(F64_TYPE,sizeof(SuperALXVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_NEG, (Token(*)(void*,Token*,Vector*))F64_Handler_Neg),
                OperatorDefiner_New(TOKEN_SUPERALX_INC, (Token(*)(void*,Token*,Vector*))F64_Handler_Inc),
                OperatorDefiner_New(TOKEN_SUPERALX_DEC, (Token(*)(void*,Token*,Vector*))F64_Handler_Dec),
                OperatorDefiner_New(TOKEN_SUPERALX_ADR, (Token(*)(void*,Token*,Vector*))F64_Handler_Adr),
                OperatorDefiner_New(TOKEN_CAST,         (Token(*)(void*,Token*,Vector*))F64_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,         (Token(*)(void*,Token*,Vector*))SuperALX_Init),
                OperatorDefiner_New(TOKEN_SUPERALX_SIZE,(Token(*)(void*,Token*,Vector*))F64_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ F64_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ASD, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asd),
                OperatorDefiner_New(TOKEN_SUPERALX_ASU, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asu),
                OperatorDefiner_New(TOKEN_SUPERALX_ASM, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asm),
                OperatorDefiner_New(TOKEN_SUPERALX_ASV, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asv),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_MUL, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Mul),
                OperatorDefiner_New(TOKEN_SUPERALX_DIV, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Div),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),SuperALX_Destroyer,SuperALX_Cpyer)
    );
}