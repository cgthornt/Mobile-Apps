//
//  ConversionHistoryController.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "ConversionHistoryController.h"

@interface ConversionHistoryController ()

@end

@implementation ConversionHistoryController
@synthesize reverseHistoryList;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"Number of history items: %d", [self.history.hist count]);
    
    // Get a reverse list!
    reverseHistoryList = [[NSMutableArray alloc] init];
    NSEnumerator *enumerator = [self.history.hist reverseObjectEnumerator];
    for(id element in enumerator)
        [reverseHistoryList addObject:element];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.history.hist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellHist";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [reverseHistoryList objectAtIndex:indexPath.row];
    
    return cell;
}

- (History*) history {
    return [History instance];
}

@end
