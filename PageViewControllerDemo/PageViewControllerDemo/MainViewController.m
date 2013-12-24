//
//  MainViewController.m
//  PageViewControllerDemo
//
//  Created by Huimin Liu on 12/22/13.
//  Copyright (c) 2013 Huimin Liu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
	UIPageViewController *_pageViewController;
	PageOneViewController *_pageOneViewController;
	PageTwoViewController *_pageTwoViewController;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		
		self.title = @"UIPageViewController DEMO";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	_pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
	_pageViewController.dataSource = self;
	
	_pageOneViewController = [[PageOneViewController alloc] init];
	_pageOneViewController.delegate = self;
	_pageTwoViewController = [[PageTwoViewController alloc] init];
	
	[_pageViewController setViewControllers:@[_pageOneViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
	
	self.edgesForExtendedLayout = UIRectEdgeNone;
	[self addChildViewController:_pageViewController];
	[self.view addSubview:_pageViewController.view];
	
	_pageViewController.view.frame = self.view.bounds;
	[_pageViewController didMoveToParentViewController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)turnToNextPage
{
	[_pageViewController setViewControllers:@[_pageTwoViewController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];
}

#pragma mark -

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
	return _pageTwoViewController == viewController ? _pageOneViewController : nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
	return _pageOneViewController == viewController ? _pageTwoViewController : nil;
}


@end
