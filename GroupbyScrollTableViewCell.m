//
//  GroupbyScrollTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/27/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupbyScrollTableViewCell.h"
#import "FirstScrollMenuView.h"
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
    
    for (int i = 0 ; i < 2; i++) {
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"FirstScrollMenuView" owner:self options:nil];
        FirstScrollMenuView *view = (FirstScrollMenuView *)[views firstObject];
        view.frame = CGRectMake(i * self.actionScrollView.frame.size.width, 0, self.actionScrollView.frame.size.width, self.actionScrollView.frame.size.height);
        [self.actionScrollView addSubview:view];
    }
    self.actionScrollView.contentSize = CGSizeMake(self.actionScrollView.frame.size.width * 2, self.actionScrollView.frame.size.height);
    self.picScrollView.views = imageViews;
    self.picScrollView.automaticScroll = YES;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
