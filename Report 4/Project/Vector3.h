#ifndef _VEC3_INCLUDED
#define _VEC3_INCLUDED
#include <math.h>

class Vector3 {

public:
   float getX(){return x;}
   float getY(){return y;}
   float getZ(){return z;}
   void setX(float x_){x = x_;}
   void setY(float y_){y = y_;}
   void setZ(float z_){z = z_;}
   float getMag();
   void normalize();

private:
   float x;
   float y;
   float z;
};

#endif  // _VEC3_INCLUDED
