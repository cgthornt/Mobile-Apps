//
//  CLength.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//


#import "ManyUnits.h"

@implementation CLength



- (NSArray*) unitKeys {
    return [NSArray arrayWithObjects:
            @"Meters", @"Kilometers", @"Centimeters", @"Feet", @"Inches", @"Yards", @"Miles", @"Nautical Miles", nil];
}

- (NSArray*) unitValues {
    return [NSArray arrayWithObjects:
            @"1", @"1000", @"0.01", @"0.3048", @"0.0254", @"0.9114", @"1609.34", @"1852", nil];
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
- (NSString*) conversionName { return @"Mass"; }
- (NSArray*) unitKeys {
    return [NSArray arrayWithObjects:
            @"Grams", @"Kilograms", @"Milligrans", @"Pounds", @"Ounces", @"Stone", nil];
}

- (NSArray*) unitValues {
    return [NSArray arrayWithObjects:
            @"1", @"1000", @"0.001", @"453.592", @"28.3495", @"6350.29", nil];
}
@end


@implementation CVolume
- (NSString*) conversionName { return @"Volume"; }
- (NSArray*) unitKeys {
    return [NSArray arrayWithObjects:
            @"Liters", @"Milliliters", @"Gallons", @"Quarts", @"Pints", @"Cups", @"Ounces", @"Tablespoons", @"Teaspoons", @"Cubic Meters", @"Cubit Feet", @"Cubic Inches", @"Barrels (oil)",  nil];
}

- (NSArray*) unitValues {
    return [NSArray arrayWithObjects:
            @"1", @"0.001", @"3.78541", @"0.946353", @"0.473176", @"0.236588", @"0.0295735", @"0.0147868", @"0.00492892", @"1000", @"28.3168", @"0.0163871", @"158.9873", nil];
}
@end