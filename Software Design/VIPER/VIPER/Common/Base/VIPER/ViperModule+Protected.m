//
//  ViperModule+Protected.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ViperModule+Protected.h"
#import <objc/runtime.h>

@implementation ViperModule (Protected)

- (void)setRootModule:(ViperModule *)rootModule
{
    objc_setAssociatedObject(self, @selector(rootModule), rootModule, OBJC_ASSOCIATION_ASSIGN);
}

- (ViperModule *)rootModule
{
    return objc_getAssociatedObject(self, @selector(rootModule));
}


@end
