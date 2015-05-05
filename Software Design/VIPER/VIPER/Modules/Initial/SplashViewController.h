//
//  SplashViewController.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-02.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SplashViewInterface.h"
#import "SplashViewPresenter.h"

@interface SplashViewController : UIViewController <SplashViewInterface>

@property (nonatomic, weak) IBOutlet id <SplashViewEvents> eventHandler;

- (void)hideSplash;

@end
