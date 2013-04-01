//
//  MapsViewController.m
//  ASUMaps
//
//  Created by Christopher Thornton on 3/27/13.
//  Copyright (c) 2013 Christopher Thornton. All rights reserved.
//

#import "MapsViewController.h"

@interface MapsViewController ()

@end

@implementation MapsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    PlacesManager *manager = [PlacesManager sharedPlacesManager];
    
    [manager addObserver:self
              forKeyPath:@"selectedPlace"
                 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                 context:NULL];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"selectedPlace"]) {
        [self moveToSelectedPlace];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) moveToSelectedPlace {
    PlacesManager *placesManager = [PlacesManager sharedPlacesManager];
    
    Location *sp = placesManager.selectedPlace;
    float latitude  = [sp.lat floatValue];
    float longitude = [sp.lon floatValue];
    
    // Make a center point for our lat / long
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion newRegion = MKCoordinateRegionMake(center, span);
    [self.mapView setRegion:newRegion animated:YES];
}

-(void) dealloc {
    PlacesManager *manager = [PlacesManager sharedPlacesManager];
    [manager removeObserver:self forKeyPath:@"selectedPlace"];
}

@end
