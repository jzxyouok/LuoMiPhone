//
//  CountDownTimerView.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "CountDownTimerView.h"

#define kDefaultTimeFormat  @"HH:mm:ss"

@interface CountDownTimerView (){
    NSDate *startCountDate;
}

@property(nonatomic,strong) NSDate *date1970;
@property(nonatomic,assign) NSTimeInterval timerInterval;
@property(nonatomic,strong) NSDate *timerToStop;
@property (nonatomic,strong) NSDateFormatter *dateFormatter;
@property (nonatomic,copy) NSString *timeFormat;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation CountDownTimerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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

-(void)awakeFromNib{
    self.hourLabel.layer.cornerRadius = 5;
    self.hourLabel.layer.masksToBounds = YES;
    self.minuteLabel.layer.cornerRadius = 5;
    self.minuteLabel.layer.masksToBounds = YES;
    self.secondLabel.layer.cornerRadius = 5;
    self.secondLabel.layer.masksToBounds = YES;
    if (self.timer == nil) {
        self.timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(updateTimerLabel) userInfo:nil repeats:YES];
        
    }
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    if (startCountDate == nil) {
        startCountDate = [NSDate date];
    }
    self.timerInterval = 60*60*10;
    
    self.timerToStop = [NSDate dateWithTimeIntervalSince1970:self.timerInterval];
    if ([self.timer isValid]) {
        [self.timer fire];
    }
}

-(void)updateTimerLabel{
    
    NSDate *timeToShow = [NSDate date];
    NSTimeInterval timerInterval = [[NSDate date] timeIntervalSinceDate:startCountDate];
   // NSLog(@"%@",[self.timerToStop description]);
    timeToShow = [self.timerToStop dateByAddingTimeInterval:timerInterval * -1];
    if ([self.dateFormatter stringFromDate:timeToShow].length > 0) {
        NSString *timeString = [self.dateFormatter stringFromDate:timeToShow];
        NSArray *timeComponenets = [timeString componentsSeparatedByString:@":"];
        self.hourLabel.text = [timeComponenets objectAtIndex:0];
        self.minuteLabel.text = [timeComponenets objectAtIndex:1];
        self.secondLabel.text = [timeComponenets objectAtIndex:2];
    }
    
}



@end
