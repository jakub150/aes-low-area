#include <stdio.h>
#include <string.h>
#include "general.h"

int main() {
    /*
    uint32_t encrpt[4] = {0xc9bf1125, 0xf0cee619, 0xee357585, 0x92ed0b43};
    uint8_t temp[16];
    keyu32tokeyu8(temp, encrpt);
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", key[4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    init_sbox();
    init_log_table();
    while(1){
        char name[256];
        int option=0;
        printf("Enter choice(1. Encryption    2. Decryption    3. Exit Program):");
        scanf("%d%*c", &option);
        if(option!=1&&option!=2){
            break;
        }
        printf("Enter text: ");//Cheers, love! The cavalry's here!
        //4JUUHf4qOCFNfEunETWRBMuyPTEF/PHQTy9a2KtAwCTQlzHiHx/1mhm7myZk50tW
        fgets(name, sizeof(name), stdin);  // read string

        uint8_t temp[16];
        uint8_t data[256];
        int counter = 0;
        /****************Decrypt***********************/
        if(option==2){
            char* ptr = name;
            for(int i = 0; i < 256; i++){
                data[i] = 0x00;
            }
            for(int i = 0; i < strlen(name); i+=4){
                uint8_t a, b;
                if((counter+1)%6==4 && name[i+2]=='='){
                    a=0x30;
                    data[counter]=(FindIndex(encoding_table, 64, name[i])<<2 | (FindIndex(encoding_table, 64, name[i+1])&a)>>4);
                    break;
                }
                if((counter+2)%6==2 && name[i+2]=='='){
                    a=0x30;
                    data[counter]=(FindIndex(encoding_table, 64, name[i])<<2 | (FindIndex(encoding_table, 64, name[i+1])&a)>>4);
                    a=0x0f; b=0x3c;
                    data[counter+1]=(((FindIndex(encoding_table, 64, name[i+1]))&a)<<4 | (FindIndex(encoding_table, 64, name[i+2])&b)>>2);
                    break;
                }
                a=0x30;
                data[counter]=(FindIndex(encoding_table, 64, name[i])<<2 | (FindIndex(encoding_table, 64, name[i+1])&a)>>4);
                a=0x0f; b=0x3c;
                //printf("%x, ", FindIndex(encoding_table, 64, name[i+1]));
                //printf("%x, ", FindIndex(encoding_table, 64, name[i+2]));
                //printf("%x, ", FindIndex(encoding_table, 64, name[i+2]));
                //printf("%x, ", FindIndex(encoding_table, 64, name[i+2]));
                //printf("%x, ", ((FindIndex(encoding_table, 64, name[i+1])&a)<<4 | (FindIndex(encoding_table, 64, name[i+2])&b)>>2));
                data[counter+1]=(((FindIndex(encoding_table, 64, name[i+1]))&a)<<4 | (FindIndex(encoding_table, 64, name[i+2])&b)>>2);
                a=0x03;
                data[counter+2]=((FindIndex(encoding_table, 64, name[i+2])&a)<<6 | (FindIndex(encoding_table, 64, name[i+3])));
                counter += 3;
            }
            
            // for(int i = 0; i < strlen(name)*6/8; i++){
            //     printf("%x, ", data[i]);
            // }
            
            counter = 0;
            int print_counter=0;
            do
            {
                for(int i = 0; i < 4; i++){
                    for(int j = 0; j < 4; j++){
                        temp[4*i+j] = 0x00;
                    }
                }

                for(int i = 0; i < 4; i++) {
                    for(int j = 0; j < 4; j++){
                        temp[i+4*j] = data[counter];
                        counter++;
                    }
                }

                Decrypt(temp, ciphertext, key);

                if(print_counter==0){
                    printf("Origin text : ");
                }
                for(int i = 0; i < 4; i++){
                    for(int j = 0; j < 4; j++){
                        if(print_counter==strlen(name)*6/8-2){
                            break;
                        }
                        printf("%c", ciphertext[4*j+i]);
                        print_counter++;
                    }
                }
                //printf("\ncounter=%d, strlen(name)*6/8=%d\n", counter, strlen(name)*6/8);
            } while (counter<strlen(name)*6/8);
            printf("\n");
        }

        /****************Decrypt***********************/
        /***************Encrypt************************/
        else if(option==1){
            char* ptr = name;
            do{
                for(int i = 0; i < 4; i++){
                    for(int j = 0; j < 4; j++){
                        temp[4*i+j] = 0x00;
                    }
                }

                for(int i = 0; i < 4; i++) {
                    for(int j = 0; j < 4; j++){
                        if(!*ptr){
                            break;
                        }
                        temp[i+4*j] = *ptr;
                        ptr++;
                    }
                }

                Encrypt(temp, ciphertext, key);
                
                for(int i = 0; i < 4; i++){
                    for(int j = 0; j < 4; j++){
                        data[16*counter+4*i+j] = ciphertext[4*j+i];
                    }
                }
                counter++;
            } while(*ptr);
            
            //Decrypt(temp, ciphertext, key);
            
            //printf("turns=%d\n", (strlen(name)/16+1)*16);

            // for(int i = 0; i < (strlen(name)/16+1)*16; i++){
            //     printf("%x, ", data[i]);
            // }
            printf("Cipher text : ");
            for(int i = 0; i < (strlen(name)/16+1)*16; i+=3){
                uint8_t a,b;
                if(((strlen(name)/16+1)*16)%6==4 && i==(strlen(name)/16+1)*16-1){
                    printf("%c", encoding_table[(data[i]>>2)]);
                    a=0x03;
                    printf("%c==", encoding_table[(data[i]&a)<<4]);
                    break;
                }
                if(((strlen(name)/16+1)*16)%6==2 && i==(strlen(name)/16+1)*16-2){
                    printf("%c", encoding_table[(data[i]>>2)]);
                    a=0x03; b=0xf0;
                    printf("%c", encoding_table[((data[i]&a)<<4)|((data[i+1]&b)>>4)]);
                    a=0x0f;
                    printf("%c=", encoding_table[(data[i+1]&a)<<2]);
                    break;
                }
                printf("%c", encoding_table[(data[i]>>2)]);
                a=0x03; b=0xf0;
                printf("%c", encoding_table[((data[i]&a)<<4)|((data[i+1]&b)>>4)]);
                a=0x0f; b=0xc0;
                printf("%c", encoding_table[((data[i+1]&a)<<2)|((data[i+2]&b)>>6)]);
                a=0x3f;
                printf("%c", encoding_table[(data[i+2]&a)]);
            }
            printf("\n");
        }
        /****************Encrypt***************************/
    }
    printf("Cheers, love! The cavalry's here!");
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", key[4*i+j]);
        }
        printf("\n");
    }
    */
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", ciphertext[4*i+j]);
        }
        printf("\n");
    }
    */
    return 0;
}