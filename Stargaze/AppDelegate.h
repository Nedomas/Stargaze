#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Position.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
  Position *CLController;
  UILabel *locLabel;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *hello;
@property (strong, nonatomic) Position *dude;
@property (strong, nonatomic) Position *CLController;

-(void)buttonTouched:(id)sender;
// - (IBAction)getNewLocation:(id)sender;
// - (void)startUpdatingLocation;

@end