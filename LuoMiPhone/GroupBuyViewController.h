//
//  GroupBuyViewController.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteScrollView.h"
@interface GroupBuyViewController : UIViewController<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>


@property(nonatomic,weak) IBOutlet UITableView *tableView;

@property(nonatomic,weak) IBOutlet NSLayoutConstraint *topTableViewConstraint;

@end
