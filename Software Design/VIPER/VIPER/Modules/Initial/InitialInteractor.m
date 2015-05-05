//
//  InitialInteractor.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "InitialInteractor.h"
#import "InitialDataManager.h"

@interface InitialInteractor ()

@property (nonatomic, assign) BOOL hasPreviousUser;
@property (nonatomic, assign) BOOL tutorialAlreadyShown;

@property (nonatomic, strong) InitialDataManager *dataManager;

@end

@implementation InitialInteractor

#pragma mark - Init

- (instancetype)initWithDataManager:(InitialDataManager *)dataManager
{
    self = [super init];
    if (self) {
        _dataManager = dataManager;
    }
    return self;
}

#pragma mark - <InitialInteractorInput>

- (void)checkForPreviousUser
{
    __weak typeof (self) welf = self;
    [self.dataManager loadCurrentUserProfileWithCompletion:^(UserProfile *profile) {
        welf.hasPreviousUser = (profile != nil);
    }];
}

- (void)checkTutorialAlreadyShown
{
    __weak typeof (self) welf = self;
    [self.dataManager loadLocalSettingsWithCompletion:^(LocalSettings *settings) {
        welf.tutorialAlreadyShown = settings.tutorialShown;
    }];
}

@end
