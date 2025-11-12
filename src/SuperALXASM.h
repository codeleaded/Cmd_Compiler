#ifndef SUPERALXASM
#define SUPERALXASM

#include "/home/codeleaded/System/Static/Library/AlxScope.h"
#include "/home/codeleaded/System/Static/Library/AlxShutingYard.h"
#include "/home/codeleaded/System/Static/Library/AlxCompiler.h"
#include "/home/codeleaded/System/Static/Library/ConstParser.h"
#include "/home/codeleaded/System/Static/Library/Files.h"
#include "/home/codeleaded/System/Static/Library/String.h"
#include "/home/codeleaded/System/Static/Container/CVector.h"

#include "SuperALXDefines.h"


typedef struct LogicBlock {
    int count;
    int extend;
} LogicBlock;

typedef struct Define {
    CStr name;
    TokenMap content;
} Define;

Define Define_New(CStr name,TokenMap tm){
    Define d;
    d.name = CStr_Cpy(name);
    d.content = tm;
    return d;
}
void Define_Free(Define* d){
    CStr_Free(&d->name);
    TokenMap_Free(&d->content);
}
void Define_Print(Define* d){
    printf("%s: ",d->name);
    TokenMap_Print_S(&d->content);
}


typedef struct SuperALX {
    Compiler ev; // like inheritance
    CVector filesstack; // call stack of files -> path
    CVector filesinc;
    String bss;
    String data;
    String text;
    CVector externs;
    CVector globals;
    CVector constsstr;
    CVector defines; // Vector<Define>
    Vector logicpath; // Vector<LogicBlock>
    char* dllpath;
    char* src;
    char* output;
    char bits;
    char PADD1;
    short PADD2;
    unsigned int stack;
    unsigned int indent;
    TT_Type logic;
} SuperALX;

int SuperALX_Bytes(SuperALX* ll){
    return ll->bits / 8;
}
int SuperALX_Indentation(SuperALX* ll){
    return I32_Min(1,ll->indent);
}
void SuperALX_Indentation_To(SuperALX* ll,int indent){
    ll->indent = indent;
}

CStr SuperALX_Indentation_CStr(SuperALX* ll){
    String builder = String_New();

    int Indentation = SuperALX_Indentation(ll);
    for(int i = 0;i<Indentation;i++) String_Append(&builder,SUPERALX_INDENTATION);

    CStr cstr = String_CStr(&builder);
    String_Free(&builder);
    return cstr;
}
void SuperALX_Indentation_Do(SuperALX* ll,String* str){
    if(SuperALX_Indentation(ll)>0){
        CStr indent = SuperALX_Indentation_CStr(ll);
        String_Append(&ll->text,indent);
        CStr_Free(&indent);
    }
}
void SuperALX_Indentation_Append(SuperALX* ll,String* str,char* cstr){
    SuperALX_Indentation_Do(ll,str);
    String_Append(str,cstr);
}
void SuperALX_Indentation_Appendf(SuperALX* ll,String* str,char* FormatCStr,...){
    SuperALX_Indentation_Do(ll,str);
    
    va_list args;
    va_start(args,FormatCStr);
    String app = String_FormatA(FormatCStr,args);
    String_AppendString(str,&app);
    String_AppendChar(str,'\n');
    String_Free(&app);
    va_end(args);
}

Boolean SuperALX_PointerType(SuperALX* ll,CStr name){
    int size = CStr_Size(name);
    for(int i = size-1;i>=0;i--){
        if(name[i]=='*') return 1;
        if(name[i]=='&') continue;
        return 0;
    }
    return 0;
}
Boolean SuperALX_DrefType(SuperALX* ll,CStr name){
    if(!name) return 0;
    
    int size = CStr_Size(name);
    if(name[size-1]=='&') return 1;
    return 0;
}
int SuperALX_DrefTypeCount(SuperALX* ll,CStr name){
    int size = CStr_Size(name);
    for(int i = size - 1;i>=0;i--)
        if(name[i]!='&') return (size - 1) - i;
    return size;
}
CStr SuperALX_TypeOfDref(SuperALX* ll,CStr name){
    int size = CStr_Size(name);
    for(int i = size-1;i>=0;i--){
        if(name[i]=='&') continue;
        return CStr_Cpy_From_To(name,0,i+1);
    }
    return NULL;
}
CStr SuperALX_TypeOfPointer(SuperALX* ll,CStr name){
    int size = CStr_Size(name);
    for(int i = size-1;i>=0;i--){
        if(name[i]=='&' || name[i]=='*') continue;
        return CStr_Cpy_From_To(name,0,i+1);
    }
    return NULL;
}
int SuperALX_Size(SuperALX* ll,CStr name){
    if(SuperALX_DrefType(ll,name)){
        return SuperALX_Bytes(ll);
    }else{
        Type* t = Scope_FindType(&ll->ev.sc,name);
        if(t){
            Token op = Token_By(TOKEN_SUPERALX_SIZE,"sizeof");
            
            Vector othertypes = Vector_New(sizeof(CStr));
            Token (*Handler)(void*,Token*,Vector*) = Scope_HandlerOf(&ll->ev.sc,&op,name,&othertypes);
            //for(int i = 0;i<types.size;i++) CStr_Free((CStr*)Vector_Get(&types,i));
            Vector_Free(&othertypes);
        
            if(Handler){
                TokenMap args = TokenMap_Make((Token[]){ Token_By(TOKEN_STRING,t->name),Token_Null() });
                Token Item = Handler(ll,&op,&args);
                TokenMap_Free(&args);
                Token_Free(&op);
            
                Number size = Number_Parse(Item.str);
                Token_Free(&Item);
                return size;
            }
            Token_Free(&op);
        }
    }
    return 0;
}

CStr SuperALX_TypeSelector(SuperALX* ll,int size){
    if(size==1) return CStr_Cpy(SUPERALX_DREF_8);
    if(size==2) return CStr_Cpy(SUPERALX_DREF_16);
    if(size==4) return CStr_Cpy(SUPERALX_DREF_32);
    if(size==8) return CStr_Cpy(SUPERALX_DREF_64);
    return NULL;
}
CStr SuperALX_TypeSelector_T(SuperALX* ll,CStr name){
    if(SuperALX_DrefType(ll,name))  return SuperALX_TypeSelector(ll,SuperALX_Bytes(ll)); 
    else                            return SuperALX_TypeSelector(ll,SuperALX_Size(ll,name));
}
CStr SuperALX_StackDir(SuperALX* ll,int size,int stack){
    CStr selector = SuperALX_TypeSelector(ll,size);
    CStr cstr = CStr_Format("%s[rsp + %d]",selector,stack);
    CStr_Free(&selector);
    return cstr;
}
CStr SuperALX_StackAtS(SuperALX* ll,int size,int stack){
    CStr selector = SuperALX_TypeSelector(ll,size);
    CStr cstr = CStr_Format("%s[rsp + %d]",selector,ll->stack - stack);
    CStr_Free(&selector);
    return cstr;
}
CStr SuperALX_StackAt(SuperALX* ll,char* typename,int stack){
    CStr selector = SuperALX_TypeSelector_T(ll,typename);
    CStr cstr = CStr_Format("%s[rsp + %d]",selector,ll->stack - stack);
    CStr_Free(&selector);
    return cstr;
}
CStr SuperALX_StackAtNT(SuperALX* ll,int stack){
    CStr cstr = CStr_Format("[rsp + %d]",ll->stack - stack);
    return cstr;
}
CStr SuperALX_GetGlobal(SuperALX* ll,CStr name){
    CStr realname = CStr_Format("g.%s",name);
    return realname;
}
CStr SuperALX_GlobalAt(SuperALX* ll,CStr name,char* typename){
    CStr selector = SuperALX_TypeSelector_T(ll,typename);
    CStr realname = SuperALX_GetGlobal(ll,name);
    CStr ret = CStr_Format("%s[%s]",selector,realname);
    CStr_Free(&realname);
    CStr_Free(&selector);
    return ret;
}
CStr SuperALX_Location(SuperALX* ll,char* name){
    Variable* v = Scope_FindVariable(&ll->ev.sc,name);
    if(v){
        SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
        if(v->range>0){
            return SuperALX_StackAt(ll,v->typename,sv->stack);
        }else if(sv->global){
            return SuperALX_GlobalAt(ll,v->name,v->typename);
        }
    }
    return NULL;
}

CStr SuperALX_Variablename_Next(SuperALX* ll,CStr name,int offset){
    CStr build = CStr_Concat(name,"*");

    Number stack_name_count = Scope_FindVariablenameLastLike(&ll->ev.sc,build,'*',offset);
    if(stack_name_count==NUMBER_PARSE_ERROR)    stack_name_count = 0;
    else                                        stack_name_count++;


    CStr_Free(&build);
    CStr stack_name = CStr_Format("%s%d",name,stack_name_count);
    return stack_name;
}
CStr SuperALX_Conststr_Next(SuperALX* ll,CStr name,int offset){
    CStr build = CStr_Concat(name,"*");

    Number stack_name_count = ll->constsstr.size;

    CStr_Free(&build);
    CStr stack_name = CStr_Format("%s%d",name,stack_name_count);
    return stack_name;
}
CStr SuperALX_ConstStr(SuperALX* ll,CStr name){
    int size = CStr_Size(name);
    String value = String_New();
    String buffer = String_New();
    for(int i = 0;i<size;i++){
        if(name[i]>=32 && name[i]<127){
            String_AppendChar(&buffer,name[i]);
        }else{
            if(buffer.size>0){
                String_AppendChar(&value,'\"');
                String_AppendString(&value,&buffer);
                String_AppendChar(&value,'\"');
                String_AppendChar(&value,',');
                String_Clear(&buffer);
            }
            String_AppendNumber(&value,name[i]);
            String_AppendChar(&value,',');
        }

        if(i == size - 1){
            if(buffer.size>0){
                String_AppendChar(&value,'\"');
                String_AppendString(&value,&buffer);
                String_AppendChar(&value,'\"');
                String_AppendChar(&value,',');
            }
        }
    }
    String_AppendNumber(&value,0);
    
    CStr cstr_value = String_CStr(&value);
    String_Free(&value);
    String_Free(&buffer);
    return cstr_value;
}
CStr SuperALX_BuildConstStr(SuperALX* ll,CStr cstr){
    CStr name = SuperALX_Conststr_Next(ll,"GLOBAL_STR",10);
    CVector_Push(&ll->constsstr,(CStr[]){ CStr_Cpy(name) });
    
    CStr cstr_value = SuperALX_ConstStr(ll,cstr);
    String_Appendf(&ll->data,"%s: db %s\n",name,cstr_value);
    CStr_Free(&cstr_value);
    return name;
}
CStr SuperALX_BuildGlobal(SuperALX* ll,CStr name,int size){
    CStr g_name = SuperALX_GetGlobal(ll,name);
    String_Appendf(&ll->bss,"%s: resb %d\n",g_name,size);
    return g_name;
}

void SuperALX_Variable_BuildXX(SuperALX* ll,CStr name,CStr type,int sizeonstack,int stack,char destroy){
    Scope_BuildInitVariable(&ll->ev.sc,name,type,(SuperALXVariable[]){ SuperALXVariable_New(stack,sizeonstack,destroy,ll) });
}
void SuperALX_Variable_BuildX(SuperALX* ll,CStr name,CStr type,int sizeonstack,char destroy){
    if(ll->ev.sc.range>0){
        ll->stack += SuperALX_Size(ll,type);
    }
    Scope_BuildInitVariable(&ll->ev.sc,name,type,(SuperALXVariable[]){ SuperALXVariable_New(ll->stack,sizeonstack,destroy,ll) });
}
void SuperALX_Variable_Build(SuperALX* ll,CStr name,CStr type){
    SuperALX_Variable_BuildX(ll,name,type,0,1);
}
void SuperALX_Variable_BuildRange(SuperALX* ll,CStr name,CStr type,Range r,int sizeonstack,char destroy){
    if(ll->ev.sc.range>0){
        ll->stack += SuperALX_Size(ll,type);
    }
    Scope_BuildInitVariableRange(&ll->ev.sc,name,type,r,(SuperALXVariable[]){ SuperALXVariable_New(ll->stack,sizeonstack,destroy,ll) });
}
void SuperALX_Variable_Build_Decl(SuperALX* ll,CStr name,CStr type){
    SuperALX_Variable_Build(ll,name,type);
    
    if(ll->ev.sc.range==0){
        CStr g_value = SuperALX_BuildGlobal(ll,name,SuperALX_Size(ll,type));
        Variable* v = Scope_FindVariable(&ll->ev.sc,name);
        SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
        sv->global = g_value;
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"sub rsp,%d",SuperALX_Size(ll,type));
    }
}
void SuperALX_Variable_Build_Ref(SuperALX* ll,CStr name,CStr type){
    SuperALX_Variable_BuildX(ll,name,type,0,0);
}
void SuperALX_Variable_BuildRange_Decl(SuperALX* ll,CStr name,CStr type,Range r){
    SuperALX_Variable_BuildRange(ll,name,type,r,0,1);
    
    if(ll->ev.sc.range==0){
        CStr g_value = SuperALX_BuildGlobal(ll,name,SuperALX_Size(ll,type));
        Variable* v = Scope_FindVariable(&ll->ev.sc,name);
        SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
        sv->global = g_value;
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"sub rsp,%d",SuperALX_Size(ll,type));
    }
}
void SuperALX_Variable_Build_Ref_Decl(SuperALX* ll,CStr name,CStr type){
    SuperALX_Variable_Build_Ref(ll,name,type);

    if(ll->ev.sc.range==0){
        CStr g_value = SuperALX_BuildGlobal(ll,name,SuperALX_Size(ll,type));
        Variable* v = Scope_FindVariable(&ll->ev.sc,name);
        SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
        sv->global = g_value;
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"sub rsp,%d",SuperALX_Size(ll,type));
    }
}
void SuperALX_Variable_Build_Use(SuperALX* ll,CStr name,CStr type,int stack){
    SuperALX_Variable_BuildXX(ll,name,type,0,stack,2);
}
void SuperALX_Variable_Destroy_Decl(SuperALX* ll,CStr name){
    Variable* v = Scope_FindVariable(&ll->ev.sc,name);
    if(v->range>0){
        int size = SuperALX_Size(ll,v->typename);
        if(size>0) SuperALX_Indentation_Appendf(ll,&ll->text,"add rsp,%d",size);
        ll->stack -= size;
    }
}
void SuperALX_Variable_Destroy_Ref_Decl(SuperALX* ll,CStr name){
    Variable* v = Scope_FindVariable(&ll->ev.sc,name);
    if(v->range>0){
        //SuperALX_Indentation_Appendf(ll,&ll->text,"add rsp,%d",SuperALX_Size(ll,v->typename));
        ll->stack -= SuperALX_Size(ll,v->typename);
    }
}
void SuperALX_Variable_Destroy_Use(SuperALX* ll,CStr name){
    //Variable* v = Scope_FindVariable(&ll->ev.sc,name);
}

CStr SuperALX_VariableType(SuperALX* ll,Token* a){
    if(a->tt==TOKEN_STRING){
        Variable* v_a = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v_a) return CStr_Cpy(v_a->typename);
    }
    if(a->tt==TOKEN_SUPERALX_BOOLEAN)    return CStr_Cpy(BOOL_TYPE);
    if(a->tt==TOKEN_NUMBER)              return CStr_Cpy(I64_TYPE);
    if(a->tt==TOKEN_CONSTSTRING_DOUBLE)  return CStr_Cpy(STR_TYPE);
    if(a->tt==TOKEN_FLOAT)               return CStr_Cpy(F64_TYPE);
    if(a->tt==TOKEN_FUNCTIONPOINTER)     return CStr_Cpy(NULL_TYPE);
    if(a->tt==TOKEN_SUPERALX_NULL)       return CStr_Cpy(NULL_TYPE);
    return NULL;
}
CStr SuperALX_VariablesType(SuperALX* ll,Token* a,Token* b){
    CStr ret = SuperALX_VariableType(ll,a);
    if(ret) return ret;
    return SuperALX_VariableType(ll,b);
}

int SuperALX_TypeRealSize(SuperALX* ll,Token* a){
    CStr type = SuperALX_VariableType(ll,a);
    
    if(SuperALX_DrefType(ll,type)){
        CStr ntype = SuperALX_TypeOfDref(ll,type);
        CStr_Set(&type,ntype);
        CStr_Free(&ntype);
    }

    int size = SuperALX_Size(ll,type);
    CStr_Free(&type);
    return size;
}
char** SuperALX_SelectRT(SuperALX* ll,int size){
    if(size==1) return SuperALX_RT_8;
    if(size==2) return SuperALX_RT_16;
    if(size==4) return SuperALX_RT_32;
    if(size==8) return SuperALX_RT_64;
    return NULL;
}
CStr SuperALX_FunctionName(SuperALX* ll,CStr name){
    String builder = String_Format("f.%s",name);
    String_Replace(&builder,"::",".");
    
    CStr functionname = String_CStr(&builder);
    String_Free(&builder);
    return functionname;
}
CStr SuperALX_SpaceName(SuperALX* ll,CStr name){
    String builder = String_New();

    for(int i = 0;i<ll->ev.cs.size;i++){
        CallPosition* cp = (CallPosition*)Vector_Get(&ll->ev.cs,i);
        if(cp->type==TOKEN_SUPERALX_NAMESPACE){
            String_Append(&builder,cp->fname);
            String_Append(&builder,"::");
        }
    }
    String_Append(&builder,name);

    CStr cstr = String_CStr(&builder);
    String_Free(&builder);
    return cstr;
}
CStr SuperALX_FuncSpaceName(SuperALX* ll,CStr name){
    String builder = String_New();

    for(int i = 0;i<ll->ev.cs.size;i++){
        CallPosition* cp = (CallPosition*)Vector_Get(&ll->ev.cs,i);
        if(cp->type==TOKEN_SUPERALX_IMPL){
            String_Append(&builder,cp->fname);
            String_Append(&builder,"::");
            break;
        }
    }

    if(builder.size == 0){
        for(int i = 0;i<ll->ev.cs.size;i++){
            CallPosition* cp = (CallPosition*)Vector_Get(&ll->ev.cs,i);
            if(cp->type==TOKEN_SUPERALX_NAMESPACE){
                String_Append(&builder,cp->fname);
                String_Append(&builder,"::");
            }
        }
    }

    String_Append(&builder,name);

    CStr cstr = String_CStr(&builder);
    String_Free(&builder);
    return cstr;
}
Function* SuperALX_FunctionIn(SuperALX* ll) {
    for(int i = ll->ev.cs.size - 1;i>=0;i--){
        CallPosition* cp = Vector_Get(&ll->ev.cs,i);
        
        if(cp && cp->type==TOKEN_FUNCTIONDECL){
            TT_Iter it = FunctionMap_Find(&ll->ev.fs,cp->fname);
            Function* f = (Function*)Vector_Get(&ll->ev.fs,it);
            return f;
        }
    }
    return NULL;
}

void SuperALX_LogicAddPath(SuperALX* ll){
    if(ll->ev.sc.range>=ll->logicpath.size){
        while(ll->ev.sc.range>=ll->logicpath.size) Vector_Push(&ll->logicpath,(LogicBlock[]){ 0,0 });
    }else{
        LogicBlock* r = (LogicBlock*)Vector_Get(&ll->logicpath,ll->ev.sc.range);
        r->count++;
    }
}
void SuperALX_LogicAddExtend(SuperALX* ll){
    if(ll->ev.sc.range>=ll->logicpath.size){
        while(ll->ev.sc.range>=ll->logicpath.size) Vector_Push(&ll->logicpath,(LogicBlock[]){ 0,0 });
    }else{
        LogicBlock* r = (LogicBlock*)Vector_Get(&ll->logicpath,ll->ev.sc.range);
        r->extend++;
    }
}
int SuperALX_GetLogicPath(SuperALX* ll,Range r){
    if(r<0){
        return -1;
    }
    if(r>=ll->logicpath.size){
        while(ll->ev.sc.range>=ll->logicpath.size) Vector_Push(&ll->logicpath,(LogicBlock[]){ 0,0 });
        return 0;
    }
    return ((LogicBlock*)Vector_Get(&ll->logicpath,r))->count;
}
int SuperALX_GetLogicExtend(SuperALX* ll,Range r){
    if(r<0){
        return -1;
    }
    if(r>=ll->logicpath.size){
        while(ll->ev.sc.range>=ll->logicpath.size) Vector_Push(&ll->logicpath,(LogicBlock[]){ 0,0 });
        return 0;
    }
    return ((LogicBlock*)Vector_Get(&ll->logicpath,r))->extend;
}
CStr SuperALX_Logic(SuperALX* ll,char se,CStr type,Range r){
    int lp = SuperALX_GetLogicPath(ll,ll->ev.sc.range);
    if(CStr_Cmp(type,"ELIF")){
        int ex = SuperALX_GetLogicExtend(ll,ll->ev.sc.range);
        return CStr_Format("l.%d_%s%d_%d_%d",se,type,r,lp,ex);
    }
    return CStr_Format("l.%d_%s%d_%d",se,type,r,lp);
}
void SuperALX_LogicCorrection(SuperALX* ll,TokenMap* tm){
    Token* t = (Token*)Vector_Get(tm,0);
    
    if(ll->logic==TOKEN_SUPERALX_IF){
        int lp = SuperALX_GetLogicPath(ll,ll->ev.sc.range);
        if(t->tt==TOKEN_SUPERALX_ELIF || t->tt==TOKEN_SUPERALX_ELSE){
            CStr log_label = SuperALX_Logic(ll,1,SUPERALX_LOG,ll->ev.sc.range);
            SuperALX_Indentation_Appendf(ll,&ll->text,"jmp %s",log_label);
            CStr_Free(&log_label);
        }else{
            CStr log_label = SuperALX_Logic(ll,1,SUPERALX_LOG,ll->ev.sc.range);
            SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",log_label);
            CStr_Free(&log_label);
        }

        CStr if_label = SuperALX_Logic(ll,1,SUPERALX_IF,ll->ev.sc.range);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",if_label);
        CStr_Free(&if_label);
    }else if(ll->logic==TOKEN_SUPERALX_ELIF){
        int lp = SuperALX_GetLogicPath(ll,ll->ev.sc.range);
        if(t->tt==TOKEN_SUPERALX_ELIF || t->tt==TOKEN_SUPERALX_ELSE){
            CStr log_label = SuperALX_Logic(ll,1,SUPERALX_LOG,ll->ev.sc.range);
            SuperALX_Indentation_Appendf(ll,&ll->text,"jmp %s",log_label);
            CStr_Free(&log_label);
        }else{
            CStr log_label = SuperALX_Logic(ll,1,SUPERALX_LOG,ll->ev.sc.range);
            SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",log_label);
            CStr_Free(&log_label);
        }

        CStr if_label = SuperALX_Logic(ll,1,SUPERALX_ELIF,ll->ev.sc.range);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",if_label);
        CStr_Free(&if_label);
    }else if(ll->logic==TOKEN_SUPERALX_ELSE){
        int lp = SuperALX_GetLogicPath(ll,ll->ev.sc.range);
        CStr log_label = SuperALX_Logic(ll,1,SUPERALX_LOG,ll->ev.sc.range);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",log_label);
        CStr_Free(&log_label);
    }else if(ll->logic==TOKEN_SUPERALX_WHILE){
        int lp = SuperALX_GetLogicPath(ll,ll->ev.sc.range);
        CStr start_label = SuperALX_Logic(ll,0,SUPERALX_WHILE,ll->ev.sc.range);
        CStr end_label = SuperALX_Logic(ll,1,SUPERALX_WHILE,ll->ev.sc.range);
        SuperALX_Indentation_Appendf(ll,&ll->text,"jmp %s",start_label);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",end_label);
        CStr_Free(&end_label);
        CStr_Free(&start_label);
    }else if(ll->logic==TOKEN_SUPERALX_FOR){
        int lp = SuperALX_GetLogicPath(ll,ll->ev.sc.range);
        CStr start_label = SuperALX_Logic(ll,0,SUPERALX_FOR,ll->ev.sc.range);
        CStr end_label = SuperALX_Logic(ll,1,SUPERALX_FOR,ll->ev.sc.range);
        SuperALX_Indentation_Appendf(ll,&ll->text,"jmp %s",start_label);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s:",end_label);
        CStr_Free(&end_label);
        CStr_Free(&start_label);
        Scope_Pop(&ll->ev.sc);// first possible decl in for ... , 
    }
    ll->logic = TOKEN_NONE;
}

Boolean SuperALX_TypeInt(CStr typename){
    return
    CStr_Cmp(typename,I8_TYPE) || CStr_Cmp(typename,I16_TYPE) ||
    CStr_Cmp(typename,I32_TYPE) || CStr_Cmp(typename,I64_TYPE) ||
    CStr_Cmp(typename,U8_TYPE) || CStr_Cmp(typename,U16_TYPE) ||
    CStr_Cmp(typename,U32_TYPE) || CStr_Cmp(typename,U64_TYPE);
}
Boolean SuperALX_TypeFloat(CStr typename){
    return CStr_Cmp(typename,F32_TYPE) || CStr_Cmp(typename,F64_TYPE);
}

Number SuperALX_Function_Add(Number a,Number b){
    return a + b;
}
Number SuperALX_Function_Sub(Number a,Number b){
    return a - b;
}
Number SuperALX_Function_Mul(Number a,Number b){
    return a * b;
}
Number SuperALX_Function_Div(Number a,Number b){
    return a / b;
}
Number SuperALX_Function_Mod(Number a,Number b){
    return a % b;
}
Number SuperALX_Function_And(Number a,Number b){
    return a & b;
}
Number SuperALX_Function_Or(Number a,Number b){
    return a | b;
}
Number SuperALX_Function_Xor(Number a,Number b){
    return a ^ b;
}
Number SuperALX_Function_Not(Number a){
    return ~a;
}
Number SuperALX_Function_Neg(Number a){
    return -a;
}
Number SuperALX_Function_Shl(Number a,Number b){
    return a << b;
}
Number SuperALX_Function_Shr(Number a,Number b){
    return a >> b;
}
Boolean SuperALX_Function_Equ(Number a,Number b){
    return a == b;
}
Boolean SuperALX_Function_Neq(Number a,Number b){
    return a != b;
}
Boolean SuperALX_Function_Les(Number a,Number b){
    return a < b;
}
Boolean SuperALX_Function_Grt(Number a,Number b){
    return a > b;
}
Boolean SuperALX_Function_Leq(Number a,Number b){
    return a <= b;
}
Boolean SuperALX_Function_Grq(Number a,Number b){
    return a >= b;
}
Boolean SuperALX_Function_Lnd(Boolean a,Boolean b){
    return a && b;
}
Boolean SuperALX_Function_Lor(Boolean a,Boolean b){
    return a || b;
}
Boolean SuperALX_Function_Lot(Boolean a){
    return !a;
}

void SuperALX_Destroyer(Variable* v){
    //printf("[SuperALX]: Destroyer: %s -> ",v->typename);
    SuperALXVariable* v_sv = (SuperALXVariable*)Variable_Data(v);
    if(v_sv->destroy==0){
        SuperALX_Variable_Destroy_Ref_Decl(v_sv->parent,v->name);
        //printf("Ref -> %s -> %d\n",v->name,((SuperALX*)v_sv->parent)->stack);
    }else if(v_sv->destroy==1){
        SuperALX_Variable_Destroy_Decl(v_sv->parent,v->name);
        //printf("Real -> %s -> %d\n",v->name,((SuperALX*)v_sv->parent)->stack);
    }else if(v_sv->destroy==2){
        SuperALX_Variable_Destroy_Use(v_sv->parent,v->name);
        //printf("Use -> %s -> %d -> %d\n",v->name,v_sv->stack,((SuperALX*)v_sv->parent)->stack);
    }
    SuperALXVariable_Free(v_sv);
}
void SuperALX_Cpyer(Variable* src,Variable* dst){
    //printf("[SuperALX]: Cpyer!\n");
    //SuperALXVariable* src_str = (SuperALXVariable*)Variable_Data(src);
    //SuperALXVariable* dst_str = (SuperALXVariable*)Variable_Data(dst);
    //*dst_str = VariableMap_Cpy(src_str);
}
Token SuperALX_Init(SuperALX* ll,Token* op,Vector* args){
    Token* a = (Token*)Vector_Get(args,0);

    //printf("[SuperALX]: INIT: %s\n",a->str);
    
    Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
    if(v){
        SuperALXVariable* sv = (SuperALXVariable*)Variable_Data(v);
        int size = SuperALX_Size(ll,v->typename);
        
        if(v->range>0){
            if(size>0){
                ll->stack += size;
                SuperALX_Indentation_Appendf(ll,&ll->text,"sub rsp,%d",size);
            }
            *sv = SuperALXVariable_New(ll->stack,0,1,ll);
        }else{
            *sv = SuperALXVariable_New(ll->stack,0,1,ll);
            CStr value = SuperALX_BuildGlobal(ll,v->name,size);
            sv->global = value;
        }
    }
    return Token_Cpy(a);
}

Double SuperALX_GetFloat(SuperALX* ll,CStr fstr){
    return Double_Parse(fstr,0);
}
CStr SuperALX_GetFloatStr(SuperALX* ll,CStr fstr){
    Double d = SuperALX_GetFloat(ll,fstr);
    CStr cstr = Number_Get(*((Number*)&d));
    return cstr;
}
Token SuperALX_GetFloatToken(SuperALX* ll,CStr fstr){
    return Token_Move(TOKEN_FLOAT,SuperALX_GetFloatStr(ll,fstr));
}

CStr SuperALX_FInstOf(SuperALX* ll,Token* a,CStr inst){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            if(SuperALX_TypeFloat(v->typename)){
                return CStr_Format("f%s",inst);
            }else if(SuperALX_TypeInt(v->typename)){
                return CStr_Format("fi%s",inst);
            }
        }
    }else if(a->tt==TOKEN_FLOAT){
        return CStr_Format("f%s",inst);
    }else if(a->tt==TOKEN_NUMBER){
        return CStr_Format("fi%s",inst);
    }
    return NULL;
}

Boolean SuperALX_Extract(SuperALX* ll,Token* a,Number* n){
    if(a->tt==TOKEN_STRING){
        return False;
    }else if(a->tt==TOKEN_NUMBER){
        *n = Number_Parse(a->str);
        return True;
    }else{
        Compiler_ErrorHandler(&ll->ev,"Number -> 1. Arg: %s is not a int type!",a->str);
        return False;
    }
}
Boolean SuperALX_ExtractBool(SuperALX* ll,Token* a,Boolean* b){
    if(a->tt==TOKEN_STRING){
        return False;
    }else if(a->tt==TOKEN_SUPERALX_BOOLEAN){
        *b = Boolean_Parse(a->str);
        return True;
    }else{
        Compiler_ErrorHandler(&ll->ev,"1. Arg: %s is not a bool type!",a->str);
        return False;
    }
}

Boolean SuperALX_ErrorsInArg(SuperALX* ll,Token* a){
    if(a->tt==TOKEN_NONE){
        Compiler_ErrorHandler(&ll->ev,"Errors -> Tokentype of %s is NONE!",a->str);
        return 1;
    }
    if(a->tt==TOKEN_CONSTSTRING_DOUBLE){
        if(a->str == NULL){
            Compiler_ErrorHandler(&ll->ev,"Errors -> const str %s is null!",a->str);
            return 1; 
        }
    }
    if(a->tt==TOKEN_NUMBER){
        if(Number_Parse(a->str) == NUMBER_PARSE_ERROR){
            Compiler_ErrorHandler(&ll->ev,"Errors -> number %s is invalid!",a->str);
            return 1;
        }
    }
    if(a->tt==TOKEN_FLOAT){
        if(Double_Parse(a->str,1) == DOUBLE_PARSE_ERROR){
            Compiler_ErrorHandler(&ll->ev,"Errors -> float %s is invalid!",a->str);
            return 1;
        }
    }
    if(a->tt==TOKEN_SUPERALX_BOOLEAN){
        if(Boolean_Parse(a->str) == BOOL_PARSE_ERROR){
            Compiler_ErrorHandler(&ll->ev,"Errors -> bool %s is invalid!",a->str);
            return 1;
        }
    }
    if(a->tt==TOKEN_STRING){
        if(Scope_FindVariable(&ll->ev.sc,a->str) == NULL){
            Compiler_ErrorHandler(&ll->ev,"Errors -> variable %s doesn't exist!",a->str);
            return 1;
        }
    }
    if(a->tt==TOKEN_FUNCTIONPOINTER){
        if(Scope_FindVariable(&ll->ev.sc,a->str) == NULL){
            Compiler_ErrorHandler(&ll->ev,"Errors -> function %s is null!",a->str);
            return 1;
        }
    }
    return 0;
}

void SuperALX_DrefIntoReg(SuperALX* ll,Token* a,CStr reg){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            if(SuperALX_DrefType(ll,v->typename)){
                CStr location = SuperALX_Location(ll,a->str);
                SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",reg,location);
                CStr typename = CStr_Cpy(v->typename);
                int drefs = SuperALX_DrefTypeCount(ll,typename);
                for(int i = 0;i<drefs-1;i++){
                    CStr typeselector = NULL;
                    if(typename[CStr_Size(typename) - 1]=='&')  typeselector = CStr_Cpy(SUPERALX_DREF_64);
                    else                                        typeselector = SuperALX_TypeSelector_T(ll,typename);

                    SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s[%s]",reg,typeselector,reg);
                    CStr_Free(&typeselector);

                    CStr newtypename = CStr_PopOff(typename);
                    CStr_Set(&typename,newtypename);
                    CStr_Free(&newtypename);
                }
                CStr_Free(&location);
            }else{
                Compiler_ErrorHandler(&ll->ev,"IntoReg -> Error: %s is not a var!",a->str);
            }
        }else{
            Compiler_ErrorHandler(&ll->ev,"DrefIntoReg -> Error: %s is not a dref var!",a->str);
        }
    }
}
void SuperALX_IntoReg(SuperALX* ll,Token* a,CStr reg){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            CStr location = SuperALX_Location(ll,a->str);
        
            if(SuperALX_DrefType(ll,v->typename)){
                SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
                CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s[%s]",reg,typeselector,SUPERALX_REG_D_64);
                CStr_Free(&typename);
                CStr_Free(&typeselector);
            }else{
                SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",reg,location);
            }
            CStr_Free(&location);
        }else{
            Compiler_ErrorHandler(&ll->ev,"IntoReg -> Error: %s is not a var!",a->str);
        }
    }else if(a->tt==TOKEN_SUPERALX_NULL){
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,0",reg);
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",reg,a->str);
    }
}
void SuperALX_IntoSet(SuperALX* ll,Token* a,CStr reg){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            CStr location = SuperALX_Location(ll,a->str);
        
            if(SuperALX_DrefType(ll,v->typename)){
                SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
                CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s[%s],%s",typeselector,SUPERALX_REG_D_64,reg);
                CStr_Free(&typename);
                CStr_Free(&typeselector);
            }else{
                SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",location,reg);
            }
            CStr_Free(&location);
        }else{
            Compiler_ErrorHandler(&ll->ev,"IntoSet -> Error: %s is not a var!",a->str);
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"IntoSet -> Error: %s is not a var but assigned!",a->str);
    }
}
void SuperALX_AtReg(SuperALX* ll,Token* a,CStr reg,CStr inst){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            CStr location = SuperALX_Location(ll,a->str);
            
            if(SuperALX_DrefType(ll,v->typename)){
                SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
                CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s],%s",inst,typeselector,SUPERALX_REG_D_64,reg);
                CStr_Free(&typename);
                CStr_Free(&typeselector);
            }else{
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s,%s",inst,reg,location);
            }
            CStr_Free(&location);
        }else{
            Compiler_ErrorHandler(&ll->ev,"AtReg -> Error: %s is not a var!",a->str);
        }
    }else if(a->tt==TOKEN_SUPERALX_NULL){
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s,0",inst,reg);
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s,%s",inst,reg,a->str);
    }
}
void SuperALX_AtRegSingle(SuperALX* ll,Token* a,CStr inst){//Always A ex: mul,div etc
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            CStr location = SuperALX_Location(ll,a->str);
            
            if(SuperALX_DrefType(ll,v->typename)){
                SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
                CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s]",inst,typeselector,SUPERALX_REG_D_64);
                CStr_Free(&typename);
                CStr_Free(&typeselector);
            }else{
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s",inst,location);
            }
            CStr_Free(&location);
        }else{
            Compiler_ErrorHandler(&ll->ev,"AtRegSingle -> Error: %s is not a var!",a->str);
        }
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s",inst,a->str);
    }
}
void SuperALX_AtSingle(SuperALX* ll,CStr reg,CStr inst){//Always A ex: mul,div etc
    SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s",inst,reg);
}
void SuperALX_AtSet(SuperALX* ll,Token* a,CStr reg,CStr inst){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        if(v){
            CStr location = SuperALX_Location(ll,a->str);
            
            if(SuperALX_DrefType(ll,v->typename)){
                SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
                CStr typename = SuperALX_TypeOfDref(ll,v->typename);
                CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s],%s",inst,typeselector,SUPERALX_REG_D_64,reg);
                CStr_Free(&typename);
                CStr_Free(&typeselector);
            }else{
                SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s,%s",inst,location,reg);
            }
            CStr_Free(&location);
        }else{
            Compiler_ErrorHandler(&ll->ev,"AtSet -> Error: %s is not a var!",a->str);
        }
    }else{
        Compiler_ErrorHandler(&ll->ev,"Set -> Error: %s is not a var but assigned!",a->str);
    }
}
void SuperALX_CmpAtReg(SuperALX* ll,Token* a,CStr reg){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr location = SuperALX_Location(ll,a->str);
        
        if(SuperALX_DrefType(ll,v->typename)){
            SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
            CStr typename = SuperALX_TypeOfDref(ll,v->typename);
            CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
            SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s[%s],%s",typeselector,SUPERALX_REG_D_64,reg);
            CStr_Free(&typename);
            CStr_Free(&typeselector);
        }else{
            SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,%s",reg,location);
        }
        CStr_Free(&location);
    }else if(a->tt==TOKEN_SUPERALX_NULL){
        SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,0",reg);
    }else{
        SuperALX_Indentation_Appendf(ll,&ll->text,"cmp %s,%s",reg,a->str);
    }
}
void SuperALX_CmpAtSet(SuperALX* ll,Token* a,CStr inst){
    if(a->tt==TOKEN_STRING){
        Variable* v = Scope_FindVariable(&ll->ev.sc,a->str);
        CStr location = SuperALX_Location(ll,a->str);
        
        if(SuperALX_DrefType(ll,v->typename)){
            SuperALX_DrefIntoReg(ll,a,SUPERALX_REG_D_64);
                
            CStr typename = SuperALX_TypeOfDref(ll,v->typename);
            CStr typeselector = SuperALX_TypeSelector_T(ll,typename);
            SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s[%s]",inst,typeselector,SUPERALX_REG_D_64);
            CStr_Free(&typename);
            CStr_Free(&typeselector);
        }else{
            SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s",inst,location);
        }
        CStr_Free(&location);
    }else{
        Compiler_ErrorHandler(&ll->ev,"Set -> Error: %s is not a var but assigned!",a->str);
    }
}

Token SuperALX_ExecuteAss(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(b->tt==TOKEN_NUMBER){
        SuperALX_AtSet(ll,a,b->str,instname);
        return Token_Cpy(a);
    }else if(b->tt==TOKEN_FLOAT){
        CStr fstr = SuperALX_GetFloatStr(ll,b->str);
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,%s",SUPERALX_REG_A_64,fstr);
        SuperALX_AtSet(ll,a,SUPERALX_REG_A_64,instname);
        CStr_Free(&fstr);
        return Token_Cpy(a);
    }else if(b->tt==TOKEN_SUPERALX_NULL){
        SuperALX_AtSet(ll,a,"0",instname);
        return Token_Cpy(a);
    }else{
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        
        if(realsize_b>realsize_a)
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,0",SUPERALX_REG_A_64);

        SuperALX_IntoReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_A]);
        SuperALX_AtSet(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A],instname);
        return Token_Cpy(a);
    }
}
Token SuperALX_ExecuteAssA(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    int realsize_a = SuperALX_TypeRealSize(ll,a);
    int realsize_b = SuperALX_TypeRealSize(ll,b);
        
    if(realsize_b>realsize_a)
        SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,0",SUPERALX_REG_A_64);

    SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
    SuperALX_IntoReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_B]);
    SuperALX_AtSingle(ll,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_B],instname);
    SuperALX_IntoSet(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
    return Token_Cpy(a);
}
Token SuperALX_ExecuteAssSingle(SuperALX* ll,Token* a,Token* op,CStr instname,CStr instnameupper){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();

    SuperALX_AtRegSingle(ll,a,instname);
    return Token_Cpy(a);
}

Token SuperALX_Execute(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper,Number (*inst)(Number,Number)){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_NUMBER && b->tt==TOKEN_NUMBER){
        char* resstr = Number_Get(inst(Number_Parse(a->str),Number_Parse(b->str)));
        return Token_Move(TOKEN_NUMBER,resstr);
    }else{
        CStr typename_a = SuperALX_VariableType(ll,a);
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
        CStr_Free(&typename_a);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
        if(realsize_b>realsize_a)
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,0",SUPERALX_REG_A_64);

        SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
        SuperALX_AtReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_A],instname);
        SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
        return stack_t;
    }
}
Token SuperALX_ExecuteA(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper,Number (*inst)(Number,Number)){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_NUMBER && b->tt==TOKEN_NUMBER){
        char* resstr = Number_Get(inst(Number_Parse(a->str),Number_Parse(b->str)));
        return Token_Move(TOKEN_NUMBER,resstr);
    }else{
        if(b->tt==TOKEN_NUMBER){
            CStr typename_a = SuperALX_VariableType(ll,a);
            int realsize_a = SuperALX_TypeRealSize(ll,a);
        
            CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
            SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
            CStr_Free(&typename_a);
            Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
            SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
            SuperALX_IntoReg(ll,b,SUPERALX_REG_B_64);
            SuperALX_AtSingle(ll,SUPERALX_REG_B_64,instname);
            SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
            return stack_t;
        }else{
            CStr typename_a = SuperALX_VariableType(ll,a);
            int realsize_a = SuperALX_TypeRealSize(ll,a);
        
            CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
            SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
            CStr_Free(&typename_a);
            Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
            SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
            SuperALX_AtRegSingle(ll,b,instname);
            SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
            return stack_t;
        }
    }
}
Token SuperALX_ExecuteAR(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper,Number (*inst)(Number,Number)){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_NUMBER && b->tt==TOKEN_NUMBER){
        char* resstr = Number_Get(inst(Number_Parse(a->str),Number_Parse(b->str)));
        return Token_Move(TOKEN_NUMBER,resstr);
    }else{
        if(b->tt==TOKEN_NUMBER){
            CStr typename_a = SuperALX_VariableType(ll,a);
            int realsize_a = SuperALX_TypeRealSize(ll,a);
        
            CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
            SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
            CStr_Free(&typename_a);
            Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
            SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
            SuperALX_IntoReg(ll,b,SUPERALX_REG_B_64);
            SuperALX_AtSingle(ll,SUPERALX_REG_B_64,instname);
            SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_D]);
            return stack_t;
        }else{
            CStr typename_a = SuperALX_VariableType(ll,a);
            int realsize_a = SuperALX_TypeRealSize(ll,a);
        
            CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
            SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
            CStr_Free(&typename_a);
            Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
            SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
            SuperALX_AtRegSingle(ll,b,instname);
            SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_D]);
            return stack_t;
        }
    }
}
Token SuperALX_ExecuteAR2(SuperALX* ll,Token* a,Token* b,int reg2,int reg2_size,Token* op,CStr instname,CStr instnameupper,Number (*inst)(Number,Number)){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_NUMBER && b->tt==TOKEN_NUMBER){
        char* resstr = Number_Get(inst(Number_Parse(a->str),Number_Parse(b->str)));
        return Token_Move(TOKEN_NUMBER,resstr);
    }else{
         CStr typename_a = SuperALX_VariableType(ll,a);
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
        CStr_Free(&typename_a);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
        if(realsize_b>realsize_a)
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,0",SUPERALX_REG_A_64);

        SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
        SuperALX_IntoReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_C]);
        SuperALX_Indentation_Appendf(ll,&ll->text,"%s %s,%s",inst,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A],SuperALX_SelectRT(ll,reg2_size)[SUPERALX_REG_C]);
        SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
    }
}
Token SuperALX_ExecuteSingle(SuperALX* ll,Token* a,Token* op,CStr instname,CStr instnameupper,Number (*inst)(Number)){
    //Compiler_InfoHandler(&ll->ev,"%s: %s%s",instnameupper,op->str,a->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();

    if(a->tt==TOKEN_NUMBER){
        char* resstr = Number_Get(inst(Number_Parse(a->str)));
        return Token_Move(TOKEN_NUMBER,resstr);
    }else{
        CStr typename_a = SuperALX_VariableType(ll,a);
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,typename_a);
        CStr_Free(&typename_a);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);

        SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
        SuperALX_AtSingle(ll,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A],instname);
        SuperALX_IntoSet(ll,&stack_t,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
        
        return stack_t;
    }
}
Token SuperALX_ExecuteCmp(SuperALX* ll,Token* a,Token* b,Token* op,CStr instname,CStr instnameupper,Boolean (*inst)(Number,Number)){
    //Compiler_InfoHandler(&ll->ev,"%s: %s %s %s",instnameupper,a->str,op->str,b->str);
    
    if(SuperALX_ErrorsInArg(ll,a)) return Token_Null();
    if(SuperALX_ErrorsInArg(ll,b)) return Token_Null();

    if(a->tt==TOKEN_NUMBER && b->tt==TOKEN_NUMBER){
        char* resstr = Boolean_Get(inst(Number_Parse(a->str),Number_Parse(b->str)));
        return Token_Move(TOKEN_SUPERALX_BOOLEAN,resstr);
    }else{
        int realsize_a = SuperALX_TypeRealSize(ll,a);
        int realsize_b = SuperALX_TypeRealSize(ll,b);
        
        CStr stack_name = SuperALX_Variablename_Next(ll,".STACK",6);
        SuperALX_Variable_Build_Decl(ll,stack_name,BOOL_TYPE);
        Token stack_t = Token_Move(TOKEN_STRING,stack_name);
        
        if(realsize_b>realsize_a)
            SuperALX_Indentation_Appendf(ll,&ll->text,"mov %s,0",SUPERALX_REG_A_64);

        SuperALX_IntoReg(ll,a,SuperALX_SelectRT(ll,realsize_a)[SUPERALX_REG_A]);
        SuperALX_CmpAtReg(ll,b,SuperALX_SelectRT(ll,realsize_b)[SUPERALX_REG_A]);
        SuperALX_CmpAtSet(ll,&stack_t,instname);
        return stack_t;
    }
}

#endif //!SUPERALXASM