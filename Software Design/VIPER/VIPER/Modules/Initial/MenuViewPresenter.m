//
//  MenuViewPresenter.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "MenuViewPresenter.h"
#import "MenuViewController.h"

@implementation MenuViewPresenter

#pragma mark - <MenuViewEvents>

- (void)assignMenuController:(MenuViewController *)controller
{
    controller.eventHandler = self;
    self.userInterface = controller;
}

@end
