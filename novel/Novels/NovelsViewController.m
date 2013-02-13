//
//  NovelsViewController.m
//  Novels
//
//  Created by cgthornt on 1/23/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import "NovelsViewController.h"

@interface NovelsViewController ()

@end

@implementation NovelsViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    Bookshelf *books = [Bookshelf sharedBookshelf];
    if(books.currentBook != nil) {
        NSString* path = [[NSBundle mainBundle]
                          pathForResource:books.currentBook
                                   ofType:@"txt"];
        [self loadText:path];
        
        [self setTitle:books.currentBook];
    }
    
    

}

-(void) loadText:(NSString *) path {
    NSString *textString = [NSString stringWithContentsOfFile:path
                                                     encoding:NSUTF8StringEncoding
                                                        error:NULL];
    [self.textContent setText:textString];
}

@end
