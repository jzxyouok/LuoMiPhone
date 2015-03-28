//
//  GroupbyScrollTableViewCell.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfiniteScrollView.h"
@interface GroupbyScrollTableViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet InfiniteScrollView *picScrollView;

@property(nonatomic,weak) IBOutlet InfiniteScrollView *actionScrollView;

@property(nonatomic,weak) IBOutlet NSLayoutConstraint *scrollHeightConstraint;
@end
