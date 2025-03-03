/*
 * lps25hb.h
 *
 *  Created on: Oct 27, 2023
 *      Author: laptop
 */

#ifndef DRIVERS_LPS25HB_LPS25HB_H_
#define DRIVERS_LPS25HB_LPS25HB_H_

#include "stdint.h"
#include "i2c.h"

#define LPS25HB_I2C_ADDRESS_0 0xBA
#define LPS25HB_I2C_ADDRESS_1 0xB8

#define LPS25HB_REG_WHO_AM_I_ADDR 0x0F
#define LPS25HB_WHO_AM_I_VALUE 0b10110001

#define LPS25HB_REG_CTRL_REG1 0x10
#define LPS25HB_REG_PRESS_OUT_XL 0x28
#define LPS25HB_REG_PRESS_OUT_L 0x29
#define LPS25HB_REG_PRESS_OUT_H 0x2A

#define TLV493_MOD1         0x1
#define TLV493_MOD2         0x3
#define TLV493D_B_MULT 		0.098
void lps25hb_write_byte(uint8_t reg_address, uint8_t* data,uint8_t len);
void lps25hb_read_bytes(uint8_t *data, uint8_t reg_address,uint8_t len);

uint8_t lps25hb_init();

float lps25hb_get_pressure();
float lps25hb_calculate_altitude(float pressure);


#endif /* DRIVERS_LPS25HB_LPS25HB_H_ */
