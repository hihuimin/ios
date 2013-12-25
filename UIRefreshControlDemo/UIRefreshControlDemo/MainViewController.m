//
//  MainViewController.m
//  UIRefreshControlDemo
//
//  Created by Huimin Liu on 12/25/13.
//  Copyright (c) 2013 Huimin Liu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
	UIScrollView *_scrollView;
	UIRefreshControl *_refreshControl;
}

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
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	
	//ADD A SCROLL VIEW
	_scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	_scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	_scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, _scrollView.frame.size.height * 2);
	[self.view addSubview:_scrollView];
	
	
	//ADD A LABEL
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 32)];
	label.font = [UIFont systemFontOfSize:28];
	label.text = @"UIRefreshControl Demo";
	[_scrollView addSubview:label];
	
	
	//INIT REFRESH CONTROL
	_refreshControl = [[UIRefreshControl alloc] init];
	[_refreshControl addTarget:self action:@selector(refreshControlValueDidChange:) forControlEvents:UIControlEventValueChanged];
	[_scrollView addSubview:_refreshControl];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (void)refreshControlValueDidChange:(id)sender
{
	//DO SOME DATA REQUEST...
	[self performSelector:@selector(finish) withObject:self afterDelay:1];
}

- (void)finish
{
	[_refreshControl endRefreshing];
}

@end
