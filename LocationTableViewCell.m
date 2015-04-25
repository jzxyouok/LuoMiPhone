//
//  LocationTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/25/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "LocationTableViewCell.h"

@interface LocationTableViewCell ()


@end


@implementation LocationTableViewCell

- (void)awakeFromNib {
    // Initialization code
    if ([CLLocationManager locationServicesEnabled]) {
        self.locationManager =  [CLLocationManager new];
        
        self.locationManager.delegate =self;
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        self.locationManager.distanceFilter = 1000;
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
            [_locationManager requestWhenInUseAuthorization];
            [_locationManager requestAlwaysAuthorization];
            
        }
        
        [self.locationManager startUpdatingLocation];

        
    }
    
    else
        
    {
        
        NSLog(@"location server error!");
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)update:(id)sender{
    self.locationLabel.text = @"定位中....";
    [self.locationManager startUpdatingLocation];

}

-(void)locationManager:(CLLocationManager*)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation

{
//    CLLocationCoordinate2D loc = [newLocation coordinate];
// 使用CLGeocoder的做法，其实是因为ios5开始，iphone推荐的做法。而MKReverseGeocoder在ios5之后，就不再推荐使用了，因为这个类需要实现两个委托方法。而使用CLGeocodre，则可以使用直接的方法。
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray* placemarks,NSError *error) {
       if (placemarks.count >0   ) {
            CLPlacemark * plmark = [placemarks objectAtIndex:0];
            
            NSString * country = plmark.country;
            
            NSLog(@"%@",country);
            
            self.locationLabel.text = country;
       } NSLog(@"%@",placemarks);
   }];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error

{
    
    NSString * errorMsg = nil;
    if ([error code] ==kCLErrorDenied) {
        
        errorMsg=@"deny";
        
    }
    if ([error code] == kCLErrorLocationUnknown ) {
        
        errorMsg = @"fail";
        
    }
    
}


-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            [self.locationManager requestAlwaysAuthorization];
        break;
        case kCLAuthorizationStatusRestricted:
        case kCLAuthorizationStatusDenied:
        {
            // do some error handling
        }
            break;
        default:{
            [self.locationManager startUpdatingLocation];
        }
            break;
    }
}

@end
