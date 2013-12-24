//
//  PageOneViewController.h
//  PageViewControllerDemo
//
//  Created by Huimin Liu on 12/22/13.
//  Copyright (c) 2013 Huimin Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageOneViewControllerDelegate <NSObject>

- (void)turnToNextPage;

@end

@interface PageOneViewController : UIViewController

@property(nonatomic, weak) id<PageOneViewControllerDelegate> delegate;

@end
