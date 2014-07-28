//
//  Object.m
//  Memory Management
//
//  Created by Andrey on 06/04/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "Object.h"

@implementation Object

+ (void)initialize
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

+ (instancetype)object
{
    id object = [[self alloc] init];
    return [object autorelease];
}

+ (id)alloc
{
    id obj = [super alloc];
    NSLog(@"%s: retain count = %d", __PRETTY_FUNCTION__, [obj retainCount]);
    return obj;
}

- (id)init
{
    self = [super init];
    if (self) {
        _counter = 1;
        NSLog(@"%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
    }
    return self;
}

- (id)retain
{
    id obj = [super retain];
    _counter++;
    NSLog(@"\t%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
    return obj;
}

- (oneway void)release
{
    [super release];
    _counter--;
    NSLog(@"\t%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
}

- (id)autorelease
{
    id obj = [super autorelease];
    NSLog(@"%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
    return obj;
}

- (void)dealloc
{
    NSLog(@"%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
    [super dealloc];
}

- (void)doSomething
{
    NSLog(@"%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
}

- (void)doSomethingElse
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"%s: retain count = %d", __PRETTY_FUNCTION__, _counter);
        [self doSomething];
    });
}

@end
