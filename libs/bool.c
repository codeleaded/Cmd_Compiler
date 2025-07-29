#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALX.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALXASM.h"

Token Bool_Bool_Handler_Ass(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);

    //printf("[Bool]: ASS: %s = %s\n",a->str,b->str);

    if(b->tt==TOKEN_NUMBER){
        SuperALX_IntoSet(ll,a,b->str);
    }else if(b->tt==TOKEN_SUPERALX_BOOLEAN){
        CStr value = Number_Get(Boolean_Parse(b->str));
        SuperALX_IntoSet(ll,a,value);
        CStr_Free(&value);
    }else if(b->tt==TOKEN_STRING){
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        SuperALX_IntoReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_A]);
        SuperALX_IntoSet(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
    }else{
        printf("[Bool]: Ass: Error -> %s has no bool/i64 type!\n",b->str);
        return Token_Null();
    }
    return Token_Cpy(a);
}
Token Bool_Bool_Handler_Lnd(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"and","LND",SuperALX_Function_And);
}
Token Bool_Bool_Handler_Lor(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"or","LOR",SuperALX_Function_Or);
}
Token Bool_Handler_Lot(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    return SuperALX_ExecuteSingle(ll,a,op,"not","LOT",SuperALX_Function_Not);
}
Token Bool_Bool_Handler_Equ(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"sete","EQU",SuperALX_Function_Equ);
}
Token Bool_Bool_Handler_Neq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setne","NEQ",SuperALX_Function_Neq);
}

Token Bool_Handler_Adr(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[Bool]: ADR: &%s\n",a->str);
    
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
            SuperALX_Variable_Build_Decl(ll,stack_name,BOOL_TYPE"*");
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

Token Bool_Null_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[Bool]: CAST: %s\n",a->str);

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

Token Bool_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(op->str==NULL) return Bool_Null_Handler_Cast(ll,op,args);
    return Token_Null();
}
Token Bool_Handler_Size(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Bool]: SIZE: %s\n",a->str);
    return Token_Move(TOKEN_NUMBER,Number_Get(BOOL_SIZE));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(BOOL_TYPE,sizeof(SuperALXVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_LOT,(void*)Bool_Handler_Lot),
                OperatorDefiner_New(TOKEN_CAST,(void*)Bool_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,(void*)SuperALX_Init),
                OperatorDefiner_New(TOKEN_SUPERALX_SIZE,(void*)Bool_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ BOOL_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(void*)Bool_Bool_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_LND,(void*)Bool_Bool_Handler_Lnd),
                OperatorDefiner_New(TOKEN_SUPERALX_LOR,(void*)Bool_Bool_Handler_Lor),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(void*)Bool_Bool_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(void*)Bool_Bool_Handler_Neq),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),SuperALX_Destroyer,SuperALX_Cpyer)
    );
}