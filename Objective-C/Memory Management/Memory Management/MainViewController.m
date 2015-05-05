//
//  MainViewController.m
//  Memory Management
//
//  Created by Andrey on 06/04/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "MainViewController.h"
#import "NSObject+Print.h"
#import "Object.h"

@interface MainViewController ()

@property (nonatomic, strong) Object *object;
@property (nonatomic, weak) IBOutlet UIButton *createButton;
@property (nonatomic, weak) IBOutlet UIButton *execButton01;
@property (nonatomic, weak) IBOutlet UIButton *execButton02;
@property (nonatomic, weak) IBOutlet UIButton *deleteButton;
@property (nonatomic, weak) IBOutlet UISwitch *autoreleaseSwitch;

- (IBAction)createObject:(id)sender;
- (IBAction)executObject:(id)sender;
- (IBAction)deleteObject:(id)sender;

@end

@implementation MainViewController

- (IBAction)createObject:(id)sender
{
    Object *object = nil;
    if (self.autoreleaseSwitch.on) {
        object = [Object object];
        NSLog(@"---");
//        NSLog(@"Auto: %@", [NSObject printObject:object]);
    } else {
        object = [[Object alloc] init];
//        object = [Object alloc];
//        NSLog(@"---");
//        NSLog(@"Alloc: %@", [NSObject printObject:object]);
//        object = [object init];
        NSLog(@"---");
//        NSLog(@"Init: %@", [NSObject printObject:object]);
    }
    NSLog(@"save object");
    self.object = object;
    self.createButton.enabled = NO;
    self.execButton01.enabled = YES;
    self.execButton02.enabled = YES;
    self.deleteButton.enabled = YES;
    self.autoreleaseSwitch.enabled = NO;
    NSLog(@"*** done");
}

- (IBAction)executObject:(id)sender
{
    NSLog(@"*** execute");
    if (sender == self.execButton01) {
        [self.object doSomething];
    } else if (sender == self.execButton02) {
        [self.object doSomethingElse];
    }
}

- (IBAction)deleteObject:(id)sender
{
    self.object = nil;
    self.createButton.enabled = YES;
    self.execButton01.enabled = NO;
    self.execButton02.enabled = NO;
    self.deleteButton.enabled = NO;
    self.autoreleaseSwitch.enabled = YES;
    NSLog(@"*** deleted\n\n\n");
}

@end
