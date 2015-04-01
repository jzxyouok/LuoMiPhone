//
//  UILabel+ChangeText.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/1/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "UILabel+ChangeText.h"
#import <CoreText/CoreText.h>

@implementation UILabel (ChangeText)

-(void)changeAttributedString{
    
    NSString *str = @"￥ 79.9 100 味道出色";
    NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:str];
    
    // Set font, notice the range is for the whole string
    UIFont *font1 = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    [attributedString1 addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0, [attributedString1 length])];
    
    // Set background color, again for entire range
    NSShadow *shadow = [[NSShadow alloc] init];
    [shadow setShadowColor:[UIColor colorWithRed:0.053 green:0.088 blue:0.205 alpha:1.000]];
    [shadow setShadowBlurRadius:1.0];
    [shadow setShadowOffset:CGSizeMake(1, 1)];
    
    self.text = nil;
    self.attributedText = attributedString1;
}

@end
