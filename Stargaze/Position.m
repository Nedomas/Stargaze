#import "Position.h"
 
@implementation Position

@synthesize coords;

- (id)init {
  self = [super init];

  locationDude = [[CLLocationManager alloc] init];
  locationDude.delegate = self;
  motionDude = [[CMMotionManager alloc] init];

  [locationDude startUpdatingLocation];
  [motionDude startDeviceMotionUpdates];

  self.coords = coords;
  self.motion = motionDude.deviceMotion;

  return self;
}

- (void)locationManager:(CLLocationManager *)manager
didUpdateLocations:(NSArray *)locations {
  CLLocationCoordinate2D coordinates = [[locations lastObject] coordinate];
  coords = [[NSDictionary alloc] initWithObjectsAndKeys:
    [NSString stringWithFormat:@"%f", coordinates.longitude], @"longitude",
    [NSString stringWithFormat:@"%f", coordinates.latitude], @"latitude", nil];
  
  // stop after we have any data
  [locationDude stopUpdatingLocation];
}

@end