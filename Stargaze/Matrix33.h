#import <Foundation/Foundation.h>
#import "math.h"
#import "Vector3.h"

@interface Matrix33 : NSObject {
	float xx;
	float xy;
	float xz;
	float yx;
	float yy;
	float yz;
	float zx;
	float zy;
	float zz;
}
-(float) getDeterminant;
-(Matrix33*) getInverse;
-(void) transpose;

@end