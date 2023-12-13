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
#include "ps2_core.h"
#include "dist_core.h"
#include <cstdlib>
#include <math.h>
#include <list>

// instantiate modules
GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));
SsegCore sseg(get_slot_addr(BRIDGE_BASE,S8_SSEG));
Ps2Core ps2(get_slot_addr(BRIDGE_BASE, S11_PS2));
DistCore dist(get_slot_addr(BRIDGE_BASE, S14_DIST));

void clearDisplay(){
	for(int i = 0;i < 8; i++){
		sseg.write_1ptn(0x7F, i);
	}
	sseg.set_dp(0x00);
}

void fillDisplay(){
	for(int i = 0;i < 8; i++){
		sseg.write_1ptn(0x00, i);
	}
}

void showNum(float val, int numDec = 1){
	if(numDec != 0){
		sseg.set_dp(0x01 << (numDec));
	}
	else{
		sseg.set_dp(0x00);
	}
	
	//shift number up
	for(int i = 0; i < numDec; i++){
		val = val * 10;
	}
	
	int dispVal = floor(val);
	
	
	//output each digit starting at one's place
	int i = 0;
	while(dispVal != 0){
		sseg.write_1ptn(sseg.h2s(dispVal % 10), i);
		i++;
		dispVal = dispVal / 10;
	}
	
	//if only a decimal part, pad zeros until leading zero for decimal point
	while (i < numDec + 1){
		sseg.write_1ptn(sseg.h2s(0), i);
		i++;
	}

	while(i < 8){
		sseg.write_1ptn(0x7F, i);
		i++;
	}
}

int main() {
	uart.disp("\r\n");
	uart.disp("Initializing...");
	uart.disp("\r\n");
	clearDisplay();
	int avgNum = 2;
	
	while(1){
		float avgVal = 0;
		for(int i = 0;i < avgNum; i++){
			float currVal = dist.getDistCm();
			while(currVal > 5000){
				uart.disp("Invalid response: ");
				uart.disp(currVal);
				uart.disp("\r\n");
				sleep_ms(70);
				currVal = dist.getDistCm();
			}
			avgVal += currVal / avgNum;
			sleep_ms(60);
		}
		uart.disp("Distance: ");
		uart.disp(avgVal);
		uart.disp("cm\r\n");
		showNum(avgVal,2);
		sleep_ms(100);
	}
} //main

