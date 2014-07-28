//
//  ArrayViewController.m
//  Algorithms
//
//  Created by Andrey on 25/11/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import "ArrayViewController.h"

static const NSUInteger kBlockSize = 5;

@interface ArrayViewController ()

@property (nonatomic, weak) IBOutlet UITextField *arrayCountField;
@property (nonatomic, weak) IBOutlet UITextView *arrayTextView;
@property (nonatomic, weak) IBOutlet UITextView *sortedTextView;
@property (nonatomic, weak) IBOutlet UILabel *medianValueLabel;

@property (nonatomic, strong) NSArray *numbersArray;

- (IBAction)numberChanged:(id)sender;
- (IBAction)generatePressed:(id)sender;
- (IBAction)sortPressed:(id)sender;
- (IBAction)calculatePressed:(id)sender;

- (NSArray *)heapSort:(NSArray *)array;
- (void)siftDown:(NSMutableArray *)array withI:(NSUInteger)i withJ:(NSUInteger)j;
- (NSUInteger)medianInArray:(NSArray *)array;

@end

@implementation ArrayViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Array";
}

- (IBAction)numberChanged:(UIStepper *)sender
{
    self.arrayCountField.text = [NSString stringWithFormat:@"%0.0f", sender.value];
}

- (IBAction)generatePressed:(id)sender
{
    NSUInteger count = self.arrayCountField.text.integerValue;
    NSMutableSet *numbers = [NSMutableSet setWithCapacity:count];
    while (numbers.count < count) {
        NSInteger value = rand() % (count * 4);
        [numbers addObject:@(value)];
    }
    self.numbersArray = numbers.allObjects;
    self.arrayTextView.text = [self.numbersArray componentsJoinedByString:@" "];
    self.medianValueLabel.text = @"";
}

- (IBAction)sortPressed:(id)sender
{
    NSArray *sorted = [self heapSort:self.numbersArray];
    self.sortedTextView.text = [sorted componentsJoinedByString:@" "];
}

- (IBAction)calculatePressed:(id)sender
{
    self.medianValueLabel.text = [NSString stringWithFormat:@"%u", [self medianInArray:self.numbersArray]];
}

- (NSArray *)heapSort:(NSArray *)array
{
    NSMutableArray *result = [array mutableCopy];

    NSInteger n = result.count;
    NSNumber *temp = nil;
    for (NSInteger i = (result.count / 2) - 1; i >= 0; --i) {
        [self siftDown:result withI:i withJ:n];
    }
    while (n > 1) {
        --n;
        temp = result[0];
        result[0] = result[n];
        result[n] = temp;
        [self siftDown:result withI:0 withJ:n];
    }

    return [NSArray arrayWithArray:result];
}

- (void)siftDown:(NSMutableArray *)array withI:(NSUInteger)i withJ:(NSUInteger)j
{
    NSInteger maxChild = i;
    NSNumber *temp = array[i];
    while (YES) {
        NSInteger child = (i * 2) + 1;
        if (child < j && ((NSNumber *)array[child]).integerValue > temp.integerValue) {
            maxChild = child;
        }
        ++child;
        if (child < j && ((NSNumber *)array[child]).integerValue > ((NSNumber *)array[maxChild]).integerValue) {
            maxChild = child;
        }
        if (maxChild == i) {
            break;
        }
        array[i] = array[maxChild];
        array[maxChild] = temp;
        i = maxChild;
    }
}

- (NSUInteger)medianInArray:(NSArray *)array
{
    if (array.count <= kBlockSize) {
        NSArray *sorted = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
            return [obj1 compare:obj2];
        }];
        return ((NSNumber *)sorted[sorted.count / 2]).integerValue;
    }
    NSMutableArray *blocks = [NSMutableArray arrayWithCapacity:((array.count / kBlockSize) + 1)];
    NSMutableArray *currentBlock;
    for (NSUInteger i = 0; i < array.count; i++) {
        if (i % kBlockSize == 0) {
            currentBlock = [NSMutableArray arrayWithCapacity:kBlockSize];
            [blocks addObject:currentBlock];
        }
        [currentBlock addObject:array[i]];
    }
    NSMutableArray *medians = [NSMutableArray arrayWithCapacity:blocks.count];
    for (NSArray *block in blocks) {
        NSUInteger median = [self medianInArray:[block sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
            return [obj1 compare:obj2];
        }]];
        [medians addObject:@(median)];
    }
    return [self medianInArray:medians];
}

@end
