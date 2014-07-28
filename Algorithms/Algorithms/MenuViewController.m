//
//  MenuViewController.m
//  Algorithms
//
//  Created by Andrey on 25/11/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import "MenuViewController.h"
#import "MenuCell.h"

NSString *const kTitleKey = @"title";
NSString *const kClassKey = @"class";

@interface MenuViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *menuView;

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.menuItemsArray.count == 0) {
        self.menuItemsArray = @[
                                @{ kTitleKey : @"Knuth", kClassKey : @"KnuthViewController" },
                                @{ kTitleKey : @"Structures", kClassKey : @"StructuresViewController" },
                                @{ kTitleKey : @"Other", kClassKey : @"OtherViewController" }
                                ];
    }

    [self.menuView registerNib:[UINib nibWithNibName:@"MenuCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:kCellIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.menuItemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"MenuCell" owner:nil options:nil][0];
    }
    cell.title = ((NSDictionary *)self.menuItemsArray[indexPath.row])[kTitleKey];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *class = ((NSDictionary *)self.menuItemsArray[indexPath.row])[kClassKey];
    if (class) {
        UIViewController *controller = [[NSClassFromString(class) alloc] init];
        if (controller) {
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
}

@end
