//
//  JSTableViewCell.m
//  JSDropDownMenuDemo
//
//  Created by Tim Geng on 4/21/15.
//  Copyright (c) 2015 jsfu. All rights reserved.
//

#import "JSTableViewCell.h"
#import "NSString+Size.h"

@implementation JSTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _cellTextLabel = [[UILabel alloc] init];
        _cellTextLabel.textAlignment = NSTextAlignmentCenter;
        _cellTextLabel.font = [UIFont systemFontOfSize:14.0f];
        [self addSubview:_cellTextLabel];
    }
    return self;
}

-(void)setCellText:(NSString *)text align:(NSString*)align{
    
    _cellTextLabel.text = text;
    // 只取宽度
    CGSize textSize = [text textSizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(MAXFLOAT, 14) lineBreakMode:NSLineBreakByWordWrapping];
    //    CGSize textSize = [text sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(MAXFLOAT, 14)];
    
    CGFloat marginX = 20;
    
    if (![@"left" isEqualToString:align]) {
        marginX = (self.frame.size.width-textSize.width)/2;
    }
    
    _cellTextLabel.frame = CGRectMake(marginX, 0, textSize.width, self.frame.size.height);
    
    if(_cellAccessoryView){
        _cellAccessoryView.frame = CGRectMake(_cellTextLabel.frame.origin.x+_cellTextLabel.frame.size.width+10, (self.frame.size.height-12)/2, 16, 12);
    }
}

-(void)setCellAccessoryView:(UIImageView *)accessoryView{
    
    if (_cellAccessoryView) {
        [_cellAccessoryView removeFromSuperview];
    }
    
    _cellAccessoryView = accessoryView;
    
    _cellAccessoryView.frame = CGRectMake(_cellTextLabel.frame.origin.x+_cellTextLabel.frame.size.width+10, (self.frame.size.height-12)/2, 16, 12);
    
    [self addSubview:_cellAccessoryView];
}

@end