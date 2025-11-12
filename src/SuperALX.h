#ifndef SuperALX_H
#define SuperALX_H

#include "/home/codeleaded/System/Static/Library/AlxScope.h"
#include "/home/codeleaded/System/Static/Library/AlxShutingYard.h"
#include "/home/codeleaded/System/Static/Library/AlxCompiler.h"

#include "/home/codeleaded/System/Static/Library/ConstParser.h"
#include "/home/codeleaded/System/Static/Library/Files.h"
#include "/home/codeleaded/System/Static/Library/String.h"

#include "/home/codeleaded/System/Static/Container/CVector.h"

#include "SuperALXDefines.h"
#include "SuperALXASM.h"

Boolean ShutingYard_compress(SuperALX* ll,TokenMap* tm);
Boolean ShutingYard_compress_pointer(SuperALX* ll,TokenMap* tm);

Boolean ShutingYard_compress_defines(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size;i++){
        Token* t = (Token*)Vector_Get(tm,i);
        if(t->tt==TOKEN_STRING){
            for(int j = 0;j<ll->defines.size;j++){
                Define* d = (Define*)CVector_Get(&ll->defines,j);
                if(CStr_Cmp(d->name,t->str)){
                    Token_Free(t);
                    Vector_Remove(tm,i);

                    TokenMap tokm = TokenMap_Cpy(&d->content);
                    Vector_AddCount(tm,tokm.Memory,tokm.size,i);
                }
            }
        }
    }
    return False;
}
Boolean ShutingYard_compress_pointer(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size-1;i++){
        Token* type = (Token*)Vector_Get(tm,i);
        if(type->tt==TOKEN_TYPE){
            Token* next = (Token*)Vector_Get(tm,i+1);
            if(next->tt==TOKEN_ASTERISK || next->tt==TOKEN_SUPERALX_MUL || next->tt==TOKEN_SUPERALX_DRF){
                CStr newtype = CStr_Concat(type->str,"*");
                CStr_Set((char**)&type->str,newtype);
                CStr_Free(&newtype);

                Token_Free(next);
                Vector_Remove(tm,i+1);
                i--;
            }else if(next->tt==TOKEN_AMPERSAND || next->tt==TOKEN_SUPERALX_AND || next->tt==TOKEN_SUPERALX_ADR){
                CStr newtype = CStr_Concat(type->str,"&");
                CStr_Set((char**)&type->str,newtype);
                CStr_Free(&newtype);
                
                Token_Free(next);
                Vector_Remove(tm,i+1);
                i--;
            }
        }
    }
    return False;
}
Boolean ShutingYard_compress_functionpointer(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size-1;i++){
        Token* type = (Token*)Vector_Get(tm,i);

        if(type->tt==TOKEN_TYPE){
            Token* next = (Token*)Vector_Get(tm,i+1);
            if(next->tt==TOKEN_PARENTHESES_L){
                int pretc = 1;
                int pretr = 2;
                for(;pretc>0;pretr++){
                    next = (Token*)Vector_Get(tm,i + pretr);
                    
                    if(next->tt==TOKEN_PARENTHESES_L) pretc++;
                    if(next->tt==TOKEN_PARENTHESES_R) pretc--;
                    if(next->tt!=TOKEN_TYPE && next->tt!=TOKEN_COMMA && next->tt!=TOKEN_PARENTHESES_L && next->tt!=TOKEN_PARENTHESES_R){
                        continue;
                    }
                    if(pretr + i==tm->size-1){
                        Compiler_ErrorHandler(&ll->ev,"Compress Functionpointer -> needs a ) to end function pointer type!");
                        return 0;
                    }
                }

                String builder = String_New();
                for(int j = 0;j<pretr;j++){
                    next = (Token*)Vector_Get(tm,i + j);
                    String_Append(&builder,next->str);
                }
                CStr newtype = String_CStr(&builder);
                CStr_Set((char**)&type->str,newtype);
                CStr_Free(&newtype);
                String_Free(&builder);

                TokenMap_Remove(tm,i+1,i+pretr);
                ShutingYard_compress_pointer(ll,tm);
                i = -1;
            }
        }
    }
    return False;
}
Boolean ShutingYard_compress_cast(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size;i++){
        Token* pretl = (Token*)Vector_Get(tm,i);
        Token* type = (Token*)Vector_Get(tm,i+1);
        Token* pretr = (Token*)Vector_Get(tm,i+2);

        if(pretl->tt==TOKEN_PARENTHESES_L && type->tt==TOKEN_TYPE && pretr->tt==TOKEN_PARENTHESES_R){
            pretl->tt = TOKEN_CAST;
            CStr_Set((char**)&pretl->str,type->str);
            TokenMap_Remove(tm,i+1,i+3);
        }
    }
    return False;
}
Boolean ShutingYard_compress_subscript(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size;i++){
        Token* subs = (Token*)Vector_Get(tm,i);

        if(subs->tt==TOKEN_SUPERALX_SUBS){
            Vector_Add(tm,(Token[]){ Token_By(TOKEN_PARENTHESES_L,"(") },i+1);
        }
        if(subs->tt==TOKEN_SUPERALX_SUBSR){
            subs->tt = TOKEN_PARENTHESES_R;
            CStr_Set((CStr*)&subs->str,")");
        }
    }
    return False;
}
Boolean ShutingYard_compress_staticmethods(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size;i++){
        Token* class = (Token*)Vector_Get(tm,i);
        
        if(i<tm->size-2){
            Token* dddop = (Token*)Vector_Get(tm,i+1);
            Token* func = (Token*)Vector_Get(tm,i+2);

            if((class->tt==TOKEN_STRING || class->tt==TOKEN_TYPE) && dddop->tt==TOKEN_SUPERALX_DDDOT && (func->tt==TOKEN_STRING || func->tt==TOKEN_TYPE)){
                String builder = String_Make(class->str);
                String_Append(&builder,dddop->str);
                String_Append(&builder,func->str);

                CStr space = String_CStr(&builder);
                String_Free(&builder);

                CStr_Set((CStr*)&func->str,space);
                CStr_Free(&space);

                TokenMap_Remove(tm,i,i+2);
                i--;
                continue;
            }
        }
        if(class->tt==TOKEN_STRING){
            Type* t = TypeMap_Find(&ll->ev.sc.types,class->str);
            if(t) class->tt = TOKEN_TYPE;
            else{
                CStr spacename = SuperALX_SpaceName(ll,class->str);
                Type* t = TypeMap_Find(&ll->ev.sc.types,spacename);
                if(t){
                    class->tt = TOKEN_TYPE;
                    CStr_Set(&class->str,spacename);
                }
                CStr_Free(&spacename);
            }
        }
    }
    return False;
}
Boolean ShutingYard_compress_functioncalls(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size-1;i++){
        Token* func = (Token*)Vector_Get(tm,i);
        Token* prentl = (Token*)Vector_Get(tm,i+1);

        if(func->tt==TOKEN_STRING && prentl->tt==TOKEN_PARENTHESES_L){
            func->tt = TOKEN_FUNCTION;
            func->args = malloc(sizeof(Vector));
            *func->args = Vector_New(sizeof(TokenMap));
            
            int Parentheses = 0;
            int Last = i+2;
            Token* prentr = (Token*)Vector_Get(tm,i+2);
            if(prentr->tt!=TOKEN_PARENTHESES_R){
                for(int j = Last;j<tm->size;j++){
                    Token* t = (Token*)Vector_Get(tm,j);
            
                    if(t->tt==TOKEN_PARENTHESES_L) Parentheses++;
                    if(t->tt==TOKEN_PARENTHESES_R) Parentheses--;
                    if(t->tt==TOKEN_COMMA || Parentheses<0){
                        if(Parentheses<=0){
                            TokenMap newtm = TokenMap_SubMove(tm,Last,j);
                            ShutingYard_compress(ll,&newtm);
                            Vector_Push(func->args,&newtm);
                            Last = j + 1;
                        }
                    }
                    if(Parentheses<0) break;
                } 
            }else{
                Last++;
            }

            TokenMap_Remove(tm,i+1,Last);
        }
    }
    return False;
}
Boolean ShutingYard_compress_functionaspointer(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size;i++){
        Token* func = (Token*)Vector_Get(tm,i);

        if(func->tt==TOKEN_STRING){
            Function* f = FunctionMap_Get(&ll->ev.fs,func->str);
            if(f){
                func->tt = TOKEN_FUNCTIONPOINTER;
            }
        }
    }
    return False;
}
Boolean ShutingYard_compress_function(SuperALX* ll,TokenMap* tm){
    for(int i = 0;i<tm->size-2;i++){
        Token* ttype = (Token*)Vector_Get(tm,i);
        Token* tname = (Token*)Vector_Get(tm,i+1);
        Token* tprentl = (Token*)Vector_Get(tm,i+2);
        
        if(ttype->tt==TOKEN_TYPE && tname->tt==TOKEN_STRING && tprentl->tt==TOKEN_PARENTHESES_L){
            Vector params = Vector_New(sizeof(Member));

            TT_Iter pretl = TokenMap_Find(tm,TOKEN_PARENTHESES_L);
            TT_Iter pretr = TokenMap_Find(tm,TOKEN_PARENTHESES_R);
            
            if(pretr - pretl > 1){
                TokenMap rest = TokenMap_SubFromToken(tm,TOKEN_PARENTHESES_L);
                TokenMap between = TokenMap_SubToToken(&rest,TOKEN_PARENTHESES_R);
                TokenMap_Free(&rest);

                for(;between.size>0;){
                    TokenMap first = TokenMap_SubToToken(&between,TOKEN_COMMA);
                    TokenMap after = TokenMap_SubFromToken(&between,TOKEN_COMMA);

                    TT_Iter type = TokenMap_Find(&first,TOKEN_TYPE);
                    TT_Iter name = TokenMap_Find(&first,TOKEN_STRING);
                    TT_Iter constant = TokenMap_Find(&first,TOKEN_SUPERALX_CONST);

                    if(type>=0 && name>=0){
                        CStr sname = ((Token*)Vector_Get(&first,name))->str;
                        CStr stype = ((Token*)Vector_Get(&first,type))->str;

                        Boolean bconstant = constant>=0;
                        Vector_Push(&params,(Member[]){ Member_Make(bconstant,0,stype,sname) });
                    }else{
                        Compiler_ErrorHandler(&ll->ev,"Compress Function: no type and no var found");
                    }

                    TokenMap_Free(&first);
                    TokenMap_Free(&between);
                    between = after;
                }
                TokenMap_Free(&between);
            }

            //Boolean bref = False;
            //Boolean bconstant = False;

            TokenMap rettypem = TokenMap_SubToToken(tm,TOKEN_PARENTHESES_L);
            TT_Iter it_pub = TokenMap_Find(&rettypem,TOKEN_SUPERALX_PUB);
            Boolean bpub = it_pub>=0;
            TokenMap_Free(&rettypem);

            Vector_Push(&params,(Member[]){ MEMBER_END });

            CStr realname = SuperALX_FuncSpaceName(ll,tname->str);
            CStr_Set((char**)&tname->str,realname);

            CallPosition cp = CallPosition_New(TOKEN_FUNCTIONDECL,ll->ev.iter);
            Vector_Push(&ll->ev.cs,&cp);

            Function f = Function_MakeX(ll->ev.iter,bpub,realname,ttype->str,(Member*)params.Memory);
            Vector_Push(&ll->ev.fs,&f);
            Vector_Free(&params);
            CStr_Free(&realname);

            CStr cname = CStr_Cpy(tname->str);
            TokenMap_Clear(tm);
            TokenMap_Push(tm,(Token[]){ Token_Move(TOKEN_FUNCTIONDECL,cname) });
            //TokenMap_Push(tm,(Token[]){ Token_By(TOKEN_CURLY_BRACES_L,"{") });
        }
    }

    return False;
}
Boolean ShutingYard_compress(SuperALX* ll,TokenMap* tm){
    //ShutingYard_compress_objects(ev,tm);

    ShutingYard_compress_staticmethods(ll,tm);
    ShutingYard_compress_defines(ll,tm);
    ShutingYard_compress_pointer(ll,tm);
    ShutingYard_compress_functionpointer(ll,tm);
    ShutingYard_compress_cast(ll,tm);
    ShutingYard_compress_subscript(ll,tm);
    ShutingYard_compress_function(ll,tm);
    ShutingYard_compress_functioncalls(ll,tm);
    ShutingYard_compress_functionaspointer(ll,tm);
    return False;
}

Boolean ShutingYard_PP_if(Compiler* ev,TokenMap* tm){
    CallPosition cp =  CallPosition_New(TOKEN_SUPERALX_IF,ev->iter);
    Vector_Push(&ev->cs,&cp);
    return False;
}
Boolean ShutingYard_PP_elif(Compiler* ev,TokenMap* tm){
    CallPosition cp =  CallPosition_New(TOKEN_SUPERALX_ELIF,ev->iter);
    Vector_Push(&ev->cs,&cp);
    return False;
}
Boolean ShutingYard_PP_else(Compiler* ev,TokenMap* tm){
    CallPosition cp =  CallPosition_New(TOKEN_SUPERALX_ELSE,ev->iter);
    Vector_Push(&ev->cs,&cp);
    return False;
}
Boolean ShutingYard_PP_while(Compiler* ev,TokenMap* tm){
    CallPosition cp =  CallPosition_New(TOKEN_SUPERALX_WHILE,ev->iter);
    Vector_Push(&ev->cs,&cp);
    return False;
}
Boolean ShutingYard_PP_for(Compiler* ev,TokenMap* tm){
    CallPosition cp = CallPosition_New(TOKEN_SUPERALX_FOR,ev->iter);
    Vector_Push(&ev->cs,&cp);
    return False;
}

Boolean ShutingYard_PP_Struct(SuperALX* ll,TokenMap* tm){
    Token* t_struct = (Token*)Vector_Get(tm,0);
    Token* t_name = (Token*)Vector_Get(tm,1);

    if(t_name->tt==TOKEN_STRING){
        if(tm->size>2){
            Token* subsl = (Token*)Vector_Get(tm,2);
            if(subsl->tt==TOKEN_SUPERALX_SUBS){
                MemberMap params = MemberMap_New();

                TokenMap rest = TokenMap_SubFromToken(tm,TOKEN_SUPERALX_SUBS);
                TokenMap between = TokenMap_SubToToken(&rest,TOKEN_SUPERALX_SUBSR);
                TokenMap_Free(&rest);

                for(;between.size>0;){
                    TokenMap first = TokenMap_SubToToken(&between,TOKEN_COMMA);
                    TokenMap after = TokenMap_SubFromToken(&between,TOKEN_COMMA);

                    TT_Iter type = TokenMap_Find(&first,TOKEN_TYPE);
                    TT_Iter name = TokenMap_Find(&first,TOKEN_STRING);
                    TT_Iter pub = TokenMap_Find(&first,TOKEN_SUPERALX_PUB);

                    if(type<0){
                        Compiler_ErrorHandler(&ll->ev,"Struct -> Error: couldn't find Type!");
                        return False;
                    }else if(name<0){
                        Compiler_ErrorHandler(&ll->ev,"Struct -> Error: couldn't find name!");
                        return False;
                    }else{
                        CStr sname = ((Token*)Vector_Get(&first,name))->str;
                        CStr stype = ((Token*)Vector_Get(&first,type))->str;

                        Boolean bpub = pub>=0;
                        Vector_Push(&params,(Member[]){ Member_MakeX(0,0,bpub,stype,sname) });
                    }

                    TokenMap_Free(&first);
                    TokenMap_Free(&between);
                    between = after;
                }
                TokenMap_Free(&between);

                Type* parent = Scope_FindType(&ll->ev.sc,STRUCT_TYPE);
                if(!parent){
                    Compiler_ErrorHandler(&ll->ev,"Struct -> Error: type %s doesn't exist!",STRUCT_TYPE);
                    return False;
                }
                
                Type t = Type_Cpy(parent);
                
                CStr realname = SuperALX_SpaceName(ll,t_name->str);
                CStr_Set(&t.name,realname);
                Type_SetAllOperators(&t,STRUCT_TYPE,realname);
                CStr_Free(&realname);

                MemberMap_Set(&t.related,&params);
                TypeMap_Push(&ll->ev.sc.types,&t);
                return False;
            }else{
                Compiler_ErrorHandler(&ll->ev,"Struct: expected [: ");
                return False;
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"Struct: struct decl needs body [...]!");
            return False;
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"Struct: name of struct doesn't exist!");
        return False;
    }
}
Boolean ShutingYard_PP_Impl(SuperALX* ll,TokenMap* tm){
    Token* t_impl = (Token*)Vector_Get(tm,0);
    Token* t_name = (Token*)Vector_Get(tm,1);
    
    if(t_name->tt==TOKEN_TYPE){
        CallPosition cp = CallPosition_New_N(TOKEN_SUPERALX_IMPL,ll->ev.iter,t_name->str);
        Vector_Push(&ll->ev.cs,&cp);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Impl: name of impl doesn't exist!");
    }
    return False;
}
Boolean ShutingYard_PP_Namespace(SuperALX* ll,TokenMap* tm){
    Token* t_impl = (Token*)Vector_Get(tm,0);
    Token* t_name = (Token*)Vector_Get(tm,1);
    
    if(t_name->tt==TOKEN_STRING){
        CallPosition cp = CallPosition_New_N(TOKEN_SUPERALX_NAMESPACE,ll->ev.iter,t_name->str);
        Vector_Push(&ll->ev.cs,&cp);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Namespace: name of namespace doesn't exist!");
    }
    return False;
}
Boolean ShutingYard_PP_Curly_L(SuperALX* ll,TokenMap* tm){
    CallPosition cp = CallPosition_New(TOKEN_NONE,ll->ev.iter);
    Vector_Push(&ll->ev.cs,&cp);
    return False;
}
Boolean ShutingYard_PP_Curly_R(SuperALX* ll,TokenMap* tm){
    TT_Type tt = CallStack_Back(&ll->ev.cs);
    
    switch (tt){
    case TOKEN_FUNCTIONDECL:
        break;
    case TOKEN_SUPERALX_IMPL:
        break;
    case TOKEN_SUPERALX_NAMESPACE:
        break;
    case TOKEN_SUPERALX_IF:
        break;
    case TOKEN_SUPERALX_ELIF:
        break;
    case TOKEN_SUPERALX_ELSE:
        break;
    case TOKEN_SUPERALX_WHILE:
        break;
    case TOKEN_SUPERALX_FOR:
        break;
    case TOKEN_NONE:
        break;
    default:
        Compiler_ErrorHandler(&ll->ev,"Call Stack top type is not defined!");
        break;
    }
    CallStack_Pop(&ll->ev.cs);
    return False;
}

Boolean ShutingYard_Import(SuperALX* ll,TokenMap* tm){
    Token* file = (Token*)Vector_Get(tm,1);

    if(file->tt==TOKEN_CONSTSTRING_DOUBLE){
        char* type = Files_Type(file->str);
        if(CStr_Cmp(type,SUPERALX_TYPE)){
            CStr current = *(CStr*)CVector_Get(&ll->filesstack,ll->filesstack.size-1);
            CStr dir = Files_Path(current);
            CStr realpath = Files_FromPath(dir,file->str);
            CStr_Free(&dir);

            if(!CVector_Contains(&ll->filesinc,(CStr[]){ realpath })){
                CVector_Push(&ll->filesstack,(CStr[]){ CStr_Cpy(realpath) });
                CVector_Push(&ll->filesinc,(CStr[]){ CStr_Cpy(realpath) });
                
                Compiler_AddScript(&ll->ev,ll->ev.iter,realpath);
            
                CVector_PopTop(&ll->filesstack);
                CStr_Free(&realpath);
            }else{
                //Compiler_ErrorHandler(&ll->ev,"module \"%s\" already included!",file->str);
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"file type of module \"%s\" is wrong: .%s, should be .%s",file->str,type,SUPERALX_TYPE);
        }
        free(type);
    }else{
        Compiler_ErrorHandler(&ll->ev,"module \"%s\" doesn't exist!",file->str);
    }
    return True;
}
Boolean ShutingYard_Define(SuperALX* ll,TokenMap* tm){
    Token* define = (Token*)Vector_Get(tm,0);
    Token* name = (Token*)Vector_Get(tm,1);
    
    if(tm->size>1 && name->tt==TOKEN_STRING){
        Define d = Define_New(name->str,TokenMap_Sub(tm,2,tm->size));
        CVector_Push(&ll->defines,&d);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Define: define needs a name!");
    }
    TokenMap_Clear(tm);
    return False;
}

Boolean ShutingYard_if(SuperALX* ll,TokenMap* tm){
    Token* if_tok = (Token*)Vector_Get(tm,0);
    Token* cbl_tok = (Token*)Vector_Get(tm,tm->size-1);
    
    if(tm->size>2){
        if(cbl_tok->tt==TOKEN_CURLY_BRACES_L){
            if(ll->ev.sc.range>0){
                Token* t = (Token*)Vector_Get(tm,0);
                Token_Free(t);
                Vector_Remove(tm,0);

                t = (Token*)Vector_Get(tm,tm->size-1);
                Token_Free(t);
                Vector_Remove(tm,tm->size-1);

                Token btok = Token_By(TOKEN_STRING,SUPERALX_BOOL);
                SuperALX_Variable_Build_Decl(ll,btok.str,BOOL_TYPE);

                Vector_Add(tm,(Token[]){ Token_Cpy(&btok) },0);
                Vector_Add(tm,(Token[]){ Compiler_SetterToken(&ll->ev) },1);

                Boolean ret = Compiler_ShutingYard(&ll->ev,tm);
                SuperALX_IntoReg(ll,&btok,SUPERALX_REG_A_L8);
                Scope_DestroyVariable(&ll->ev.sc,btok.str);
                Token_Free(&btok);

                SuperALX_LogicAddPath(ll);

                CStr nextlabel = SuperALX_Logic(ll,0,SUPERALX_IF,ll->ev.sc.range);
                CStr otherlabel = SuperALX_Logic(ll,1,SUPERALX_IF,ll->ev.sc.range);
                SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,0",SUPERALX_REG_A_L8);
                SuperALX_Indentation_Appendf(ll,&ll->text,"je %s",otherlabel);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",nextlabel);
                CStr_Free(&otherlabel);
                CStr_Free(&nextlabel);

                ll->ev.sc.range++;
                CallPosition cp = CallPosition_New(TOKEN_SUPERALX_IF,ll->ev.iter);
                CallStack_Push(&ll->ev.cs,&cp);
                return ret;
            }else{
                Compiler_ErrorHandler(&ll->ev,"if: global if isn't allowed!");
                return False;
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"if: should end with a { like: if ... { ");
            return False;
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"if: should look like: if ... { ");
        return False;
    }
}
Boolean ShutingYard_elif(SuperALX* ll,TokenMap* tm){
    Token* elif_tok = (Token*)Vector_Get(tm,0);
    Token* cbl_tok = (Token*)Vector_Get(tm,tm->size-1);
    
    if(tm->size>2){
        if(cbl_tok->tt==TOKEN_CURLY_BRACES_L){
            if(ll->ev.sc.range>0){
                Token* t = (Token*)Vector_Get(tm,0);
                Token_Free(t);
                Vector_Remove(tm,0);

                t = (Token*)Vector_Get(tm,tm->size-1);
                Token_Free(t);
                Vector_Remove(tm,tm->size-1);

                Token btok = Token_By(TOKEN_STRING,SUPERALX_BOOL);
                SuperALX_Variable_Build_Decl(ll,btok.str,BOOL_TYPE);

                Vector_Add(tm,(Token[]){ Token_Cpy(&btok) },0);
                Vector_Add(tm,(Token[]){ Compiler_SetterToken(&ll->ev) },1);

                Boolean ret = Compiler_ShutingYard(&ll->ev,tm);
                SuperALX_IntoReg(ll,&btok,SUPERALX_REG_A_L8);
                Scope_DestroyVariable(&ll->ev.sc,btok.str);
                Token_Free(&btok);

                SuperALX_LogicAddExtend(ll);

                CStr nextlabel = SuperALX_Logic(ll,0,SUPERALX_ELIF,ll->ev.sc.range);
                CStr otherlabel = SuperALX_Logic(ll,1,SUPERALX_ELIF,ll->ev.sc.range);
                SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,0",SUPERALX_REG_A_L8);
                SuperALX_Indentation_Appendf(ll,&ll->text,"je %s",otherlabel);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",nextlabel);
                CStr_Free(&otherlabel);
                CStr_Free(&nextlabel);

                ll->ev.sc.range++;
                CallPosition cp = CallPosition_New(TOKEN_SUPERALX_ELIF,ll->ev.iter);
                CallStack_Push(&ll->ev.cs,&cp);
                return ret;
            }else{
                Compiler_ErrorHandler(&ll->ev,"elif: global elif isn't allowed!");
                return False;
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"elif: should end with a { like: elif ... { ");
            return False;
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"elif: should look like: elif ... { ");
        return False;
    }
}
Boolean ShutingYard_else(SuperALX* ll,TokenMap* tm){
    Token* if_tok = (Token*)Vector_Get(tm,0);
    Token* cbl_tok = (Token*)Vector_Get(tm,tm->size-1);
    
    if(tm->size==2){
        if(cbl_tok->tt==TOKEN_CURLY_BRACES_L){
            if(ll->ev.sc.range>0){
                Token* t = (Token*)Vector_Get(tm,0);
                Token_Free(t);
                Vector_Remove(tm,0);

                t = (Token*)Vector_Get(tm,tm->size-1);
                Token_Free(t);
                Vector_Remove(tm,tm->size-1);

                CStr nextlabel = SuperALX_Logic(ll,0,SUPERALX_ELSE,ll->ev.sc.range);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",nextlabel);
                CStr_Free(&nextlabel);

                ll->ev.sc.range++;
                CallPosition cp = CallPosition_New(TOKEN_SUPERALX_ELSE,ll->ev.iter);
                CallStack_Push(&ll->ev.cs,&cp);
                return False;
            }else{
                Compiler_ErrorHandler(&ll->ev,"else: global else isn't allowed!");
                return False;
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"else: should end with a { like: else { ");
            return False;
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"else: should look like: else { ");
        return False;
    }
}
Boolean ShutingYard_while(SuperALX* ll,TokenMap* tm){
    Token* while_tok = (Token*)Vector_Get(tm,0);
    Token* cbl_tok = (Token*)Vector_Get(tm,tm->size-1);
    
    if(tm->size>2){
        if(cbl_tok->tt==TOKEN_CURLY_BRACES_L){
            if(ll->ev.sc.range>0){
                Token* t = (Token*)Vector_Get(tm,0);
                Token_Free(t);
                Vector_Remove(tm,0);

                t = (Token*)Vector_Get(tm,tm->size-1);
                Token_Free(t);
                Vector_Remove(tm,tm->size-1);

                SuperALX_LogicAddPath(ll);
                CStr nextlabel = SuperALX_Logic(ll,0,SUPERALX_WHILE,ll->ev.sc.range);
                CStr otherlabel = SuperALX_Logic(ll,1,SUPERALX_WHILE,ll->ev.sc.range);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",nextlabel);

                Token btok = Token_By(TOKEN_STRING,SUPERALX_BOOL);
                SuperALX_Variable_Build_Decl(ll,btok.str,BOOL_TYPE);

                Vector_Add(tm,(Token[]){ Token_Cpy(&btok) },0);
                Vector_Add(tm,(Token[]){ Compiler_SetterToken(&ll->ev) },1);

                Boolean ret = Compiler_ShutingYard(&ll->ev,tm);
                SuperALX_IntoReg(ll,&btok,SUPERALX_REG_A_L8);
                Scope_DestroyVariable(&ll->ev.sc,btok.str);
                Token_Free(&btok);

                SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,0",SUPERALX_REG_A_L8);
                SuperALX_Indentation_Appendf(ll,&ll->text,"je %s",otherlabel);
                CStr_Free(&otherlabel);
                CStr_Free(&nextlabel);

                ll->ev.sc.range++;
                CallPosition cp = CallPosition_New(TOKEN_SUPERALX_WHILE,ll->ev.iter);
                CallStack_Push(&ll->ev.cs,&cp);
                return ret;
            }else{
                Compiler_ErrorHandler(&ll->ev,"while: global while isn't allowed!");
                return False;
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"while: should end with a { like: while ... { ");
            return False;
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"while: should look like: while ... { ");
        return False;
    }
}
Boolean ShutingYard_for(SuperALX* ll,TokenMap* tm){
    Token* for_tok = (Token*)Vector_Get(tm,0);
    Token* cbl_tok = (Token*)Vector_Get(tm,tm->size-1);
    
    if(tm->size>2){
        if(cbl_tok->tt==TOKEN_CURLY_BRACES_L){
            if(ll->ev.sc.range>0){
                Token* t = (Token*)Vector_Get(tm,0);
                Token_Free(t);
                Vector_Remove(tm,0);

                t = (Token*)Vector_Get(tm,tm->size-1);
                Token_Free(t);
                Vector_Remove(tm,tm->size-1);

                TokenMap statement_0 = TokenMap_SubToToken(tm,TOKEN_COMMA);
                TokenMap statement_up = TokenMap_SubFromToken(tm,TOKEN_COMMA);
                TokenMap statement_1 = TokenMap_SubToToken(&statement_up,TOKEN_COMMA);
                TokenMap statement_2 = TokenMap_SubFromToken(&statement_up,TOKEN_COMMA);
                TokenMap_Free(&statement_up);

                ll->ev.sc.range++;
                Compiler_Do(&ll->ev,&statement_0);
                TokenMap_Free(&statement_0);

                SuperALX_LogicAddPath(ll);
                CStr nextlabel = SuperALX_Logic(ll,0,SUPERALX_FOR,ll->ev.sc.range);
                CStr otherlabel = SuperALX_Logic(ll,1,SUPERALX_FOR,ll->ev.sc.range);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",nextlabel);

                Boolean ret = False;
                if(statement_1.size>0){
                   Token btok = Token_By(TOKEN_STRING,SUPERALX_BOOL);
                    SuperALX_Variable_Build_Decl(ll,btok.str,BOOL_TYPE);

                    Vector_Add(&statement_1,(Token[]){ Token_Cpy(&btok) },0);
                    Vector_Add(&statement_1,(Token[]){ Compiler_SetterToken(&ll->ev) },1);

                    ret = Compiler_ShutingYard(&ll->ev,&statement_1);
                    SuperALX_IntoReg(ll,&btok,SUPERALX_REG_A_L8);
                    Scope_DestroyVariable(&ll->ev.sc,btok.str);
                    Token_Free(&btok); 

                    SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,0",SUPERALX_REG_A_L8);
                    SuperALX_Indentation_Appendf(ll,&ll->text,"je %s",otherlabel);
                }
                TokenMap_Free(&statement_1);
                
                CStr_Free(&otherlabel);
                CStr_Free(&nextlabel);

                ll->ev.sc.range++;
                CallPosition cp = CallPosition_Make(statement_2,TOKEN_SUPERALX_FOR,ll->ev.iter,NULL,ll->ev.sc.range);
                CallStack_Push(&ll->ev.cs,&cp);
                return ret;
            }else{
                Compiler_ErrorHandler(&ll->ev,"for: global for isn't allowed!");
                return False;
            }
        }else{
            //TokenMap_Print(tm);
            Compiler_ErrorHandler(&ll->ev,"for: should end with a { like: for ..., ..., ... { ");
            return False;
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"for: should look like: for ..., ..., ... { ");
        return False;
    }
}

Boolean ShutingYard_Curly_L(SuperALX* ll,TokenMap* tm){
    SuperALX_LogicAddPath(ll);
    ll->ev.sc.range++;
    CallPosition cp = CallPosition_New(TOKEN_NONE,ll->ev.iter);
    CallStack_Push(&ll->ev.cs,&cp);
    return False;
}
Boolean ShutingYard_Curly_R(SuperALX* ll,TokenMap* tm){
    TT_Type tt = CallStack_Back(&ll->ev.cs);

    switch (tt){
    case TOKEN_FUNCTIONDECL:
        Function* f = SuperALX_FunctionIn(ll);
        
        Scope_To(&ll->ev.sc,1);
        Scope_Pop(&ll->ev.sc);

        ll->stack += SuperALX_Bytes(ll);//Return Address
        SuperALX_Indentation_Append(ll,&ll->text,"ret\n");

        SuperALX_Indentation_To(ll,SUPERALX_INDENTATION_NONE);
        String_Append(&ll->text,"\n");
        break;
    case TOKEN_SUPERALX_IMPL:
        break;
    case TOKEN_SUPERALX_NAMESPACE:
        break;
    case TOKEN_SUPERALX_IF:
        Scope_Pop(&ll->ev.sc);
        ll->logic = TOKEN_SUPERALX_IF;
        break;
    case TOKEN_SUPERALX_ELIF:
        Scope_Pop(&ll->ev.sc);
        ll->logic = TOKEN_SUPERALX_ELIF;
        break;
    case TOKEN_SUPERALX_ELSE:
        Scope_Pop(&ll->ev.sc);
        ll->logic = TOKEN_SUPERALX_ELSE;
        break;
    case TOKEN_SUPERALX_WHILE:
        Scope_Pop(&ll->ev.sc);
        ll->logic = TOKEN_SUPERALX_WHILE;
        break;
    case TOKEN_SUPERALX_FOR:
        CallPosition* cp = (CallPosition*)Vector_Get(&ll->ev.cs,ll->ev.cs.size-2);
        Compiler_Do(&ll->ev,&cp->tm);

        Scope_Pop(&ll->ev.sc);
        ll->logic = TOKEN_SUPERALX_FOR;
        break;
    case TOKEN_NONE:
        Scope_Pop(&ll->ev.sc);
        break;
    default:
        Compiler_ErrorHandler(&ll->ev,"Call Stack top type is not defined!");
        break;
    }
    CallStack_Pop(&ll->ev.cs);
    return False;
}
Boolean ShutingYard_Struct(SuperALX* ll,TokenMap* tm){
    return False;
}
Boolean ShutingYard_Impl(SuperALX* ll,TokenMap* tm){
    Token* t_impl = (Token*)Vector_Get(tm,0);
    Token* t_name = (Token*)Vector_Get(tm,1);
    
    if(t_name->tt==TOKEN_TYPE){
        CallPosition cp =  CallPosition_New_N(TOKEN_SUPERALX_IMPL,ll->ev.iter,t_name->str);
        CallStack_Push(&ll->ev.cs,&cp);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Impl: name of impl doesn't exist!");
    }
    return False;
}
Boolean ShutingYard_Namespace(SuperALX* ll,TokenMap* tm){
    Token* t_impl = (Token*)Vector_Get(tm,0);
    Token* t_name = (Token*)Vector_Get(tm,1);
    
    if(t_name->tt==TOKEN_STRING){
        CallPosition cp =  CallPosition_New_N(TOKEN_SUPERALX_NAMESPACE,ll->ev.iter,t_name->str);
        CallStack_Push(&ll->ev.cs,&cp);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Impl: name of impl doesn't exist!");
    }
    return False;
}
Boolean ShutingYard_function(SuperALX* ll,TokenMap* tm){
    Token* tfunc = (Token*)Vector_Get(tm,0);
    
    TT_Iter it_func = FunctionMap_Find(&ll->ev.fs,tfunc->str);
    if(it_func>=0){
        Function* f = (Function*)Vector_Get(&ll->ev.fs,it_func);

        ll->ev.sc.range++;

        Type* t = Scope_FindType(&ll->ev.sc,f->rettype);
        if(t){
            SuperALX_Variable_Build_Ref(ll,COMPILER_RETURN"0",f->rettype);
            
            for(int i = 0;i<f->params.size;i++){
                Member* m = (Member*)Vector_Get(&f->params,i);
                SuperALX_Variable_Build_Ref(ll,m->name,m->type);
            }
            ll->stack += SuperALX_Bytes(ll);//Return Address
            ll->ev.sc.range++;
        }

        SuperALX_Indentation_To(ll,SUPERALX_INDENTATION_FUNCTION);
        
        CStr fname = SuperALX_FunctionName(ll,tfunc->str);
        String_Appendf(&ll->text,"%s:\n",fname);
        CStr_Free(&fname);

        CallPosition cp = CallPosition_New_N(TOKEN_FUNCTIONDECL,ll->ev.iter,tfunc->str);
        CallStack_Push(&ll->ev.cs,&cp);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Function -> %s not defined!",tfunc->str);
    }

    return False;
}
Boolean ShutingYard_return(SuperALX* ll,TokenMap* tm){
    if(tm->size!=1){
        TokenMap cpy = TokenMap_Cpy(tm);
        Variable* v = Scope_FindVariable(&ll->ev.sc,COMPILER_RETURN"0");
        
        if(v){
            Vector_Remove(&cpy,0);
            Vector_Add(&cpy,(Token[]){ Token_By(TOKEN_STRING,v->name) },0);
            Vector_Add(&cpy,(Token[]){ Token_By(TOKEN_SUPERALX_ASS,"=") },1);
        }else{
            Compiler_ErrorHandler(&ll->ev,"return: return value doesn't exist!");
            TokenMap_Free(&cpy);
            return False;
        }

        Compiler_ShutingYard(&ll->ev,&cpy);
        TokenMap_Free(&cpy);
    }

    Scope_FromTo_DestroyOnly(&ll->ev.sc,1,ll->ev.sc.range);
    
    /*Function* f = Compiler_FunctionIn(&ll->ev);
    if(f && f->params.size>0){
        CStr retaddress = SuperALX_StackDir(ll,8,0);
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov rax,%s",retaddress);
        CStr_Free(&retaddress);
        SuperALX_Indentation_Appendf(ll,&ll->text,"add rsp,%d",SuperALX_Bytes(ll));
        Scope_Range_DestroyOnly(&ll->ev.sc,1);
        SuperALX_Indentation_Appendf(ll,&ll->text,"push rax");
    }*/
    
    ll->stack += SuperALX_Bytes(ll);//Return Address
    SuperALX_Indentation_Append(ll,&ll->text,"ret\n");

    return False;
}
Boolean ShutingYard_Decl(SuperALX* ll,TokenMap* tm){
    if(tm->size >= 2){
        Token* pottype = (Token*)Vector_Get(tm,0);
        Token* name = (Token*)Vector_Get(tm,1);
        
        if(name->tt==TOKEN_STRING){
            if(!CStr_Cmp(name->str,SUPERALX_SELF)){
                SuperALX_Variable_Build_Decl(ll,name->str,pottype->str);
                if(tm->size>2){
                    if(ll->ev.sc.range>0){
                        Token* t = (Token*)Vector_Get(tm,0);
                        Token_Free(t);
                        Vector_Remove(tm,0);
                        Boolean ret = Compiler_ShutingYard(&ll->ev,tm);
                        return ret;
                    }else{
                        Compiler_ErrorHandler(&ll->ev,"decl: global variable can't be set like this!");
                        return False;
                    }
                }
            }else   Compiler_ErrorHandler(&ll->ev,"decl: name self is not allowed for decl!");
        }else{
            Compiler_ErrorHandler(&ll->ev,"decl: name of decl variable doesn't exist!");
            return False;
        }
    }
    return False;
}

Boolean ShutingYard_Assembly(SuperALX* ll,TokenMap* tm){
    CStr indent = SuperALX_Indentation_CStr(ll);
    String_Append(&ll->text,indent);
    CStr_Free(&indent);
    
    for(int i = 1;i<tm->size;i++){
        Token* t = (Token*)Vector_Get(tm,i);

        if(t->tt==TOKEN_CONSTSTRING_DOUBLE) String_Append(&ll->text,t->str);
        else if(t->tt==TOKEN_NUMBER)        String_Append(&ll->text,t->str);
        else if(t->tt==TOKEN_FLOAT)         String_Append(&ll->text,t->str);
        else if(t->tt==TOKEN_STRING){
            CStr location = SuperALX_Location(ll,t->str);
            String_Append(&ll->text,location);
            CStr_Free(&location);
        }else{
            Compiler_ErrorHandler(&ll->ev,"asm: assembly keyword can't handle: %s!",t->str);
        }
    }
    String_AppendChar(&ll->text,'\n');
    return False;
}

Boolean ShutingYard_FunctionCall_Acs(SuperALX* ll,TokenMap* tm,int i,int args,Token* tok){
    if(i - args >= 0 && i - args + 1 < tm->size){
        Token* accssed = (Token*)Vector_Get(tm,i - args);
        Token* func = (Token*)Vector_Get(tm,i - args + 1);

        if(func->tt==TOKEN_FUNCTION){
            Variable* v = Scope_FindVariable(&ll->ev.sc,accssed->str);

            if(v){
                CStr type = SuperALX_TypeOfDref(ll,v->typename);
                CStr oldname = CStr_Cpy(func->str);
                CStr newname = CStr_Format("%s::%s",type,func->str);
                CStr_Set((char**)&func->str,newname);

                TT_Iter it_f = FunctionMap_Find(&ll->ev.fs,func->str);
                if(it_f>=0){
                    TokenMap acs = TokenMap_Make((Token[]){
                        Token_By(TOKEN_SUPERALX_ADR,"&"),
                        Token_Cpy(accssed),
                        Token_Null()
                    });

                    Vector_Add(func->args,&acs,0);
                }else{
                    CStr_Set((char**)&func->str,oldname);
                }

                CStr_Free(&newname);
                CStr_Free(&oldname);
                CStr_Free(&type);

                it_f = FunctionMap_Find(&ll->ev.fs,func->str);
                if(it_f>=0){
                    Function* f = (Function*)Vector_Get(&ll->ev.fs,it_f);

                    if(f->access || CStr_Cmp(accssed->str,SUPERALX_SELF)){
                        Boolean ret = Compiler_FunctionCall(&ll->ev,func);
                        if(!ret){
                            CStr retstr = Compiler_Variablename_This(&ll->ev,COMPILER_RETURN,7);
                            *tok = Token_Move(TOKEN_STRING,retstr);
                        }
                        return ret;
                    }else{
                        Compiler_ErrorHandler(&ll->ev,"Function: %s isn't pub or non self %s tries to access!",func->str,accssed->str);
                        return FUNCTIONRT_NONE;
                    }
                }
            }
        } 
    }
        
    return FUNCTIONRT_NONE;
}
Boolean ShutingYard_FunctionCall_Arw(SuperALX* ll,TokenMap* tm,int i,int args,Token* tok){
    Token* accssed = (Token*)Vector_Get(tm,i - args);
    Token* func = (Token*)Vector_Get(tm,i - args + 1);

    if(func->tt==TOKEN_FUNCTION){
        Variable* v = Scope_FindVariable(&ll->ev.sc,accssed->str);

        if(v){
            CStr type = SuperALX_TypeOfPointer(ll,v->typename);
            CStr oldname = CStr_Cpy(func->str);
            CStr newname = CStr_Format("%s::%s",type,func->str);
            CStr_Set((char**)&func->str,newname);

            TT_Iter it_f = FunctionMap_Find(&ll->ev.fs,func->str);
            if(it_f>=0){
                TokenMap acs = TokenMap_Make((Token[]){
                    Token_Cpy(accssed),
                    Token_Null()
                });

                Vector_Add(func->args,&acs,0);
            }else{
                CStr_Set((char**)&func->str,oldname);
            }

            CStr_Free(&newname);
            CStr_Free(&oldname);
            CStr_Free(&type);

            it_f = FunctionMap_Find(&ll->ev.fs,func->str);
            if(it_f>=0){
                Function* f = (Function*)Vector_Get(&ll->ev.fs,it_f);
                if(f->access || CStr_Cmp(accssed->str,SUPERALX_SELF)){
                    Boolean ret = Compiler_FunctionCall(&ll->ev,func);
                    if(!ret){
                        CStr retstr = Compiler_Variablename_This(&ll->ev,COMPILER_RETURN,7);
                        *tok = Token_Move(TOKEN_STRING,retstr);
                    }
                    return ret;
                }else{
                    Compiler_ErrorHandler(&ll->ev,"Function: %s isn't pub or non self %s tries to access!",func->str,accssed->str);
                    return FUNCTIONRT_NONE;
                }
            }
        }
    }
        
    return FUNCTIONRT_NONE;
}

void SuperALX_Function_Handler(SuperALX* ll,Token* t,Function* f){
    if(t->tt==TOKEN_FUNCTION){
        if(f->pos>=0){
            CStr functionname = SuperALX_FunctionName(ll,f->name);
            SuperALX_Indentation_Appendf(ll,&ll->text,"call %s",functionname);
            CStr_Free(&functionname);
        }else{
            CStr location = SuperALX_Location(ll,f->name);
            SuperALX_Indentation_Appendf(ll,&ll->text,"call %s",location);
            CStr_Free(&location);
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"Function: %s doesn't exist!",t->str);
    }
}

SuperALX SuperALX_New(char* dllpath,char* src,char* output,char bits) {
    SuperALX ll;
    ll.ev = Compiler_New(
        KeywordMap_Make((KeywordRP[]){
            KeywordRP_New("return",TOKEN_SUPERALX_RETURN),
            KeywordRP_New("if",TOKEN_SUPERALX_IF),
            KeywordRP_New("elif",TOKEN_SUPERALX_ELIF),
            KeywordRP_New("else",TOKEN_SUPERALX_ELSE),
            KeywordRP_New("while",TOKEN_SUPERALX_WHILE),
            KeywordRP_New("for",TOKEN_SUPERALX_FOR),
            KeywordRP_New("import",TOKEN_SUPERALX_IMPORT),
            KeywordRP_New("const",TOKEN_SUPERALX_CONST),
            KeywordRP_New("struct",TOKEN_SUPERALX_STRUCT),
            KeywordRP_New("impl",TOKEN_SUPERALX_IMPL),
            KeywordRP_New("namespace",TOKEN_SUPERALX_NAMESPACE),
            KeywordRP_New("define",TOKEN_SUPERALX_DEFINE),
            KeywordRP_New("asm",TOKEN_SUPERALX_ASMBY),
            KeywordRP_New("sizeof",TOKEN_SUPERALX_SIZE),
            KeywordRP_New("pub",TOKEN_SUPERALX_PUB),
            KeywordRP_New("false",TOKEN_SUPERALX_BOOLEAN),
            KeywordRP_New("true",TOKEN_SUPERALX_BOOLEAN),
            KEYWORD_END
        }),
        OperatorMap_Make((OperatorRP[]){
            OperatorRP_Make((TT_Type[]){ TOKEN_EQUAL_SIGN,TOKEN_END },                                      TOKEN_SUPERALX_ASS,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_PLUS_SIGN,TOKEN_END },                                       TOKEN_SUPERALX_ADD,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_MINUS_SIGN,TOKEN_END },                                      TOKEN_SUPERALX_SUB,1),
            OperatorRP_Make((TT_Type[]){ TOKEN_ASTERISK,TOKEN_END },                                        TOKEN_SUPERALX_MUL,1),
            OperatorRP_Make((TT_Type[]){ TOKEN_SLASH,TOKEN_END },                                           TOKEN_SUPERALX_DIV,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_MINUS_SIGN,TOKEN_END },                                      TOKEN_SUPERALX_NEG,0),

            OperatorRP_Make((TT_Type[]){ TOKEN_AMPERSAND,TOKEN_END },                                       TOKEN_SUPERALX_AND,1),
            OperatorRP_Make((TT_Type[]){ TOKEN_PIPE,TOKEN_END },                                            TOKEN_SUPERALX_OR,1),
            OperatorRP_Make((TT_Type[]){ TOKEN_CARET,TOKEN_END },                                           TOKEN_SUPERALX_XOR,1),
            OperatorRP_Make((TT_Type[]){ TOKEN_TILDE,TOKEN_END },                                           TOKEN_SUPERALX_NOT,0),

            OperatorRP_Make((TT_Type[]){ TOKEN_AMPERSAND,TOKEN_AMPERSAND,TOKEN_END },                       TOKEN_SUPERALX_LND,1),
            OperatorRP_Make((TT_Type[]){ TOKEN_PIPE,TOKEN_PIPE,TOKEN_END },                                 TOKEN_SUPERALX_LOR,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_EXCLAMATION_MARK,TOKEN_END },                                TOKEN_SUPERALX_LOT,ARGS_IGNORE),

            OperatorRP_Make((TT_Type[]){ TOKEN_AMPERSAND,TOKEN_END },                                       TOKEN_SUPERALX_ADR,0),
            OperatorRP_Make((TT_Type[]){ TOKEN_ASTERISK,TOKEN_END },                                        TOKEN_SUPERALX_DRF,0),

            OperatorRP_Make((TT_Type[]){ TOKEN_PERCENT,TOKEN_END },                                         TOKEN_SUPERALX_MOD,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_PLUS_SIGN,TOKEN_PLUS_SIGN,TOKEN_END },                       TOKEN_SUPERALX_INC,0),
            OperatorRP_Make((TT_Type[]){ TOKEN_MINUS_SIGN,TOKEN_MINUS_SIGN,TOKEN_END },                     TOKEN_SUPERALX_DEC,0),

            OperatorRP_Make((TT_Type[]){ TOKEN_ANGLE_BRACKETS_L,TOKEN_ANGLE_BRACKETS_L,TOKEN_END },         TOKEN_SUPERALX_SHL,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ANGLE_BRACKETS_R,TOKEN_ANGLE_BRACKETS_R,TOKEN_END },         TOKEN_SUPERALX_SHR,ARGS_IGNORE),

            OperatorRP_Make((TT_Type[]){ TOKEN_EQUAL_SIGN,TOKEN_EQUAL_SIGN,TOKEN_END },                     TOKEN_SUPERALX_EQU,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_EXCLAMATION_MARK,TOKEN_EQUAL_SIGN,TOKEN_END },               TOKEN_SUPERALX_NEQ,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ANGLE_BRACKETS_L,TOKEN_END },                                TOKEN_SUPERALX_LES,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ANGLE_BRACKETS_R,TOKEN_END },                                TOKEN_SUPERALX_GRT,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ANGLE_BRACKETS_L,TOKEN_EQUAL_SIGN,TOKEN_END },               TOKEN_SUPERALX_LEQ,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ANGLE_BRACKETS_R,TOKEN_EQUAL_SIGN,TOKEN_END },               TOKEN_SUPERALX_GRQ,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_PERIOD,TOKEN_END },                                          TOKEN_SUPERALX_ACS,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_MINUS_SIGN,TOKEN_ANGLE_BRACKETS_R,TOKEN_END },               TOKEN_SUPERALX_ARW,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_COLON,TOKEN_END },                                           TOKEN_SUPERALX_DDOT,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_COLON,TOKEN_COLON,TOKEN_END },                               TOKEN_SUPERALX_DDDOT,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_SQUARE_BRACKETS_L,TOKEN_END },                               TOKEN_SUPERALX_SUBS,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_SQUARE_BRACKETS_R,TOKEN_END },                               TOKEN_SUPERALX_SUBSR,ARGS_IGNORE),

            OperatorRP_Make((TT_Type[]){ TOKEN_PLUS_SIGN,TOKEN_EQUAL_SIGN,TOKEN_END },                      TOKEN_SUPERALX_ASD,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_MINUS_SIGN,TOKEN_EQUAL_SIGN,TOKEN_END },                     TOKEN_SUPERALX_ASU,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ASTERISK,TOKEN_EQUAL_SIGN,TOKEN_END },                       TOKEN_SUPERALX_ASM,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_SLASH,TOKEN_EQUAL_SIGN,TOKEN_END },                          TOKEN_SUPERALX_ASV,ARGS_IGNORE),
    
            OperatorRP_Make((TT_Type[]){ TOKEN_SLASH,TOKEN_SLASH,TOKEN_END },                               TOKEN_SUPERALX_LINECOMMENT,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_SLASH,TOKEN_ASTERISK,TOKEN_END },                            TOKEN_SUPERALX_BLOCKCOMMENTSTART,ARGS_IGNORE),
            OperatorRP_Make((TT_Type[]){ TOKEN_ASTERISK,TOKEN_SLASH,TOKEN_END },                            TOKEN_SUPERALX_BLOCKCOMMENTEND,ARGS_IGNORE),
            OperatorRP_End()
        }),
        DirectiveMap_Make((Directive[]){
            Directive_End()
        }),
        DirectiveMap_Make((Directive[]){
            Directive_Comment_Line(TOKEN_SUPERALX_LINECOMMENT),
            Directive_Comment_Block(TOKEN_SUPERALX_BLOCKCOMMENTSTART,TOKEN_SUPERALX_BLOCKCOMMENTEND,True),
            Directive_Remove(TOKEN_NEWLINE),
            Directive_Remove(TOKEN_CARTURN),
            Directive_Remove(TOKEN_HTAB),
            Directive_Remove(TOKEN_VTAB),
            Directive_End()
        }),
        ReseterMap_Make((Reseter[]){ 
            // operators who might have two versions: 1 arg vs. 2 args are not listed: -
            { TOKEN_NONE,RESETER_NONE },
            { TOKEN_NUMBER,RESETER_ADD1 },
            { TOKEN_FLOAT,RESETER_ADD1 },
            { TOKEN_STRING,RESETER_ADD1 },
            { TOKEN_TYPE,RESETER_RST },
            
            { TOKEN_SPACE,RESETER_NONE },
            { TOKEN_NEWLINE,RESETER_RST },// without semicolon like python
            { TOKEN_CARTURN,RESETER_NONE },
            { TOKEN_HTAB,RESETER_NONE },
            { TOKEN_VTAB,RESETER_NONE },
    
            { TOKEN_COMMA,RESETER_RST },

            { TOKEN_PARENTHESES_R,RESETER_TO1 },
            { TOKEN_SUPERALX_SUBSR,RESETER_NONE },
            { TOKEN_CURLY_BRACES_R,RESETER_NONE },
            //{ TOKEN_ANGLE_BRACKETS_R,RESETER_NONE }, //also < and > operator
            { TOKEN_DOUBLE_ANGLE_BRACKETS_R,RESETER_NONE },
            { TOKEN_WHITE_SQUARE_BRACKETS_R,RESETER_NONE },
            
            { TOKEN_PARENTHESES_L,RESETER_RST },
            { TOKEN_SQUARE_BRACKETS_L,RESETER_RST },
            { TOKEN_CURLY_BRACES_L,RESETER_RST },
            //{ TOKEN_ANGLE_BRACKETS_L,RESETER_RST }, //also < and > operator
            { TOKEN_DOUBLE_ANGLE_BRACKETS_L,RESETER_RST },
            { TOKEN_WHITE_SQUARE_BRACKETS_L,RESETER_RST },
            { TOKEN_SEMICOLON,RESETER_RST },
            { TOKEN_COLON,RESETER_RST },
            { TOKEN_EXCLAMATION_MARK,RESETER_RST },
            { TOKEN_QUESTION_MARK,RESETER_RST },
            { TOKEN_ELLIPSIS,RESETER_RST },
            { TOKEN_PLUS_SIGN,RESETER_RST },
            { TOKEN_MULTIPLICATION_SIGN,RESETER_RST },
            { TOKEN_DIVISION_SIGN,RESETER_RST },
            { TOKEN_EQUAL_SIGN,RESETER_RST },
            { TOKEN_NOT_EQUAL_SIGN,RESETER_RST },
            { TOKEN_LESS_THAN,RESETER_RST },
            { TOKEN_GREATER_THAN,RESETER_RST },
            { TOKEN_LESS_THAN_OR_EQUAL_TO,RESETER_RST },
            { TOKEN_GREATER_THAN_OR_EQUAL_TO,RESETER_RST },
            { TOKEN_APPROXIMATION_SIGN,RESETER_RST },
            { TOKEN_PLUS_MINUS_SIGN,RESETER_RST },
            { TOKEN_AMPERSAND,RESETER_RST },
            { TOKEN_AT_SIGN,RESETER_RST },
            { TOKEN_ASTERISK,RESETER_RST },
            { TOKEN_CARET,RESETER_RST },
            { TOKEN_TILDE,RESETER_RST },
            { TOKEN_SLASH,RESETER_RST },
            { TOKEN_BACKSLASH,RESETER_RST },
            { TOKEN_UNDERSCORE,RESETER_RST },
            { TOKEN_PIPE,RESETER_RST },
            { TOKEN_PERCENT,RESETER_RST },
            { TOKEN_HASH_POUND_SIGN,RESETER_RST },
            { TOKEN_SINGLE_QUOTE,RESETER_RST },
            { TOKEN_DOUBLE_QUOTE,RESETER_RST },
            { TOKEN_BACKTICK,RESETER_RST },
            { TOKEN_PRIME,RESETER_RST },
            { TOKEN_DOUBLE_PRIME,RESETER_RST },
            { TOKEN_SECTION_SYMBOL,RESETER_RST },
            { TOKEN_DEGREE_SYMBOL,RESETER_RST },
            { TOKEN_FRACTION_SLASH,RESETER_RST },
            { TOKEN_INTERROBANG,RESETER_RST },
            { TOKEN_BULLET_POINT,RESETER_RST },
    
            { TOKEN_CAST,RESETER_ADD1 },
            { TOKEN_FUNCTION,RESETER_ADD1 },
            { TOKEN_CONSTSTRING_SINGLE,RESETER_ADD1 },
            { TOKEN_CONSTSTRING_DOUBLE,RESETER_ADD1 },

            { TOKEN_SUPERALX_RETURN,RESETER_RST },
            { TOKEN_END,RESETER_RST }
        }),
        ShutingYard_New(
            PrecedenceMap_Make((Precedencer[]){
                Precedencer_New(TOKEN_SUPERALX_ASS,1),
                Precedencer_New(TOKEN_SUPERALX_ADD,6),
                Precedencer_New(TOKEN_SUPERALX_SUB,5),
                Precedencer_New(TOKEN_SUPERALX_MUL,7),
                Precedencer_New(TOKEN_SUPERALX_DIV,8),
                Precedencer_New(TOKEN_SUPERALX_MOD,9),
                Precedencer_New(TOKEN_SUPERALX_NEG,12),
                Precedencer_New(TOKEN_SUPERALX_INC,12),
                Precedencer_New(TOKEN_SUPERALX_DEC,12),

                Precedencer_New(TOKEN_SUPERALX_AND,7),
                Precedencer_New(TOKEN_SUPERALX_OR,7),
                Precedencer_New(TOKEN_SUPERALX_XOR,7),
                Precedencer_New(TOKEN_SUPERALX_NOT,8),

                Precedencer_New(TOKEN_SUPERALX_LND,2),
                Precedencer_New(TOKEN_SUPERALX_LOR,2),
                Precedencer_New(TOKEN_SUPERALX_LOT,4),

                Precedencer_New(TOKEN_SUPERALX_SHL,7),
                Precedencer_New(TOKEN_SUPERALX_SHR,7),

                Precedencer_New(TOKEN_SUPERALX_EQU,4),
                Precedencer_New(TOKEN_SUPERALX_NEQ,4),
                Precedencer_New(TOKEN_SUPERALX_LES,4),
                Precedencer_New(TOKEN_SUPERALX_GRT,4),
                Precedencer_New(TOKEN_SUPERALX_LEQ,4),
                Precedencer_New(TOKEN_SUPERALX_GRQ,4),

                Precedencer_New(TOKEN_SUPERALX_ACS,13), 
                Precedencer_New(TOKEN_SUPERALX_ARW,13),
                Precedencer_New(TOKEN_SUPERALX_ADR,10),
                Precedencer_New(TOKEN_SUPERALX_DRF,10),
                Precedencer_New(TOKEN_SUPERALX_DDOT,PRECEDENCE_DONTCARE),
                Precedencer_New(TOKEN_SUPERALX_DDDOT,PRECEDENCE_DONTCARE),
                Precedencer_New(TOKEN_SUPERALX_SUBS,13),

                Precedencer_New(TOKEN_SUPERALX_ASD,1),
                Precedencer_New(TOKEN_SUPERALX_ASU,1),
                Precedencer_New(TOKEN_SUPERALX_ASM,1),
                Precedencer_New(TOKEN_SUPERALX_ASV,1),

                Precedencer_New(TOKEN_CAST,9),
                Precedencer_New(TOKEN_SUPERALX_SIZE,13),
                Precedencer_New(TOKEN_PARENTHESES_L,PRECEDENCE_BRACKL),
                Precedencer_New(TOKEN_PARENTHESES_R,PRECEDENCE_BRACKR),
                Precedencer_New(TOKEN_SUPERALX_LINECOMMENT,PRECEDENCE_DONTCARE),
                Precedencer_New(TOKEN_SUPERALX_BLOCKCOMMENTSTART,PRECEDENCE_DONTCARE),
                Precedencer_New(TOKEN_SUPERALX_BLOCKCOMMENTEND,PRECEDENCE_DONTCARE),
                Precedencer_End
            }),
            ExecuteMap_Make((Executer[]){
                Executer_New(TOKEN_SUPERALX_ASS,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_ADD,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_SUB,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_MUL,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_DIV,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_MOD,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_NEG,1,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_INC,1,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_DEC,1,Scope_StdHandler),

                Executer_New(TOKEN_SUPERALX_AND,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_OR,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_XOR,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_NOT,1,Scope_StdHandler),

                Executer_New(TOKEN_SUPERALX_LND,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_LOR,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_LOT,1,Scope_StdHandler),

                Executer_New(TOKEN_SUPERALX_SHL,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_SHR,2,Scope_StdHandler),

                Executer_New(TOKEN_SUPERALX_EQU,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_NEQ,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_LES,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_GRT,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_LEQ,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_GRQ,2,Scope_StdHandler),

                Executer_New(TOKEN_SUPERALX_ACS,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_ARW,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_ADR,1,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_DRF,1,Scope_StdHandler),
                
                Executer_New(TOKEN_SUPERALX_DDOT,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_DDDOT,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_SUBS,2,Scope_StdHandler),

                Executer_New(TOKEN_SUPERALX_ASD,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_ASU,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_ASM,2,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_ASV,2,Scope_StdHandler),

                Executer_New(TOKEN_CAST,1,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_SIZE,1,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_LINECOMMENT,ARGS_IGNORE,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_BLOCKCOMMENTSTART,ARGS_IGNORE,Scope_StdHandler),
                Executer_New(TOKEN_SUPERALX_BLOCKCOMMENTEND,ARGS_IGNORE,Scope_StdHandler),
                Executer_End
            }),
            PreexecuteMap_Make((Preexecuter[]){
                Preexecuter_New(TOKEN_SUPERALX_ACS,(void*)ShutingYard_FunctionCall_Acs),
                Preexecuter_New(TOKEN_SUPERALX_ARW,(void*)ShutingYard_FunctionCall_Arw),
                Preexecuter_End
            })
        ),
        Scope_Make(
            (StdConstType[]){
                StdConstType_New(TOKEN_NUMBER,I64_TYPE),
                StdConstType_New(TOKEN_FLOAT,F64_TYPE),
                StdConstType_New(TOKEN_SUPERALX_BOOLEAN,BOOL_TYPE),
                StdConstType_New(TOKEN_CONSTSTRING_DOUBLE,STR_TYPE),
                StdConstType_New(TOKEN_FUNCTIONPOINTER,NULL_TYPE),
                STDCONSTTYPE_END
            },
            VariableMap_Make((Variable[]){
                //Variable_Make("z","int",(Number[]){ 69 },8,0,NULL,NULL),
                //Variable_Make("b","int",(Number[]){ 31 },8,0),
                VARIABLE_END
            }),
            TypeMap_Make((Type[]){
                TYPE_END
            }),
        (void*)Enviroment_ErrorHandler),
        RangeChangerMap_Make((RangeChanger[]){
            //RangeChanger_New(TOKEN_SUPERALX_IF,1),
            //RangeChanger_New(TOKEN_SUPERALX_WHILE,1),
            //RangeChanger_New(TOKEN_SUPERALX_FOR,1),
            //RangeChanger_New(TOKEN_CURLY_BRACES_L,-1),
            //RangeChanger_New(TOKEN_CURLY_BRACES_R,-1),
            RANGECHANGER_END
        }),
        ExternPackageMap_Make((ExternPackage[]){
            EXTERNPACKAGE_END
        }),
        KeywordExecuterMap_Make((KeywordExecuter[]){
            KeywordExecuter_New(TOKEN_TYPE,                 (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_STRING,               (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_PARENTHESES_L,        (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_RETURN,      (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_IF,          (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_ELIF,        (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_ELSE,        (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_WHILE,       (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_FOR,         (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_PARENTHESES_L,        (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_DRF,         (void*)ShutingYard_compress),
            KeywordExecuter_New(TOKEN_SUPERALX_PUB,         (void*)ShutingYard_compress),

            KeywordExecuter_New(TOKEN_SUPERALX_STRUCT,      (void*)ShutingYard_compress_staticmethods),
            KeywordExecuter_New(TOKEN_SUPERALX_STRUCT,      (void*)ShutingYard_compress_pointer),
            KeywordExecuter_New(TOKEN_SUPERALX_IMPL,        (void*)ShutingYard_compress_staticmethods),
            KeywordExecuter_New(TOKEN_SUPERALX_IMPL,        (void*)ShutingYard_compress_pointer),

            KeywordExecuter_New(TOKEN_SUPERALX_STRUCT,      (void*)ShutingYard_PP_Struct),
            KeywordExecuter_New(TOKEN_SUPERALX_IMPL,        (void*)ShutingYard_PP_Impl),
            KeywordExecuter_New(TOKEN_SUPERALX_NAMESPACE,   (void*)ShutingYard_PP_Namespace),
            KeywordExecuter_New(TOKEN_SUPERALX_IF,          (void*)ShutingYard_PP_if),
            KeywordExecuter_New(TOKEN_SUPERALX_ELIF,        (void*)ShutingYard_PP_elif),
            KeywordExecuter_New(TOKEN_SUPERALX_ELSE,        (void*)ShutingYard_PP_else),
            KeywordExecuter_New(TOKEN_SUPERALX_WHILE,       (void*)ShutingYard_PP_while),
            KeywordExecuter_New(TOKEN_SUPERALX_FOR,         (void*)ShutingYard_PP_for),
            KeywordExecuter_New(TOKEN_CURLY_BRACES_L,       (void*)ShutingYard_PP_Curly_L),
            KeywordExecuter_New(TOKEN_CURLY_BRACES_R,       (void*)ShutingYard_PP_Curly_R),
            KeywordExecuter_New(TOKEN_SUPERALX_IMPORT,      (void*)ShutingYard_Import),
            KeywordExecuter_New(TOKEN_SUPERALX_DEFINE,      (void*)ShutingYard_Define),
            KEYWORDEXECUTER_END
        }),
        KeywordExecuterMap_Make((KeywordExecuter[]){
            KeywordExecuter_New(TOKEN_TYPE,                 (void*)ShutingYard_Decl),
            KeywordExecuter_New(TOKEN_PARENTHESES_L,        (void*)Compiler_ShutingYard),
            KeywordExecuter_New(TOKEN_SUPERALX_DRF,         (void*)Compiler_ShutingYard),
            KeywordExecuter_New(TOKEN_CURLY_BRACES_L,       (void*)ShutingYard_Curly_L),
            KeywordExecuter_New(TOKEN_CURLY_BRACES_R,       (void*)ShutingYard_Curly_R),
            KeywordExecuter_New(TOKEN_SUPERALX_IF,          (void*)ShutingYard_if),
            KeywordExecuter_New(TOKEN_SUPERALX_ELIF,        (void*)ShutingYard_elif),
            KeywordExecuter_New(TOKEN_SUPERALX_ELSE,        (void*)ShutingYard_else),
            KeywordExecuter_New(TOKEN_SUPERALX_WHILE,       (void*)ShutingYard_while),
            KeywordExecuter_New(TOKEN_SUPERALX_FOR,         (void*)ShutingYard_for),
            KeywordExecuter_New(TOKEN_SUPERALX_RETURN,      (void*)ShutingYard_return),
            KeywordExecuter_New(TOKEN_SUPERALX_STRUCT,      (void*)ShutingYard_Struct),
            KeywordExecuter_New(TOKEN_SUPERALX_IMPL,        (void*)ShutingYard_Impl),
            KeywordExecuter_New(TOKEN_SUPERALX_NAMESPACE,   (void*)ShutingYard_Namespace),
            KeywordExecuter_New(TOKEN_FUNCTIONDECL,         (void*)ShutingYard_function),
            KeywordExecuter_New(TOKEN_SUPERALX_ASMBY,       (void*)ShutingYard_Assembly),
            KEYWORDEXECUTER_END
        }),
        DTT_TypeMap_Make((DTT_Type[]){
            DTT_Type_New(TOKEN_SEMICOLON,Token_Null()),
            DTT_Type_New(TOKEN_CURLY_BRACES_L,Token_By(TOKEN_CURLY_BRACES_L,"{")),
            DTT_Type_New(TOKEN_CURLY_BRACES_R,Token_By(TOKEN_CURLY_BRACES_R,"}")),
            DTT_TYPE_END
        }),
        Token_By(TOKEN_SUPERALX_ASS,"="),
        (void*)SuperALX_LogicCorrection,
        (void*)SuperALX_Function_Handler
    );
    ll.bits = bits;
    ll.logic = TOKEN_NONE;
    ll.stack = 0U;
    ll.indent = 0U;
    ll.src = CStr_Cpy(src);
    ll.output = CStr_Cpy(output);
    ll.dllpath = CStr_Cpy(dllpath);

    ll.bss = String_New();
    ll.data = String_New();
    ll.text = String_New();

    ll.externs = CVector_New(sizeof(CStr),(void*)CStr_Free,NULL,(void*)CStr_PCmp,(void*)CStr_print);
    ll.globals = CVector_New(sizeof(CStr),(void*)CStr_Free,NULL,(void*)CStr_PCmp,(void*)CStr_print);
    ll.filesstack = CVector_New(sizeof(CStr),(void*)CStr_Free,NULL,(void*)CStr_PCmp,(void*)CStr_print);
    ll.filesinc = CVector_New(sizeof(CStr),(void*)CStr_Free,NULL,(void*)CStr_PCmp,(void*)CStr_print);
    ll.constsstr = CVector_New(sizeof(CStr),(void*)CStr_Free,NULL,(void*)CStr_PCmp,(void*)CStr_print);
    ll.defines = CVector_New(sizeof(Define),(void*)Define_Free,NULL,NULL,(void*)Define_Print);

    ll.logicpath = Vector_New(sizeof(LogicBlock));

    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,VOID_TYPE,"Ex_Packer",  (CStr[]){ VOID_TYPE,    NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,BOOL_TYPE,"Ex_Packer",  (CStr[]){ BOOL_TYPE,    NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,I8_TYPE,  "Ex_Packer",  (CStr[]){ I8_TYPE,      NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,I16_TYPE, "Ex_Packer",  (CStr[]){ I16_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,I32_TYPE, "Ex_Packer",  (CStr[]){ I32_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,I64_TYPE, "Ex_Packer",  (CStr[]){ I64_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,U8_TYPE,  "Ex_Packer",  (CStr[]){ U8_TYPE,      NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,U16_TYPE, "Ex_Packer",  (CStr[]){ U16_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,U32_TYPE, "Ex_Packer",  (CStr[]){ U32_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,U64_TYPE, "Ex_Packer",  (CStr[]){ U64_TYPE,     NULL },&ll.ev.sc) });
    //Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,F32_TYPE, "Ex_Packer",  (CStr[]){ F32_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,F64_TYPE, "Ex_Packer",  (CStr[]){ F64_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,"pointer","Ex_Packer",  (CStr[]){ POINTER_TYPE, NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,"dref",   "Ex_Packer",  (CStr[]){ DREF_TYPE,    NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,"str",    "Ex_Packer",  (CStr[]){ STR_TYPE,     NULL },&ll.ev.sc) });
    Vector_Push(&ll.ev.epm,(ExternPackage[]){ ExternPackage_Make(ll.dllpath,"struct", "Ex_Packer",  (CStr[]){ STRUCT_TYPE,  NULL },&ll.ev.sc) });

    CVector_Push(&ll.filesstack,(CStr[]){ CStr_Cpy(src) });
    CVector_Push(&ll.filesinc,(CStr[]){ CStr_Cpy(src) });
    Compiler_Script(&ll.ev,src);
    CVector_PopTop(&ll.filesstack);
    return ll;
}
void SuperALX_PrintVariable(SuperALX* ll,Variable* v) {
    Scope_PrintVariableDirect(&ll->ev.sc,v);
}

void SuperALX_Construct_EntryPoint(SuperALX* ll) {
    CVector_Push(&ll->globals,(CStr[]){ CStr_Cpy("_start") });
}

void SuperALX_Build_Externs(SuperALX* ll,String* str) {
    for(int i = 0;i<ll->externs.size;i++){
        CStr name = *(CStr*)CVector_Get(&ll->externs,i);
        String_Append(str,"extern ");
        String_Append(str,name);
        String_Append(str,"\n");
    }
    if(ll->externs.size>0) String_Append(str,"\n");
}
void SuperALX_Build_Globals(SuperALX* ll,String* str) {
    for(int i = 0;i<ll->globals.size;i++){
        CStr name = *(CStr*)CVector_Get(&ll->globals,i);
        String_Append(str,"global ");
        String_Append(str,name);
        String_Append(str,"\n");
    }
    if(ll->globals.size>0) String_Append(str,"\n");
}
void SuperALX_Build_EntryPoint(SuperALX* ll) {
    String_Append(&ll->text,"\n_start:\n");
    String_Appendf(&ll->text,"%ssub rsp,%d\n",SUPERALX_INDENTATION,SuperALX_Bytes(ll));
    
    CStr fmain = SuperALX_FunctionName(ll,"main");
    String_Appendf(&ll->text,"%scall %s\n",SUPERALX_INDENTATION,fmain);
    CStr_Free(&fmain);
    
    String_Appendf(&ll->text,"%smov rdi,QWORD[rsp + 0]\n",SUPERALX_INDENTATION);
    String_Appendf(&ll->text,"%sadd rsp,%d\n",SUPERALX_INDENTATION,SuperALX_Bytes(ll));
    String_Appendf(&ll->text,"%smov rax,60\n",SUPERALX_INDENTATION);
    String_Appendf(&ll->text,"%ssyscall\n",SUPERALX_INDENTATION);
}
void SuperALX_Build(SuperALX* ll) {
    Compiler_Begin(&ll->ev);
    
    if(!ll->ev.error){
        SuperALX_Construct_EntryPoint(ll);
        SuperALX_Build_EntryPoint(ll);

        String output = String_Format(";|\n;| SuperALX by codeleaded\n;|\n\nbits %d\n",ll->bits);
        String_Append(&output,"\nsection .bss\n");
        String_AppendString(&output,&ll->bss);
        String_Append(&output,"\nsection .data\n");
        String_AppendString(&output,&ll->data);
        String_Append(&output,"\nsection .text\n");
        SuperALX_Build_Externs(ll,&output);
        SuperALX_Build_Globals(ll,&output);
        String_AppendString(&output,&ll->text);

        Files_WriteT(ll->output,output.Memory,output.size);
        String_Free(&output);
    }else{
        printf("%s-> %sbuild aborted because of Errors!%s\n",ANSI_FG_GRAY,ANSI_FG_RED,ANSI_FG_WHITE);
    }
}
void SuperALX_Free(SuperALX* ll) {
    String_Free(&ll->bss);
    String_Free(&ll->data);
    String_Free(&ll->text);

    CVector_Free(&ll->externs);
    CVector_Free(&ll->globals);
    
    CStr_Free(&ll->dllpath);
    CStr_Free(&ll->src);
    CStr_Free(&ll->output);

    Compiler_Free(&ll->ev);

    CVector_Free(&ll->filesstack);
    CVector_Free(&ll->filesinc);
    CVector_Free(&ll->constsstr);
    CVector_Free(&ll->defines);

    Vector_Free(&ll->logicpath);
}
void SuperALX_Print(SuperALX* ll) {
    printf("--- SuperALX ---\n");
    printf("Stack: %d [%d]\n",ll->stack,ll->bits);
    printf("dlls: %s, src: %s, output: %s\n",ll->dllpath,ll->src,ll->output);
    CVector_Print(&ll->externs);
    CVector_Print(&ll->globals);
    CVector_Print(&ll->filesinc);
    CVector_Print(&ll->constsstr);
    CVector_Print(&ll->defines);
    Compiler_Print(&ll->ev);
    printf("--------------------------\n");
}

#endif