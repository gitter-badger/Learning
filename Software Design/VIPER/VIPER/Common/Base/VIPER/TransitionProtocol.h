//
//  TransitionProtocol.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-06.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TransitionProtocol <NSObject>

@property (nonatomic, strong) id sourceViewController;
@property (nonatomic, strong) id destinationViewController;

/**
 *  Get a target module of the transition.
 *
 *  @return a target module name or nil for current module
 */
- (NSString *)targetModuleName;

/**
 *  Perform the transition from sourceViewController to destinationViewController.
 */
- (void)performTransition;

@end
