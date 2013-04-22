//
//  AppDelegate.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/15/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self initializeConversions];
    
    return YES;
}


// Here we can create new conversion instances. All we need to do is initialize them and the resulting
// intialized class will be saved elsewhere!
- (void) initializeConversions {
    [Conversion initializeConversions:^(NSMutableArray* arr) {
        [arr addObject: [[CLength alloc] init]];
        [arr addObject: [[CMass alloc] init]];
    }];
}

@end
