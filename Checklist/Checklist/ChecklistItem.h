//
//  ChecklistItem.h
//  Checklist
//
//  Created by cgthornt on 1/30/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject <NSCoding>

@property (nonatomic, copy) NSString* text;
@property (nonatomic, assign) BOOL checked;

- (void) toggleChecked;

@end
