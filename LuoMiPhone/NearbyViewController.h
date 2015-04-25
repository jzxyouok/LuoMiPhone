//
//  NearbyViewController.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)  UIView *menuView;


@property(nonatomic,assign) IBOutlet UITableView *tableView;

@end
