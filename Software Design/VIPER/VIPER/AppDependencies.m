//
//  AppDependencies.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-02.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "AppDependencies.h"

#import "InitialModule.h"

@interface AppDependencies ()

@property (nonatomic, weak) UIWindow *window;
@property (nonatomic, strong) InitialModule *rootModule;

- (void)configureDependenciesWithWindow:(UIWindow *)window;

@end

@implementation AppDependencies

#pragma mark - Init

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self) {
        [self configureDependenciesWithWindow:window];
    }
    return self;
}

#pragma mark - Public

- (void)installRootViewController
{
    [self.rootModule installInWindow];
}

#pragma mark - Private

- (void)configureDependenciesWithWindow:(UIWindow *)window
{
    InitialModule *root = [[InitialModule alloc] initWithWindow:window];
    self.rootModule = root;
}

@end
