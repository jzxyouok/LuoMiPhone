//
//  UIImageView+AddSubImageView.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/1/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "UIImageView+AddSubImageView.h"

@implementation UIImageView (AddSubImageView)

-(void)addBookImageView{
    UILabel *bookLabel = [[UILabel alloc] init];
    bookLabel.backgroundColor = [UIColor colorWithRed:1.0 green:126/255.0 blue:0 alpha:1.0];
    [bookLabel setTextColor:[UIColor whiteColor]];
    int randomInt = arc4random() % 2;
    if (randomInt == 1) {
        bookLabel.text = @"免预约";

    }else{
        bookLabel.text = @"闪发";

    }
    bookLabel.frame = CGRectMake(0, 0, 50, 10);
    bookLabel.layer.position = CGPointMake(15, 15);
    bookLabel.textAlignment = NSTextAlignmentCenter;
    [bookLabel setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    [self addSubview:bookLabel];
    bookLabel.layer.affineTransform = CGAffineTransformMakeRotation(-M_PI_4);
    self.layer.masksToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFit;
    randomInt = arc4random() % 5;
    switch (randomInt) {
        case 0:
            self.image = [UIImage imageNamed:@"mc0"];
            break;
        case 1:
            self.image = [UIImage imageNamed:@"mc1"];
            break;
        case 2:
            self.image = [UIImage imageNamed:@"mc2"];
            break;
        case 3:
            self.image = [UIImage imageNamed:@"mc3"];
            break;
        case 4:
            self.image = [UIImage imageNamed:@"mc4"];
            break;
        default:
            break;
    }
}

@end
