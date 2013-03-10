#import "MainViewController.h"
#import "MainView.h"
 
@implementation MainViewController

@synthesize position;

// if view = nil, then loadView is called
- (void)loadView {
  // start locating
  position = [[Position alloc] init];
  // create the main view
  CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
  MainView *mainView = [[MainView alloc] initWithFrame:mainFrame];
  self.view = mainView;
}

- (void)buttonTouched:(id)sender {
  NSLog(@"Location DATA");
  NSLog(@"Longitute: %@", [position.coords objectForKey:@"longitude"]);
  NSLog(@"Latitude: %@", [position.coords objectForKey:@"latitude"]);

  // Refs http://developer.apple.com/library/ios/#documentation/CoreMotion/Reference/CMDeviceMotion_Class/Reference/Reference.html#//apple_ref/doc/c_ref/CMDeviceMotion
  NSLog(@"Motion DATA");
  NSLog(@"Attitude roll: %f", position.motion.attitude.roll);
  NSLog(@"Rotation rate. X:%f, Y:%f, Z:%f", position.motion.rotationRate.x,
    position.motion.rotationRate.y, position.motion.rotationRate.z);
  NSLog(@"Gravity. X:%f, Y:%f, Z:%f", position.motion.gravity.x, position.motion.gravity.y,
    position.motion.gravity.z);
  NSLog(@"Magnetic Field. X:%f, Y:%f, Z:%f", position.motion.magneticField.field.x,
    position.motion.magneticField.field.y, position.motion.magneticField.field.z);
}

@end