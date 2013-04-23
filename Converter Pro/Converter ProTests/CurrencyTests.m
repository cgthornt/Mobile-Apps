//
//  CurrencyTests.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "CurrencyTests.h"

@implementation CurrencyTests

@synthesize currency;

- (void)setUp {
    [super setUp];
    currency = [[Currency alloc] init];
}

// Currency should require loading at this point
- (void) testShouldNotBeLoaded {
    STAssertTrue([currency requiresLoading], @"Currency should require initial loading!");
}

// Downloading Currency!
- (void) testDownloadCurrency {
    STAssertNoThrow(([currency loadData:self]), @"Downloading currency rates should not raise an exception");
}

- (void) conversionDataLoadError: (NSString *) error {
    STFail([NSString stringWithFormat: @"Downloading exchange rates results in an error: %@", error]);
}

- (void) conversionDataLoadSuccess {
    STFail(@"Conversion was successful!");
}


@end
