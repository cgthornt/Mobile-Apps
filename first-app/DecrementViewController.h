//
//  SecondViewController.h
//  Hello Xcode2
//
//  Created by cgthornt on 1/9/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Counter.h"

@interface DecrementViewController : UIViewController

@property (weak, nonatomic) Counter *counter;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil andCount: (Counter *) startCount;

- (void) updateCounterLabel;
- (IBAction)prevButtonPressed:(id)sender;

@end
