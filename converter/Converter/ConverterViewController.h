//
//  ViewController.h
//  Converter
//
//  Created by cgthornt on 1/16/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conversions.h"

@interface ConverterViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *conversionResultLabel;
@property (weak, nonatomic) IBOutlet UITextField *conversionInput;


@end
