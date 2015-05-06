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

#pragma mark - Public

+ (NSString *)moduleStoryboardName
{
    NSAssert(false, @"Module should know it's Storyboard name");
    return nil;
}

- (void)installInWindow:(UIWindow *)window
{
    [self.router installInWindow:window];
}

@end
