//
//  ChecklistViewController.m
//  Checklist
//
//  Created by cgthornt on 1/30/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//


// Tag value = 12
#import "ChecklistViewController.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController {
    NSMutableArray *items;
}

- (void) tableViewControllerDidCancel:(TableViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) tableViewController:(TableViewController *)controller didFinishAddingItem:(ChecklistItem *)item {
    int newRowIndex = [items count];
    [items addObject:item];
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveChecklistItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}


// We need to let our new controller know we plan on being the delegate for it
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        TableViewController *controller = (TableViewController *) navigationController.topViewController;
        controller.delegate = self;
    }
}


// Save items
- (void) saveChecklistItems {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:items forKey:@"ChecklistItems"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void) loadChecklistItems {
    NSString *path = [self dataFilePath];
    // If our file exists, then load the existing
    if([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        items = [unarchiver decodeObjectForKey:@"ChecklistItems"];
        [unarchiver finishDecoding];
        
    //
    } else {
        ChecklistItem *item;
        items = [[NSMutableArray alloc] initWithCapacity:20];
        for(int i = 0; i < 5; i++) {
            item = [[ChecklistItem alloc] init];
            item.text = [NSString stringWithFormat:@"I'm cell %d", i];
            
            // Just for fun, initialize only if the row is divisible by 7 or three
            item.checked = (i % 7 == 0 || i % 3 == 0);
            
            [items addObject: item];
        }
        [self saveChecklistItems];
    }
}


// Directory for documents and files
- (NSString *) documentsDirectory { return [@"~/Documents" stringByExpandingTildeInPath]; }
- (NSString *) dataFilePath { return [[self documentsDirectory] stringByAppendingPathComponent:@"Checklist.plist"]; }


// Add item button at le top
/*
- (IBAction) addItem:(id)sender {
    int newRowIndex = [items count];
    ChecklistItem *item = [[ChecklistItem alloc] init];
    item.text = [NSString stringWithFormat:@"I'm new and number %d", newRowIndex];
    item.checked = NO;
    [items addObject:item];
    [self.tableView reloadData];
    [self saveChecklistItems];
} */

- (void) viewDidLoad {
    [super viewDidLoad];
    [self loadChecklistItems];
    NSLog(@"Data Path: %@", [self dataFilePath]);
}


// Only one selection for both
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView { return 1; }
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { return [items count]; }

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    // Assign the cell to being checked
    ChecklistItem *item = [items objectAtIndex:indexPath.row];
    cell.accessoryType = item.checked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    // Get the label
    UILabel *label = (UILabel *)[cell viewWithTag:12];
    label.text = item.text;
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // Get the item for this row and toggle it
    ChecklistItem *item = [items objectAtIndex:indexPath.row];
    [item toggleChecked];
    cell.accessoryType = item.checked ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    // Remove blue outline
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self saveChecklistItems];
}

// Remove a swiped item
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [items removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
    [self saveChecklistItems];
}

@end
