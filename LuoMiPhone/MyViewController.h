//
//  MyViewController.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController<UINavigationControllerDelegate,UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak) IBOutlet UITableView *tableView;

@end
