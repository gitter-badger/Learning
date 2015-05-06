//
//  ViperRouter.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViperModule;
@protocol TransitionProtocol;

@interface ViperRouter : NSObject

@property (nonatomic, weak) ViperModule *module;

+ (NSString *)moduleStoryboardName;

- (void)installInWindow:(UIWindow *)window;
- (void)performTransition:(id <TransitionProtocol>)transition;

@end
