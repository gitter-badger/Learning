//
//  ViperPresenter.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ViperPresenter.h"
#import "ViperUserInterface.h"

@interface ViperPresenter ()

@end

@implementation ViperPresenter

- (instancetype)initWithInteractor:(id)interactor
{
    self = [super init];
    if (self) {
        _interactor = interactor;
        [interactor assignPresenter:self];
    }
    return self;
}

#pragma mark - <ViperPresenterInput>

#pragma mark - <ViperInteractorOutput>

#pragma mark - Private

- (void)performTransition:(ViewTransition)transition
{
    [self.userInterface prepareSegueForTransition:transition withCompletion:^(UIStoryboardSegue *segue) {
        [self.router performTransition:segue];
    }];
}

@end
