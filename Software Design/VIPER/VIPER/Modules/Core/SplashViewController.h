//
//  SplashViewController.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-02.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CoreEventHandler.h"

@interface SplashViewController : UIViewController

@property (nonatomic, weak) id <CoreEventHandler> eventHandler;

- (void)hideSplash;

@end
