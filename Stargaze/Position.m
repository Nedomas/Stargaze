#import "Position.h"

@implementation Position;

@synthesize locMgr, delegate;

- (id)init {
  self = [super init];
 
  if(self != nil) {
    self.locMgr = [[CLLocationManager alloc] init]; // Create new instance of locMgr
    self.locMgr.delegate = self; // Set the delegate as self.
  }
 
  return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
  if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {  // Check if the class assigning itself as the delegate conforms to our protocol.  If not, the message will go nowhere.  Not good.
    [self.delegate locationUpdate:newLocation];
  }
}
 
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  if([self.delegate conformsToProtocol:@protocol(CoreLocationControllerDelegate)]) {  // Check if the class assigning itself as the delegate conforms to our protocol.  If not, the message will go nowhere.  Not good.
    [self.delegate locationError:error];
  }
}
@end