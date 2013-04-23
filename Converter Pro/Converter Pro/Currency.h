//
//  Currency.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "Conversion.h"
#import "AFJSONRequestOperation.h"

@interface Currency : Conversion

@property BOOL didDoLoading;
@property (atomic) NSMutableArray* keyz;
@property (atomic) NSMutableArray* vals;

@end
