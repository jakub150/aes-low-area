#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "general.h"


uint8_t plaintext[16] = {0x17, 0x6a, 0xde, 0x1e,
                         0xbb, 0x24, 0x1f, 0xaa,
                         0xa9, 0x91, 0xde, 0xdb,
                         0xab, 0x7a, 0xee, 0x4e};

/*
uint8_t plaintext[16] = {0xea, 0x04, 0x65, 0x85,
                         0x83, 0x45, 0x5d, 0x96,
                         0x5c, 0x33, 0x98, 0xb0,
                         0xf0, 0x2d, 0xad, 0xc5};
*/

uint8_t ciphertext[16] = {0x00, 0x00, 0x00, 0x00,
                          0x00, 0x00, 0x00, 0x00,
                          0x00, 0x00, 0x00, 0x00,
                          0x00, 0x00, 0x00, 0x00};

uint8_t key[16] = { 0xac, 0x19, 0x28, 0x57,
                    0x77, 0xfa, 0xd1, 0x5c,
                    0x66, 0xdc, 0x29, 0x00,
                    0xf3, 0x21, 0x41, 0x6a};

uint32_t expandkey[4] = {   0xabc78912,
                            0x00000000,
                            0x14109782,
                            0x471896ae};

const char encoding_table[] = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                                'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
                                'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                                'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
                                'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                                'w', 'x', 'y', 'z', '0', '1', '2', '3',
                                '4', '5', '6', '7', '8', '9', '+', '/'};

uint8_t FindIndex( const char a[], int size, char value )
{
    uint8_t index = 0x00;

    while ( index < size && a[index] != value ) ++index;

    return ( index == size ? -1 : index );
}

// 定义S盒，用于字节代换
uint32_t maxbit(uint32_t a){
    if(a==0)return 0;
    uint32_t value = 0;
    for(uint32_t i=0;i<32;i++){
        if(a&(1<<i)) value = i;
    }
    return value+1;
}

uint32_t mod2add( uint32_t a, uint32_t b){
    return a^b;
}

uint32_t mod2sub( uint32_t a, uint32_t b){
    return a^b;
}

uint32_t mod2mul( uint32_t a, uint32_t b){
    uint32_t value = 0;
    for(uint32_t i=0;i<32;i++){
        if(a&(1<<i)){
        value = mod2add(value,b<<i);
        }
    }
    return value;
}

uint32_t mod2div( uint32_t a, uint32_t b, uint32_t * r){
    uint32_t alen = maxbit(a);
    uint32_t blen = maxbit(b);
    if(alen<blen){
        *r = a;
        return 0;
    }
    else{
        uint32_t c = alen - blen;
        a = mod2sub(a, b<<c);
        uint32_t s =  mod2div(a, b, r)|(1<<c);
        return s;
    }
}


uint32_t exgcd( uint32_t a, uint32_t b, uint32_t * x, uint32_t *y){
    if(b==0)
    {
        *x=1;*y=0;
        return a;
    }
     uint32_t c = 0;
     uint32_t s = mod2div(a,b,&c);
     uint32_t r = exgcd(b,c,x,y);
    uint32_t temp = *y;
    *y= mod2sub(*x,mod2mul(s,*y));
    *x= temp;
    return r;
}

uint8_t affine(uint8_t a){
    uint8_t tmp = 0;
    uint8_t c = 0xf1;
    for(int i = 0 ;i<8;i++){
        uint8_t tmp2= 0;
        for(int j = 0;j<8;j++){
            tmp2 ^= ((a>>j)&1) & ((ROF8(c,i)>>j)&1);
        }
        tmp += tmp2<<i;
    }
    tmp = tmp ^ 0x63;
    return tmp;
}
/*
const uint8_t sbox[256] = 
{
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76, 
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, 
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15, 
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, 
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84, 
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf, 
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8, 
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, 
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73, 
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb, 
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79, 
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08, 
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a, 
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e, 
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, 
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
};
*/
uint8_t sbox[256];

void init_sbox(void)
{
    uint32_t a=0;
    uint32_t b=0;
    for(int i = 0;i<256;i++){
        exgcd(0x11b, i, &a,&b);
        sbox[i] = affine(b);
        // printf("0x%X, ",affine(b));
        // if((i+1)%8==0){
        //     printf("\n");
        // }
    }
};

const uint8_t InverseSbox[256] = 
{
    0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
    0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
    0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
    0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
    0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
    0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
    0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
    0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
    0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
    0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
    0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
    0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
    0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
    0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
    0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
    0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D
}; // Inverse Sbox

const uint8_t mix_column_matrix[4][4] = {{0x02, 0x03, 0x01, 0x01},
                                         {0x01, 0x02, 0x03, 0x01},
                                         {0x01, 0x01, 0x02, 0x03},
                                         {0x03, 0x01, 0x01, 0x02}};

const uint8_t inv_mix_column_matrix[4][4] = {{0x0e, 0x0b, 0x0d, 0x09},
                                             {0x09, 0x0e, 0x0b, 0x0d},
                                             {0x0d, 0x09, 0x0e, 0x0b},
                                             {0x0b, 0x0d, 0x09, 0x0e}};
/*
const uint8_t log_table[256]={    0,   0,  25,   1,  50,   2,  26, 198,  75, 199,  27, 104,  51, 238, 223,   3,
                                100,   4, 224,  14,  52, 141, 129, 239,  76, 113,   8, 200, 248, 105,  28, 193,
                                125, 194,  29, 181, 249, 185,  39, 106,  77, 228, 166, 114, 154, 201,   9, 120,
                                101,  47, 138,   5,  33,  15, 225,  36,  18, 240, 130,  69,  53, 147, 218, 142,
                                150, 143, 219, 189,  54, 208, 206, 148,  19,  92, 210, 241,  64,  70, 131,  56,
                                102, 221, 253,  48, 191,   6, 139,  98, 179,  37, 226, 152,  34, 136, 145,  16,
                                126, 110,  72, 195, 163, 182,  30,  66,  58, 107,  40,  84, 250, 133,  61, 186,
                                 43, 121,  10,  21, 155, 159,  94, 202,  78, 212, 172, 229, 243, 115, 167,  87,
                                175,  88, 168,  80, 244, 234, 214, 116,  79, 174, 233, 213, 231, 230, 173, 232,
                                 44, 215, 117, 122, 235,  22,  11, 245,  89, 203,  95, 176, 156, 169,  81, 160,
                                127,  12, 246, 111,  23, 196,  73, 236, 216,  67,  31,  45, 164, 118, 123, 183,
                                204, 187,  62,  90, 251,  96, 177, 134,  59,  82, 161, 108, 170,  85,  41, 157,
                                151, 178, 135, 144,  97, 190, 220, 252, 188, 149, 207, 205,  55,  63,  91, 209,
                                 83,  57, 132,  60,  65, 162, 109,  71,  20,  42, 158,  93,  86, 242, 211, 171,
                                 68,  17, 146, 217,  35,  32,  46, 137, 180, 124, 184,  38, 119, 153, 227, 165,
                                103,  74, 237, 222, 197,  49, 254,  24,  13,  99, 140, 128, 192, 247, 112,   7};

const uint8_t exp_table[255] = {0x01, 0x03, 0x05, 0x0f, 0x11, 0x33, 0x55, 0xff, 0x1a, 0x2e, 0x72, 0x96, 0xa1, 0xf8, 0x13, 0x35,
                                0x5f, 0xe1, 0x38, 0x48, 0xd8, 0x73, 0x95, 0xa4, 0xf7, 0x02, 0x06, 0x0a, 0x1e, 0x22, 0x66, 0xaa,
                                0xe5, 0x34, 0x5c, 0xe4, 0x37, 0x59, 0xeb, 0x26, 0x6a, 0xbe, 0xd9, 0x70, 0x90, 0xab, 0xe6, 0x31,
                                0x53, 0xf5, 0x04, 0x0c, 0x14, 0x3c, 0x44, 0xcc, 0x4f, 0xd1, 0x68, 0xb8, 0xd3, 0x6e, 0xb2, 0xcd,
                                0x4c, 0xd4, 0x67, 0xa9, 0xe0, 0x3b, 0x4d, 0xd7, 0x62, 0xa6, 0xf1, 0x08, 0x18, 0x28, 0x78, 0x88,
                                0x83, 0x9e, 0xb9, 0xd0, 0x6b, 0xbd, 0xdc, 0x7f, 0x81, 0x98, 0xb3, 0xce, 0x49, 0xdb, 0x76, 0x9a,
                                0xb5, 0xc4, 0x57, 0xf9, 0x10, 0x30, 0x50, 0xf0, 0x0b, 0x1d, 0x27, 0x69, 0xbb, 0xd6, 0x61, 0xa3,
                                0xfe, 0x19, 0x2b, 0x7d, 0x87, 0x92, 0xad, 0xec, 0x2f, 0x71, 0x93, 0xae, 0xe9, 0x20, 0x60, 0xa0,
                                0xfb, 0x16, 0x3a, 0x4e, 0xd2, 0x6d, 0xb7, 0xc2, 0x5d, 0xe7, 0x32, 0x56, 0xfa, 0x15, 0x3f, 0x41,
                                0xc3, 0x5e, 0xe2, 0x3d, 0x47, 0xc9, 0x40, 0xc0, 0x5b, 0xed, 0x2c, 0x74, 0x9c, 0xbf, 0xda, 0x75,
                                0x9f, 0xba, 0xd5, 0x64, 0xac, 0xef, 0x2a, 0x7e, 0x82, 0x9d, 0xbc, 0xdf, 0x7a, 0x8e, 0x89, 0x80,
                                0x9b, 0xb6, 0xc1, 0x58, 0xe8, 0x23, 0x65, 0xaf, 0xea, 0x25, 0x6f, 0xb1, 0xc8, 0x43, 0xc5, 0x54,
                                0xfc, 0x1f, 0x21, 0x63, 0xa5, 0xf4, 0x07, 0x09, 0x1b, 0x2d, 0x77, 0x99, 0xb0, 0xcb, 0x46, 0xca,
                                0x45, 0xcf, 0x4a, 0xde, 0x79, 0x8b, 0x86, 0x91, 0xa8, 0xe3, 0x3e, 0x42, 0xc6, 0x51, 0xf3, 0x0e,
                                0x12, 0x36, 0x5a, 0xee, 0x29, 0x7b, 0x8d, 0x8c, 0x8f, 0x8a, 0x85, 0x94, 0xa7, 0xf2, 0x0d, 0x17,
                                0x39, 0x4b, 0xdd, 0x7c, 0x84, 0x97, 0xa2, 0xfd, 0x1c, 0x24, 0x6c, 0xb4, 0xc7, 0x52, 0xf6};
*/
uint8_t log_table[256];
uint8_t exp_table[255];
const uint8_t g = 0x03;

uint8_t  GFmultiplication(uint8_t  a, uint8_t  b)
{
    uint8_t p=0;
    uint8_t carry;
    int i;
    for(i=0;i<8;i++)
    {
        if(b & 1)
            p ^=a;
        carry = a & 0x80;
        a = a<<1;
        if(carry)
            a^=0x1b;
        b = b>>1;
    }
    return p;
};

void init_log_table(void)
{
    log_table[0] = 0;
    for (int i = 0, x = 1; i < 255; x = GFmultiplication(x, g), i++) {
        log_table[x] = i;
        exp_table[i] = x;
        //printf("log_table[%d] = %x\n", x, i);
    }
};

uint8_t rc;

void byteSubstitution(uint8_t* plain, uint8_t* cipher) 
{
    for (int i = 0; i < 16; i++) {
        cipher[i] = sbox[plain[i]];
    }
}

void InverseByteSubstitution(uint8_t* cipher, uint8_t* plain) 
{
    for (int i = 0; i < 16; i++) 
    {
        plain[i] = InverseSbox[cipher[i]];
    }
} // Substitute

void ShiftRows(uint8_t* plain, uint8_t* cipher) {
    cipher[0] = plain[0];
    cipher[1] = plain[1];
    cipher[2] = plain[2];
    cipher[3] = plain[3];

    cipher[4] = plain[5];
    cipher[5] = plain[6];
    cipher[6] = plain[7];
    cipher[7] = plain[4];

    cipher[8] = plain[10];
    cipher[9] = plain[11];
    cipher[10] = plain[8];
    cipher[11] = plain[9];

    cipher[12] = plain[15];
    cipher[13] = plain[12];
    cipher[14] = plain[13];
    cipher[15] = plain[14];
}

void InverseShiftRows(uint8_t* cipher, uint8_t* plain) {
    plain[0] = cipher[0];
    plain[1] = cipher[1];
    plain[2] = cipher[2];
    plain[3] = cipher[3];

    plain[4] = cipher[7];
    plain[5] = cipher[4];
    plain[6] = cipher[5];
    plain[7] = cipher[6];

    plain[8] = cipher[10];
    plain[9] = cipher[11];
    plain[10] = cipher[8];
    plain[11] = cipher[9];

    plain[12] = cipher[13];
    plain[13] = cipher[14];
    plain[14] = cipher[15];
    plain[15] = cipher[12];
}

static uint8_t gmul(uint8_t x, uint8_t y) {//Galois field multiple
    if(x == 0||y == 0){
        return 0x00;
    }
    else{
        return exp_table[(log_table[x] + log_table[y]) % 255];
    }
};

void MixColumn(uint8_t* plain, uint8_t* cipher) {
    for(int i = 0; i < 4; i++){
        cipher[i] = gmul(mix_column_matrix[0][0], plain[i])^gmul(mix_column_matrix[0][1], plain[i+4])^gmul(mix_column_matrix[0][2], plain[i+8])^gmul(mix_column_matrix[0][3],plain[i+12]);
    }
    for(int i = 0; i < 4; i++){
        cipher[i+4] = gmul(mix_column_matrix[1][0], plain[i])^gmul(mix_column_matrix[1][1], plain[i+4])^gmul(mix_column_matrix[1][2], plain[i+8])^gmul(mix_column_matrix[1][3], plain[i+12]);
    }
    for(int i = 0; i < 4; i++){
        cipher[i+8] = gmul(mix_column_matrix[2][0],plain[i])^gmul(mix_column_matrix[2][1], plain[i+4])^gmul(mix_column_matrix[2][2],plain[i+8])^gmul(mix_column_matrix[2][3],plain[i+12]);
    }
    for(int i = 0; i < 4; i++){
        cipher[i+12] = gmul(mix_column_matrix[3][0], plain[i])^gmul(mix_column_matrix[3][1],plain[i+4])^gmul(mix_column_matrix[3][2],plain[i+8])^gmul(mix_column_matrix[3][3],plain[i+12]);
    }
};

void InvMixColumn(uint8_t* plain, uint8_t* cipher) {
    for(int i = 0; i < 4; i++){
        cipher[i] = gmul(inv_mix_column_matrix[0][0], plain[i])^gmul(inv_mix_column_matrix[0][1], plain[i+4])^gmul(inv_mix_column_matrix[0][2], plain[i+8])^gmul(inv_mix_column_matrix[0][3],plain[i+12]);
    }
    for(int i = 0; i < 4; i++){
        cipher[i+4] = gmul(inv_mix_column_matrix[1][0], plain[i])^gmul(inv_mix_column_matrix[1][1], plain[i+4])^gmul(inv_mix_column_matrix[1][2], plain[i+8])^gmul(inv_mix_column_matrix[1][3], plain[i+12]);
    }
    for(int i = 0; i < 4; i++){
        cipher[i+8] = gmul(inv_mix_column_matrix[2][0],plain[i])^gmul(inv_mix_column_matrix[2][1], plain[i+4])^gmul(inv_mix_column_matrix[2][2],plain[i+8])^gmul(inv_mix_column_matrix[2][3],plain[i+12]);
    }
    for(int i = 0; i < 4; i++){
        cipher[i+12] = gmul(inv_mix_column_matrix[3][0], plain[i])^gmul(inv_mix_column_matrix[3][1],plain[i+4])^gmul(inv_mix_column_matrix[3][2],plain[i+8])^gmul(inv_mix_column_matrix[3][3],plain[i+12]);
    }
}

static uint32_t u8tou32(uint8_t* u8) {
    // {0xac, 0x19, 0x28, 0x57} --> 0xac192857
    return u8[3] | (u8[2] << 8) | (u8[1] << 16) | (u8[0] << 24);
}

static void u32tou8(uint8_t* u8, uint32_t u32) {
    // 0xac192857 --> {0xac, 0x19, 0x28, 0x57}
    u8[3] = (uint8_t)u32;
    u8[2] = (uint8_t)(u32>>=8);
    u8[1] = (uint8_t)(u32>>=8);
    u8[0] = (uint8_t)(u32>>=8);
}

void keyu8tokeyu32(uint8_t* u8, uint32_t* u32) {
    /*
     s0  s1  s2  s3
     s4  s5  s6  s7
     s8  s9 s10 s11
    s12 s13 s14 s15
     |   |   |   |
     V   V   V   V
     w0  w1  w2  w3
    */
    uint8_t temp0[4] = {u8[0], u8[4], u8[8], u8[12]};
    uint8_t temp1[4] = {u8[1], u8[5], u8[9], u8[13]};
    uint8_t temp2[4] = {u8[2], u8[6], u8[10], u8[14]};
    uint8_t temp3[4] = {u8[3], u8[7], u8[11], u8[15]};
    u32[0] = u8tou32(temp0);
    u32[1] = u8tou32(temp1);
    u32[2] = u8tou32(temp2);
    u32[3] = u8tou32(temp3);
}

void keyu32tokeyu8(uint8_t* u8, uint32_t* u32) {
    /*
     w0  w1  w2  w3
     |   |   |   |
     V   V   V   V
     s0  s1  s2  s3
     s4  s5  s6  s7
     s8  s9 s10 s11
    s12 s13 s14 s15
    */
    uint8_t temp[4][4];
    for(int i = 0; i < 4; i++){
        u32tou8(temp[i], u32[i]);
    }

    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            u8[4*i+j] = temp[j][i];
        }
    }
}

void byteSubstitution4turn(uint8_t* initial, uint8_t* expanded) 
{
    for (int i = 0; i < 4; i++) {
        expanded[i] = sbox[initial[i]];
    }
}

void RoundConstant(uint8_t* initial, uint8_t* expanded) {
    //printf("rc=%x\n", rc);
    expanded[0] = initial[0]^rc;
    expanded[1] = initial[1];
    expanded[2] = initial[2];
    expanded[3] = initial[3];
    if(rc == 0){
        rc = 1;
    }
    else if(rc < 0x80){
        rc *= 2;
    }
    else{
        rc = (rc*2)^0x1b;
    }
    /*
    printf("initial[0]=%x\n", initial[0]);
    printf("expanded[0]=%x\n", expanded[0]);
    printf("rc=%x\n", rc);
    */
}

uint32_t gFunction(uint32_t initial) {
    uint8_t temp[4][4];
    u32tou8(temp[0], initial);

    //1.RotWords
    temp[1][0] = temp[0][1];
    temp[1][1] = temp[0][2];
    temp[1][2] = temp[0][3];
    temp[1][3] = temp[0][0];

    //2.SubByte
    byteSubstitution4turn(temp[1], temp[2]);

    //3.RoundConstant
    RoundConstant(temp[2], temp[3]);

    return u8tou32(temp[3]);
}

void KeyExpansion(uint32_t* initial, uint32_t* expanded) {
    uint32_t temp = gFunction(initial[3]);
    expanded[0] = initial[0]^temp;
    expanded[1] = initial[1]^expanded[0];
    expanded[2] = initial[2]^expanded[1];
    expanded[3] = initial[3]^expanded[2];
    
    //printf("rc=%x\n", rc);
    /*
    for(int i = 0; i < 4; i++){
        printf("%x,\n", expanded[i]);
    }
    printf("\n");
    */
}

void AddRoundkey(uint8_t* plain, uint8_t* cipher, uint32_t* initialkey, uint32_t* roundkey) {
    KeyExpansion(initialkey, roundkey);
    uint8_t temp[16];
    keyu32tokeyu8(temp, initialkey);
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    for (int i = 0; i < 16; i++) {
        cipher[i] = plain[i]^temp[i];
    }
}

void InvAddRoundkey(uint8_t* cipher, uint8_t* plain, uint32_t* roundkey) {
    uint8_t temp[16];
    keyu32tokeyu8(temp, roundkey);
    for (int i = 0; i < 16; i++) {
        plain[i] = cipher[i]^temp[i];
    }
}

void EncryptRound(uint8_t* plain, uint8_t* cipher, uint32_t* initialkey, uint32_t* roundkey) {
    uint8_t temp[3][16];
    byteSubstitution(plain, temp[0]);
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[0][4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    ShiftRows(temp[0], temp[1]);
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[1][4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    MixColumn(temp[1], temp[2]);
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[2][4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    AddRoundkey(temp[2], cipher, initialkey, roundkey);
}

void Encrypt(uint8_t* plain, uint8_t* cipher, uint8_t* key) {
    
    rc = 0x01; //round constant
    uint8_t encrypttext[10][16];
    uint32_t keyu32[4];
    keyu8tokeyu32(key, keyu32);
    uint32_t expandkey[11][4];

    AddRoundkey(plain, encrypttext[0], keyu32, expandkey[0]);
    /*
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", encrypttext[0][4*i+j]);
        }
        printf("\n");
    }
    printf("\n");
    */
    for(int i = 0; i < 9; i++){
        EncryptRound(encrypttext[i], encrypttext[i+1], expandkey[i], expandkey[i+1]);
        /*
        if(i==8){
            for(int k = 0; k < 4; k++){
                for(int j = 0; j < 4; j++){
                    printf("%x, ", encrypttext[9][4*k+j]);
                }
                printf("\n");
            }
        }
        */
    }

    uint8_t temp[2][16];
    byteSubstitution(encrypttext[9], temp[0]);
    /*
    for(int k = 0; k < 4; k++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[0][4*k+j]);
        }
        printf("\n");
    }
    */
    ShiftRows(temp[0], temp[1]);
    /*
    for(int k = 0; k < 4; k++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", temp[1][4*k+j]);
        }
        printf("\n");
    }
    */
    AddRoundkey(temp[1], cipher, expandkey[9], expandkey[10]);
    /*
    for(int k = 0; k < 4; k++){
        printf("%x,\n", expandkey[9][k]);
    }

    for(int k = 0; k < 4; k++){
        for(int j = 0; j < 4; j++){
            printf("%x, ", cipher[4*k+j]);
        }
        printf("\n");
    }
    */
}

void DecryptRound(uint8_t* cipher, uint8_t* plain, uint32_t* roundkey) {
    uint8_t temp[3][16];
    InverseShiftRows(cipher, temp[0]);
    InverseByteSubstitution(temp[0], temp[1]);
    InvAddRoundkey(temp[1], temp[2], roundkey);
    InvMixColumn(temp[2], plain);
}

void Decrypt(uint8_t* cipher, uint8_t* plain, uint8_t* key) {
    rc = 0x01; //round constant
    uint8_t decrypttext[10][16];
    uint32_t keyu32[4];
    keyu8tokeyu32(key, keyu32);
    uint32_t expandkey[10][4];

    KeyExpansion(keyu32, expandkey[0]);
    for(int i = 0; i < 9; i++){
        KeyExpansion(expandkey[i], expandkey[i+1]);
    }

    InvAddRoundkey(cipher, decrypttext[0], expandkey[9]);
    for(int i = 0; i < 9; i++){
        DecryptRound(decrypttext[i], decrypttext[i+1], expandkey[8-i]);
    }

    uint8_t temp[2][16];
    InverseShiftRows(decrypttext[9], temp[0]);
    InverseByteSubstitution(temp[0], temp[1]);
    InvAddRoundkey(temp[1], plain, keyu32);
}

/*
void init_log_table(void)
{
    log_table[0] = 0;
    for (int i = 0, x = 1; i < 255; x = GFmultiplication(x, g), i++) {
        log_table[x] = i;
        exp_table[i] = x;
        //printf("log_table[%d] = %x\n", x, i);
    }
};
*/

/*
uint8_t  GFmultiplication(uint8_t  a, uint8_t  b)
{
    uint8_t p=0;
    uint8_t carry;
    int i;
    for(i=0;i<8;i++)
    {
        if(b & 1)
            p ^=a;
        carry = a & 0x80;
        a = a<<1;
        if(carry)
            a^=0x1b;
        b = b>>1;
    }
    return p;
};
*/
