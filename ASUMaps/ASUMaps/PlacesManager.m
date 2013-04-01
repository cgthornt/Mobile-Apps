//
//  PlacesManager.m
//  ASUMaps
//
//  Created by Christopher Thornton on 4/1/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "PlacesManager.h"

static PlacesManager *theManager;

@implementation PlacesManager



+(PlacesManager*) sharedPlacesManager {
    @synchronized(self) {
        if(theManager == nil) theManager = [[PlacesManager alloc] init];
    }
    return theManager;
}

-(NSFetchedResultsController*) fetchControllerForLocations {
    Storage *storage = [Storage sharedStorage];
    
    NSManagedObjectContext *context = storage.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:@"Location"
                                      inManagedObjectContext:storage.managedObjectContext];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"lon" ascending:YES];
    
    NSArray *sorts = [NSArray arrayWithObjects:sortDescriptor, nil];
    fetchRequest.sortDescriptors = sorts;
    
    NSFetchedResultsController *fetchController = [[NSFetchedResultsController alloc]
                                                   initWithFetchRequest:fetchRequest
                                                   managedObjectContext: context
                                                   sectionNameKeyPath:nil
                                                   cacheName:@"locationListCache"];
    
    NSError *error;
    BOOL success = [fetchController performFetch:&error];
    return fetchController;
}

- (id) init {
    self = [super init];
    if(self != nil) {
        Storage *storage = [Storage sharedStorage];
        
        Location *loc = (Location*)[NSEntityDescription
                                    insertNewObjectForEntityForName:@"Location"
                                    inManagedObjectContext:storage.managedObjectContext];
        
        loc.name = @"Test Point 1";
        loc.lat = [NSNumber numberWithFloat:33.42357962];
        loc.lon = [NSNumber numberWithFloat:-111.93946123123];
        
        [storage saveContext];
    }
    
    return self;
}


@end
