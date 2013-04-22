//
//  CLength.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//


#import "CLength.h"

@implementation CLength


@synthesize  didDoLoading;

- (NSArray*) unitKeys {
    return [NSArray arrayWithObjects:
            @"Meters", @"Kilometers", @"Centimeters", @"Feet", @"Inches", @"Yards", @"Miles", @"Nautical Miles", nil];
}

- (NSArray*) unitValues {
    return [NSArray arrayWithObjects:
            @"1", @"1000", @"0.01", @"0.3048", @"0.254", @"0.9114", @"1609.34", @"1852", nil];
}

- (NSString*) conversionName {
    return @"Length";
}

/*
- (BOOL) requiresLoading {
    return !didDoLoading;
}

- (void) loadData: (id<ConversionDataLoading>) loader {
    [loader conversionDataLoadError: @"Oh my! An error!"];
} */


@end

@implementation CMass
@end
