#import "MainViewController.h"
#import "MainView.h"
 
@implementation MainViewController

@synthesize position;
static BOOL simulate = YES;

// if view = nil, then loadView is called
- (void)loadView {
  
  if (simulate) {
    NSLog(@"Using SIMULATED position data.");
    position = [[SimulatedPosition alloc] init];
  } else {
    NSLog(@"Using REAL position data.");
    position = [[Position alloc] init];
  }

  // create the main view
  CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
  MainView *mainView = [[MainView alloc] initWithFrame:mainFrame];
  self.view = mainView;
}

- (void)buttonTouched:(id)sender {
  NSLog(@"Position DATA");
  NSLog(@"Longitute: %@", [[position getCoords] objectForKey:@"longitude"]);
  NSLog(@"Latitude: %@", [[position getCoords] objectForKey:@"latitude"]);
  NSLog(@"Roll: %@", [[position getMotion] objectForKey:@"roll"]);
  NSLog(@"Pitch: %@", [[position getMotion] objectForKey:@"pitch"]);
  NSLog(@"Heading: %@", [[position getHeading] objectForKey:@"heading"]);
}

@end