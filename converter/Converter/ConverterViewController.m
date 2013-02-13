//
//  ViewController.m
//  Converter
//
//  Created by cgthornt on 1/16/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import "ConverterViewController.h"

@interface ConverterViewController ()

@end

@implementation ConverterViewController

- (void) viewDidLoad {
    [self.conversionResultLabel setText:@"0 tbsp"];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"Typed %@", [textField text]);
    float cupsValue = [textField.text floatValue];
    float tbsValue  = [Conversions tablespoonsForCups:cupsValue];
    [self.conversionResultLabel setText:
     [NSString stringWithFormat:@"%.2f tbsp", tbsValue]];
    return YES;
}

@end
