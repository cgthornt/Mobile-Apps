//
//  History.m
//  Converter Pro
//
//  Created by Christopher Thornton on 4/22/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//


// "\n" is a file seperator!
#import "History.h"
#define MAX_HISTORY_SIZE 25

static History* historyInstance;
static NSString* fileName = @"conversionHistory.txt";

@implementation History


@synthesize hist;
@synthesize theFilePath;

- (id) init {
    self = [super init];
    if(self) {
        hist = [[NSMutableArray alloc] init];
        // [self loadFromFile];
    }
    return self;
}


- (void) push: (NSString*) item {
    // NSLog(@"Adding item to history: %@", item);
    // If we exceed max size, then remove the first element
    if(hist.count == MAX_HISTORY_SIZE)
        [hist removeObjectAtIndex:0];
    [hist addObject:item];
    [self saveToFile];
}


// Gets the path for the file
// Some code taken from http://stackoverflow.com/questions/5619719/write-a-file-on-ios
- (NSString*) filePath {
    if(theFilePath == nil) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        theFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory, fileName];
    }
    return theFilePath;
}

- (void) saveToFile {
    NSMutableString *str = [[NSMutableString alloc] init];
    for(NSString *item in hist) {
        [str appendString:item];
        [str appendString:@"\n"];
    }
    [str writeToFile:str atomically:NO encoding:NSUTF8StringEncoding error:nil];
}


- (void) loadFromFile {
    NSString *fileContents = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
    hist = [[fileContents componentsSeparatedByString:@"\n"] mutableCopy]; // seperate back into each pieces
    
    // The last item may simply be an empty string!
    if(hist.count > 0) {
        NSString *last = hist.lastObject;
        if([last isEqualToString: @""])
            [hist removeLastObject];
    }
}


+ (History*) instance {
    if(historyInstance == nil) historyInstance = [[History alloc] init];
    return historyInstance;
}

@end
