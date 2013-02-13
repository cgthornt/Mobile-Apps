//
//  ChecklistItem.m
//  Checklist
//
//  Created by cgthornt on 1/30/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem 

@synthesize text, checked;

- (id) initWithCoder:(NSCoder *)aDecoder {
    if(self = [super init]) {
        self.text = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.text forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}

// Basic way to toggle checked status
- (void) toggleChecked { self.checked = !self.checked; }

@end
