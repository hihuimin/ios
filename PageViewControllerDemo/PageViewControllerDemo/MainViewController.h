//
//  MainViewController.h
//  PageViewControllerDemo
//
//  Created by Huimin Liu on 12/22/13.
//  Copyright (c) 2013 Huimin Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageOneViewController.h"
#import "PageTwoViewController.h"

@interface MainViewController : UIViewController <UIPageViewControllerDataSource, PageOneViewControllerDelegate>

@end
