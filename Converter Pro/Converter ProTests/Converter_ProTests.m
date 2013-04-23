//
//  Converter_ProTests.m
//  Converter ProTests
//
//  Created by Christopher Thornton on 4/15/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "Converter_ProTests.h"




@implementation Converter_ProTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}


- (void) testLength {
    CLength *l = [[CLength alloc] init];
    
    // Random calculations
    AssertCalculation(l, 12, @"Feet", 12, @"Feet");
    AssertCalculation(l, 1, @"Feet", 12, @"Inches");
    AssertCalculation(l, 12345, @"Centimeters", 0.066657667, @"Nautical Miles");
}


- (void) testVolume {
    CVolume *v = [[CVolume alloc] init];
    AssertCalculation(v, 12, @"Quarts", 11.3562, @"Liters");
    AssertCalculation(v, 12.114, @"Cups", 0.0028660299, @"Cubic Meters");
    
    
    // Odd floating point conversions! Looks like a bug that will need to be fixed eventually
    AssertCalculation(v, 1, @"Gallons", 768, @"Teaspoons");
}

- (void) testMass {
    CMass *m = [[CMass alloc] init];
    
    AssertCalculation(m, 1, @"Pounds", 453.592, @"Grams");
    AssertCalculation(m, 3, @"Stone", 19.0509, @"Kilograms");
    AssertCalculation(m, 3, @"Kilograms", 105.822, @"Ounces");
}



- (void) assertCalculation: (Conversion*) conversion startAmount: (double) startAmt startUnit: (NSString*) startUnits expectedAmount: (double) expectedAmnt targetUnits: (NSString*) targetUnits {

    // Convert to NSnumber
    NSNumber *startAmount = [NSNumber numberWithDouble:startAmt],
    *expectedAmount   = [NSNumber numberWithDouble:expectedAmnt];
    
    NSDecimalNumber *start = [NSDecimalNumber decimalNumberWithString: startAmount.stringValue];
    //    *expected = [NSDecimalNumber decimalNumberWithString: expectedAmount.stringValue];
        
    // Calculate real result
    NSDecimalNumber *result = [conversion doConversion:start
                                        originalConversion:startUnits
                                          targetConversion:targetUnits];
        
    // Get result strings to precision of 5
    NSString *expectedStr = [NSString stringWithFormat:@"%.4f", expectedAmount.doubleValue],
    *actualStr = [NSString stringWithFormat:@"%.4f", result.doubleValue];
        
        
    NSString* errorString = [NSString stringWithFormat:
                                 @"Expected conversion of %.f %@ into %@ to equal %@, but was %@",
                                 startAmount.doubleValue, startUnits, targetUnits, expectedStr, actualStr];
    
    STAssertTrue([expectedStr isEqualToString: actualStr], errorString);
}



@end
