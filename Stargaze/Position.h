#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Position : NSObject<CLLocationManagerDelegate> {
  CLLocationManager *locationDude;
}

@property (strong, nonatomic) NSDictionary *coords;

- (void)locationManager:(CLLocationManager *)manager
didUpdateLocations:(NSArray *)locations;

@end