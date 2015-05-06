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
- (void)createModuleScene:(ViperModule *)module withUserInterface:(UIViewController *)interface;
- (ViperModule *)createModuleWithName:(NSString *)moduleName;

@end

@implementation ViperRouter

@synthesize moduleStoryboard = _moduleStoryboard;

- (void)installInWindow:(UIWindow *)window
{
    UIViewController *controller = [self createInitialViewController];
    [self createModuleScene:self.module withUserInterface:controller];
    window.rootViewController = controller;
}

- (void)performTransition:(id <TransitionProtocol>)transition
{
    UIViewController *controller = transition.destinationViewController;
    ViperModule *targetModule = nil;

    NSString *targetModuleName = [transition targetModuleName];
    if (targetModuleName) {
        targetModule = [self createModuleWithName:targetModuleName];
    } else {
        targetModule = self.module;
    }
    [self createModuleScene:targetModule withUserInterface:controller];
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

- (void)createModuleScene:(ViperModule *)module withUserInterface:(UIViewController *)interface
{
    ViperInteractor *interactor = module.interactor;

    NSString *className = [[interface class] associatedPresenterClassName];
    NSAssert(className != nil, @"Presenter's class name was not provided!");
    Class presenterClass = NSClassFromString(className);
    NSAssert(presenterClass != NULL, @"Presenter class not found: %@", className);

    ViperPresenter *presenter = [[presenterClass alloc] initWithInteractor:interactor];
    interface.presenter = presenter;
    presenter.userInterface = interface;
    presenter.router = self;
}

- (ViperModule *)createModuleWithName:(NSString *)moduleName
{
    ViperModule *module = nil;
    Class moduleClass = NSClassFromString(moduleName);
    if (moduleClass) {
        module = [[moduleClass alloc] init];
    }
    return module;
}

@end
