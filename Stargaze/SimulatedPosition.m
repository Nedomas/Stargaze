#import "SimulatedPosition.h"
 
@implementation SimulatedPosition

- (id)init {
  self = [super init];

  // editable values
  [self setCoords:[[NSDictionary alloc] initWithObjectsAndKeys:
    @"-100.123456", @"longitude", @"50.123456", @"latitude", nil]];
  [self setHeading:[[NSDictionary alloc] initWithObjectsAndKeys:
    @"15", @"heading", nil]];
  [self setMotion:[[NSDictionary alloc] initWithObjectsAndKeys:
    @"40", @"roll", @"10", @"pitch", nil]];

  return self;
}

- (void)setCoords:(NSDictionary *)value {
  coords = value;
}

- (NSDictionary *)getCoords {
  return coords;
}

- (void)setHeading:(NSDictionary *)value {
  heading = value;
}
- (NSDictionary *)getHeading {
  return heading;
}

- (NSDictionary *)getMotion {
  return motion;
}

- (void)setMotion:(NSDictionary *)value {
  motion = value;
}

@end