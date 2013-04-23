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

@synthesize didDoLoading;
@synthesize keyz;
@synthesize vals;

- (NSString*) conversionName {
    return @"Currency";
}


- (BOOL) requiresLoading {
    return !didDoLoading;
}

- (void) loadData: (id<ConversionDataLoading>) loader {
    NSURL *url = [NSURL URLWithString:requestURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // Make URL and such
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        // Default values!
        NSString *base = [JSON valueForKeyPath:@"base"];
        self.currentToUnit = base;
        self.currentFromUnit = base;
        
        NSDictionary *currencies = [JSON valueForKeyPath:@"rates"];
        NSString *key;
        
        // Initialize keys and vals! Important! I wated quite some time figuring this out...
        keyz = [[NSMutableArray alloc] init];
        vals = [[NSMutableArray alloc] init];
        
        for(key in currencies) {
            NSNumber *amount = [currencies objectForKey:key];
            [self.keyz addObject:key];
            [self.vals addObject: amount.stringValue];
            NSDecimalNumber *dec = [NSDecimalNumber decimalNumberWithString:amount.stringValue];
            [self.units setObject:dec forKey:key];
        }
        
        [self.units removeObjectForKey:@"Loading..."];
        didDoLoading = YES;
        [loader conversionDataLoadSuccess];
        
        
        
        
    } failure: ^(NSURLRequest *request, NSHTTPURLResponse *response , NSError *error , id JSON ) {
        [loader conversionDataLoadError: @"Unable to download latest currency exchange rates!"];
    }];
    [operation start];
    
    
}


- (NSArray*) unitKeys {
    if(keyz == nil) return [super unitKeys];
    return keyz;
}

- (NSArray*) unitValues {
    if(vals == nil) return [super unitValues];
    return vals;
}

// Calculation is kind of different
- (NSDecimalNumber*) doConversion: (NSDecimalNumber*) originalValue originalConversion: (NSString*) originalConversion targetConversion:(NSString*) targetConversion {
    
    NSDecimalNumber
    *originalBase = [self.units objectForKey:originalConversion];
    
    NSDecimalNumber
        *targetBase   = [self.units objectForKey:targetConversion];

    // Bad result!
    if(originalValue == nil || originalBase == nil || targetBase == nil) {
        NSLog(@"A value returned nil!");
        return nil;
    }
    
    // Base units. Converss the original conersion to the base units
    NSDecimalNumber *baseUnits = [originalValue decimalNumberByDividingBy:originalBase];
    
    
    // Now we can return the result!
    NSDecimalNumber *result = [baseUnits decimalNumberByMultiplyingBy:targetBase];
    
    
    return result;
    
}


@end
