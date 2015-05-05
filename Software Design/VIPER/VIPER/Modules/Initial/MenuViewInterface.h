//
//  MenuViewInterface.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MainMenuViewModel;

@protocol MenuViewInterface <NSObject>

- (void)reloadMenuData:(MainMenuViewModel *)data;

@end
