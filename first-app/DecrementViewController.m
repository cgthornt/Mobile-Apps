//
//  SecondViewController.m
//  Hello Xcode2
//
//  Created by cgthornt on 1/9/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import "DecrementViewController.h"

@interface DecrementViewController ()

@end

@implementation DecrementViewController

@synthesize counter;

- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil andCount: (Counter *) startCount
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
        counter = startCount;
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateCounterLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)decrementPressed:(id)sender {
    [counter decrement];
    [self updateCounterLabel];
}

- (void) updateCounterLabel {
    [self.countLabel setText: [NSString stringWithFormat:@"%d", [counter count]]];
}

- (IBAction)prevButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
