//
//  InitialRouter.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InitialInteractorInput;

@interface InitialRouter : NSObject

- (instancetype)initWithWindow:(UIWindow *)window withInteractor:(id <InitialInteractorInput>)interactor;

- (void)presentMainMenuWithInteractor:(id)interactor;
- (void)presentSplashWithInteractor:(id)interactor;
- (void)dismissSplash;
- (void)dismissSplashAndPresentTutorialWithInteractor:(id)interactor;
- (void)dismissTutorial;

@end
