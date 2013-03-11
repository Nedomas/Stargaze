#import "MainView.h"

@implementation MainView

extern BOOL simulate;

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  self.backgroundColor = [UIColor blueColor];

  UIButton *logButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  logButton.tag = 1;
  logButton.frame = CGRectMake(0,0,150,50);
  logButton.center = self.center;
  [logButton setTitle:@"Log my coords!" forState:UIControlStateNormal];
  // send the message to the superview, in this case MainViewController
  [logButton addTarget:self.superview action:@selector(buttonTouched:)
    forControlEvents:UIControlEventTouchUpInside];

  if (simulate) {
    UIButton *simulateButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    simulateButton.tag = 2;
    simulateButton.frame = CGRectMake(210,400,100,50);
    [simulateButton setTitle:@"Simulate" forState:UIControlStateNormal];
    [simulateButton addTarget:self.superview action:@selector(buttonTouched:)
      forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:simulateButton];
  }

  // place the buttons on the self
  [self addSubview:logButton];
  return self;
}

@end