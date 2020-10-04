//
//  DetailViewController.m
//  YouthHostelsLombardy
//
//  Created by pierangelo on 16/05/15.
//  Copyright (c) 2015 pierangelo. All rights reserved.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "MapAnnotation.h"

@interface DetailViewController ()
//@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation DetailViewController

@synthesize myObject;

@synthesize mapView;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    // Do any additional setup after loading the view.
    self.denominazioneLabel.text = [myObject valueForKey:@"denominazione"];
    self.comuneLabel.text = [myObject valueForKey:@"comune"];
    self.indirizzoLabel.text = [myObject valueForKey:@"indirizzo"];
    self.telefonoLabel.text = [myObject valueForKey:@"telefono"];
    self.latitudineLabel.text = [myObject valueForKey:@"latitudine"];
    self.longitudineLabel.text = [myObject valueForKey:@"longitudine"];
    
    NSString *lati = [myObject valueForKey:@"latitudine"];
    NSString *longi = [myObject valueForKey:@"longitudine"];
    
    NSLog(@"LATITUDINEzzzz %@", lati);
    NSLog(@"LONGITUDINEzzzz %@", longi);
    
    MapAnnotation *mapPoint = [[MapAnnotation alloc] init];
    mapPoint.coordinate = CLLocationCoordinate2DMake([lati doubleValue], [longi doubleValue]);
    //mapPoint.title = self.location.title;
    
    // Add it to the map view
    [self.mapView addAnnotation:mapPoint];
    
    // Zoom to a region around the pin
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(mapPoint.coordinate, 500, 500);
    [self.mapView setRegion:region];
       
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
