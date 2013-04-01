//
//  PlacesAnnotation.h
//  Maps
//
//  Created by philippe faucon on 3/5/13.
//  Copyright (c) 2013 philippe faucon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Location.h"

@interface PlaceAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;



-(id)initWithInfo:(Location*)info;
@end
