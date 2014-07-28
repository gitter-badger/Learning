//
//  ViewController.m
//  Threads
//
//  Created by Andrey on 28/02/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "ViewController.h"

#import <libkern/OSAtomic.h>

static const NSUInteger max = 1000000;
static const NSUInteger NO_PRINT = 0;
static const NSUInteger PRINT = 1;

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *counter1Label;
@property (nonatomic, weak) IBOutlet UILabel *counter2Label;
@property (nonatomic, weak) IBOutlet UILabel *counter3Label;
@property (nonatomic, weak) IBOutlet UILabel *counter4Label;
@property (nonatomic, weak) IBOutlet UILabel *counter5Label;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *buttons;
@property (nonatomic, assign) NSUInteger value2;
@property (atomic, assign) NSInteger value3;
@property (nonatomic, assign) NSUInteger value4;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, assign) NSUInteger value5;

@property (nonatomic, strong) NSConditionLock *readyToPrint;
@property (nonatomic, strong) NSCondition *done;
@property (nonatomic, assign) NSUInteger threads;

- (IBAction)calculate:(id)sender;
- (void)calculateBlock:(void(^)())block;
- (void)watchThreads;
- (void)print;

@end

static NSUInteger value1 = 0;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.readyToPrint = [[NSConditionLock alloc] initWithCondition:NO_PRINT];
    self.done = [[NSCondition alloc] init];

//    NSRunLoop *watcherLoop = [[NSRunLoop alloc] init];
//    watcherLoop
//    NSThread *watcherThread = [[NSThread alloc] initWithTarget:self selector:@selector(watchThreads) object:nil];
//    [watcherThread ]
}

- (IBAction)calculate:(UIButton *)sender
{
    void(^block)() = nil;

    [self.readyToPrint lock];

    switch (sender.tag) {
        case 1: {
            self.counter1Label.text = @"Static: 0";
            value1 = 0;
            block = ^{
                for (int i = 0; i < max; i++) {
                    value1++;
                }
            };
            break;
        }

        case 2: {
            self.counter2Label.text = @"Nonatomic: 0";
            self.value2 = 0;
            block = ^{
                for (int i = 0; i < max; i++) {
                    self.value2++;
                }
            };
            break;
        }

        case 3: {
            self.counter3Label.text = @"Atomic: 0";
            self.value3 = 0;
            block = ^{
                for (int i = 0; i < max; i++) {
                    OSAtomicIncrement32(&_value3);
                }
            };
            break;
        }

        case 4: {
            self.counter4Label.text = @"NSLock: 0";
            self.value4 = 0;
            block = ^{
                self.lock = [[NSLock alloc] init];
                for (int i = 0; i < max; i++) {
                    [self.lock lock];
                    self.value4++;
                    [self.lock unlock];
                }
            };
            break;
        }

        case 5: {
            self.counter5Label.text = @"Synchronized: 0";
            self.value5 = 0;
            block = ^{
                static NSString *const mutant = @"mutant";
                for (int i = 0; i < max; i++) {
                    @synchronized(mutant) {
                        self.value5++;
                    }
                }
            };
            break;
        }

        default:
            break;
    }

    [self.buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
        button.enabled = NO;
    }];

    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(calculateBlock:) object:block];
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(calculateBlock:) object:block];
    [thread1 start];
    [thread2 start];

    [self.readyToPrint unlockWithCondition:PRINT];

    [NSThread detachNewThreadSelector:@selector(print) toTarget:self withObject:nil];
}

- (void)calculateBlock:(void(^)())block
{
    @autoreleasepool {
        [self.done lock];
        self.threads++;
        [self.done unlock];

        NSDate *start = [NSDate date];

        block();

        NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:start];
        NSLog(@"[0x%08x]: finished in %0.3f sec", (NSUInteger)((__bridge void *)[NSThread currentThread]), time);

        [self.done lock];
        self.threads--;
        [self.done signal];
        [self.done unlock];
    }
}

- (void)watchThreads
{
    @autoreleasepool {
    }
}

- (void)print
{
    @autoreleasepool {
        [self.done lock];
        while (self.threads > 0) {
            [self.done wait];
        }
        [self.done unlock];

        [self.readyToPrint lockWhenCondition:PRINT];

        NSLog(@"print");
        self.counter1Label.text = [NSString stringWithFormat:@"Static: %d", value1];
        self.counter2Label.text = [NSString stringWithFormat:@"Nonatomic: %d", self.value2];
        self.counter3Label.text = [NSString stringWithFormat:@"Atomic: %d", self.value3];
        self.counter4Label.text = [NSString stringWithFormat:@"NSLock: %d", self.value4];
        self.counter5Label.text = [NSString stringWithFormat:@"Synchronized: %d", self.value5];

        [self.buttons enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL *stop) {
            button.enabled = YES;
        }];
        
        [self.readyToPrint unlockWithCondition:NO_PRINT];
    }
}

@end
