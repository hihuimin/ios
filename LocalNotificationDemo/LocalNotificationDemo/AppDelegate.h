//
//  AppDelegate.h
//  LocalNotificationDemo
//
//  Created by Huimin Liu on 2/10/14.
//  Copyright (c) 2014 Huimin Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate> {
	UILocalNotification *_localNotification;
}

@property (strong, nonatomic) UIWindow *window;

@end
