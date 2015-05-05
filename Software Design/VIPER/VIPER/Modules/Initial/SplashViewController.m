//
//  SplashViewController.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-02.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "SplashViewController.h"

@implementation SplashViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self.eventHandler checkForTutorialNeeds];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark - Public

- (void)hideSplash
{
    [self performSegueWithIdentifier:@"Hide Splash" sender:self];
}

@end
