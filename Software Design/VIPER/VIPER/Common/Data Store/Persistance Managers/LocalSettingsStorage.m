//
//  LocalSettingsStorage.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "LocalSettingsStorage.h"

@implementation LocalSettingsStorage

- (void)getLocalSettingsWithCompletion:(LocalSettingsLoadCompletionBlock)completion
{
    if (!completion) {
        return;
    }

    LocalSettings *settings = [[LocalSettings alloc] init];
    settings.tutorialShown = YES;

    completion(settings, nil);
}

@end
