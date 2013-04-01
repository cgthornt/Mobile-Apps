//
//  ListViewController.h
//  ASUMaps
//
//  Created by Christopher Thornton on 4/1/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "PlacesManager.h"
#import "Location.h"

@interface ListViewController : UITableViewController




@property (nonatomic, strong) NSFetchedResultsController *fetchController;
@end
