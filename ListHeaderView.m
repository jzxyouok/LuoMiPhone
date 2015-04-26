//
//  ListHeaderView.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/25/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "ListHeaderView.h"

@implementation ListHeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // Draw top line
    
    bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(0, self.frame.size.height)];
    
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    
    [[UIColor lightGrayColor] setStroke];
    
    [bezierPath setLineWidth:.5];
    
    [bezierPath stroke];
}


@end
