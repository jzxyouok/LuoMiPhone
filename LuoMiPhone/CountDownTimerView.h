//
//  CountDownTimerView.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountDownTimerView : UIView

@property(nonatomic,strong) IBOutlet UILabel *hourLabel;
@property(nonatomic,strong) IBOutlet UILabel *minuteLabel;
@property(nonatomic,strong) IBOutlet UILabel *secondLabel;

@end
