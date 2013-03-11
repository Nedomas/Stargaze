#import "MainViewController.h"
#import "MainView.h"
#import "SimulateView.h"
 
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

  switch ([sender tag]) 
  {
    case 1: // Log my coords!
      NSLog(@"Position DATA");
      NSLog(@"Longitute: %@", [[position getCoords] objectForKey:@"longitude"]);
      NSLog(@"Latitude: %@", [[position getCoords] objectForKey:@"latitude"]);
      NSLog(@"Roll: %@", [[position getMotion] objectForKey:@"roll"]);
      NSLog(@"Pitch: %@", [[position getMotion] objectForKey:@"pitch"]);
      NSLog(@"Heading: %@", [[position getHeading] objectForKey:@"heading"]);
      break;
    case 2: { // Simulate
      CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
      SimulateView *simulateView = [[SimulateView alloc] initWithFrame:mainFrame];
      self.view = simulateView;
      // self.view.longitudeField.delegate = self;
      break;
    }
    case 3: {
      NSString *longitude = ((UITextField *)[self.view viewWithTag:1]).text;
      NSString *latitude = ((UITextField *)[self.view viewWithTag:2]).text;
      [position setCoords:[[NSDictionary alloc] initWithObjectsAndKeys:
        longitude, @"longitude", latitude, @"latitude", nil]];

      // go back to main view
      CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
      MainView *mainView = [[MainView alloc] initWithFrame:mainFrame];
      self.view = mainView;
      break;
    }
  }

}

@end