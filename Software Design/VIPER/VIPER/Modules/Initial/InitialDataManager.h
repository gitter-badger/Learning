//
//  InitialDataManager.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserProfile.h"
#import "LocalSettings.h"

typedef void (^UserProfileCompletionBlock)(UserProfile *profile);
typedef void (^SettingsCompletionBlock)(LocalSettings *settings);

@interface InitialDataManager : NSObject

@property (nonatomic, readonly, strong) UserProfile *user;
@property (nonatomic, readonly, strong) LocalSettings *settings;

- (void)loadCurrentUserProfileWithCompletion:(UserProfileCompletionBlock)completion;
- (void)loadLocalSettingsWithCompletion:(SettingsCompletionBlock)completion;

@end
