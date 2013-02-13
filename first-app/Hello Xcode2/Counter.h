//
//  Counter.h
//  Hello Xcode2
//
//  Created by cgthornt on 1/14/13.
//  Copyright (c) 2013 cgthornt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Counter : NSObject

@property ( nonatomic , readonly) int count ;

- (void) increment;
- (void) decrement;

@end
