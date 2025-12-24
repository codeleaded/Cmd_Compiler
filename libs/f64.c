#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/System/Static/Library/RexLang.h"
#include "/home/codeleaded/System/Static/Library/RexLangASMF.h"

Token F64_F64_Handler_Ass(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteAss(ll,a,b,op,"mov","ASS");
}

Token F64_F64_Handler_Asd(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteAss(ll,a,b,op,"add","ASD");
}
Token F64_F64_Handler_Asu(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteAss(ll,a,b,op,"sub","ASU");
}
Token F64_F64_Handler_Asm(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteAssA(ll,a,b,op,"imul","ASM");
}
Token F64_F64_Handler_Asv(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteAssA(ll,a,b,op,"idiv","ASV");
}

Token F64_F64_Handler_Add(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteF(ll,a,b,op,"add","FADD",RexLang_Function_FAdd);
}
Token F64_F64_Handler_Sub(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteF(ll,a,b,op,"sub","FSUB",RexLang_Function_FSub);
}
Token F64_F64_Handler_Mul(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteF(ll,a,b,op,"mul","FMUL",RexLang_Function_FMul);
}
Token F64_F64_Handler_Div(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return RexLang_ExecuteF(ll,a,b,op,"div","FDIV",RexLang_Function_FDiv);
}

Token F64_Handler_Neg(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return RexLang_ExecuteFSingle(ll,a,op,"fchs","FNEG",RexLang_Function_FNeg);
}
Token F64_Handler_Inc(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token b = Token_By(TOKEN_FLOAT,"1");
    Token ret = RexLang_ExecuteFAss(ll,a,&b,op,"add","FINC");
    Token_Free(&b);
    return ret;
}
Token F64_Handler_Dec(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token b = Token_By(TOKEN_FLOAT,"1");
    Token ret = RexLang_ExecuteFAss(ll,a,&b,op,"sub","FDEC");
    Token_Free(&b);
    return ret;
}

Token F64_F64_Handler_Equ(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //return RexLang_ExecuteFCmp(ll,a,b,op,"sete","FEQU",RexLang_Function_FEqu);
    return RexLang_ExecuteFJmp(ll,a,b,op,"je","FEQU",RexLang_Function_FEqu);
}
Token F64_F64_Handler_Neq(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //return RexLang_ExecuteFCmp(ll,a,b,op,"setne","FNEQ",RexLang_Function_FNeq);
    return RexLang_ExecuteFJmp(ll,a,b,op,"jne","FNEQ",RexLang_Function_FNeq);
}
Token F64_F64_Handler_Les(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //return RexLang_ExecuteFCmp(ll,a,b,op,"setl","FLES",RexLang_Function_FLes);
    return RexLang_ExecuteFJmp(ll,a,b,op,"jl","FLES",RexLang_Function_FLes);
}
Token F64_F64_Handler_Grt(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //return RexLang_ExecuteFCmp(ll,a,b,op,"setg","FGRT",RexLang_Function_FGrt);
    return RexLang_ExecuteFJmp(ll,a,b,op,"jg","FGRT",RexLang_Function_FGrt);
}
Token F64_F64_Handler_Leq(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //return RexLang_ExecuteFCmp(ll,a,b,op,"setle","FLEQ",RexLang_Function_FLeq);
    return RexLang_ExecuteFJmp(ll,a,b,op,"jle","FLEQ",RexLang_Function_FLeq);
}
Token F64_F64_Handler_Grq(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //return RexLang_ExecuteFCmp(ll,a,b,op,"setge","FGRQ",RexLang_Function_FGrq);
    return RexLang_ExecuteFJmp(ll,a,b,op,"jge","FGRQ",RexLang_Function_FGrq);
}

Token F64_Handler_Adr(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(a->tt==TOKEN_FLOAT){
        Environment_ErrorHandler(&ll->ev,"Adr -> Error: can not get address of const: %s!",a->str);
        return Token_Null();
    }else if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr stack_name = RexLang_Variablename_Next(ll,".STACK",6);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
        if(RexLang_DrefType(ll,v->typename)){
            CStr type = CStr_Cpy(v->typename);
            type[CStr_Size(type) - 1] = '*';
            RexLang_Variable_Build_Decl(ll,stack_name,type);
            CStr_Free(&type);

            RexLang_AtReg(ll,a,RexLang_REG_A_64,"mov");
            RexLang_IntoSet(ll,&stack_t,RexLang_REG_A_64);
        }else{
            RexLang_Variable_Build_Decl(ll,stack_name,F64_TYPE"*");

            RexLang_AtReg(ll,a,RexLang_REG_A_64,"lea");
            RexLang_IntoSet(ll,&stack_t,RexLang_REG_A_64);
        }

        return stack_t;
    }else{
        Environment_ErrorHandler(&ll->ev,"Adr: Error -> %s has no address!",a->str);
        return Token_Null();
    }
}

Token F64_Null_Handler_Cast(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[F64]: CAST: %s\n",a->str);

    String ret = String_New();

    if(a->tt==TOKEN_NUMBER){
        String_AppendNumber(&ret,Number_Parse(a->str));
    }else{
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            RexLangVariable* sv = (RexLangVariable*)Variable_Data(v);
            String_Appendf(&ret,"T: %s,S:%d [&:%d,%d]",v->typename,sv->stack,sv->destroy,sv->sizeonstack);
        }else{
            Environment_ErrorHandler(&ll->ev,"Cast -> Error!");
            String_Append(&ret,"ERROR");
        }
    }

    CStr out = String_CStr(&ret);
    String_Free(&ret);
    return Token_Move(TOKEN_CONSTSTRING_DOUBLE,out);
}
Token F64_I64_Handler_Cast(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(a->tt==TOKEN_FLOAT){
        CStr nstr = Number_Get((Number)Double_Parse(a->str,1));
        return Token_Move(TOKEN_NUMBER,nstr);
    }else if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr stack_name = RexLang_Variablename_Next(ll,".STACK",6);
        
        RexLang_Variable_Build_Decl(ll,stack_name,I64_TYPE);
        
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        RexLang_AtFPU(ll,a);
        RexLang_FromFPU(ll,&stack_t);
        return stack_t;
    }else{
        Environment_ErrorHandler(&ll->ev,"Cast(f64 -> i64): Error -> %s is from no possible type!",a->str);
        return Token_Null();
    }
}

Token F64_Handler_Cast(RexLang* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(op->str==NULL)               return F64_Null_Handler_Cast(ll,op,args);
    if(CStr_Cmp(op->str,I64_TYPE))  return F64_I64_Handler_Cast(ll,op,args);
    return Token_Null();
}
Token F64_Handler_Size(RexLang* ll,Token* op,Vector* args){
    //Token* a = (Token*)Vector_Get(args,0);
    //printf("[F64]: SIZE: %s\n",a->str);
    return Token_Move(TOKEN_NUMBER,Number_Get(F64_SIZE));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(F64_TYPE,sizeof(RexLangVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_RexLang_NEG, (Token(*)(void*,Token*,Vector*))F64_Handler_Neg),
                OperatorDefiner_New(TOKEN_RexLang_INC, (Token(*)(void*,Token*,Vector*))F64_Handler_Inc),
                OperatorDefiner_New(TOKEN_RexLang_DEC, (Token(*)(void*,Token*,Vector*))F64_Handler_Dec),
                OperatorDefiner_New(TOKEN_RexLang_ADR, (Token(*)(void*,Token*,Vector*))F64_Handler_Adr),
                OperatorDefiner_New(TOKEN_CAST,         (Token(*)(void*,Token*,Vector*))F64_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,         (Token(*)(void*,Token*,Vector*))RexLang_Init),
                OperatorDefiner_New(TOKEN_RexLang_SIZE,(Token(*)(void*,Token*,Vector*))F64_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ F64_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_RexLang_ASS, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Ass),
                OperatorDefiner_New(TOKEN_RexLang_ASD, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asd),
                OperatorDefiner_New(TOKEN_RexLang_ASU, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asu),
                OperatorDefiner_New(TOKEN_RexLang_ASM, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asm),
                OperatorDefiner_New(TOKEN_RexLang_ASV, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Asv),
                OperatorDefiner_New(TOKEN_RexLang_ADD, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Add),
                OperatorDefiner_New(TOKEN_RexLang_SUB, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Sub),
                OperatorDefiner_New(TOKEN_RexLang_MUL, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Mul),
                OperatorDefiner_New(TOKEN_RexLang_DIV, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Div),
                OperatorDefiner_New(TOKEN_RexLang_EQU, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Equ),
                OperatorDefiner_New(TOKEN_RexLang_NEQ, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Neq),
                OperatorDefiner_New(TOKEN_RexLang_LES, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Les),
                OperatorDefiner_New(TOKEN_RexLang_GRT, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Grt),
                OperatorDefiner_New(TOKEN_RexLang_LEQ, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Leq),
                OperatorDefiner_New(TOKEN_RexLang_GRQ, (Token(*)(void*,Token*,Vector*))F64_F64_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),RexLang_Destroyer,RexLang_Cpyer)
    );
}