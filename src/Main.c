#include "SuperALX.h"

int main(int argc,char** argv){
    if(argc<=1){
        printf("Missing Src File ."SUPERALX_TYPE"!\n");
        return 1;
    }
    if(argc<=2){
        printf("Missing Output File .asm/s!\n");
        return 1;
    }

    SuperALX ll = SuperALX_New("./bin",argv[1],argv[2],64);
    //SuperALX_Print(&ll);
    SuperALX_Build(&ll);
    //SuperALX_Print(&ll);
    SuperALX_Free(&ll);
    
    return 0;
}