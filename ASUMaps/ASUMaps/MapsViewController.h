//
//  MapsViewController.h
//  ASUMaps
//
//  Created by Christopher Thornton on 3/27/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PlacesManager.h"
#import "Location.h"
#import "PlaceAnnotation.h"

@interface MapsViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end
