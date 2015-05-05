//
//  UIViewController+Routing.h
//  VIPER
//
//  Created by n0p and Mari on 2015-04-30.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewControllerRoute : NSObject

@property (nonatomic, copy) NSString *segueIdentifier;
@property (nonatomic, strong) UIViewController *destination;

+ (instancetype)routeToViewController:(UIViewController *)destination withSegueIdentifier:(NSString *)segueIdentifier;

@end

@interface UIViewController (Routing)

@property (nonatomic, readonly, strong) NSSet *routingTable;

- (void)addViewControllerRoute:(UIViewControllerRoute *)route;
- (void)removeViewControllerRoute:(UIViewControllerRoute *)route;
- (BOOL)hasRouteToViewController:(UIViewController *)destination;
- (UIViewControllerRoute *)routeToViewController:(UIViewController *)destination;

@end
