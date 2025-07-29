#ifndef SUPERALXASMF
#define SUPERALXASMF

#include "SuperALXASM.h"


Double SuperALX_Function_FAdd(Double a,Double b){
    return a + b;
}
Double SuperALX_Function_FSub(Double a,Double b){
    return a - b;
}
Double SuperALX_Function_FMul(Double a,Double b){
    return a * b;
}
Double SuperALX_Function_FDiv(Double a,Double b){
    return a / b;
}
Double SuperALX_Function_FNeg(Double a){
    return -a;
}
Double SuperALX_Function_FInc(Double a){
    return ++a;
}
Double SuperALX_Function_FDec(Double a){
    return --a;
}
Boolean SuperALX_Function_FEqu(Double a,Double b){
    return a == b;
}
Boolean SuperALX_Function_FNeq(Double a,Double b){
    return a != b;
}
Boolean SuperALX_Function_FLes(Double a,Double b){
    return a < b;
}
Boolean SuperALX_Function_FGrt(Double a,Double b){
    return a > b;
}
Boolean SuperALX_Function_FLeq(Double a,Double b){
    return a <= b;
}
Boolean SuperALX_Function_FGrq(Double a,Double b){
    return a >= b;
}

void SuperALX_AtFPU(SuperALX* ll,Token* a){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            if(SuperALX_TypeFloat(v->typename)){
                if(SuperALX_DrefType(ll,v->typename)){
                    SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                    
                    CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                    CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fld %s[%s]",typeselector,SUPERALX_REG_D_64);
                    CStr_Free(&typename);
                    CStr_Free(&typeselector);
                }else{
                    CStr location = SuperALX_Location(ll,a->str);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fld %s",location);
                    CStr_Free(&location);
                }
            }else if(SuperALX_TypeInt(v->typename)){
                if(SuperALX_DrefType(ll,v->typename)){
                    SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                    
                    CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                    CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fild %s[%s]",typeselector,SUPERALX_REG_D_64);
                    CStr_Free(&typename);
                    CStr_Free(&typeselector);
                }else{
                    CStr location = SuperALX_Location(ll,a->str);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fild %s",location);
                    CStr_Free(&location);
                }
            }else{
                Enviroment_ErrorHandler(&ll->ev,"AtFPU -> Error: %s is not a int of float!",a->str);
            }
        }else{
            Enviroment_ErrorHandler(&ll->ev,"AtFPU -> Error: %s is not a var!",a->str);
        }
    }else if(a->tt==TOKEN_FLOAT){
        CStr fstr = SuperALX_GetFloatStr(ll,a->str);
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,fstr);
        SuperALX_Indentation_Appendf(ll,&ll->text,"push %s",SUPERALX_REG_A_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"fld %s[%s]",SUPERALX_DREF_64,SUPERALX_REG_SP_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,8",SUPERALX_REG_SP_64);
        CStr_Free(&fstr);
    }else if(a->tt==TOKEN_NUMBER){
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,a->str);
        SuperALX_Indentation_Appendf(ll,&ll->text,"push %s",SUPERALX_REG_A_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"fild %s[%s]",SUPERALX_DREF_64,SUPERALX_REG_SP_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,8",SUPERALX_REG_SP_64);
    }else{
        Enviroment_ErrorHandler(&ll->ev,"AtFPU -> Error: %s is not a var or const!",a->str);
    }
}
void SuperALX_DoFPU(SuperALX* ll,Token* a,CStr inst){
    CStr rinst = SuperALX_FInstOf(ll,a,inst);
    
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            if(SuperALX_TypeFloat(v->typename)){
                if(SuperALX_DrefType(ll,v->typename)){
                    SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                    
                    CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                    CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s]",rinst,typeselector,SUPERALX_REG_D_64);
                    CStr_Free(&typename);
                    CStr_Free(&typeselector);
                }else{
                    CStr location = SuperALX_Location(ll,a->str);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s",rinst,location);
                    CStr_Free(&location);
                }
            }else if(SuperALX_TypeInt(v->typename)){
                if(SuperALX_DrefType(ll,v->typename)){
                    SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                    
                    CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                    CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s]",rinst,typeselector,SUPERALX_REG_D_64);
                    CStr_Free(&typename);
                    CStr_Free(&typeselector);
                }else{
                    CStr location = SuperALX_Location(ll,a->str);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s",rinst,location);
                    CStr_Free(&location);
                }
            }else{
                Enviroment_ErrorHandler(&ll->ev,"DoFPU -> Error: %s is not a int of float!",a->str);
            }
        }else{
            Enviroment_ErrorHandler(&ll->ev,"DoFPU -> Error: %s is not a var!",a->str);
        }
    }else if(a->tt==TOKEN_FLOAT){
        CStr fstr = SuperALX_GetFloatStr(ll,a->str);
        SuperALX_Indentation_Appendf(ll,&ll->text,"sub %s,8",SUPERALX_REG_SP_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s[%s],%s",SUPERALX_DREF_64,SUPERALX_REG_SP_64,fstr);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s]",rinst,SUPERALX_DREF_64,SUPERALX_REG_SP_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,8",SUPERALX_REG_SP_64);
        CStr_Free(&fstr);
    }else if(a->tt==TOKEN_NUMBER){
        SuperALX_Indentation_Appendf(ll,&ll->text,"sub %s,8",SUPERALX_REG_SP_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s[%s],%s",SUPERALX_DREF_64,SUPERALX_REG_SP_64,a->str);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s]",rinst,SUPERALX_DREF_64,SUPERALX_REG_SP_64);
        SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,8",SUPERALX_REG_SP_64);
    }else{
        Enviroment_ErrorHandler(&ll->ev,"DoFPU -> Error: %s is not a var or const!",a->str);
    }
    
    CStr_Free(&rinst);
}
void SuperALX_DoFPUInst(SuperALX* ll,CStr inst){
    SuperALX_Indentation_Appendf(ll,&ll->text,"%s",inst);
}
void SuperALX_FromFPU(SuperALX* ll,Token* a){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            if(SuperALX_TypeFloat(v->typename)){
                if(SuperALX_DrefType(ll,v->typename)){
                    SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                    
                    CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                    CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fstp %s[%s]",typeselector,SUPERALX_REG_D_64);
                    CStr_Free(&typename);
                    CStr_Free(&typeselector);
                }else{
                    CStr location = SuperALX_Location(ll,a->str);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fstp %s",location);
                    CStr_Free(&location);
                }
            }else if(SuperALX_TypeInt(v->typename)){
                if(SuperALX_DrefType(ll,v->typename)){
                    SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                    
                    CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                    CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fistp %s[%s]",typeselector,SUPERALX_REG_D_64);
                    CStr_Free(&typename);
                    CStr_Free(&typeselector);
                }else{
                    CStr location = SuperALX_Location(ll,a->str);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"fistp %s",location);
                    CStr_Free(&location);
                }
            }else{
                Enviroment_ErrorHandler(&ll->ev,"FromFPU -> Error: %s is not a int of float!",a->str);
            }
        }else{
            Enviroment_ErrorHandler(&ll->ev,"FromFPU -> Error: var %s doesn't exist!",a->str);
        }
    }else{
        Enviroment_ErrorHandler(&ll->ev,"FromFPU -> Error: %s is not a var!",a->str);
    }
}
void SuperALX_CmpFPU(SuperALX* ll,Token* a){
    SuperALX_AtFPU(ll,a);
    SuperALX_Indentation_Appendf(ll,&ll->text,"fcomp");
    SuperALX_Indentation_Appendf(ll,&ll->text,"fstsw ax");
    SuperALX_Indentation_Appendf(ll,&ll->text,"sahf");
    SuperALX_Indentation_Appendf(ll,&ll->text,"fstp");
}

Token SuperALX_ExecuteFAss(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper){
    //Enviroment_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    SuperALX_AtFPU(ll,a);
    SuperALX_DoFPU(ll,b,instname);
    SuperALX_FromFPU(ll,a);
    return Token_Cpy(b);
}
Token SuperALX_ExecuteFAssSingle(SuperALX* ll,Token* a,Token* op,CStr instname,CStr instnameupper){
    //Enviroment_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();

    SuperALX_AtRegSingle(ll,a,instname);
    return Token_Cpy(a);
}

Token SuperALX_ExecuteF(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper,Double (*inst)(Double,Double)){
    //Enviroment_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_FLOAT && b->tt==TOKEN_FLOAT){
        char* resstr = Double_Get(inst(Double_Parse(a->str,1),Double_Parse(b->str,1)),8);
        return Token_Move(TOKEN_FLOAT,resstr);
    }else{
        CStr typename_a = SuperALX_VariableType(ll,a);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
        CStr_Free(&typename_a);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);

        SuperALX_AtFPU(ll,a);
        SuperALX_DoFPU(ll,b,instname);
        SuperALX_FromFPU(ll,&stack_t);
        return stack_t;
    }
}
Token SuperALX_ExecuteFSingle(SuperALX* ll,Token* a,Token* op,CStr instname,CStr instnameupper,Double (*inst)(Double)){
    //Enviroment_InfoHandler(&ll->ev,"%s: %s%s",instnameupper,op->str,a->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();

    if(a->tt==TOKEN_FLOAT){
        char* resstr = Double_Get(inst(Double_Parse(a->str,1)),8);
        return Token_Move(TOKEN_FLOAT,resstr);
    }else{
        CStr typename_a = SuperALX_VariableType(ll,a);
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
        CStr_Free(&typename_a);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);

        SuperALX_AtFPU(ll,a);
        SuperALX_DoFPUInst(ll,instname);
        SuperALX_FromFPU(ll,&stack_t);
        return stack_t;
    }
}
Token SuperALX_ExecuteFCmp(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper,Boolean (*inst)(Double,Double)){
    //Enviroment_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_FLOAT && b->tt==TOKEN_NUMBER){
        char* resstr = Boolean_Get(inst(Double_Parse(a->str,1),Number_Parse(b->str)));
        return Token_Move(TOKEN_SUPERALX_BOOLEAN,resstr);
    }else if(a->tt==TOKEN_FLOAT && b->tt==TOKEN_FLOAT){
        char* resstr = Boolean_Get(inst(Double_Parse(a->str,1),Double_Parse(b->str,1)));
        return Token_Move(TOKEN_SUPERALX_BOOLEAN,resstr);
    }else{
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,BOOL_TYPE);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
        SuperALX_AtFPU(ll,a);
        SuperALX_CmpFPU(ll,b);
        SuperALX_CmpAtSet(ll,&stack_t,instname);
        return stack_t;
    }
}

#endif //!SUPERALXASMF