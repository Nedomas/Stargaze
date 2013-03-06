#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *hello;

-(IBAction)buttonTouched;
// - (IBAction)getNewLocation:(id)sender;
// - (void)startUpdatingLocation;

@end