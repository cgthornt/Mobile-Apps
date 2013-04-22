//
//  WelcomeController.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "WelcomeController.h"


// This is the section index that contains the "categories" you can select.
#define CONVERSION_SECTION 0

@interface WelcomeController ()
@end

@implementation WelcomeController

@synthesize conversionTable;
@synthesize conversions;

// We want to load and sort everything!
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    conversionTable = [Conversion availableConversions];
    conversions = Conversion.sortedConversions;
}


/**
// This should be auto-determined by the storyboard. Let's keep this here for now, but commented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
} 
 */

// A fun bug here:
// If in the interface builder, there are less placeholders than actual amounts, then this will crash with this error:
//
//      Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayI objectAtIndex:]: index 1 beyond bounds [0 .. 0]'
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger parent = [super tableView: tableView numberOfRowsInSection:section];
   if(section == CONVERSION_SECTION) 
        return [conversions count]; 
    return parent;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ConversionCell";
    
    // Use the already made static cells in the storyboard except for our conversion section
    if([indexPath section] != CONVERSION_SECTION)
        return [super tableView: tableView cellForRowAtIndexPath:indexPath];
    
    
    
    // Attempt to find an already-created cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // If we could not find the cell, make a new one and let it be re-used
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setAccessoryType: UITableViewCellAccessoryDisclosureIndicator];
    }
    
    // We want to get the current conversion selected
    Conversion *currentConversion = [conversions objectAtIndex:[indexPath row]];
    
    // Now configure the cell
    cell.textLabel.text = [currentConversion conversionName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // If not using conversion section, then return! Let the segue do the work
    if(indexPath.section != CONVERSION_SECTION)
        return;
    
    NSInteger row = [indexPath row];
    
    // Get currently selected conversion
    Conversion *current = [conversions objectAtIndex: row];
    [Conversion setCurrentConversion:current];
    
    // Now we can segue it!
    [self performSegueWithIdentifier:@"ConvertSegue" sender:current];
    
}


@end
