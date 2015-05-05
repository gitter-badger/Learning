//
//  MenuViewController.h
//  VIPER
//
//  Created by n0p and Mari on 2015-05-04.
//  Copyright (c) 2015 Improve Digital. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuViewInterface.h"
#import "MenuViewPresenter.h"

@interface MenuViewController : UITableViewController <MenuViewInterface>

@property (nonatomic, weak) IBOutlet id <MenuViewEvents> eventHandler;

@end
