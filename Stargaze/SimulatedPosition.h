#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface SimulatedPosition : NSObject {
  NSDictionary *coords;
  NSDictionary *heading;
  NSDictionary *motion;
}

- (void)setCoords:(NSDictionary *)value;
- (NSDictionary *)getCoords;
- (void)setHeading:(NSDictionary *)value;
- (NSDictionary *)getHeading;
- (NSDictionary *)getMotion;

@end