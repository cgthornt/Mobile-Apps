//
//  ConvertController.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "ConvertController.h"

@interface ConvertController ()

@end

@implementation ConvertController

@synthesize alert;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"View did load!");
    
    // Get the current conversion
    Conversion *conversion = [Conversion currentConversion];
    
    NSLog(@"Latest conversion: %@", conversion.conversionName);
    
    // Set the title bar
    [self setTitle: conversion.conversionName];
    
    // Now if we need to do any loading, do it here
    if(conversion.requiresLoading) {
        NSLog(@"This requires some loading!");
        [self showLoadingDialog];
        [conversion loadData: self];
    
    // Otherwise, just finalize loading
    } else {
        [self finalizeLoading];
    }

}


- (void) finalizeLoading {


}

- (void) showLoadingDialog {
    alert = [[UIAlertView alloc] initWithTitle:@"Loading Data..." message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
    [alert show];
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Adjust the indicator so it is up a few pixels from the bottom of the alert
    indicator.center = CGPointMake(alert.bounds.size.width / 2, alert.bounds.size.height - 50);
    [indicator startAnimating];
    [alert addSubview:indicator];
}

- (void) conversionDataLoadSuccess {
    [alert dismissWithClickedButtonIndex:1 animated:YES];
    [self finalizeLoading];
}
- (void) conversionDataLoadError: (NSString *) error {
    [alert dismissWithClickedButtonIndex:1 animated:YES];
    alert = [[UIAlertView alloc] initWithTitle:@"Error" message:error delegate:self
            cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}


// Index 0 = cancel
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger) index {
    if(index == 0) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}



@end
