//
//  NSObject+Print.m
//  Memory Management
//
//  Created by Andrey on 06/04/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "NSObject+Print.h"

#import <malloc/malloc.h>

@implementation NSObject (Print)

+ (NSString *)printObject:(NSObject *)object
{
    NSLog(@"+++");

    unsigned long size = malloc_size((__bridge const void *)(object));
    void *data = (__bridge void *)(object);

    NSMutableString *result = [NSMutableString stringWithFormat:@"Object of %@ contains %lu bytes:\n", [object class], size];

    for (unsigned long i = 0; i < size; i++) {
        if (i > 0 && i % 16 == 0) {
            [result appendString:@"\n"];
        }
        [result appendFormat:@"%02X ", ((unsigned char *)data)[i]];
    }

    return [NSString stringWithString:result];
}

@end
