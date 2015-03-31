//
//  GroupByListTableViewCell.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupByListModal.h"
@interface GroupByListTableViewCell : UITableViewCell

-(void)setGroupByListModal:(GroupByListModal *)modal;

@property(nonatomic,weak) IBOutlet UIImageView *imageView;
@property(nonatomic,weak) IBOutlet UILabel *listTitleLabel;
@property(nonatomic,weak) IBOutlet UILabel *listDetailLabel;
@property(nonatomic,weak) IBOutlet UILabel *listPriceLabel;
@property(nonatomic,weak) IBOutlet UILabel *listSalesLabel;

@end
