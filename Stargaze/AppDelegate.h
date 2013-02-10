//
//  AppDelegate.h
//  Stargaze
//
//  Created by Domas Bitvinskas on 2013-02-09.
//  Copyright (c) 2013 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *hello;

@property (nonatomic, retain) CLLocationManager *locationMgr;
@property (nonatomic, retain) CLLocation *lastLocation;

- (IBAction)getNewLocation:(id)sender;
- (void)startUpdatingLocation;

@end
