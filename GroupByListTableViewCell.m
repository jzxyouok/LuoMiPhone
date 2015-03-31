//
//  GroupByListTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupByListTableViewCell.h"

@implementation GroupByListTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setGroupByListModal:(GroupByListModal *)modal{
    self.imageView.image = modal.image;
    self.listDetailLabel.text = modal.listDetail;
    self.listPriceLabel.text = modal.listPrice;
    self.listSalesLabel.text = modal.listSales;
    self.listTitleLabel.text = modal.listTitle;
}

@end
