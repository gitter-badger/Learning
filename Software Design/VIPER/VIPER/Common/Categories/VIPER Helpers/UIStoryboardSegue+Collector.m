//
//  UIStoryboardSegue+Collector.m
//  VIPER
//
//  Created by n0p and Mari on 2015-04-30.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "UIStoryboardSegue+Collector.h"
#import "UIViewController+Routing.h"

#import <objc/runtime.h>

@implementation UIStoryboardSegue (Collector)

/**
 *  Segue initialization logic improved with some collection algorithms.
 *  Swizzling example taken from http://nshipster.com/method-swizzling/
 */
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(initWithIdentifier:source:destination:);
        SEL swizzledSelector = @selector(fake_initWithIdentifier:source:destination:);

        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);

        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (instancetype)fake_initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    UIViewControllerRoute *route = [UIViewControllerRoute routeToViewController:destination withSegueIdentifier:identifier];
    [source addViewControllerRoute:route];

    return [self fake_initWithIdentifier:identifier source:source destination:destination];
}

@end
