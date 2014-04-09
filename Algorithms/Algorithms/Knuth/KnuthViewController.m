//
//  KnuthViewController.m
//  Algorithms
//
//  Created by Andrey on 22/03/14.
//  Copyright (c) 2014 Plush Cube. All rights reserved.
//

#import "KnuthViewController.h"

@interface KnuthViewController ()

@end

@implementation KnuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.menuItemsArray = @[
                                @{ kTitleKey : @"Euclid Algorithm", kClassKey : @"EuclidViewController" },
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

    self.title = @"Donald E. Knuth";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
