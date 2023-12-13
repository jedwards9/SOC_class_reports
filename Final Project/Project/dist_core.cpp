#include "dist_core.h"

DistCore::DistCore(uint32_t core_base_addr)
{
	base_addr = core_base_addr;
	calibration = 1.0;
}

DistCore::~DistCore(){}
	
void DistCore::updateDist()
{
	io_write(base_addr, RD_STATUS, 0);//address and data are arbitrary
}

int DistCore::checkReady()
{
	return (READY_FIELD & getStatusReg()) >> 8;
}

int DistCore::checkNumWrites(){
	return (WRITES_FIELD & getStatusReg());
}

uint32_t DistCore::getStatusReg(){
	return io_read(base_addr, RD_STATUS);
}

float DistCore::getDistRaw()
{
	updateDist();
	while(!checkReady()){}
	return io_read(base_addr, RD_DATA)/100.0;
}

float DistCore::getDistCm()
{
	return getDistRaw()/58.0 * calibration;
}

float DistCore::getDistIn()
{
	return getDistRaw()/148.0 * calibration;
}

void DistCore::calibrate(float realDistCm = 100){
	calibration = 1;
	float measureDist = getDistCm();
	calibration = realDistCm / measureDist;
}
