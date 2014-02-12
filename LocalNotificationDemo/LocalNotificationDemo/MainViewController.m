//
//  MainViewController.m
//  LocalNotificationDemo
//
//  Created by Huimin Liu on 2/10/14.
//  Copyright (c) 2014 Huimin Liu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
	UILocalNotification *_localNotification;
}

@property (strong, nonatomic) IBOutlet UISwitch *theSwitch;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISwitch

- (IBAction)switchValueDidChange:(UISwitch *)sender
{
	if (sender.isOn) {
		[self scheduleLocalNotification];
	} else {
		if (nil != _localNotification) {
			[[UIApplication sharedApplication] cancelLocalNotification:_localNotification];
		}
	}
}

#pragma mark - 

- (void)scheduleLocalNotification
{
	_localNotification = [[UILocalNotification alloc] init];
    if (_localNotification == nil) {
        return;
	}
    _localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    _localNotification.timeZone = [NSTimeZone defaultTimeZone];
	
    _localNotification.alertBody = NSLocalizedString(@"Remember me to someone who lives there", nil);
    _localNotification.alertAction = NSLocalizedString(@"View Detail", nil);
	
    _localNotification.soundName = UILocalNotificationDefaultSoundName;
    _localNotification.applicationIconBadgeNumber = 1;
	
    _localNotification.userInfo = @{@"name": @"Huimin"};
	
    [[UIApplication sharedApplication] scheduleLocalNotification:_localNotification];
}

@end
