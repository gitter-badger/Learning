//
//  ViperModule.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ViperModule.h"
#import "ViperModule+Protected.h"

@implementation ViperModule

- (instancetype)initWithRootModule:(ViperModule *)rootModule
{
    self = [super init];
    if (self) {
        [self setRootModule:rootModule];
    }
    return self;
}

- (void)installInWindow:(UIWindow *)window
{
    [self.router installInWindow:window];
}

- (void)showInModule:(ViperModule *)module
{
}

@end
