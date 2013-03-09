#import "MainViewController.h"
 
@implementation MainViewController

@synthesize gps;

// if view = nil, then loadView is called
- (void)loadView {
  // start locating
  gps = [[Position alloc] init];

  // create the main view
  CGRect mainFrame = [[UIScreen mainScreen] applicationFrame];
  UIView *mainView = [[UIView alloc] initWithFrame:mainFrame];
  mainView.backgroundColor = [UIColor blueColor];
  self.view = mainView;

  // create button
  UIButton *positionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  positionButton.frame = CGRectMake(10,10,150,50);
  positionButton.center = self.view.center;
  [positionButton setTitle:@"Log my coords!" forState:UIControlStateNormal];
  [positionButton addTarget:self action:@selector(buttonTouched:)
    forControlEvents:UIControlEventTouchUpInside];

  // place the button on the mainView
  [mainView addSubview:positionButton];
}

-(void)buttonTouched:(id)sender {
 NSLog(@"Longitute: %@", [gps.coords objectForKey:@"longitude"]);
 NSLog(@"Latitude: %@", [gps.coords objectForKey:@"latitude"]);
}

@end