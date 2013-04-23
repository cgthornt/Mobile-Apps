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
@synthesize currentConversion;
@synthesize  lastUpdateMode;

@synthesize fromUnitLabel;
@synthesize toLabelUnit;
@synthesize fromUnitAmount;
@synthesize resultUnitLabel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) executeCalculation {
    NSString *result = [currentConversion calculate: fromUnitAmount.text];
    resultUnitLabel.text = result;
}


- (void) viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"View did load!");
    
    // Get the current conversion
    currentConversion = [Conversion currentConversion];
    
    NSLog(@"Latest conversion: %@", currentConversion.conversionName);
    
    // Set the title bar
    [self setTitle: currentConversion.conversionName];
    
    // Now if we need to do any loading, do it here
    if(currentConversion.requiresLoading) {
        NSLog(@"This requires some loading!");
        [self showLoadingDialog];
        [currentConversion loadData: self];
    
    // Otherwise, just finalize loading
    } else {
        [self finalizeLoading];
    }

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"Hey! The view did appear!");
    [self updateValues];
    [self executeCalculation]; // Useful when switching units
}


- (void) finalizeLoading {
    [self updateValues];
}


- (void) updateValues {
    if(lastUpdateMode != nil) {
        if([lastUpdateMode isEqualToString: @"from"]) {
            currentConversion.currentFromUnit = currentConversion.lastSelectedUnit;
        } else {
            currentConversion.currentToUnit = currentConversion.lastSelectedUnit;
        }
    }
    lastUpdateMode = nil;
    
    // Update UI
    fromUnitLabel.text = currentConversion.currentFromUnit;
    toLabelUnit.text   = currentConversion.currentToUnit;
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString: @"FromSelect"]) {
        currentConversion.lastSelectedUnit = currentConversion.currentFromUnit;
        lastUpdateMode = @"from";
    } else {
        currentConversion.lastSelectedUnit = currentConversion.currentToUnit;
        lastUpdateMode = @"to";
    }
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



- (IBAction)calculatePressed:(id)sender {
    // Hide toolbar
    [self.view endEditing:YES];
    [self executeCalculation];
}

@end
