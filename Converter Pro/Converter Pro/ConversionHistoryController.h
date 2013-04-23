//
//  ConversionHistoryController.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "History.h"

@interface ConversionHistoryController : UITableViewController

@property NSMutableArray* reverseHistoryList;

- (History*) history;

@end
