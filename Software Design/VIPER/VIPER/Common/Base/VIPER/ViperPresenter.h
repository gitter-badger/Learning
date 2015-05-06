//
//  ViperPresenter.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViperPresenterInput.h"
#import "ViperInteractorIO.h"
#import "ViperRouter.h"

@protocol ViperUserInterface;

@interface ViperPresenter : NSObject <ViperPresenterInput, ViperInteractorOutput>

@property (nonatomic, weak) id <ViperInteractorInput> interactor;
@property (nonatomic, weak) ViperRouter *router;
@property (nonatomic, weak) IBOutlet UIViewController <ViperUserInterface> *userInterface;

- (instancetype)initWithInteractor:(id)interactor;

@end
