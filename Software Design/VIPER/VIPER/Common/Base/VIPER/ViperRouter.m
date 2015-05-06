//
//  ViperRouter.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ViperRouter.h"
#import "ViperPresenter.h"
#import "UIViewController+Viper.h"
#import "ViperModule+Protected.h"
#import "UIStoryboardSegue+Viper.h"

@interface ViperRouter ()

@property (nonatomic, readonly, strong) UIStoryboard *moduleStoryboard;

- (UIViewController *)createInitialViewController;
- (void)createSceneWithUserInterface:(UIViewController *)interface;

@end

@implementation ViperRouter

@synthesize moduleStoryboard = _moduleStoryboard;

+ (NSString *)moduleStoryboardName
{
    return nil;
}

#pragma mark - Public

- (void)installInWindow:(UIWindow *)window
{
    UIViewController *controller = [self createInitialViewController];
    [self createSceneWithUserInterface:controller];
    window.rootViewController = controller;
}

- (void)performTransition:(id <TransitionProtocol>)transition
{
    // TODO: add logic for inter-module transitions
    UIViewController *controller = transition.destinationViewController;
    [self createSceneWithUserInterface:controller];
    [transition performTransition];
}

#pragma mark - Private

- (UIStoryboard *)moduleStoryboard
{
    if (!_moduleStoryboard) {
        NSString *storyboardName = [[self class] moduleStoryboardName];
        NSAssert(storyboardName != nil, @"You must provide a storyboard name for a module!");
        _moduleStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle:[NSBundle mainBundle]];
        NSAssert(_moduleStoryboard == nil, @"Can't find storyboard with name '%@'", storyboardName);
    }
    return _moduleStoryboard;
}

- (UIViewController *)createInitialViewController
{
    UIStoryboard *storyboard = [self moduleStoryboard];
    UIViewController *controller = [storyboard instantiateInitialViewController];
    return controller;
}

- (void)createSceneWithUserInterface:(UIViewController *)interface;
{
    ViperInteractor *interactor = self.module.interactor;

    NSString *className = [[interface class] associatedPresenterClassName];
    NSAssert(className != nil, @"Presenter's class name was not provided!");
    Class presenterClass = NSClassFromString(className);
    NSAssert(presenterClass != NULL, @"Presenter class not found: %@", className);

    ViperPresenter *presenter = [[presenterClass alloc] initWithInteractor:interactor];
    interface.presenter = presenter;
    presenter.userInterface = interface;
    presenter.router = self;
}

@end
