#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface Position : NSObject<CLLocationManagerDelegate> {
  CLLocationManager *locationDude;
  CMMotionManager *motionDude;
  NSDictionary *coords;
  NSDictionary *heading;
  NSDictionary *motion;
}

- (void)setCoords:(NSDictionary *)value;
- (NSDictionary *)getCoords;
- (void)setHeading:(NSDictionary *)value;
- (NSDictionary *)getHeading;
- (void)setMotion:(NSDictionary *)value;
- (NSDictionary *)getMotion;

- (void)locationManager:(CLLocationManager *)manager
didUpdateLocations:(NSArray *)locations;
- (void)locationManager:(CLLocationManager *)manager
didUpdateHeading:(CLHeading *)newHeading;

@end