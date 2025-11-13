#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALX.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALXASM.h"

Token Pointer_Pointer_Handler_Ass(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);

    //printf("[Pointer]: ASS: %s = %s\n",a->str,b->str);

    if(b->tt==TOKEN_NUMBER){
        SuperALX_IntoSet(ll,a,b->str);
    }else if(b->tt==TOKEN_CONSTSTRING_DOUBLE){
        CStr name = SuperALX_BuildConstStr(ll,b->str);
        SuperALX_IntoSet(ll,a,name);
        CStr_Free(&name);
    }else if(b->tt==TOKEN_FUNCTIONPOINTER){
        CStr name = SuperALX_FunctionName(ll,b->str);
        SuperALX_IntoSet(ll,a,name);
        CStr_Free(&name);
    }else if(b->tt==TOKEN_SUPERALX_NULL){
        SuperALX_IntoSet(ll,a,"0");
    }else if(b->tt==TOKEN_STRING){
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        SuperALX_IntoReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_A]);
        SuperALX_IntoSet(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Ass: Error -> %s has no pointer type!",b->str);
        return Token_Null();
    }
    return Token_Cpy(a);
}
Token Pointer_Pointer_Handler_Add(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"add","ADD",SuperALX_Function_Add);
}
Token Pointer_Pointer_Handler_Sub(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_Execute(ll,a,b,op,"sub","SUB",SuperALX_Function_Sub);
}

Token Pointer_Pointer_Handler_Equ(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"sete","EQU",SuperALX_Function_Equ);
}
Token Pointer_Pointer_Handler_Neq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setne","NEQ",SuperALX_Function_Neq);
}
Token Pointer_Pointer_Handler_Les(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setl","LES",SuperALX_Function_Les);
}
Token Pointer_Pointer_Handler_Grt(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setg","GRT",SuperALX_Function_Grt);
}
Token Pointer_Pointer_Handler_Leq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setle","LEQ",SuperALX_Function_Leq);
}
Token Pointer_Pointer_Handler_Grq(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    return SuperALX_ExecuteCmp(ll,a,b,op,"setge","GRQ",SuperALX_Function_Grq);
}

Token Pointer_Handler_Adr(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Pointer]: ADR: &%s\n",a->str);
    
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
            CStr type = CStr_Concat(v->typename,"*");
            SuperALX_Variable_Build_Decl(ll,stack_name,type);
            CStr_Free(&type);
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
Token Pointer_Handler_Drf(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Pointer]: DRF: *%s\n",a->str);
    
    if(a->tt==TOKEN_STRING){
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        
        if(SuperALX_DrefType(ll,v->typename)){
            CStr type = CStr_PopOff(v->typename);
            type[CStr_Size(type) - 1] = '&';
            SuperALX_Variable_Build_Decl(ll,stack_name,type);
            CStr_Free(&type);
            
            Token stack_t = Token_Move(TOKEN_STRING,stack_name);
            CStr location_a = SuperALX_Location(ll,a->str);
            CStr location_s = SuperALX_Location(ll,stack_name);

            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,location_a);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s[%s]",SUPERALX_REG_A_64,SUPERALX_DREF_64,SUPERALX_REG_A_64);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",location_s,SUPERALX_REG_A_64);

            CStr_Free(&location_a);
            CStr_Free(&location_s);
            return stack_t;
        }else{
            CStr type = CStr_Cpy(v->typename);
            type[CStr_Size(type) - 1] = '&';
            SuperALX_Variable_Build_Decl(ll,stack_name,type);
            CStr_Free(&type);
            
            Token stack_t = Token_Move(TOKEN_STRING,stack_name);
            CStr location_a = SuperALX_Location(ll,a->str);
            CStr location_s = SuperALX_Location(ll,stack_name);

            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,location_a);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",location_s,SUPERALX_REG_A_64);

            CStr_Free(&location_a);
            CStr_Free(&location_s);
            return stack_t;
        }
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Drf: Error -> %s has no dref op!",a->str);
        return Token_Null();
    }
}
Token Pointer_Handler_Arw(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //printf("[Pointer]: ARW: %s->%s\n",a->str,b->str);
    
    if(a->tt==TOKEN_STRING){
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        
        CStr structtype = CStr_PopOff(v->typename);
        Type* t = Scope_FindType(&ll->ev.sc,structtype);
        CStr_Free(&structtype);
        if(t){
            Member* member = MemberMap_Find(&t->related,b->str);
            if(member){
                if(member->access || CStr_Cmp(a->str,SUPERALX_SELF)){
                    int offset = 0;
                    for(int i = 0;i<t->related.size;i++){
                        Member* m = (Member*)Vector_Get(&t->related,i);
                        if(CStr_Cmp(b->str,m->name)) break;
                        offset += SuperALX_Size(ll,m->type);
                    }

                    CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
                    if(!SuperALX_DrefType(ll,v->typename)){
                        CStr type = CStr_Concat(member->type,"&");
                        SuperALX_Variable_Build_Decl(ll,stack_name,type);
                        CStr_Free(&type);

                        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
                        CStr location_a = SuperALX_Location(ll,a->str);
                        CStr location_s = SuperALX_Location(ll,stack_name);

                        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,location_a);
                        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",location_s,SUPERALX_REG_A_64);
                        SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,%d",location_s,offset);

                        CStr_Free(&location_a);
                        CStr_Free(&location_s);
                    }else{
                        CStr type = CStr_Concat(member->type,"&");
                        SuperALX_Variable_Build_Decl(ll,stack_name,type);
                        CStr_Free(&type);

                        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
                        CStr location_a = SuperALX_Location(ll,a->str);
                        CStr location_s = SuperALX_Location(ll,stack_name);

                        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,location_a);
                        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s[%s]",SUPERALX_REG_A_64,SUPERALX_DREF_64,SUPERALX_REG_A_64);
                        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",location_s,SUPERALX_REG_A_64);
                        SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,%d",location_s,offset);

                        CStr_Free(&location_a);
                        CStr_Free(&location_s);
                    }
                    return Token_Move(TOKEN_STRING,stack_name);
                }else{
                    Enviroment_ErrorHandler(&ll->ev,"Arw: Member %s isn't pub or non self %s tries to access!",b->str,a->str);
                    return Token_Null();
                }
            }else{
                Enviroment_ErrorHandler(&ll->ev,"Arw: Member %s not found!",b->str);
                return Token_Null();
            }
        }else{
            Enviroment_ErrorHandler(&ll->ev,"Arw: Type %s not found!",v->typename);
            return Token_Null();
        }
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Arw: Error -> %s has no dref op!",a->str);
        return Token_Null();
    }
}

Token Pointer_I64_Handler_Subs(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //printf("[Pointer]: SUBS: %s[%s]\n",a->str,b->str);
    
    Token add = Token_By(TOKEN_SUPERALX_ADD,"+");
    Token drf = Token_By(TOKEN_SUPERALX_DRF,"*");

    Token out = Pointer_Pointer_Handler_Add(ll,&add,args);
    TokenMap newargs = TokenMap_Make((Token[]){ out,Token_Null() });
    Token ret = Pointer_Handler_Drf(ll,&drf,&newargs);
    TokenMap_Free(&newargs);

    Token_Free(&drf);
    Token_Free(&add);
    return ret;
}

Token Pointer_Null_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[Pointer]: CAST: %s\n",a->str);

    String ret = String_New();

    if(a->tt==TOKEN_NUMBER){
        String_AppendNumber(&ret,Number_Parse(a->str));
    }else{
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
            String_Appendf(&ret,"T: %s,S:%d [&:%d,%d]",v->typename,sv->stack,sv->destroy,sv->sizeonstack);
        }else{
            printf("[I64]: Cast -> Error!\n");
            String_Append(&ret,"ERROR");
        }
    }

    CStr out = String_CStr(&ret);
    String_Free(&ret);
    return Token_Move(TOKEN_CONSTSTRING_DOUBLE,out);
}

Token Pointer_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(op->str==NULL) return Pointer_Null_Handler_Cast(ll,op,args);
    if(CStr_Cmp(op->str,I8_TYPE) || CStr_Cmp(op->str,I16_TYPE) || CStr_Cmp(op->str,I32_TYPE) || CStr_Cmp(op->str,I64_TYPE) ||
       CStr_Cmp(op->str,U8_TYPE) || CStr_Cmp(op->str,U16_TYPE) || CStr_Cmp(op->str,U32_TYPE) || CStr_Cmp(op->str,U64_TYPE) ||
       SuperALX_PointerType(ll,op->str))
        return Int_Int_Handler_Cast(ll,op,args,op->str);
    return Token_Null();
}
Token Pointer_Handler_Size(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Pointer]: SIZE: %s\n",a->str);
    return Token_Move(TOKEN_NUMBER,Number_Get(POINTER_SIZE));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(POINTER_TYPE,sizeof(SuperALXVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ADR,(Token(*)(void*,Token*,Vector*))Pointer_Handler_Adr),
                OperatorDefiner_New(TOKEN_SUPERALX_DRF,(Token(*)(void*,Token*,Vector*))Pointer_Handler_Drf),
                OperatorDefiner_New(TOKEN_CAST,(Token(*)(void*,Token*,Vector*))Pointer_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,(Token(*)(void*,Token*,Vector*))SuperALX_Init),
                OperatorDefiner_New(TOKEN_SUPERALX_SIZE,(Token(*)(void*,Token*,Vector*))Pointer_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ POINTER_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grq),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ I32_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grq),
                OperatorDefiner_New(TOKEN_SUPERALX_SUBS,(Token(*)(void*,Token*,Vector*))Pointer_I64_Handler_Subs),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ I64_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grq),
                OperatorDefiner_New(TOKEN_SUPERALX_SUBS,(Token(*)(void*,Token*,Vector*))Pointer_I64_Handler_Subs),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ U32_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grq),
                OperatorDefiner_New(TOKEN_SUPERALX_SUBS,(Token(*)(void*,Token*,Vector*))Pointer_I64_Handler_Subs),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ U64_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Ass),
                OperatorDefiner_New(TOKEN_SUPERALX_ADD,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Add),
                OperatorDefiner_New(TOKEN_SUPERALX_SUB,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Sub),
                OperatorDefiner_New(TOKEN_SUPERALX_EQU,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Equ),
                OperatorDefiner_New(TOKEN_SUPERALX_NEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Neq),
                OperatorDefiner_New(TOKEN_SUPERALX_LES,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Les),
                OperatorDefiner_New(TOKEN_SUPERALX_GRT,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grt),
                OperatorDefiner_New(TOKEN_SUPERALX_LEQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Leq),
                OperatorDefiner_New(TOKEN_SUPERALX_GRQ,(Token(*)(void*,Token*,Vector*))Pointer_Pointer_Handler_Grq),
                OperatorDefiner_New(TOKEN_SUPERALX_SUBS,(Token(*)(void*,Token*,Vector*))Pointer_I64_Handler_Subs),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ OPERATORINTERATER_DONTCARE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ARW,(Token(*)(void*,Token*,Vector*))Pointer_Handler_Arw),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),SuperALX_Destroyer,SuperALX_Cpyer)
    );
}
