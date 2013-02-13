//
//  ViewController.m
//  Hello Xcode2
//
//  Created by cgthornt on 1/9/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import "HelloIPhoneViewController.h"

@interface HelloIPhoneViewController ()

@end

@implementation HelloIPhoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Set counter to zero
    counter = [Counter alloc];
    
    // Make a rectangle
    // Bounds are x, y, width, height
    countLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 10, 300, 20)];
    [countLabel setText: @"Hello World"];
    [countLabel setBackgroundColor:[UIColor cyanColor]];
    [self.view addSubview:countLabel];
    
    // Now we want to make an increment button
    // Here, our button won't actually do anything
    UIButton *incBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [incBtn setFrame:CGRectMake(10, 50, 300, 40)];
    [incBtn setTitle: @"Increment" forState:UIControlStateNormal];
    [incBtn setTitle: @"Ouch!" forState:UIControlStateHighlighted];
    [self.view addSubview: incBtn];
    
    // Now set a target for the button so that we call "buttonPressed"
    [incBtn addTarget:self
               action:@selector(buttonPressed)
     forControlEvents:UIControlEventTouchUpInside];
    
    // Finally, add our NEXT button
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [nextButton setFrame: CGRectMake(10, 110, 300, 40)];
    [nextButton setTitle:@"Next!" forState:UIControlStateNormal];
    [nextButton addTarget:self
                   action:@selector(nextButtonPressed)
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
}

// When we clicked le button
- (void) buttonPressed {
    [counter increment];
    [self updateCounterLabel];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateCounterLabel];
}

// When our next
- (void) nextButtonPressed {
    DecrementViewController *nextVC = [DecrementViewController alloc];
    nextVC = [nextVC initWithNibName:@"DecrementViewController"
                              bundle:nil
                            andCount:counter];
    [self.navigationController pushViewController:nextVC animated:YES];
}

- (void) updateCounterLabel {
    [countLabel setText:[NSString stringWithFormat:@"%d", [counter count]]];
}

@end
