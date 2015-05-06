//
//  ViperInteractorInput.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-05.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ViperInteractorOutput <NSObject>

@end

@protocol ViperInteractorInput <NSObject>

- (void)assignPresenter:(id <ViperInteractorOutput>)presenter;

@end
