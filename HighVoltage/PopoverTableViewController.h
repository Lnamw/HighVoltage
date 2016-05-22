//
//  PopoverTableViewController.h
//  HighVoltage
//
//  Created by Elena Maso Willen on 21/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ValueTableViewController.h"

@protocol PopoverTableViewControllerDelegate <NSObject>

- (void)valueWasChosen:(NSString *)valueChosen;

@end

@interface PopoverTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *electricityArray;

@property (weak, nonatomic) id<PopoverTableViewControllerDelegate>delegate;


@end
