//
//  PlaceAnnotation.m
//  Maps
//
//  Created by philippe faucon on 3/5/13.
//  Copyright (c) 2013 philippe faucon. All rights reserved.
//

#import "PlaceAnnotation.h"


@interface PlaceAnnotation ()
//@property (nonatomic, strong) Location *placeInfo;
@end

@implementation PlaceAnnotation
//@synthesize placeInfo = _placeInfo;

// Q: Why didn't I synthesize coordinate?  Note that it's readonly.
// A: I don't want to synthesize it because I am writing the getter
//    method myself down below.
/*

-(id)initWithInfo:(Location*)info {
	if (self = [super init]) {
		// I'm keeping this information around in an instance variable, so I should be an owner.
		self.placeInfo = info;
	}
	return self;
}

// Instead of synthesizing this property, we're going to implement the getter ourselves!
-(CLLocationCoordinate2D) coordinate {
	double lat = [self.placeInfo.lat doubleValue];
	double lon = [self.placeInfo.lon doubleValue];
	
	return CLLocationCoordinate2DMake(lat, lon);
}

- (NSString *)title {
	return self.placeInfo.name;
}

- (NSString *)subtitle {
	return [NSString stringWithFormat:@"Latitude:%@\nLongitude:%@", self.placeInfo.lat, self.placeInfo.lon];
}


// when I am deallocated, I want to release my reference to the placeInfo
-(void) dealloc {
	self.placeInfo = nil;
} */
@end
