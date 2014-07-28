//
//  BinarySearchTree.h
//  Algorithms
//
//  Created by Andrey on 01/12/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinarySearchTreeNode;

@interface BinarySearchTree : NSObject

@property (nonatomic, readonly) NSUInteger height;
@property (nonatomic, readonly) NSUInteger count;

- (void)insertNode:(BinarySearchTreeNode *)node;
- (void)deleteNode:(BinarySearchTreeNode *)node;
- (BinarySearchTreeNode *)searchNodeWithKey:(NSUInteger)key;
- (void)sortTree;
- (void)enumerateTreeWithBlock:(void (^)(BinarySearchTreeNode *node))enumerator;

@end
