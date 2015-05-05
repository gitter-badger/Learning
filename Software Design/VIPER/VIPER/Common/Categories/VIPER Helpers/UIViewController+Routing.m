//
//  UIViewController+Routing.m
//  VIPER
//
//  Created by n0p and Mari on 2015-04-30.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "UIViewController+Routing.h"

#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, strong) NSMutableSet *realRoutingTable;

@end

@implementation UIViewController (Routing)

- (NSSet *)routingTable
{
    return [NSSet setWithSet:self.realRoutingTable];
}

- (NSMutableSet *)realRoutingTable
{
    NSMutableSet *result = objc_getAssociatedObject(self, @selector(realRoutingTable));
    if (!result) {
        result = [NSMutableSet set];
        self.realRoutingTable = result;
    }
    return result;
}

- (void)setRealRoutingTable:(NSMutableArray *)realRoutingTable
{
    objc_setAssociatedObject(self, @selector(realRoutingTable), realRoutingTable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addViewControllerRoute:(UIViewControllerRoute *)route
{
    [self.realRoutingTable addObject:route];
    NSLog(@"route added: %@", route);
}

- (void)removeViewControllerRoute:(UIViewControllerRoute *)route
{
    [self.realRoutingTable removeObject:route];
    NSLog(@"route removed: %@", route);
}

- (BOOL)hasRouteToViewController:(UIViewController *)destination
{
    return ([self routeToViewController:destination] != nil);
}

- (UIViewControllerRoute *)routeToViewController:(UIViewController *)destination
{
    for (UIViewControllerRoute *route in self.routingTable) {
        if (route.destination == destination) {
            return route;
        }
    }
    return nil;
}

@end

@implementation UIViewControllerRoute

+ (instancetype)routeToViewController:(UIViewController *)destination withSegueIdentifier:(NSString *)segueIdentifier
{
    UIViewControllerRoute *object = [[UIViewControllerRoute alloc] init];

    object.segueIdentifier = segueIdentifier;
    object.destination = destination;

    return object;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ (%@) -> %@", [self class], self.segueIdentifier, self.destination];
}

- (BOOL)isEqualToViewControllerRoute:(UIViewControllerRoute *)object
{
    BOOL hasEqualSegue = [self.segueIdentifier isEqualToString:object.segueIdentifier];
    BOOL hasEqualDestination = [self.destination isEqual:object.destination];

    return hasEqualSegue && hasEqualDestination;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    if (![object isKindOfClass:[UIViewControllerRoute class]]) {
        return NO;
    }
    return [self isEqualToViewControllerRoute:object];
}

- (NSUInteger)hash
{
    return [self.destination hash] ^ [self.segueIdentifier hash];
}

@end
