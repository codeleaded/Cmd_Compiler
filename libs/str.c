#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALX.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALXASM.h"

Token Str_Null_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[Str]: CAST: %s\n",a->str);

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

Token Str_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(op->str==NULL) return Str_Null_Handler_Cast(ll,op,args);
    return Token_Null();
}
Token Str_Handler_Size(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Str]: SIZE: %s\n",a->str);
    return Token_Move(TOKEN_NUMBER,Number_Get(STR_SIZE));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(VOID_TYPE,sizeof(SuperALXVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_CAST,(Token(*)(void*,Token*,Vector*))Str_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,(Token(*)(void*,Token*,Vector*))SuperALX_Init),
                OperatorDefiner_New(TOKEN_SUPERALX_SIZE,(Token(*)(void*,Token*,Vector*))Str_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ VOID_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                //OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))Str_Str_Handler_Ass),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),SuperALX_Destroyer,SuperALX_Cpyer)
    );
}