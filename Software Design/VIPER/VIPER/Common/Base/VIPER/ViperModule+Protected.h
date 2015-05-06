//
//  ViperModule+Protected.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ViperModule.h"
#import "ViperInteractor.h"
#import "ViperRouter.h"

@interface ViperModule (Protected)

@property (nonatomic, weak) ViperModule *rootModule;
@property (nonatomic, strong) ViperInteractor *interactor;
@property (nonatomic, strong) ViperRouter *router;

@end
