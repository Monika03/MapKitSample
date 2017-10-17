//
//  ViewController.m
//  MapKitExample
//
//  Created by Ankam Mounika on 4/5/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.mapView.delegate = self;
    
   //Create a Region
    MKCoordinateRegion myRegion;
    
    //Create Center
    CLLocationCoordinate2D center;
    center.latitude = 37.791256;
    center.longitude = -122.396399;
    
    //Craete Span
    MKCoordinateSpan span;
    span.latitudeDelta = .02;
    span.longitudeDelta = .02;
    
    myRegion.center = center;
    myRegion.span = span;
    
    [self.mapView setRegion:myRegion animated:YES];
    
    //Adding Annotation
    
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc]init];
    pointAnnotation.coordinate = center;
    pointAnnotation.title = @"Address";
    pointAnnotation.subtitle = @"My office Location";
    
    [self.mapView addAnnotation:pointAnnotation];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKPointAnnotation *Annotation = [[MKPointAnnotation alloc]init];
    
    CLLocationCoordinate2D Coordinate;
    Coordinate.latitude = 37.791256;
    Coordinate.longitude = -122.396399;
    
    Annotation.coordinate = Coordinate;
    
    [self.mapView addAnnotation:Annotation];
    
}
//
//- (MKAnnotationView *)mapView:(MKMapView *)mapview viewForAnnotation:(nonnull id<MKAnnotation>)annotation
//{
//    if([annotation isKindOfClass:[MKUserLocation class]])
//    {
//        return nil;
//    }
//    MKAnnotationView *pinView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"locations"];
//    return  pinView;
//}

- (IBAction)setMap:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            _mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            _mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            _mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
    
}
@end
