#import <CoreLocation/CoreLocation.h>

@protocol CoreLocationControllerDelegate 
@required
- (void)locationUpdate:(CLLocation *)location; // Our location updates are sent here
- (void)locationError:(NSError *)error; // Any errors are sent here
@end

@interface Position : NSObject <CLLocationManagerDelegate> {
  CLLocationManager *locMgr;
  id delegate;
}
 
@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, assign) id delegate;
 
@end