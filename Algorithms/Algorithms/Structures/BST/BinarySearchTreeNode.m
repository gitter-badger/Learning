//
//  BinarySearchTreeNode.m
//  Algorithms
//
//  Created by Andrey on 01/12/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import "BinarySearchTreeNode.h"

@interface BinarySearchTreeNode ()

@property (nonatomic, readwrite, assign) NSUInteger key;

@end

@implementation BinarySearchTreeNode

- (id)initWithKey:(NSUInteger)key withValue:(id)value
{
    self = [super init];
    if (self) {
        _key = key;
        _value = value;
    }
    return self;
}

@end
