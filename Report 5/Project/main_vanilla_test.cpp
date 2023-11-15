/*****************************************************************//**
 * @file main_vanilla_test.cpp
 *
 * @brief Basic test of 4 basic i/o cores
 *
 * @author p chu
 * @version v1.0: initial release
 *********************************************************************/

//#define _DEBUG
#include "chu_init.h"
#include "gpio_cores.h"
#include "xadc_core.h"
#include "sseg_core.h"
#include "i2c_core.h"

float getTemp(I2cCore *adt7420_p, GpoCore *led_p) {
   const uint8_t DEV_ADDR = 0x4b;
   uint8_t wbytes[2], bytes[2];
   //int ack;
   uint16_t tmp;
   float tmpC;
   
   wbytes[0] = 0x00;
   adt7420_p->write_transaction(DEV_ADDR, wbytes, 1, 1);
   adt7420_p->read_transaction(DEV_ADDR, bytes, 2, 0);

   // conversion
   tmp = (uint16_t) bytes[0];
   tmp = (tmp << 8) + (uint16_t) bytes[1];
   if (tmp & 0x8000) {
      tmp = tmp >> 3;
      tmpC = (float) ((int) tmp - 8192) / 16;
   } else {
      tmp = tmp >> 3;
      tmpC = (float) tmp / 16;
   }
   return tmpC
}

// instantiate modules
SsegCore sseg(get_slot_addr(BRIDGE_BASE,S8_SSEG));
I2cCore adt7420(get_slot_addr(BRIDGE_BASE, S10_I2C));

int main() {
	sseg.set_dp(0x00);
	uint8_t C = 0xC6;
	uint8_t neg = 0xBF;
	uint8_t zero = 0xC0;

	//clear display
	for(int i = 0;i < 8; i++){
		sseg.write_1ptn(0x7F, i);
	}

	while (1) {
		float temp = getTemp(&adt7420, &led);
		int16_t tempManip = getTemp * 100;
		int8_t i = 1;
		uint8_t isPositive = tempManip > 0;
		
		sseg.write_1ptn(F,0);
		sseg.set_dp(0x08);
		
		//output each digit starting at one's place
		while(tempManip != 0){
			sseg.write(sseg.h2s(tempManip % 10), i);
			i++;
			tempManip = tempManip / 10;
		}
		
		//if only a decimal part, pad zeros until leading zero for decimal point
		while (i < 4){
			sseg.write(zero, i);
			i++;
		}
		
		if(!isPositive){
			sseg.write(neg, i);
		}
		
		sleep_ms(100);
   } //while
} //main

