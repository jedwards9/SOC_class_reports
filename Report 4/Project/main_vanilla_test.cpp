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
#include "sseg_core.h"
#include "spi_core.h"
#include "vector3.h"
#include <cstdlib>


Vector3 getAccel(SpiCore *spi_p){
   const uint8_t RD_CMD = 0x0b;
   const uint8_t DATA_REG = 0x08;
   const float raw_max = 127.0 / 2.0;  //128 max 8-bit reading for +/-2g

   int8_t xraw, yraw, zraw;
   Vector3 val;

   spi_p->set_freq(400000);
   spi_p->set_mode(0, 0);
   // read 8-bit x/y/z g values once
   spi_p->assert_ss(0);    // activate
   spi_p->transfer(RD_CMD);  // for read operation
   spi_p->transfer(DATA_REG);  //
   xraw = spi_p->transfer(0x00);
   yraw = spi_p->transfer(0x00);
   zraw = spi_p->transfer(0x00);
   spi_p->deassert_ss(0);
   val.setX((float) xraw / raw_max);
   val.setY((float) yraw / raw_max);
   val.setZ((float) zraw / raw_max);
   return val;
}

// instantiate modules
GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));
SsegCore sseg(get_slot_addr(BRIDGE_BASE,S8_SSEG));
SpiCore spi(get_slot_addr(BRIDGE_BASE, S9_SPI));

int main() {
	sseg.set_dp(0x00);
	uint8_t top = 0x7E;
	uint8_t bottom = 0x77;
	uint8_t left = 0x79;
	uint8_t right = 0x4F;

	//clear display
	for(int i = 0;i < 8; i++){
		sseg.write_1ptn(0x7F, i);
	}

	while (1) {
		uint8_t target;
		Vector3 accel = getAccel(&spi);
		accel.normalize();

		if(accel.getX() > 0){
			sseg.write_1ptn(0xFF, 1);
		}
		else{
			sseg.write_1ptn(0x00, 1);
		}
		if(accel.getY() > 0){
			sseg.write_1ptn(0xFF, 2);
		}
		else{
			sseg.write_1ptn(0x00, 2);
		}

		if(abs(accel.getX()) > abs(accel.getY())){
			if(accel.getX() > 0){
				target = top;
			}
			else{
				target = bottom;
			}
		}
		else{
			if(accel.getY() > 0){
				target = left;
			}
			else{
				target = right;
			}
		}
		sseg.write_1ptn(target, 0);
		sleep_ms(100);
   } //while
} //main

