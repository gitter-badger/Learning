//
//  UIStoryboard+Links.h
//  iOS-native
//
//  Created by n0p and Mari on 2015-04-30.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIStoryboard (Links)

/**
 *  Load a view controller from it's storyboard specified by a special format.
 *  Format: controllerStoryboardID@storyboardName
 *
 *  @param identifier special formatted Storyboard ID.
 *
 *  @return view controller or nil if not found.
 */
+ (UIViewController *)sceneNamed:(NSString *)identifier;

@end
