//
//  DocSelectionViewController.m
//  Novels
//
//  Created by cgthornt on 1/23/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import "DocSelectionViewController.h"

@interface DocSelectionViewController ()

@end


@implementation DocSelectionViewController

- (NSInteger) numberOfComponentsInPickerView: (UIPickerView*) pickerView {
    return 1 ;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    Bookshelf *books = [Bookshelf sharedBookshelf];
    return [books.booklist count];
}

-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Bookshelf *books = [Bookshelf sharedBookshelf];
    return [books.booklist objectAtIndex:row];
}

- (IBAction)readPressed:(id)sender {
    
    // Get the selected book
    Bookshelf *books = [Bookshelf sharedBookshelf];
    int index = [self.picker selectedRowInComponent:0];
    books.currentBook = [books.booklist objectAtIndex:index];
    
    // Now load the next item
    NovelsViewController *nextView = [self.storyboard
                                      instantiateViewControllerWithIdentifier:@"novelsVC"];
    [self.navigationController pushViewController:nextView animated:YES];
}
@end
