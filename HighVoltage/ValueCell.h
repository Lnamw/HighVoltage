//
//  ValueCell.h
//  HighVoltage
//
//  Created by Elena Maso Willen on 21/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ValueCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;

@end
