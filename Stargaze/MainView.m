#import "MainView.h"

@implementation MainView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  self.backgroundColor = [UIColor blueColor];

  // create button
  UIButton *positionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  positionButton.frame = CGRectMake(10,10,150,50);
  positionButton.center = self.center;
  [positionButton setTitle:@"Log my coords!" forState:UIControlStateNormal];

  // send the message to the superview, in this case MainViewController
  // NSLog(@"%@", self.superview);
  // got no idea why logging it does not work
  [positionButton addTarget:self.superview action:@selector(buttonTouched:)
    forControlEvents:UIControlEventTouchUpInside];

  // place the button on the self
  [self addSubview:positionButton];
  return self;
}

@end