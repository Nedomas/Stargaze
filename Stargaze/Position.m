#import "Position.h"
 
@implementation Position

- (id)init {
  self = [super init];

  locationDude = [[CLLocationManager alloc] init];
  locationDude.delegate = self;
  motionDude = [[CMMotionManager alloc] init];

  [locationDude startUpdatingLocation];
  [locationDude startUpdatingHeading];
  [motionDude startDeviceMotionUpdates];

  return self;
}

- (void)setCoords:(NSDictionary *)value {
  coords = value;
}

- (NSDictionary *)getCoords {
  return coords;
}

- (void)locationManager:(CLLocationManager *)manager
didUpdateLocations:(NSArray *)locations {
  CLLocationCoordinate2D coordinates = [[locations lastObject] coordinate];
  [self setCoords:[[NSDictionary alloc] initWithObjectsAndKeys:
    [NSString stringWithFormat:@"%f", coordinates.longitude], @"longitude",
    [NSString stringWithFormat:@"%f", coordinates.latitude], @"latitude", nil]];
  
  // stop after we have any data
  [locationDude stopUpdatingLocation];
}

- (void)setHeading:(NSDictionary *)value {
  heading = value;
}

- (NSDictionary *)getHeading {
  return heading;
}

- (void)locationManager:(CLLocationManager *)manager
didUpdateHeading:(CLHeading *)newHeading {
  // it is never called in simulator with REAL data
  [self setHeading:[[NSDictionary alloc] initWithObjectsAndKeys: [NSString stringWithFormat:@"%f", newHeading.trueHeading], @"heading", nil]];
}

- (NSDictionary *)getMotion {
  NSDictionary *value = [[NSDictionary alloc] initWithObjectsAndKeys:
    [NSString stringWithFormat:@"%f", motionDude.deviceMotion.attitude.roll], @"roll",
    [NSString stringWithFormat:@"%f", motionDude.deviceMotion.attitude.pitch], @"pitch", nil];
  return value;
}

@end