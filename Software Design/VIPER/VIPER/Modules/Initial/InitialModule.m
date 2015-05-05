//
//  InitialModule.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "InitialModule.h"
#import "InitialDataManager.h"
#import "InitialInteractor.h"
#import "InitialRouter.h"

@interface InitialModule ()

- (InitialDataManager *)createDataManager;
- (InitialInteractor *)createInteractorWithDataManager:(InitialDataManager *)dataManager;
- (InitialRouter *)createRouterWithWindow:(UIWindow *)window withInteractor:(id)interactor;

@end

@implementation InitialModule

#pragma mark - Init

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self) {
        InitialDataManager *manager = [self createDataManager];
        _interactor = [self createInteractorWithDataManager:manager];
        _router = [self createRouterWithWindow:window withInteractor:_interactor];
    }
    return self;
}

#pragma mark - Public

- (void)installInWindow
{
    [self.router presentMainMenuWithInteractor:self.interactor];
}

#pragma mark - Private

- (InitialDataManager *)createDataManager
{
    InitialDataManager *manager = [[InitialDataManager alloc] init];
    return manager;
}

- (InitialInteractor *)createInteractorWithDataManager:(InitialDataManager *)dataManager
{
    InitialInteractor *interactor = [[InitialInteractor alloc] initWithDataManager:dataManager];
    return interactor;
}

- (InitialRouter *)createRouterWithWindow:(UIWindow *)window withInteractor:(id)interactor
{
    InitialRouter *router = [[InitialRouter alloc] initWithWindow:window withInteractor:interactor];
    return router;
}

@end
