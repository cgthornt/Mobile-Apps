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

@class Conversion;

@implementation Conversion

@synthesize units;


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
        units = [NSMutableDictionary dictionaryWithObjects:[self unitValues] forKeys:[self unitKeys]];
        
        // Add self to available conversions
        
        // [dict setObject:self forKey:[self conversionName]];
    }
    return self;
}


- (BOOL) requiresLoading { return false; }


- (void) loadData {  }

- (NSArray*) unitKeys {
    return [NSArray arrayWithObject:@"Key"];
}

- (NSArray*) unitValues {
    return [NSArray arrayWithObject:@"0.1"];
}

- (NSString*) conversionName {
    return @"Unknown";
}

- (NSDecimalNumber*) doConversion: (NSDecimalNumber*) originalValue originalConversion: (NSString*) originalConversion targetConversion:(NSString*) targetConversion {
    
    NSDecimalNumber
        *originalBase = [units objectForKey:targetConversion],
        *targetBase   = [units objectForKey:originalConversion];
    
    // Bad result!
    if(originalBase == nil || targetBase == nil)
        return nil;
    
    // Base units. Converss the original conersion to the base units
    NSDecimalNumber *baseUnits = [originalValue decimalNumberByMultiplyingBy:originalBase];
    
    // Now we can return the result!
    return [baseUnits decimalNumberByDividingBy:targetBase];
    
}


@end
