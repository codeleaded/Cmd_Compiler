#include "/home/codeleaded/System/Static/Library/AlxCallStack.h"
#include "/home/codeleaded/System/Static/Library/AlxExternFunctions.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALX.h"
#include "/home/codeleaded/Hecke/C/Cmd_Compiler/src/SuperALXASM.h"

Token Struct_Struct_Handler_Ass(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //printf("[Struct]: ASS: %s = %s\n",a->str,b->str);

    if(b->tt==TOKEN_STRING){
        Variable* va = Scope_FindVariable(&ll->ev.sc,a->str);
        SuperALXVariable* va_s = (SuperALXVariable*)Variable_Data(va);
        Variable* vb = Scope_FindVariable(&ll->ev.sc,b->str);
        SuperALXVariable* vb_s = (SuperALXVariable*)Variable_Data(vb);

        const int realsize = SuperALX_TypeRealSize(ll,a);
        //int realsize = SuperALX_TypeRealSize(ll,b);

        const int offset_a = ll->stack - va_s->stack;
        const int offset_b = ll->stack - vb_s->stack;

        CStr location_a = CStr_Format("[%s + %d",SUPERALX_REG_SP_64,offset_a);
        CStr location_b = CStr_Format("[%s + %d",SUPERALX_REG_SP_64,offset_b);
        
        if(SuperALX_DrefType(ll,va->typename)){
            SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
            
            CStr setter = CStr_Format("[%s",SUPERALX_REG_D_64);
            CStr_Set(&location_a,setter);
            CStr_Free(&setter);
        }
        if(SuperALX_DrefType(ll,vb->typename)){
            SuperALX_DrefIntoReg(ll,b,SUPERALX_REG_C_64);
            
            CStr setter = CStr_Format("[%s",SUPERALX_REG_C_64);
            CStr_Set(&location_b,setter);
            CStr_Free(&setter);
        }

        int i = 0;
        for(;i<=realsize-8;i+=8){
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s%s + %d]",SUPERALX_REG_A_64,SUPERALX_DREF_64,location_b,i);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s%s + %d],%s",SUPERALX_DREF_64,location_a,i,SUPERALX_REG_A_64);
        }
        for(;i<=realsize-4;i+=4){
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s%s + %d]",SUPERALX_REG_A_32,SUPERALX_DREF_32,location_b,i);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s%s + %d],%s",SUPERALX_DREF_32,location_a,i,SUPERALX_REG_A_32);
        }
        for(;i<=realsize-2;i+=2){
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s%s + %d]",SUPERALX_REG_A_16,SUPERALX_DREF_16,location_b,i);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s%s + %d],%s",SUPERALX_DREF_16,location_a,i,SUPERALX_REG_A_16);
        }
        for(;i<=realsize-1;i+=1){
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s%s + %d]",SUPERALX_REG_A_L8,SUPERALX_DREF_8,location_b,i);
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s%s + %d],%s",SUPERALX_DREF_8,location_a,i,SUPERALX_REG_A_L8);
        }

        CStr_Free(&location_b);
        CStr_Free(&location_a);
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Ass: Error -> %s is no struct type!",b->str);
        return Token_Null();
    }
    return Token_Cpy(a);
}
Token Struct_Handler_Adr(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Struct]: ADR: &%s\n",a->str);
    
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        SuperALXVariable* va = (SuperALXVariable*)Variable_Data(v);
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
        
        CStr location_a = SuperALX_StackAtNT(ll,va->stack);
        SuperALX_Indentation_Appendf(ll,&ll->text,"lea %s,%s",SUPERALX_REG_A_64,location_a);
        SuperALX_IntoSet(ll,&stack_t,SUPERALX_REG_A_64);
        return stack_t;
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Adr: Error -> %s has no address!",a->str);
        return Token_Null();
    }
}
Token Struct_Handler_Acs(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    Token* b = (Token*)Vector_Get(args,1);
    //printf("[Struct]: ACS: %s.%s\n",a->str,b->str);
    
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
            Type* t = Scope_FindType(&ll->ev.sc,v->typename);
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
                            SuperALX_Variable_Build_Use(ll,stack_name,member->type,sv->stack - offset);
                        }else{
                            CStr type = CStr_Concat(member->type,"&");
                            SuperALX_Variable_Build_Decl(ll,stack_name,type);
                            CStr_Free(&type);

                            CStr location_a = SuperALX_Location(ll,a->str);
                            CStr location_s = SuperALX_Location(ll,stack_name);

                            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,location_a);
                            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",location_s,SUPERALX_REG_A_64);
                            SuperALX_Indentation_Appendf(ll,&ll->text,"add %s,%d",location_s,offset);

                            CStr_Free(&location_a);
                            CStr_Free(&location_s);
                        }

                        return Token_Move(TOKEN_STRING,stack_name);
                    }else{
                        Enviroment_ErrorHandler(&ll->ev,"Acs: Member %s isn't pub or non self %s tries to access!",b->str,a->str);
                        return Token_Null();
                    }
                }else{
                    Enviroment_ErrorHandler(&ll->ev,"Acs: Member %s not found!",b->str);
                    return Token_Null();
                }
            }else{
                Enviroment_ErrorHandler(&ll->ev,"Acs: Type %s not found!",v->typename);
                return Token_Null();
            }
        }else{
            Enviroment_ErrorHandler(&ll->ev,"Acs: 1. Arg: %s not found as a variable!",a->str);
            return Token_Null();
        }
    }else{
        Enviroment_ErrorHandler(&ll->ev,"Acs: 1. Arg: %s is not a variable type!",a->str);
        return Token_Null();
    }

    return Token_Null();
}

Token Struct_Null_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[Struct]: CAST: %s\n",a->str);

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

Token Struct_Handler_Cast(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    if(op->str==NULL) return Struct_Null_Handler_Cast(ll,op,args);
    return Token_Null();
}
Token Struct_Handler_Size(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);
    //printf("[Struct]: SIZE: %s\n",a->str);

    Type* t = Scope_FindType(&ll->ev.sc,a->str);
    if(t){
        int size = 0;
        for(int i = 0;i<t->related.size;i++){
            Member* m = (Member*)Vector_Get(&t->related,i);
            size += SuperALX_Size(ll,m->type);
        }
        return Token_Move(TOKEN_NUMBER,Number_Get(size));
    }
    return Token_Move(TOKEN_NUMBER,Number_Get(0));
}

void Ex_Packer(ExternFunctionMap* Extern_Functions,Vector* funcs,Scope* s){//Vector<CStr>
    TypeMap_PushContained(&s->types,funcs,
        Type_Make(STRUCT_TYPE,sizeof(SuperALXVariable),OperatorInterationMap_Make((OperatorInterater[]){
            OperatorInterater_Make((CStr[]){ NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ADR,(void*)Struct_Handler_Adr),
                OperatorDefiner_New(TOKEN_CAST,(void*)Struct_Handler_Cast),
                OperatorDefiner_New(TOKEN_INIT,(void*)SuperALX_Init),
                OperatorDefiner_New(TOKEN_SUPERALX_SIZE,(void*)Struct_Handler_Size),
                //OperatorDefiner_New(TOKEN_DESTROY,NULL),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ STRUCT_TYPE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ASS,(void*)Struct_Struct_Handler_Ass),
                OPERATORDEFINER_END
            })),
            OperatorInterater_Make((CStr[]){ OPERATORINTERATER_DONTCARE,NULL },OperatorDefineMap_Make((OperatorDefiner[]){
                OperatorDefiner_New(TOKEN_SUPERALX_ACS,(void*)Struct_Handler_Acs),
                OPERATORDEFINER_END
            })),
            OPERATORINTERATER_END
        }),SuperALX_Destroyer,SuperALX_Cpyer)
    );
}
