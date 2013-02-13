//
//  NovelsViewController.h
//  Novels
//
//  Created by cgthornt on 1/23/13.
//  Copyright (c) 2013 Arizona State University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bookshelf.h"

@interface NovelsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textContent;


-(void) loadText:(NSString *) path;

@end
