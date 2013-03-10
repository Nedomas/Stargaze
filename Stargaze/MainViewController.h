#import <UIKit/UIKit.h>
#import "Position.h"

@interface MainViewController : UIViewController {
}

@property (strong, nonatomic) Position *gps;
-(void)buttonTouched:(id)sender;

@end