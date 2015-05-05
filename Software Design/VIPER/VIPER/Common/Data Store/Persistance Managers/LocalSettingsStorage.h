//
//  LocalSettingsStorage.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LocalSettings.h"

typedef void (^LocalSettingsLoadCompletionBlock)(LocalSettings *settings, NSError *error);

@interface LocalSettingsStorage : NSObject

- (void)getLocalSettingsWithCompletion:(LocalSettingsLoadCompletionBlock)completion;

@end
