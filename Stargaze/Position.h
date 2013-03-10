#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>

@interface Position : NSObject<CLLocationManagerDelegate> {
  CLLocationManager *locationDude;
  CMMotionManager *motionDude;
}

@property (strong, nonatomic) NSDictionary *coords;
@property (strong, nonatomic) CMDeviceMotion *motion;

- (void)locationManager:(CLLocationManager *)manager
didUpdateLocations:(NSArray *)locations;

@end