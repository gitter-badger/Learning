//
//  InitialDataManager.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "InitialDataManager.h"

#import "UserProfileStorage.h"
#import "LocalSettingsStorage.h"

@interface InitialDataManager ()

@property (nonatomic, strong) UserProfile *user;
@property (nonatomic, strong) LocalSettings *settings;

- (UserProfileStorage *)createUserProfileStorage;
- (LocalSettingsStorage *)createLocalSettingsStorage;

@end

@implementation InitialDataManager

#pragma mark - Public

- (void)loadCurrentUserProfileWithCompletion:(UserProfileCompletionBlock)completion
{
    UserProfileStorage *storage = [self createUserProfileStorage];

    __weak typeof (self) welf = self;
    [storage loadCurrentUserProfileWithCompletion:^(UserProfile *profile, NSError *error) {
        if (error || !profile) {
            welf.user = nil;
        } else {
            welf.user = profile;
        }
        if (completion) {
            completion(welf.user);
        }
    }];
}

- (void)loadLocalSettingsWithCompletion:(SettingsCompletionBlock)completion
{
    LocalSettingsStorage *storage = [self createLocalSettingsStorage];

    __weak typeof (self) welf = self;
    [storage getLocalSettingsWithCompletion:^(LocalSettings *settings, NSError *error) {
        if (error || !settings) {
            welf.settings = nil;
        } else {
            welf.settings = settings;
        }
        if (completion) {
            completion(welf.settings);
        }
    }];
}

#pragma mark - Private

- (UserProfileStorage *)createUserProfileStorage
{
    UserProfileStorage *storage = [[UserProfileStorage alloc] init];
    return storage;
}

- (LocalSettingsStorage *)createLocalSettingsStorage
{
    LocalSettingsStorage *storage = [[LocalSettingsStorage alloc] init];
    return storage;
}

@end
