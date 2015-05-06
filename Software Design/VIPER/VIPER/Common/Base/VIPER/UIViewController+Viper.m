//
//  UIViewController+Viper.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "UIViewController+Viper.h"
#import "UIStoryboardSegue+Viper.h"

#import <objc/runtime.h>

@interface UIViewController () <ViperSegueDelegate>

@property (nonatomic, weak) PrepareSegueCompletion prepareCompletion;

@end

@implementation UIViewController (Viper)

#pragma mark - <ViperUserInterface>

- (BOOL)prepareSegueForTransition:(ViewTransition)transition withCompletion:(PrepareSegueCompletion)completion
{
    if (completion) {
        self.prepareCompletion = completion;
    } else {
        return NO;
    }
    NSString *segueIdentifier = [self segueIdentifierForTransition:transition];
    if (segueIdentifier) {
        [self performSegueWithIdentifier:segueIdentifier sender:self];
    }
    return NO;
}

#pragma mark - <ViperSegueDelegate>

- (void)segueDidPrepared:(UIStoryboardSegue *)segue
{
    if (self.prepareCompletion) {
        self.prepareCompletion(segue);
    }
}

#pragma mark - Public

+ (NSString *)associatedPresenterClassName
{
    NSAssert(false, @"%@ must have associated presenter class name", NSStringFromClass(self));
    return nil;
}

- (NSString *)segueIdentifierForTransition:(ViewTransition)transition
{
    return nil;
}

#pragma mark - Accessors

- (void)setPresenter:(id)presenter
{
    objc_setAssociatedObject(self, @selector(presenter), presenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)presenter
{
    return objc_getAssociatedObject(self, @selector(presenter));
}

@end
