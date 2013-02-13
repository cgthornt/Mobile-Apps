//
//  Bookshelf.m
//  Novels
//
//  Created by cgthornt on 1/23/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import "Bookshelf.h"

@implementation Bookshelf
@synthesize booklist;
@synthesize currentBook;

static Bookshelf *theBookshelf = nil;


+(Bookshelf*) sharedBookshelf {
    if(theBookshelf == nil) theBookshelf = [[Bookshelf alloc] init];
    return theBookshelf;
}

- (id) init {
    self = [super init];
    if(self) { // Load book list
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Books" ofType:@"plist"];
        self.booklist = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    
    return self;
}
@end
