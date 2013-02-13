//
//  Counter.m
//  Hello Xcode2
//
//  Created by cgthornt on 1/14/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import "Counter.h"

@implementation Counter

@synthesize count = _count;

- (void) increment {
    _count++;
}

- (void) decrement {
    _count--;
}

@end
