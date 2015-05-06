//
//  UIStoryboardSegue+Viper.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-06.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TransitionProtocol.h"

@protocol ViperSegueDelegate <NSObject>

@optional
/**
 *  Notifies the source view controller about new segue has been created.
 *
 *  @param segue freshly created segue
 */
- (void)segueDidPrepared:(UIStoryboardSegue *)segue;

@end

@interface UIStoryboardSegue (Viper) <TransitionProtocol>

@end
