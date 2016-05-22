//
//  ValueTableViewController.h
//  HighVoltage
//
//  Created by Elena Maso Willen on 21/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverTableViewController.h"

@class ElectricityClass;

@protocol ValueTableViewControllerDelegate <NSObject>

-(ElectricityClass *)doCalculation:(ElectricityClass *)electObject;

@end

@interface ValueTableViewController : UITableViewController

@property (weak, nonatomic) id<ValueTableViewControllerDelegate>delegate;

@end
