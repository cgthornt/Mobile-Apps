//
//  ConvertController.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conversion.h"

@interface ConvertController : UITableViewController <ConversionDataLoading, UIAlertViewDelegate>


@property Conversion* currentConversion;

@property (nonatomic) UIAlertView *alert;

// NIL  = nothing to update
// from = from unit
// to   = to unit
@property NSString* lastUpdateMode;


@property (weak, nonatomic) IBOutlet UILabel *fromUnitLabel;
@property (weak, nonatomic) IBOutlet UILabel *toLabelUnit;
@property (weak, nonatomic) IBOutlet UITextField *fromUnitAmount;
@property (weak, nonatomic) IBOutlet UILabel *resultUnitLabel;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *calculateButton;

- (IBAction)calculatePressed:(id)sender;

@end
