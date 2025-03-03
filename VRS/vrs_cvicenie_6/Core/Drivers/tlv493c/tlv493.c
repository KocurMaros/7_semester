#include "tlv493.h"

uint16_t dataX, dataY, dataZ;

void tlv493_write_bytes(uint8_t reg_address, uint8_t *data, uint8_t len){
    i2c_master_write(data, reg_address, TLV493_ADDRESS, len);
}
void tlv493_read_bytes(uint8_t reg_address, uint8_t *data, uint8_t len){
    i2c_master_read(data, reg_address, TLV493_ADDRESS, len);
}

uint8_t tlv493_init(){
	uint8_t mod1 = 0x0;
    uint8_t mod2 = 0b11100000;
    tlv493_read_bytes(&mod1,0x7,1);
	mod1 = mod1 | 0x0 << 2;
	mod1 = mod1 | 1<<1;
	mod1 = mod1 & ~(0b0);
	tlv493_write_bytes(TLV493_MOD1, &mod1, 1);
	tlv493_write_bytes(TLV493_MOD2, &mod2, 1);
	return 1;
}
void tlv493_update_data(){
    uint8_t data[6];
    tlv493_read_bytes(TLV493_BX1, &data,6);
    dataX = (uint16_t )((data[0] << 8)) | (data[4] >> 4);
    dataY = (uint16_t)(data[1] << 8 | (data[4] & 0b1111) << 8);
    dataZ = (uint16_t)(data[3] << 8) | data[5] & 0b1111;
}
float getX(){
    return (float)dataX*TLV493D_B_MULT;
}
float getY(){
    return (float)dataY*TLV493D_B_MULT;
}
float getZ(){
    return (float)dataZ*TLV493D_B_MULT;
}
void tlv493_test(){
    tlv493_update_data();
    char *str;
    str = malloc(32*sizeof(char));
    int len = sprintf(str,"%.2f,%.2f,%.2f\n",getX,getY,getZ);
    USART2_PutBuffer(str,len);
    free(str);
}
// void get_data(float *coord){
//     uint8_t data[6];
//     tlv493_read_bytes(&data,0x0,6);
// 	uint16_t xx = (uint16_t)((data[0] << 8)) | (data[4] >> 4);
//     uint16_t yy = (uint16_t)(data[1] << 8 | (data[4] & 0b1111) << 8);
//     uint16_t zz = (uint16_t)(data[2] << 8) | (data[5] & 0b1111);
//     coord[0] = (float)((float)xx*TLV493D_B_MULT);
//     coord[1] = (float)((float)yy*TLV493D_B_MULT);
//     coord[2] = (float)((float)zz*TLV493D_B_MULT);
// }
