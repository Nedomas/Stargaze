#import <Foundation/Foundation.h>
#import "math.h"

@interface Vector3 : NSObject {
	float x;
	float y;
	float z;
}
-(id)initWithZeros;
-(float) length;
-(void) normalize;
-(float) getX;
-(float) getY;
-(float) getZ;
@end