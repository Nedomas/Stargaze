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

  UITextField *headingField = [[UITextField alloc] initWithFrame:CGRectMake(30, 110, 100, 40)];
  headingField.tag = 3;
  headingField.borderStyle = UITextBorderStyleRoundedRect;
  headingField.placeholder = @"heading";
  headingField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  [self addSubview:headingField];

  UITextField *rollField = [[UITextField alloc] initWithFrame:CGRectMake(30, 160, 100, 40)];
  rollField.tag = 4;
  rollField.borderStyle = UITextBorderStyleRoundedRect;
  rollField.placeholder = @"roll";
  rollField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  [self addSubview:rollField];

  UITextField *pitchField = [[UITextField alloc] initWithFrame:CGRectMake(30, 210, 100, 40)];
  pitchField.tag = 5;
  pitchField.borderStyle = UITextBorderStyleRoundedRect;
  pitchField.placeholder = @"pitch";
  pitchField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  [self addSubview:pitchField];

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