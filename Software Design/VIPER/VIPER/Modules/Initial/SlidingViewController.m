//
//  SlidingViewController.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "SlidingViewController.h"

#import "UIStoryboard+Links.h"

static const CGFloat kMainMenuRightOffset = 54.0;

@implementation SlidingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.anchorRightRevealAmount = CGRectGetWidth([UIScreen mainScreen].bounds) - kMainMenuRightOffset;
    self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue (%@) from %@ to %@", segue.identifier, NSStringFromClass([segue.sourceViewController class]), NSStringFromClass([segue.destinationViewController class]));
}

#pragma mark - properties

- (void)setUnderRightViewController:(UIViewController *)underRightViewController
{
    [super setUnderRightViewController:underRightViewController];

    // TODO: we need to pass presenters and routers here somehow
}

- (void)setTopViewControllerStoryboardId:(NSString *)topViewControllerStoryboardId
{
    self.topViewController = [UIStoryboard sceneNamed:topViewControllerStoryboardId];

    // TODO: we need to pass presenters and routers here somehow
}

- (void)setTopViewController:(UIViewController *)topViewController
{
    [super setTopViewController:topViewController];
    [topViewController.view addGestureRecognizer:self.panGesture];

    // TODO: we need to pass presenters and routers here somehow
}

@end
