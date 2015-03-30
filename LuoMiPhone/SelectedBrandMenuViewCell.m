//
//  SelectedBrandMenuView.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "SelectedBrandMenuViewCell.h"
#import "LMTimerLabel.h"

@interface SelectedBrandMenuViewCell ()

@property(nonatomic,strong) LMTimerLabel *lmTimerLabel;
@end

@implementation SelectedBrandMenuViewCell

- (void)awakeFromNib {
    // Initialization code
    self.lmTimerLabel = [[LMTimerLabel alloc] initWithLabel:self.timeLabel];
    [self.lmTimerLabel setTimerToStopInterval:60*60]; //** Or you can use [timer3 setCountDownToDate:aDate];
    [self.lmTimerLabel start];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
