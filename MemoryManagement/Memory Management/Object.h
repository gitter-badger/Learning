//
//  Object.h
//  Memory Management
//
//  Created by Andrey on 06/04/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object : NSObject
{
    NSUInteger _counter;
}

+ (instancetype)object;

- (void)doSomething;
- (void)doSomethingElse;

@end
