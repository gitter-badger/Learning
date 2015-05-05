//
//  UserProfileStorage.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "UserProfileStorage.h"

@implementation UserProfileStorage

- (void)loadCurrentUserProfileWithCompletion:(UserProfileLoadCompletionBlock)completion
{
    if (!completion) {
        return;
    }

    UserProfile *currentUser = nil;

    completion(currentUser, nil);
}

@end
