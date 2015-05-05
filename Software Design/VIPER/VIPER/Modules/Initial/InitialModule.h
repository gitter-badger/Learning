//
//  InitialModule.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InitialInteractor;
@class InitialRouter;

@interface InitialModule : NSObject

@property (nonatomic, readonly, strong) InitialInteractor *interactor;
@property (nonatomic, readonly, strong) InitialRouter *router;

- (instancetype)initWithWindow:(UIWindow *)window;
- (void)installInWindow;

@end
