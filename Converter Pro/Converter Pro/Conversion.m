//
//  Conversion.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "Conversion.h"

// Available Conversions!
static NSMutableDictionary *theAvailableConversions = nil;

// Gets / sets the current conversion
static Conversion* theCurrentConversion = nil;

// @class Conversion;

@implementation Conversion

@synthesize units;

@synthesize currentFromUnit;
@synthesize currentToUnit;
@synthesize lastSelectedUnit;


+ (void) setCurrentConversion: (Conversion*) conversion {
    theCurrentConversion = conversion;
}

+ (Conversion*) currentConversion {
    return theCurrentConversion;
}



+(void) initializeConversions: (conversionBlock) block {
    // Create an array we will save to
    NSMutableArray *conversions = [[NSMutableArray alloc] init];
    
    // Call the array
    block(conversions);
    
    // Now get the dictionary
    NSMutableDictionary *dict = [Conversion availableConversions];
    
    // Loop through the conversions
    for(Conversion* conv in conversions) {
        
        // Ensure it's of the correct type. If not, raise
        if(![conv isKindOfClass: [Conversion class]]) {
            [NSException raise: @"Initalize conversion classes should be subclasses of Conversion" format: @"None"];
        }
    
        // Finally, add it!
        [dict setObject:conv forKey:[conv conversionName]];
        
        // NSLog(@"Added new conversion to table: '%@'", [conv conversionName]);
    }
    
    // We're done!
}


+(NSMutableDictionary*) availableConversions {
    if(theAvailableConversions == nil) {
        theAvailableConversions = [[NSMutableDictionary alloc] init];
    }
    return theAvailableConversions;
}


+(NSArray *) sortedConversions {
    NSArray *arr = [Conversion.availableConversions allValues];
    return [arr sortedArrayUsingComparator:^(Conversion *a, Conversion *b) {
        return [[a conversionName] compare: [b conversionName]];
    }];
}



/**
 * Overriden constructor
 */
- (id) init {
    self = [super init];
    if(self) {
        // Convert string values into decimal values!
        NSMutableArray *decimalValues = [[NSMutableArray alloc] initWithCapacity: [self.unitValues count]];
        for(id value in [self unitValues]) {
            [decimalValues addObject: [NSDecimalNumber decimalNumberWithString:value]];
        }
        units = [NSMutableDictionary dictionaryWithObjects:decimalValues forKeys:[self unitKeys]];
        
        // Set default current and from
        currentFromUnit = [self.unitKeys objectAtIndex: 0];
        currentToUnit   = [self.unitKeys objectAtIndex: 0];
    }
    return self;
}


- (void) updateUnitsFrom: (NSString*) from andTo: (NSString*) to {
    currentFromUnit = from;
    currentToUnit   = to;
}

- (NSDecimalNumber*) currentFromBase {
    return [units objectForKey: currentFromUnit];
}

- (NSDecimalNumber*) currentToBase {
    return [units objectForKey: currentToUnit];
}

- (NSString*) calculate: (NSString*) amount {
    NSDecimalNumber *original = [NSDecimalNumber decimalNumberWithString:amount];
    NSDecimalNumber *result   = [self doConversion:original
           originalConversion: currentFromUnit
             targetConversion: currentToUnit];
    
    float resultFloat = result.floatValue;
    NSLog(@"Calculated %.3f from start %@, From: %@, To %@",
          resultFloat, amount, currentFromUnit, currentToUnit);
    
    return [NSString stringWithFormat: @"%.3f %@",
            resultFloat, currentToUnit];
}


- (BOOL) requiresLoading { return false; }


- (void) loadData: (id<ConversionDataLoading>) loader { }

- (NSArray*) unitKeys {
    return [NSArray arrayWithObject:@"Loading..."];
}

- (NSArray*) unitValues {
    return [NSArray arrayWithObject:@"0.1"];
}

- (NSString*) conversionName {
    return @"Unknown";
}

- (NSDecimalNumber*) doConversion: (NSDecimalNumber*) originalValue originalConversion: (NSString*) originalConversion targetConversion:(NSString*) targetConversion {
    
    NSDecimalNumber
    *originalBase = [units objectForKey:originalConversion];
    
    NSDecimalNumber
        *targetBase   = [units objectForKey:targetConversion];
    
    
    // Bad result!
    if(originalValue == nil || originalBase == nil || targetBase == nil) {
        NSLog(@"A value returned nil!");
        return nil;
    }
    
    // Base units. Converss the original conersion to the base units
    NSDecimalNumber *baseUnits = [originalValue decimalNumberByMultiplyingBy:originalBase];

    
    // Now we can return the result!
    NSDecimalNumber *result = [baseUnits decimalNumberByDividingBy:targetBase];
    
    
    return result;
    
}


@end
