#import "SimulateView.h"

@implementation SimulateView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  self.backgroundColor = [UIColor whiteColor];

  // Create value boxes
  UITextField *longitudeField = [[UITextField alloc] initWithFrame:CGRectMake(30, 10, 100, 40)];
  longitudeField.tag = 1;
  longitudeField.borderStyle = UITextBorderStyleRoundedRect;
  longitudeField.placeholder = @"longitude";
  longitudeField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  [self addSubview:longitudeField];

  UITextField *latitudeField = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 100, 40)];
  latitudeField.tag = 2;
  latitudeField.borderStyle = UITextBorderStyleRoundedRect;
  latitudeField.placeholder = @"latitude";
  latitudeField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  [self addSubview:latitudeField];

  // create submit button
  UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  saveButton.tag = 3;
  saveButton.frame = CGRectMake(200,10,100,50);
  [saveButton setTitle:@"Save" forState:UIControlStateNormal];

  [saveButton addTarget:self.superview action:@selector(buttonTouched:)
    forControlEvents:UIControlEventTouchUpInside];

  // place the button on the self
  [self addSubview:saveButton];
  return self;
}

@end