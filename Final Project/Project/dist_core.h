#ifndef _DIST_H_INCLUDED
#define _DIST_H_INCLUDED

#include "chu_init.h"

class DistCore{
	public:
	enum{
		RD_DATA = 0x0,
		RD_STATUS = 0x1
	};
	
	enum{
		READY_FIELD  = 0x00000100,
		WRITES_FIELD = 0x000000FF,
	};
	
	DistCore(uint32_t core_base_addr);
	~DistCore();
	
	void updateDist();
	int checkReady();
	int checkNumWrites();
	uint32_t getStatusReg();
	float getDistRaw();
	float getDistCm();
	float getDistIn();
	void calibrate(float realDist);
	
	
	private:
	uint32_t base_addr;
	float calibration;
};

#endif
