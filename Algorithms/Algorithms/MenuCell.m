//
//  MenuCell.m
//  Algorithms
//
//  Created by Andrey on 25/11/13.
//  Copyright (c) 2013 Plush Cube. All rights reserved.
//

#import "MenuCell.h"

NSString *const kCellIdentifier = @"MenuCellIdentifier";

@interface MenuCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation MenuCell

- (void)layoutSubviews
{
    self.titleLabel.text = self.title;
}

@end
