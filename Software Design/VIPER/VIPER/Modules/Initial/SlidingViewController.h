//
//  SlidingViewController.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ECSlidingViewController.h"

@protocol MenuViewEvents;

@interface SlidingViewController : ECSlidingViewController

@property (nonatomic, weak) IBOutlet id <MenuViewEvents> eventHandler;

@end
