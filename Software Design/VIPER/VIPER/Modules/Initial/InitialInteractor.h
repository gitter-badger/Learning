//
//  InitialInteractor.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol InitialInteractorInput <NSObject>

- (void)checkForPreviousUser;
- (void)checkTutorialAlreadyShown;

@end

@class InitialDataManager;

@interface InitialInteractor : NSObject <InitialInteractorInput>

@property (nonatomic, readonly, assign) BOOL hasPreviousUser;
@property (nonatomic, readonly, assign) BOOL tutorialAlreadyShown;

- (instancetype)initWithDataManager:(InitialDataManager *)dataManager;

@end
