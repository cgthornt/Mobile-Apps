//
//  TableViewController.h
//  Checklist
//
//  Created by cgthornt on 2/11/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChecklistItem.h"

// Wat?
// @class AddItemViewController

@interface TableViewController : UITableViewController
- (IBAction)Cancel:(id)sender;
- (IBAction)Save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
