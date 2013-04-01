//
//  Location.h
//  ASUMaps
//
//  Created by Christopher Thornton on 4/1/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lon;

@end
