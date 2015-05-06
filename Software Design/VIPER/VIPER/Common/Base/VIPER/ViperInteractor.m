//
//  ViperInteractor.m
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import "ViperInteractor.h"

@implementation ViperInteractor

#pragma mark - <ViperInteractorInput>

- (void)assignPresenter:(id<ViperInteractorOutput>)presenter
{
    _presenter = presenter;
}

@end
