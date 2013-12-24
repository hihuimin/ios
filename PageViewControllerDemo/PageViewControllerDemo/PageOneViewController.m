//
//  PageOneViewController.m
//  PageViewControllerDemo
//
//  Created by Huimin Liu on 12/22/13.
//  Copyright (c) 2013 Huimin Liu. All rights reserved.
//

#import "PageOneViewController.h"

@interface PageOneViewController ()

@end

@implementation PageOneViewController

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
	
	self.view.backgroundColor = [UIColor colorWithRed:0xFF/255. green:0x3B/255. blue:0x30/255. alpha:1];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.frame = CGRectMake(15, 10, 200, 30);
	[button setTitle:@"Click To Scroll To Next Page" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonDidPress:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDidPress:(id)sender
{
	if (self.delegate && [self.delegate respondsToSelector:@selector(turnToNextPage)]) {
		[self.delegate turnToNextPage];
	}
}

@end
