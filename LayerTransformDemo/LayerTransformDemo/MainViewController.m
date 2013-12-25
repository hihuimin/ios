//
//  MainViewController.m
//  LayerTransformDemo
//
//  Created by huiminliu on 7/26/13.
//  Copyright (c) 2013 huiminliu. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController () {
	CALayer *_testLayer;
}

@property (strong, nonatomic) IBOutlet UIView *testView;
@property (strong, nonatomic) IBOutlet UISlider *translationXSlider;
@property (strong, nonatomic) IBOutlet UISlider *translationYSlider;
@property (strong, nonatomic) IBOutlet UISlider *translationZSlider;
@property (strong, nonatomic) IBOutlet UISlider *scaleXSlider;
@property (strong, nonatomic) IBOutlet UISlider *scaleYSlider;
@property (strong, nonatomic) IBOutlet UISlider *scaleZSlider;
@property (strong, nonatomic) IBOutlet UISlider *rotationXSlider;
@property (strong, nonatomic) IBOutlet UISlider *rotationYSlider;
@property (strong, nonatomic) IBOutlet UISlider *rotationZSlider;

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
    // Do any additional setup after loading the view from its nib.
	
	_testLayer = [CALayer layer];
	_testLayer.bounds = _testView.layer.bounds;
	_testLayer.position = _testView.layer.position;
	_testLayer.backgroundColor = [[UIColor colorWithRed:0x00/255.f green:0x00/255.f blue:0xBB/255.f alpha:.6] CGColor];
	[self.view.layer addSublayer:_testLayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)translationValueDidChange:(UISlider *)slider
{
	NSString *axis = @[@".x", @".y", @".z"][slider.tag];
	NSString *keyPath = [NSString stringWithFormat:@"transform.translation%@", axis];
	[self changeLayerPropertyByValue:slider.value andKeyPath:keyPath];
}

- (IBAction)scaleValueDidChange:(UISlider *)slider
{
	NSString *axis = @[@".x", @".y", @""][slider.tag];
	NSString *keyPath = [NSString stringWithFormat:@"transform.scale%@", axis];
	[self changeLayerPropertyByValue:slider.value andKeyPath:keyPath];
}

- (IBAction)rotateValueDidChange:(UISlider *)slider
{
	NSString *axis = @[@".x", @".y", @".z"][slider.tag];
	NSString *keyPath = [NSString stringWithFormat:@"transform.rotation%@", axis];
	[self changeLayerPropertyByValue:slider.value andKeyPath:keyPath];
}

- (void)changeLayerPropertyByValue:(CGFloat)value andKeyPath:(NSString *)keyPath
{
	[CATransaction begin];
	[CATransaction setDisableActions:YES];
	[_testLayer setValue:[NSNumber numberWithFloat:value] forKeyPath:keyPath];
	[CATransaction commit];
}

- (IBAction)resetButtonDidClick:(id)sender
{
	_testLayer.transform = CATransform3DIdentity;
	[self resetSliders];
}

- (void)resetSliders
{
	[_translationXSlider setValue:0. animated:YES];
	[_translationYSlider setValue:0. animated:YES];
	[_translationZSlider setValue:0. animated:YES];
	
	[_scaleXSlider setValue:1. animated:YES];
	[_scaleYSlider setValue:1. animated:YES];
	[_scaleZSlider setValue:1. animated:YES];
	
	[_rotationXSlider setValue:0. animated:YES];
	[_rotationYSlider setValue:0. animated:YES];
	[_rotationZSlider setValue:0. animated:YES];
}

@end
