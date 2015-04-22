//
//  LeftTableViewCell.m
//  JSDropDownMenuDemo
//
//  Created by Tim Geng on 4/21/15.
//  Copyright (c) 2015 jsfu. All rights reserved.
//

#import "LeftTableViewCell.h"
#define SelectColorForMenuAndIndicator [UIColor colorWithRed:254/255.0f green:109/255.0f blue:156/255.0f alpha:1.0]


@implementation LeftTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.subMenuCount.layer.cornerRadius = 3.0;
    self.subMenuCount.layer.masksToBounds = YES;
    self.subMenuCount.backgroundColor = LeftCountDefaultColor;

   // [self setstyleForSelected:NO];

}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    [super setHighlighted:highlighted animated:animated];
    [self setstyleForSelected:highlighted];

}

-(void)setstyleForSelected:(BOOL)selected{
    
    if (selected) {
        NSLog(@"*******selected = yes********");
        self.menuTitle.textColor = SelectColorForMenuAndIndicator;

        self.iconImageView.highlighted = YES;
        self.contentView.backgroundColor = LeftSelectColor;
    }else{
        NSLog(@"*******selected = no********");

        self.contentView.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1.0];
        
        self.menuTitle.textColor = [UIColor blackColor];
        self.iconImageView.highlighted = NO;
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self setstyleForSelected:selected];
   
    // Configure the view for the selected state
}

@end
