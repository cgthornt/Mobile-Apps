//
//  Currency.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "Currency.h"

// This should probably be read from a file, but whatevah.
static NSString* requestURL = @"http://openexchangerates.org/api/latest.json?app_id=e11857b7d19d492dacc1fffc6de8c7a0";

@implementation Currency

- (NSString*) conversionName {
    return @"Currency";
}


@end
