//
//  LMTimerLabel.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMTimerLabel : UILabel

@property(nonatomic,strong) UILabel *timeLabel;

- (id)initWithLabel:(UILabel *)theLabel;
-(void)setTimerToStopInterval:(NSTimeInterval)timeInterval;
-(void)start;
@end
