//
//  DetailViewController.h
//  YouthHostelsLombardy
//
//  Created by pierangelo on 16/05/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface DetailViewController : UIViewController<MKMapViewDelegate>

@property (nonatomic) CLLocationCoordinate2D coordinate;


@property (nonatomic, strong) NSString *myObject;


@property (weak, nonatomic) IBOutlet UILabel *denominazioneLabel;
@property (weak, nonatomic) IBOutlet UILabel *comuneLabel;
@property (weak, nonatomic) IBOutlet UILabel *indirizzoLabel;
@property (weak, nonatomic) IBOutlet UILabel *telefonoLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudineLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudineLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;




@end
