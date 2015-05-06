//
//  ViperUserInterface.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ViewTransition) {
    ViewTransitionNowhere = 0
};

typedef void (^PrepareSegueCompletion)(UIStoryboardSegue *segue);

@protocol ViperUserInterface <NSObject>

- (BOOL)prepareSegueForTransition:(ViewTransition)transition withCompletion:(PrepareSegueCompletion)completion;

@end
