//
//  OtherViewController.m
//  Algorithms
//
//  Created by Andrey on 23/03/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuItemsArray = @[
                                @{ kTitleKey : @"Binary Period", kClassKey : @"BinaryPeriodViewController" }
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

    self.title = @"Other Algorithms";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
