//
//  GroupbyScrollTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupbyScrollTableViewCell.h"

@interface GroupbyScrollTableViewCell (){
    NSTimer *timer;
}

@end

@implementation GroupbyScrollTableViewCell

- (void)awakeFromNib {
    // Initialization code
    NSMutableArray *imageViews = [[NSMutableArray alloc] init];
    for (int i = 1; i < 5; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"GroupByScroll%d",i];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageViews addObject:imageView];
    }
    
    self.picScrollView.views = imageViews;
    self.picScrollView.automaticScroll = YES;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
