//
//  SelectUnitController.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "SelectUnitController.h"

@interface SelectUnitController ()

@end

@implementation SelectUnitController


@synthesize currentConversion;
@synthesize availabeUnits;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    currentConversion = [Conversion currentConversion];
    availabeUnits     = currentConversion.unitKeys;
    
    NSLog(@"Current: %@, From: %@, To: %@", currentConversion.lastSelectedUnit, currentConversion.currentFromUnit, currentConversion.currentToUnit);
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [availabeUnits count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"UnitCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Get string and set it as title
    NSString* unitName = [availabeUnits objectAtIndex: indexPath.row];
    cell.textLabel.text = unitName;
    
    // Add a checkmark if the current one
    if([unitName isEqualToString: currentConversion.lastSelectedUnit]) {
        [cell setAccessoryType: UITableViewCellAccessoryCheckmark];
    } else {
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    }
    
    return cell;
}



// UnitCell

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    currentConversion.lastSelectedUnit = [availabeUnits objectAtIndex: indexPath.row];
    
    [self dismissViewControllerAnimated: YES completion: ^(void) {
        
    }];
}

@end
