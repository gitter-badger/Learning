//
//  SplashViewPresenter.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "SplashViewPresenter.h"
#import "InitialRouter.h"

#import <KVOController/FBKVOController.h>

@interface SplashViewPresenter ()

@property (nonatomic, strong) FBKVOController *interactorObserver;

- (void)createListenersForInteractor:(id <InitialInteractorInput>)interactor;

@end

@implementation SplashViewPresenter

#pragma mark - Init

- (instancetype)initWithInteractor:(id <InitialInteractorInput>)interactor
{
    self = [super init];
    if (self) {
        _interactor = interactor;
        [self createListenersForInteractor:interactor];
    }
    return self;
}

#pragma mark - <SplashViewEvents>

- (void)checkForTutorialNeeds
{
    [self.interactor checkTutorialAlreadyShown];
}

#pragma mark - Private

- (void)createListenersForInteractor:(id <InitialInteractorInput>)interactor
{
    FBKVOController *observer = [FBKVOController controllerWithObserver:self];
    [observer observe:interactor keyPath:@"tutorialAlreadyShown" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        [self.router dismissSplashAndPresentTutorialWithInteractor:interactor];
    }];
    [observer observe:interactor keyPath:@"hasPreviousUser" options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) block:^(id observer, id object, NSDictionary *change) {
        // do something
    }];
    self.interactorObserver = observer;
}

@end
