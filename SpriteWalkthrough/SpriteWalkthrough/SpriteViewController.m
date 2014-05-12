//
//  SpriteViewController.m
//  SpriteWalkthrough
//
//  Created by Huimin Liu on 4/21/14.
//  Copyright (c) 2014 Huimin Liu. All rights reserved.
//

#import "SpriteViewController.h"
#import "HelloScene.h"

@interface SpriteViewController ()

@end

@implementation SpriteViewController

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
	
	SKView *spriteView = (SKView *)self.view;
	spriteView.showsDrawCount = YES;
	spriteView.showsFPS = YES;
	spriteView.showsNodeCount = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	HelloScene *hello = [[HelloScene alloc] initWithSize:CGSizeMake(self.view.frame.size.width, self.view.frame.size.height)];
	
	SKView *spriteView = (SKView *)self.view;
	[spriteView presentScene:hello];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
