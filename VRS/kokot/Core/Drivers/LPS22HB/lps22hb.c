/*
 * lp22hb.c
 *
 *  Created on: Nov 4, 2023
 *      Author: laptop
 */
#include "lp22hb.h"

static uint8_t slaveAddress = LPS22HB_I2C_ADDRESS_0;

void lps22hb_write_bytes(uint8_t *data, uint8_t reg_address, uint8_t len){
    masterWriteMultiByte(data, len, slaveAddress, reg_address);
}
void lps22hb_read_bytes(uint8_t *data, uint8_t reg_address, uint8_t len){
    masterReadMultiByte(data, len, slaveAddress, reg_address);
}

uint8_t lps22hb_init(){
    uint8_t ID;
    lps22hb_read_bytes(&ID,LPS22HB_REG_WHO_AM_I_ADDR,1);
    if(ID != LPS22HB_WHO_AM_I_VALUE){
        slaveAddress = LPS22HB_I2C_ADDRESS_1;
        lps22hb_read_bytes(&ID,LPS22HB_REG_WHO_AM_I_ADDR,1);
        if(ID != LPS22HB_WHO_AM_I_VALUE)
            return 0;
    }
    uint8_t ctrl1 = 0b00110000;
    lps22hb_write_bytes(&ctrl1,LPS22HB_REG_CTRL_REG1,1);
    return 1;
}   

float lps22hb_get_pressure(){
    uint8_t data[3];
    lps22hb_read_bytes(&data,LPS22HB_REG_PRESS_OUT_XL,3);
    return ((data[0] | data[1] << 8 | data[2] << 16)/4096.0); 
} 
float lps22hb_calculate_altitude(float pressure){
    return 44330 * (1 - pow(pressure/1013.25, 1/5.255));
}


