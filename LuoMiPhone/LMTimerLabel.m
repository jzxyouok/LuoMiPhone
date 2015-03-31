//
//  LMTimerLabel.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "LMTimerLabel.h"

#define kDefaultTimeFormat  @"HH : mm : ss"



@interface LMTimerLabel (){
    
    NSDate *startCountDate;
}
@property(nonatomic,strong) NSDate *date1970;
@property(nonatomic,assign) NSTimeInterval timerInterval;
@property(nonatomic,strong) NSDate *timerToStop;
@property (nonatomic,strong) NSDateFormatter *dateFormatter;
@property (nonatomic,copy) NSString *timeFormat;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation LMTimerLabel

-(void)start{
    if (self.timer == nil) {
        self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateTimerLabel) userInfo:nil repeats:YES];

    }
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    if (startCountDate == nil) {
        startCountDate = [NSDate date];
    }
    if ([self.timer isValid]) {
        [self.timer fire];
    }
}
- (id)initWithLabel:(UILabel *)theLabel{
    self = [super init];
    if (self) {
        self.timeLabel = theLabel;
        self.date1970 = [NSDate dateWithTimeIntervalSince1970:0];
      
        [self updateTimerLabel];
    }
    return self;
}

- (NSString*)timeFormat
{
    if ([_timeFormat length] == 0 || _timeFormat == nil) {
        _timeFormat = kDefaultTimeFormat;
    }
    
    return _timeFormat;
}

-(void)setTimerToStopInterval:(NSTimeInterval)timeInterval{
    if (timeInterval > 0) {
        self.timerInterval = timeInterval;
    }
    self.timerToStop = [NSDate dateWithTimeIntervalSince1970:self.timerInterval];
}

- (NSDateFormatter*)dateFormatter{
    if (_dateFormatter == nil) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
        [_dateFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
        _dateFormatter.dateFormat = self.timeFormat;
    }
    return _dateFormatter;
}

-(void)updateTimerLabel{
    
    NSDate *timeToShow = [NSDate date];
    NSTimeInterval timerInterval = [[NSDate date] timeIntervalSinceDate:startCountDate];
    timeToShow = [self.timerToStop dateByAddingTimeInterval:timerInterval * -1];
    if ([self.dateFormatter stringFromDate:timeToShow].length > 0) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[self.dateFormatter stringFromDate:timeToShow]];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 2)];
        [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:85/255.0 green:85/255.0 blue:93/255.0 alpha:1.0] range:NSMakeRange(0, 2)];

        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, 2)];

        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, 2)];

        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(10, 2)];

         [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:85/255.0 green:85/255.0 blue:93/255.0 alpha:1.0] range:NSMakeRange(3, 1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:85/255.0 green:85/255.0 blue:93/255.0 alpha:1.0] range:NSMakeRange(8, 1)];
        self.timeLabel.attributedText = attributedString;
    }
    
}

@end
