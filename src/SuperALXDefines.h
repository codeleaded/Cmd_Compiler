#ifndef SUPERALXDEFINES_H
#define SUPERALXDEFINES_H

#include "/home/codeleaded/System/Static/Library/AlxParser.h"

#define TOKEN_SUPERALX_LINECOMMENT        (TOKEN_START+0)
#define TOKEN_SUPERALX_BLOCKCOMMENTSTART  (TOKEN_START+1)
#define TOKEN_SUPERALX_BLOCKCOMMENTEND    (TOKEN_START+2)
#define TOKEN_SUPERALX_RETURN             (TOKEN_START+4)
#define TOKEN_SUPERALX_END                (TOKEN_START+5)
#define TOKEN_SUPERALX_IF                 (TOKEN_START+6)
#define TOKEN_SUPERALX_ELIF               (TOKEN_START+7)
#define TOKEN_SUPERALX_ELSE               (TOKEN_START+8)
#define TOKEN_SUPERALX_WHILE              (TOKEN_START+9)
#define TOKEN_SUPERALX_FOR                (TOKEN_START+10)
#define TOKEN_SUPERALX_IMPORT             (TOKEN_START+11)
#define TOKEN_SUPERALX_CONST              (TOKEN_START+12)
#define TOKEN_SUPERALX_STRUCT             (TOKEN_START+13)
#define TOKEN_SUPERALX_IMPL               (TOKEN_START+14)
#define TOKEN_SUPERALX_NAMESPACE          (TOKEN_START+15)
#define TOKEN_SUPERALX_BOOLEAN            (TOKEN_START+16)
#define TOKEN_SUPERALX_ASS                (TOKEN_START+17)
#define TOKEN_SUPERALX_ADD                (TOKEN_START+18)
#define TOKEN_SUPERALX_SUB                (TOKEN_START+19)
#define TOKEN_SUPERALX_MUL                (TOKEN_START+20)
#define TOKEN_SUPERALX_DIV                (TOKEN_START+21)
#define TOKEN_SUPERALX_NEG                (TOKEN_START+22)
#define TOKEN_SUPERALX_DRF                (TOKEN_START+23)
#define TOKEN_SUPERALX_ADR                (TOKEN_START+24)
#define TOKEN_SUPERALX_AND                (TOKEN_START+25)
#define TOKEN_SUPERALX_OR                 (TOKEN_START+26)
#define TOKEN_SUPERALX_XOR                (TOKEN_START+27)
#define TOKEN_SUPERALX_NOT                (TOKEN_START+28)
#define TOKEN_SUPERALX_LND                (TOKEN_START+29)
#define TOKEN_SUPERALX_LOR                (TOKEN_START+30)
#define TOKEN_SUPERALX_LOT                (TOKEN_START+31)
#define TOKEN_SUPERALX_NEQ                (TOKEN_START+32)
#define TOKEN_SUPERALX_EQU                (TOKEN_START+33)
#define TOKEN_SUPERALX_LES                (TOKEN_START+34)
#define TOKEN_SUPERALX_GRT                (TOKEN_START+35)
#define TOKEN_SUPERALX_LEQ                (TOKEN_START+36)
#define TOKEN_SUPERALX_GRQ                (TOKEN_START+37)
#define TOKEN_SUPERALX_ACS                (TOKEN_START+38)
#define TOKEN_SUPERALX_ARW                (TOKEN_START+39)
#define TOKEN_SUPERALX_DDOT               (TOKEN_START+40)
#define TOKEN_SUPERALX_DDDOT              (TOKEN_START+41)
#define TOKEN_SUPERALX_SUBS               (TOKEN_START+42)
#define TOKEN_SUPERALX_SUBSR              (TOKEN_START+43)
#define TOKEN_SUPERALX_ASD                (TOKEN_START+44)
#define TOKEN_SUPERALX_ASU                (TOKEN_START+45)
#define TOKEN_SUPERALX_ASM                (TOKEN_START+46)
#define TOKEN_SUPERALX_ASV                (TOKEN_START+47)
#define TOKEN_SUPERALX_MOD                (TOKEN_START+48)
#define TOKEN_SUPERALX_INC                (TOKEN_START+49)
#define TOKEN_SUPERALX_DEC                (TOKEN_START+50)
#define TOKEN_SUPERALX_CAL                (TOKEN_START+51)
#define TOKEN_SUPERALX_ASMBY              (TOKEN_START+52)
#define TOKEN_SUPERALX_REG                (TOKEN_START+53)
#define TOKEN_SUPERALX_SIZE               (TOKEN_START+54)
#define TOKEN_SUPERALX_PUB                (TOKEN_START+55)
#define TOKEN_SUPERALX_DEFINE             (TOKEN_START+56)

#define SUPERALX_TYPE                       "salx"
#define SUPERALX_INDENTATION                "    "
#define SUPERALX_INDENTATION_NONE           0
#define SUPERALX_INDENTATION_FUNCTION       1

#define SUPERALX_TYPE_NONE                  "void"
#define SUPERALX_SELF                       "self"
#define SUPERALX_BOOL                       ".BOOL"
#define SUPERALX_IF                         "IF"
#define SUPERALX_ELIF                       "ELIF"
#define SUPERALX_ELSE                       "ELSE"
#define SUPERALX_WHILE                      "WHILE"
#define SUPERALX_FOR                        "FOR"
#define SUPERALX_LOG                        "LOG"

#define SUPERALX_DREF_8                     "BYTE"
#define SUPERALX_DREF_16                    "WORD"
#define SUPERALX_DREF_32                    "DWORD"
#define SUPERALX_DREF_64                    "QWORD"

#define SUPERALX_REG_A_L8                   "al"
#define SUPERALX_REG_B_L8                   "bl"
#define SUPERALX_REG_C_L8                   "cl"
#define SUPERALX_REG_D_L8                   "dl"
#define SUPERALX_REG_A_H8                   "ah"
#define SUPERALX_REG_B_H8                   "bh"
#define SUPERALX_REG_C_H8                   "ch"
#define SUPERALX_REG_D_H8                   "dh"
#define SUPERALX_REG_SI_8                   "sil"
#define SUPERALX_REG_DI_8                   "dil"
#define SUPERALX_REG_SP_8                   "spl"
#define SUPERALX_REG_BP_8                   "bpl"
#define SUPERALX_REG_8_8                    "r8b"
#define SUPERALX_REG_9_8                    "r9b"
#define SUPERALX_REG_10_8                   "r10b"
#define SUPERALX_REG_11_8                   "r11b"
#define SUPERALX_REG_12_8                   "r12b"
#define SUPERALX_REG_13_8                   "r13b"
#define SUPERALX_REG_14_8                   "r14b"
#define SUPERALX_REG_15_8                   "r15b"

#define SUPERALX_REG_A_16                   "ax"
#define SUPERALX_REG_B_16                   "bx"
#define SUPERALX_REG_C_16                   "cx"
#define SUPERALX_REG_D_16                   "dx"
#define SUPERALX_REG_SI_16                  "si"
#define SUPERALX_REG_DI_16                  "di"
#define SUPERALX_REG_SP_16                  "sp"
#define SUPERALX_REG_BP_16                  "bp"
#define SUPERALX_REG_8_16                   "r8w"
#define SUPERALX_REG_9_16                   "r9w"
#define SUPERALX_REG_10_16                  "r10w"
#define SUPERALX_REG_11_16                  "r11w"
#define SUPERALX_REG_12_16                  "r12w"
#define SUPERALX_REG_13_16                  "r13w"
#define SUPERALX_REG_14_16                  "r14w"
#define SUPERALX_REG_15_16                  "r15w"

#define SUPERALX_REG_A_32                   "eax"
#define SUPERALX_REG_B_32                   "ebx"
#define SUPERALX_REG_C_32                   "ecx"
#define SUPERALX_REG_D_32                   "edx"
#define SUPERALX_REG_SI_32                  "esi"
#define SUPERALX_REG_DI_32                  "edi"
#define SUPERALX_REG_SP_32                  "esp"
#define SUPERALX_REG_BP_32                  "ebp"
#define SUPERALX_REG_8_32                   "r8d"
#define SUPERALX_REG_9_32                   "r9d"
#define SUPERALX_REG_10_32                  "r10d"
#define SUPERALX_REG_11_32                  "r11d"
#define SUPERALX_REG_12_32                  "r12d"
#define SUPERALX_REG_13_32                  "r13d"
#define SUPERALX_REG_14_32                  "r14d"
#define SUPERALX_REG_15_32                  "r15d"

#define SUPERALX_REG_A_64                   "rax"
#define SUPERALX_REG_B_64                   "rbx"
#define SUPERALX_REG_C_64                   "rcx"
#define SUPERALX_REG_D_64                   "rdx"
#define SUPERALX_REG_SI_64                  "rsi"
#define SUPERALX_REG_DI_64                  "rdi"
#define SUPERALX_REG_SP_64                  "rsp"
#define SUPERALX_REG_BP_64                  "rbp"
#define SUPERALX_REG_8_64                   "r8"
#define SUPERALX_REG_9_64                   "r9"
#define SUPERALX_REG_10_64                  "r10"
#define SUPERALX_REG_11_64                  "r11"
#define SUPERALX_REG_12_64                  "r12"
#define SUPERALX_REG_13_64                  "r13"
#define SUPERALX_REG_14_64                  "r14"
#define SUPERALX_REG_15_64                  "r15"

#define SUPERALX_REG_A                      0
#define SUPERALX_REG_B                      1
#define SUPERALX_REG_C                      2
#define SUPERALX_REG_D                      3
#define SUPERALX_REG_SI                     4
#define SUPERALX_REG_DI                     5
#define SUPERALX_REG_SP                     6
#define SUPERALX_REG_BP                     7
#define SUPERALX_REG_IP                     8
#define SUPERALX_REG_8                      9
#define SUPERALX_REG_9                      10
#define SUPERALX_REG_10                     11
#define SUPERALX_REG_11                     12
#define SUPERALX_REG_12                     13
#define SUPERALX_REG_13                     14
#define SUPERALX_REG_14                     15
#define SUPERALX_REG_15                     16

char* SuperALX_RT_8[] = {
    SUPERALX_REG_A_L8,  SUPERALX_REG_B_L8,  SUPERALX_REG_C_L8,  SUPERALX_REG_D_L8,
    SUPERALX_REG_SI_8,  SUPERALX_REG_DI_8,  SUPERALX_REG_SP_8,  SUPERALX_REG_BP_8,
    SUPERALX_REG_8_8,   SUPERALX_REG_9_8,   SUPERALX_REG_10_8,  SUPERALX_REG_11_8,
    SUPERALX_REG_12_8,  SUPERALX_REG_13_8,  SUPERALX_REG_14_8,  SUPERALX_REG_15_8
};
char* SuperALX_RT_16[] = {
    SUPERALX_REG_A_16,  SUPERALX_REG_B_16,  SUPERALX_REG_C_16,  SUPERALX_REG_D_16,
    SUPERALX_REG_SI_16, SUPERALX_REG_DI_16, SUPERALX_REG_SP_16, SUPERALX_REG_BP_16,
    SUPERALX_REG_8_16,  SUPERALX_REG_9_16,  SUPERALX_REG_10_16, SUPERALX_REG_11_16,
    SUPERALX_REG_12_16, SUPERALX_REG_13_16, SUPERALX_REG_14_16, SUPERALX_REG_15_16
};
char* SuperALX_RT_32[] = {
    SUPERALX_REG_A_32,  SUPERALX_REG_B_32,  SUPERALX_REG_C_32,  SUPERALX_REG_D_32,
    SUPERALX_REG_SI_32, SUPERALX_REG_DI_32, SUPERALX_REG_SP_32, SUPERALX_REG_BP_32,
    SUPERALX_REG_8_32,  SUPERALX_REG_9_32,  SUPERALX_REG_10_32, SUPERALX_REG_11_32,
    SUPERALX_REG_12_32, SUPERALX_REG_13_32, SUPERALX_REG_14_32, SUPERALX_REG_15_32
};
char* SuperALX_RT_64[] = {
    SUPERALX_REG_A_64,  SUPERALX_REG_B_64,  SUPERALX_REG_C_64,  SUPERALX_REG_D_64,
    SUPERALX_REG_SI_64, SUPERALX_REG_DI_64, SUPERALX_REG_SP_64, SUPERALX_REG_BP_64,
    SUPERALX_REG_8_64,  SUPERALX_REG_9_64,  SUPERALX_REG_10_64, SUPERALX_REG_11_64,
    SUPERALX_REG_12_64, SUPERALX_REG_13_64, SUPERALX_REG_14_64, SUPERALX_REG_15_64
};

#define BOOL_TYPE                           "bool"
#define I8_TYPE                             "i8"
#define I16_TYPE                            "i16"
#define I32_TYPE                            "i32"
#define I64_TYPE                            "i64"
#define U8_TYPE                             "u8"
#define U16_TYPE                            "u16"
#define U32_TYPE                            "u32"
#define U64_TYPE                            "u64"
#define F32_TYPE                            "f32"
#define F64_TYPE                            "f64"
#define VOID_TYPE                           "void"
#define NULL_TYPE                           VOID_TYPE"*"
#define STR_TYPE                            "i8*"
#define POINTER_TYPE                        "?*"
#define DREF_TYPE                           "!&"
#define STRUCT_TYPE                         ".struct"

#define BOOL_SIZE                           1
#define I8_SIZE                             1
#define I16_SIZE                            2
#define I32_SIZE                            4
#define I64_SIZE                            8
#define U8_SIZE                             1
#define U16_SIZE                            2
#define U32_SIZE                            4
#define U64_SIZE                            8
#define F32_SIZE                            4
#define F64_SIZE                            8
#define VOID_SIZE                           0
#define STR_SIZE                            8
#define POINTER_SIZE                        8
#define DREF_SIZE                           8


typedef struct SuperALXVariable{
    int stack;
    int sizeonstack;
    char destroy;
    CStr global;
    void* parent;
} SuperALXVariable;

SuperALXVariable SuperALXVariable_New(int stack,int sizeonstack,char destroy,void* parent){
    SuperALXVariable sv;
    sv.stack = stack;
    sv.sizeonstack = sizeonstack;
    sv.destroy = destroy;
    sv.global = NULL;
    sv.parent = parent;
    return sv;
}
void SuperALXVariable_Free(SuperALXVariable* sv){
    CStr_Free(&sv->global);
}

#endif //!SUPERALXDEFINES_H