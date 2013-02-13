//
//  DocSelectionViewController.h
//  Novels
//
//  Created by cgthornt on 1/23/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookshelf.h"
#import "NovelsViewController.h"

@interface DocSelectionViewController : UIViewController <UIPickerViewDataSource , UIPickerViewDelegate>
- (IBAction)readPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end
