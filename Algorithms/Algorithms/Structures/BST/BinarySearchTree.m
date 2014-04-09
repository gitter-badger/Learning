//
//  BinarySearchTree.m
//  Algorithms
//
//  Created by Andrey on 01/12/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import "BinarySearchTree.h"
#import "BinarySearchTreeNode.h"

@interface BinarySearchTree ()

@property (nonatomic, strong) BinarySearchTreeNode *root;

- (void)insertNode:(BinarySearchTreeNode *)node intoSubtree:(BinarySearchTreeNode *)tree;
- (void)deleteNode:(BinarySearchTreeNode *)node fromSubtree:(BinarySearchTreeNode *)tree;
- (BinarySearchTreeNode *)searchNodeWithKey:(NSUInteger)key inSubtree:(BinarySearchTreeNode *)tree;
- (void)enumerateTree:(BinarySearchTreeNode *)tree withBlock:(void (^)(BinarySearchTreeNode *node))enumerator;

@end

@implementation BinarySearchTree

#pragma mark - Public

- (void)insertNode:(BinarySearchTreeNode *)node
{
    if (self.root) {
        [self insertNode:node intoSubtree:self.root];
    } else {
        self.root = node;
    }
}

- (void)deleteNode:(BinarySearchTreeNode *)node
{
    if (self.root) {
        [self deleteNode:node fromSubtree:self.root];
    }
}

- (BinarySearchTreeNode *)searchNodeWithKey:(NSUInteger)key
{
    return [self searchNodeWithKey:key inSubtree:self.root];
}

- (void)sortTree
{
}

- (void)enumerateTreeWithBlock:(void (^)(BinarySearchTreeNode *node))enumerator
{
}

#pragma mark - Private

- (void)insertNode:(BinarySearchTreeNode *)node intoSubtree:(BinarySearchTreeNode *)tree
{
}

- (void)deleteNode:(BinarySearchTreeNode *)node fromSubtree:(BinarySearchTreeNode *)tree
{
}

- (BinarySearchTreeNode *)searchNodeWithKey:(NSUInteger)key inSubtree:(BinarySearchTreeNode *)tree
{
    if (!tree) {
        return nil;
    }
    if (tree.key == key) {
        return tree;
    }
    if (key < tree.key) {
        return [self searchNodeWithKey:key inSubtree:tree.leftChild];
    } else {
        return [self searchNodeWithKey:key inSubtree:tree.rightChild];
    }
}

- (void)enumerateTree:(BinarySearchTreeNode *)tree withBlock:(void (^)(BinarySearchTreeNode *node))enumerator
{
}

@end
