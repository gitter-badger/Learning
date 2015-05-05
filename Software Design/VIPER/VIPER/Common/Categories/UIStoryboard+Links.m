//
//  UIStoryboard+Links.m
//  iOS-native
//
//  Created by n0p and Mari on 2015-04-30.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "UIStoryboard+Links.h"

@implementation UIStoryboard (Links)

+ (UIViewController *)sceneNamed:(NSString *)identifier {
    NSArray *info = [identifier componentsSeparatedByString:@"@"];

    NSString *storyboard_name = info[0];
    NSString *scene_name = (info.count > 1 ? info[1] : nil);

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboard_name bundle:nil];
    UIViewController *scene = nil;
    if (scene_name.length == 0) {
        scene = [storyboard instantiateInitialViewController];
    }
    else {
        scene = [storyboard instantiateViewControllerWithIdentifier:scene_name];
    }

    return scene;
}

@end
