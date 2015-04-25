//
//  LocationTableViewCell.h
//  LuoMiPhone
//
//  Created by Tim Geng on 4/25/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LocationTableViewCell : UITableViewCell<CLLocationManagerDelegate>

@property(nonatomic,weak) IBOutlet UIButton *updateLocation;
@property(nonatomic,weak) IBOutlet UILabel *locationLabel;
-(IBAction)update:(id)sender;
@property(nonatomic,strong) CLLocationManager *locationManager;

@end
