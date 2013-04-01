//
//  PlacesManager.h
//  ASUMaps
//
//  Created by Christopher Thornton on 4/1/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Storage.h"
#import "Location.h"


@interface PlacesManager : NSObject

@property (nonatomic, strong) Location *selectedPlace;

+(PlacesManager*) sharedPlacesManager;
-(NSFetchedResultsController*) fetchControllerForLocations;
-(NSArray*) getAllLocations;
@end
