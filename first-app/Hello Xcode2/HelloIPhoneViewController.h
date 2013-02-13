//
//  Christopher Thornton
//  -------------------------------
//  Mobile App Development Course, First Application
//
//  ViewController.h
//  Hello Xcode2
//
//  Created by cgthornt on 1/9/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DecrementViewController.h"
#import "Counter.h"

@interface HelloIPhoneViewController : UIViewController {
    UILabel *countLabel;
    Counter *counter;
};

- (void) updateCounterLabel;

@end
