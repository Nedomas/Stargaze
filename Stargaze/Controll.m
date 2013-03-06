#include "Controll.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@implementation Controll 

@synthesize myButton;


-(void)action:(id)sender {
	NSLog(@"Spuuust:/@",sender);
}
-(UIButton *) myButton {
	if (myButton == nil) {
		CGRect frame = CGRectMake(5,20,50,50);
		myButton = [UIButton initWithFrame:frame];
		[myButton setTittle:@"Mano" forState:UIControlStateNormal];
		[myButton setTittleColor:[UIColor redColor] forState:UIControlStateNormal];
		[myButton setTittle:@"Spust" forState:UIControlStateSelected];
		[myButton addTarget:self action:@selector(action:) forControlEvents:UIContolEventTouchUpInside];

	}
	return myButton
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.myButton;
}

@end