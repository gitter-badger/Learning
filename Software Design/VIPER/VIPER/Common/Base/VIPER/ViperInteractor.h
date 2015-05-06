//
//  ViperInteractor.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ViperInteractorIO.h"

@interface ViperInteractor : NSObject <ViperInteractorInput>

@property (nonatomic, readonly, weak) id <ViperInteractorOutput> presenter;

@end
