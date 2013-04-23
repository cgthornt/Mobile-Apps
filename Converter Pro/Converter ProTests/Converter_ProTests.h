//
//  Converter_ProTests.h
//  Converter ProTests
//
//  Created by Christopher Thornton on 4/15/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Conversion.h"
#import "Currency.h"
#import "ManyUnits.h"

// Shorthand assertions!
#define AssertCalculation(conv,startAmt,startU,expectedAmt,targetU) \
    [self assertCalculation: conv startAmount: startAmt startUnit:startU \
        expectedAmount: expectedAmt targetUnits: targetU]



@interface Converter_ProTests : SenTestCase

@end
