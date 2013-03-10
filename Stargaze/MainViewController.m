#import "MainViewController.h"
#import "MainView.h"
 
@implementation MainViewController

@synthesize gps;

// if view = nil, then loadView is called
- (void)loadView {
  // start locating
  gps = [[Position alloc] init];
  // create the main view
  CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
  MainView *mainView = [[MainView alloc] initWithFrame:mainFrame];
  self.view = mainView;
}

-(void)buttonTouched:(id)sender {
  NSLog(@"Longitute: %@", [gps.coords objectForKey:@"longitude"]);
  NSLog(@"Latitude: %@", [gps.coords objectForKey:@"latitude"]);
}

@end