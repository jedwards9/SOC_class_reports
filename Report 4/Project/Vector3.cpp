#include <math.h>
#include "Vector3.h"

float Vector3::getMag(){
	return sqrt(x * x + y * y + z * z);
}

void Vector3::normalize(){
	float mag = getMag();
	if(mag == 0){
		return;
	}
	x = x/getMag();
	y = y/getMag();
	z = z/getMag();
}
