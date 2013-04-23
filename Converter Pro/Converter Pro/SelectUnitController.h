//
//  SelectUnitController.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Conversion.h"

@interface SelectUnitController : UITableViewController



@property Conversion* currentConversion;
@property NSArray* availabeUnits;
@property NSString* segueIdentifier;

@end
