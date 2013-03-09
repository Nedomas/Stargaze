#import "Position.h"
 
@implementation Position

@synthesize coords;

- (id)init {
  self = [super init];

  locationDude = [[CLLocationManager alloc] init];
  locationDude.delegate = self;

  [locationDude startUpdatingLocation];
  self.coords = coords;

  return self;
}

- (void)locationManager:(CLLocationManager *)manager
didUpdateLocations:(NSArray *)locations {
  CLLocationCoordinate2D coordinates = [[locations lastObject] coordinate];
  coords = [[NSDictionary alloc] initWithObjectsAndKeys:
    [NSString stringWithFormat:@"%g", coordinates.longitude], @"longitude",
    [NSString stringWithFormat:@"%g", coordinates.latitude], @"latitude", nil];
  
  // stop after we have any data
  [locationDude stopUpdatingLocation];
}

@end