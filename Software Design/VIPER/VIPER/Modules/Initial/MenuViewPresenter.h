//
//  MenuViewPresenter.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InitialInteractor.h"

@class InitialRouter;
@class MenuViewController;
@protocol MenuViewInterface;

@protocol MenuViewEvents <NSObject>

- (void)assignMenuController:(MenuViewController *)controller;

@end

@interface MenuViewPresenter : NSObject <MenuViewEvents>

@property (nonatomic, weak) id <InitialInteractorInput> interactor;
@property (nonatomic, weak) InitialRouter *router;
@property (nonatomic, weak) UIViewController <MenuViewInterface> *userInterface;

@end
