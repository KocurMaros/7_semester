/*
 * lps25hb.c
 *
 *  Created on: Oct 27, 2023
 *      Author: laptop
 */
#include "lps25hb.h"
#include "math.h"
#include "usart.h"
static uint8_t address = 0x5E << 1;

void lps25hb_write_byte(uint8_t reg_address, uint8_t *data,uint8_t len)
{
//	i2c_master_write_byte(address, reg_address, data);
	i2c_master_write(data, reg_address, address,len);
}

void lps25hb_read_bytes(uint8_t *data, uint8_t reg_address,uint8_t len)
{
	i2c_master_read(data, len, reg_address, address);
}

uint8_t lps25hb_init()
{
	// verify WHO_AM_I

	// set up sensor registers
	uint8_t mod2 = 0b11100000;

	uint8_t mod1;
	lps25hb_read_bytes(&mod1,0x7,1);
	mod1 = mod1 | 0x0 << 2;
	mod1 = mod1 | 1<<1;
	mod1 = mod1 & ~(0b0);
	lps25hb_write_byte(TLV493_MOD1, &mod1,1);
	lps25hb_write_byte(TLV493_MOD2, &mod2,1);
	return 1;
}

float lps25hb_get_pressure(float *coord)
{
	uint8_t data[6];
	lps25hb_read_bytes(&data,0x0,6);
	uint16_t x = (uint16_t)((data[0] << 8)) | (data[4] >> 4);
    uint16_t y = (uint16_t)(data[1] << 8 | (data[4] & 0b1111) << 8);
    uint16_t z = (uint16_t)(data[2] << 8) | (data[5] & 0b1111);
    coord[0] = (float)x*TLV493D_B_MULT;
    coord[1] = (float)y*TLV493D_B_MULT;
    coord[2] = (float)z*TLV493D_B_MULT;

	return 0;
}

float lps25hb_calculate_altitude(float pressure)
{
	// https://community.bosch-sensortec.com/t5/Question-and-answers/How-to-calculate-the-altitude-from-the-pressure-sensor-data/qaq-p/5702
	return 44330 * (1 - pow(pressure/1013.25, 1/5.255));
}

