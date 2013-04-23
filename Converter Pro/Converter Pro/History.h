//
//  History.h
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

@property NSMutableArray *hist;
@property NSString* theFilePath;


// Push an item to the history
- (void) push: (NSString*) item;

// instance
+ (History*) instance;

@end
