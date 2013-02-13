//
//  TableViewController.m
//  Checklist
//
//  Created by cgthornt on 2/11/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import "TableViewController.h"
#import "ChecklistItem.h"

@interface TableViewController ()

@end

@implementation TableViewController


-(NSIndexPath*) tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
}

- (IBAction)Cancel:(id)sender {
    [self.delegate tableViewControllerDidCancel:self];
    // [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Save:(id)sender {
    ChecklistItem *item = [[ChecklistItem alloc] init];
    item.text = self.textField.text;
    item.checked = NO;
    [self.delegate tableViewController:self didFinishAddingItem:item];
    
    //[self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
