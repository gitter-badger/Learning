//
//  ViperModule.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViperModule : NSObject

- (instancetype)initWithRootModule:(ViperModule *)rootModule;

- (void)installInWindow:(UIWindow *)window;
- (void)showInModule:(ViperModule *)module;

@end
