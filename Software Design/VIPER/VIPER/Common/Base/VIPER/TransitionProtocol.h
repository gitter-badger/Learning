//
//  TransitionProtocol.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-06.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TransitionProtocol <NSObject>

@property (nonatomic, strong) id sourceViewCOntroller;
@property (nonatomic, strong) id destinationViewController;

- (void)performTransition;

@end
