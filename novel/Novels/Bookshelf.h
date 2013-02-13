//
//  Bookshelf.h
//  Novels
//
//  Created by cgthornt on 1/23/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bookshelf : NSObject
@property (nonatomic, strong) NSMutableArray *booklist;
@property (nonatomic, strong) NSString *currentBook;
+(Bookshelf*) sharedBookshelf;
@end
