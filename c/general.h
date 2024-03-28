#include <stdio.h>
#include <string.h>
#include <stdint.h>
# define ROF8(x,n) (((x << n) | (x >> (8-n))) & 0xff)

/***************************/
extern uint8_t plaintext[16];
extern uint8_t ciphertext[16];
extern uint8_t key[16];
extern uint32_t expandkey[4];

/******************************************/
extern const char encoding_table[64];
extern uint8_t FindIndex(const char[], int, char);

/******************************************/
uint32_t maxbit(uint32_t);
uint32_t mod2add( uint32_t, uint32_t);
uint32_t mod2sub( uint32_t, uint32_t);
uint32_t mod2mul( uint32_t, uint32_t);
uint32_t mod2div( uint32_t, uint32_t, uint32_t*);
uint32_t exgcd( uint32_t, uint32_t, uint32_t*, uint32_t*);
uint8_t affine(uint8_t);
extern uint8_t sbox[256];
void init_sbox(void);
//extern const uint8_t sbox[256];
/******************************************/

extern const uint8_t mix_column_matrix[4][4];
extern const uint8_t inv_mix_column_matrix[4][4];
extern uint8_t log_table[256];
extern uint8_t exp_table[255];
//extern const uint8_t log_table[256];
//extern const uint8_t exp_table[255];
uint8_t GFmultiplication(uint8_t, uint8_t);
void init_log_table(void);
extern uint8_t rc;

/************1.SubByte******************/
void byteSubstitution(uint8_t*, uint8_t*);  //check
/////////////////////////////////////////
void InverseByteSubstitution(uint8_t*, uint8_t*);  //check

/************2.ShiftRows****************/
void ShiftRows(uint8_t*, uint8_t*);  //check
/////////////////////////////////////////
void InverseShiftRows(uint8_t*, uint8_t*);  //check

/************3.Mix Column****************/
static uint8_t gmul(uint8_t, uint8_t);  //check
void MixColumn(uint8_t*, uint8_t*);  //check
void InvMixColumn(uint8_t*, uint8_t*);  //check

/**********4.AddRoundkey*****************/
static uint32_t u8tou32(uint8_t*);  //check
static void u32tou8(uint8_t*, uint32_t);  //check
void keyu8tokeyu32(uint8_t*, uint32_t*);  //check
void keyu32tokeyu8(uint8_t*, uint32_t*);  //check
void byteSubstitution4turn(uint8_t*, uint8_t*);  //check
void RoundConstant(uint8_t*, uint8_t*);  //check
uint32_t gFunction(uint32_t);  //check
void KeyExpansion(uint32_t*, uint32_t*);  //check
void AddRoundkey(uint8_t*, uint8_t*, uint32_t*, uint32_t*);  //check
//////////////////////////////////////////
void InvAddRoundkey(uint8_t*, uint8_t*, uint32_t*);  //check

/***************Encrypt******************/
void EncryptRound(uint8_t*, uint8_t*, uint32_t*, uint32_t*);  //check
void Encrypt(uint8_t*, uint8_t*, uint8_t*);  //check
//////////////////////////////////////////
void DecryptRound(uint8_t*, uint8_t*, uint32_t*);  //check
void Decrypt(uint8_t*, uint8_t*, uint8_t*);  //check
//void init_log_table(void);

//char* hextobin(const char);
//void bytetobin(const char*, char*);

//void xor_byte(const char*, const char*, char*);