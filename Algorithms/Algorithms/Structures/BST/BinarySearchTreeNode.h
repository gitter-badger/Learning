//
//  BinarySearchTreeNode.h
//  Algorithms
//
//  Created by Andrey on 01/12/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySearchTreeNode : NSObject

@property (nonatomic, readonly) NSUInteger key;
@property (nonatomic, strong) id value;
@property (nonatomic, strong) BinarySearchTreeNode *leftChild;
@property (nonatomic, strong) BinarySearchTreeNode *rightChild;

- (id)initWithKey:(NSUInteger)key withValue:(id)value;

@end
