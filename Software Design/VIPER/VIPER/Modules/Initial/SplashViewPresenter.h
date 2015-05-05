//
//  SplashViewPresenter.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InitialInteractor.h"

@class InitialRouter;
@protocol SplashViewInterface;

@protocol SplashViewEvents <NSObject>

- (void)checkForTutorialNeeds;

@end

@interface SplashViewPresenter : NSObject <SplashViewEvents>

@property (nonatomic, weak) InitialRouter *router;
@property (nonatomic, weak) id <InitialInteractorInput> interactor;
@property (nonatomic, weak) UIViewController <SplashViewInterface> *userInterface;

- (instancetype)initWithInteractor:(id <InitialInteractorInput>)interactor;

@end
