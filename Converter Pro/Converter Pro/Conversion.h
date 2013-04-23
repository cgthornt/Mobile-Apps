//
//  Conversion.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <Foundation/Foundation.h>

// Typedef for setting conversions
typedef void (^conversionBlock)(NSMutableArray*);


@protocol ConversionDataLoading

- (void) conversionDataLoadSuccess;
- (void) conversionDataLoadError: (NSString *) error;

@end


@interface Conversion : NSObject


/**
 * How this should be formatted:
 *
 *      "name" => base units
 */
@property (nonatomic) NSMutableDictionary *units;

/**
 * The last selected from unit
 */
@property NSString* currentFromUnit;

@property NSString* currentToUnit;

@property NSString* lastSelectedUnit;




/**
 * Updates from and to units
 */
// - (void) updateUnitsFrom: (NSString*) from andTo: (NSString*) to;


/**
 * Takes input as a string (floating point number string) and returns the result as
 * a string
 */
- (NSString*) calculate: (NSString*) amount;

/**
 * Sets the current conversion being used
 */
+ (void) setCurrentConversion: (Conversion*) conversion;

/**
 * Gets the current conversion being used. May be nil if 'setCurrentConversion' has not been used.
 */
+ (Conversion*) currentConversion;


/**
 * Use this to initialize any of the available conversion types. Calling this should add values to
 * the available conversions dictionary. Gets a list of conversions from "createAvailableConversions"
 */
+ (void) initializeConversions: (conversionBlock) block;


/**
 * Gets a sorted array of conversions
 */
+ (NSArray*) sortedConversions;


/**
 * Gets a list of available conversions!
 */
+(NSMutableDictionary*) availableConversions;


/**
 * Gets the conversion name
 */
- (NSString*) conversionName;


/**
 * Whether this conversion requires loading. If TRUE, will show a loading
 * dialog and will call the loadData method. By default, simply returns FALSE.
 */
- (BOOL) requiresLoading;


/**
 * Used to load data. Will only be called if requiresLoading returns true. By default, this
 * simply does nothing.
 */
- (void) loadData: (id<ConversionDataLoading>) loader;

/**
 * Gets unit keys
 */
- (NSArray*) unitKeys;

/**
 * Gets unit values. Should be an array of strings, which will be converted to an NSDecimalNumber
 */ 
- (NSArray*) unitValues;



/**
 * Gets a conversion value based upon the result! Returns nil if the original value or target conversion
 * was invalid.
 */
- (NSDecimalNumber*) doConversion: (NSDecimalNumber*) originalValue originalConversion: (NSString*) originalConversion targetConversion:(NSString*) targetConversion;


@end
