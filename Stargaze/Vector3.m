#import "Vector3.h"

@implementation Vector3

-(id)initWithZeros{
	x = 0;
	y = 0;
	z = 0;
	return self;
}
-(id)initWithValues:(float) xx y:(float) yy z:(float) zz {
	x = xx;
	y = yy;
	z = zz;
	return self;
}
-(id)initWithVector:(float[]) v {
	/*if (v.length != 3) {
		NSLog(@"WTF");
		//crash
		return nil;
	}*/
	x = v[0];
	y = v[1];
	z = v[2];
	return self;
}
-(float) length {
	return sqrt(x*x+y+y+z*z);
}
-(void) normalize {
	float norm = self.length;
	x = x/norm;
	y = y/norm;
	z = z/norm;
}
-(float) getX{
	return x;
}
-(float) getY{
	return y;
}
-(float) getZ{
	return z;
}

@end