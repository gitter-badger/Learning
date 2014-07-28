//
//  StructuresViewController.m
//  Algorithms
//
//  Created by Andrey on 23/03/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "StructuresViewController.h"

@interface StructuresViewController ()

@end

@implementation StructuresViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuItemsArray = @[
                                @{ kTitleKey : @"Array", kClassKey : @"ArrayViewController" },
                                @{ kTitleKey : @"Linked list", kClassKey : @"ListViewController" },
                                @{ kTitleKey : @"Circular buffer", kClassKey : @"ListViewController" },
                                @{ kTitleKey : @"Stack", kClassKey : @"ListViewController" },
                                @{ kTitleKey : @"Binary tree", kClassKey : @"TreeViewController" },
                                @{ kTitleKey : @"B+ tree", kClassKey : @"TreeViewController" }
                                ];
    }
    return self;
}

- (void)loadView
{
    NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"MenuViewController" owner:self options:nil];
    if (objects.count > 0) {
        self.view = objects[0];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Structures";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
