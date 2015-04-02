//
//  GroupByListTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupByListTableViewCell.h"
#import "UIImageView+AddSubImageView.h"
#import "UILabel+ChangeText.h"
@implementation GroupByListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    UITextView *priceTextView = [[UITextView alloc] init];
    priceTextView.text = @"dfsdf";
    priceTextView.backgroundColor = [UIColor redColor];
    priceTextView.frame = CGRectMake(self.listDetailLabel.frame.origin.x, self.listDetailLabel.frame.origin.y + self.listDetailLabel.frame.size.height, self.listDetailLabel.frame.size.width, 20);
    [self addSubview:priceTextView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setGroupByListModal:(GroupByListModal *)modal{
    self.imageView.image = modal.image;
    self.listDetailLabel.text = modal.listDetail;
    self.listPriceTextView.text = modal.listPrice;
    self.listTitleLabel.text = modal.listTitle;
    [self.imageView addBookImageView];
}

@end
