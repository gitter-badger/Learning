//
//  UIViewController+Viper.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViperUserInterface.h"

@protocol ViperPresenterInput;

@interface UIViewController (Viper) <ViperUserInterface>

@property (nonatomic, strong) IBOutlet id <ViperPresenterInput> presenter;

+ (NSString *)associatedPresenterClassName;
- (NSString *)segueIdentifierForTransition:(ViewTransition)transition;

@end
