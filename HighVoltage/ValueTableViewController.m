//
//  ValueTableViewController.m
//  HighVoltage
//
//  Created by Elena Maso Willen on 21/05/2016.
//  Copyright © 2016 Training. All rights reserved.
//

#import "ValueTableViewController.h"
#import "PopoverTableViewController.h"
#import "ValueCell.h"

@interface ValueTableViewController () <UIPopoverPresentationControllerDelegate, PopoverTableViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *valueArray;
@property (nonatomic, strong) NSMutableArray *remainingValueArray;



@end

@implementation ValueTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.remainingValueArray = [[NSMutableArray alloc] initWithObjects:@"Ohms", @"Amps", @"Volts", @"Watts", nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.valueArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ValueCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ValueCell" forIndexPath:indexPath];

    NSString *name = self.valueArray[indexPath.row];
    cell.nameLabel.text = name;
    
    
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    PopoverTableViewController *vc = (PopoverTableViewController *)[segue destinationViewController];
    
    vc.electricityArray = self.remainingValueArray;
    vc.popoverPresentationController.delegate = self;

}

#pragma mark - UIPopoverPresentationController
// to present as a popover with iPhones :
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

#pragma mark - PopoverTableViewController Delegate
- (void)valueWasChosen:(NSString *)valueChosen {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [self.valueArray addObject:valueChosen];
    
    NSInteger rowToRemove = [self.remainingValueArray indexOfObject:valueChosen]; //return the index of character line
    [self.remainingValueArray removeObjectAtIndex:rowToRemove];
    
    [self.tableView reloadData];

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/





@end
