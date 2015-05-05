//
//  SlideLinkedContentSegue.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "SlideLinkedContentSegue.h"
#import "UIStoryboard+Links.h"

@implementation SlideLinkedContentSegue

- (id)initWithIdentifier:(NSString *)identifier source:(UIViewController *)source destination:(UIViewController *)destination
{
    return [super initWithIdentifier:identifier source:source destination:[UIStoryboard sceneNamed:identifier]];
}

- (void)perform
{
    [super perform];
}

@end
