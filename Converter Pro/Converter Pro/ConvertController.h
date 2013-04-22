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

@property (nonatomic) UIAlertView *alert;

@property (weak, nonatomic) IBOutlet UILabel *fromUnitLabel;
@property (weak, nonatomic) IBOutlet UITextField *fromUnitAmount;
@property (weak, nonatomic) IBOutlet UILabel *resultUnitLabel;


@end
