//
//  UserProfileStorage.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserProfile.h"

typedef void (^UserProfileLoadCompletionBlock)(UserProfile *profile, NSError *error);

@interface UserProfileStorage : NSObject

- (void)loadCurrentUserProfileWithCompletion:(UserProfileLoadCompletionBlock)completion;

@end
