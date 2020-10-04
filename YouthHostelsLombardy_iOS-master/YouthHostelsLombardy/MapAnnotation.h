//
//  MapAnnotation.h
//  YouthHostelsLombardy
//
//  Created by pierangelo on 19/05/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MapAnnotation : NSObject<MKAnnotation>


@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end