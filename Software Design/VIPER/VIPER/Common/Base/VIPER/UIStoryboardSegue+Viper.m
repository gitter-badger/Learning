//
//  UIStoryboardSegue+Viper.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-06.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "UIStoryboardSegue+Viper.h"

#import <objc/runtime.h>

@interface UIStoryboardSegue ()

- (instancetype)fake_initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination;
- (void)fake_perform;

@end

void exchangeMethods(Class class, SEL originalSelector, SEL swizzledSelector);

@implementation UIStoryboardSegue (Viper)

#pragma mark - Class creation

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalInitSelector = @selector(initWithIdentifier:source:destination:);
        SEL swizzledInitSelector = @selector(fake_initWithIdentifier:source:destination:);
        exchangeMethods(class, originalInitSelector, swizzledInitSelector);

        SEL originalPerformSelector = @selector(perform);
        SEL swizzledPerformSelector = @selector(fake_perform);
        exchangeMethods(class, originalPerformSelector, swizzledPerformSelector);
    });
}

#pragma mark - Swizzled methods

- (instancetype)fake_initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    [self fake_initWithIdentifier:identifier source:source destination:destination];
    if ([source respondsToSelector:@selector(segueDidPrepared:)]) {
        [(UIViewController <ViperSegueDelegate> *)source segueDidPrepared:self];
    }
    return self;
}

- (void)fake_perform            // it will be called on VC's 'performSegueWithIdentifier'
{
    // do nothing
}

#pragma mark - <TransitionProtocol>

- (void)performTransition
{
    [self fake_perform];        // the real 'perform' will be called
}

@end

#pragma mark - Swizzling helper

void exchangeMethods(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

    BOOL didAddInitMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));

    if (didAddInitMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
