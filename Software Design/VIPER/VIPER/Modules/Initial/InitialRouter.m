//
//  InitialRouter.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "InitialRouter.h"
#import "InitialInteractor.h"
#import "SlidingViewController.h"
#import "MenuViewController.h"
#import "MenuViewPresenter.h"
#import "SplashViewController.h"
#import "SplashViewPresenter.h"

@interface InitialRouter ()

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, weak) id <InitialInteractorInput> interactor;

@property (nonatomic, strong) MenuViewController *mainMenuViewController;
@property (nonatomic, strong) SplashViewController *splashViewController;
@property (nonatomic, strong) UIViewController *tutorialViewController;

@property (nonatomic, readonly, strong) UIStoryboard *moduleStoryboard;

- (SplashViewController *)loadSplashViewController;

@end

@implementation InitialRouter

@synthesize moduleStoryboard = _moduleStoryboard;

- (instancetype)initWithWindow:(UIWindow *)window withInteractor:(id <InitialInteractorInput>)interactor
{
    self = [super init];
    if (self) {
        _window = window;
        _interactor = interactor;
    }
    return self;
}

- (void)presentMainMenuWithInteractor:(id)interactor
{
    UIStoryboard *storyboard = [self moduleStoryboard];
    SlidingViewController *slider = [storyboard instantiateInitialViewController];
    self.window.rootViewController = slider;
}

- (void)presentSplashWithInteractor:(id)interactor
{
    SplashViewController *controller = [self loadSplashViewController];
    SplashViewPresenter *presenter = [[SplashViewPresenter alloc] initWithInteractor:interactor];
    controller.eventHandler = presenter;
    presenter.userInterface = controller;
    self.splashViewController = controller;
}

- (void)dismissSplash
{
    [self.splashViewController hideSplash];
}

- (void)dismissSplashAndPresentTutorialWithInteractor:(id)interactor
{
}

- (void)dismissTutorial
{
}

#pragma mark - Private

- (SplashViewController *)loadSplashViewController
{
    UIStoryboard *storyboard = [self moduleStoryboard];
    SplashViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Splash Screen"];
    return viewController;
}

- (UIStoryboard *)moduleStoryboard
{
    if (!_moduleStoryboard) {
        _moduleStoryboard = [UIStoryboard storyboardWithName:@"Initial" bundle:[NSBundle mainBundle]];
    }
    return _moduleStoryboard;
}

@end
