//
//  AppDelegate.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/15/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conversion.h"
#import "CLength.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


/**
 * Should be used to initialize a bunch of conversions!
 */
- (void) initializeConversions;

@end
