//
//  SelectedBrandCollectionViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/30/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "SelectedBrandCollectionViewCell.h"

@implementation SelectedBrandCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    //@"￥77.9 100"
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"￥77.9 100"];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, 5)];
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(5, 4)];
    
    [attributedString addAttribute:NSStrikethroughStyleAttributeName value:[NSNumber numberWithInteger: NSUnderlineStyleSingle] range:NSMakeRange(6, 3)];
    
    self.label.attributedText = attributedString;
 }

@end
