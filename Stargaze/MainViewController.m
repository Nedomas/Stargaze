#import "MainViewController.h"
#import "MainView.h"
#import "SimulateView.h"

extern BOOL simulate;
 
@implementation MainViewController

@synthesize position;

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
      break;
    }
    case 3: { // Save
      NSString *longitude = ((UITextField *)[self.view viewWithTag:1]).text;
      NSString *latitude = ((UITextField *)[self.view viewWithTag:2]).text;
      [position setCoords:[[NSDictionary alloc] initWithObjectsAndKeys:
        longitude, @"longitude", latitude, @"latitude", nil]];
      NSString *heading = ((UITextField *)[self.view viewWithTag:3]).text;
      [position setHeading:[[NSDictionary alloc] initWithObjectsAndKeys:
        heading, @"heading", nil]];
      NSString *roll = ((UITextField *)[self.view viewWithTag:4]).text;
      NSString *pitch = ((UITextField *)[self.view viewWithTag:5]).text;
      [position setMotion:[[NSDictionary alloc] initWithObjectsAndKeys:
        roll, @"roll", pitch, @"pitch", nil]];


      // go back to main view
      CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
      MainView *mainView = [[MainView alloc] initWithFrame:mainFrame];
      self.view = mainView;
      break;
    }
  }

}

@end