//
//  GroupByListTableViewCell.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupByListTableViewCell.h"
#import "UIImageView+AddSubImageView.h"
#import "UILabel+ChangeText.h"
#import "LMTextStorage.h"
#import "LMLayoutManager.h"

@implementation GroupByListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    [style setAlignment:NSTextAlignmentJustified];
    
    NSString *priceString1 = @"￥25 30 全城热卖";
    //NSString *priceString = [NSString stringWithCString:[priceString1 UTF8String] encoding:NSUTF8StringEncoding];
      NSString *priceString = [NSString stringWithString:[priceString1 stringByReplacingPercentEscapesUsingEncoding:NSJapaneseEUCStringEncoding]];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:priceString];
    NSArray *textArray = [priceString componentsSeparatedByString:@" "];
    LMTextStorage *text = [[LMTextStorage alloc] init];
    
    if (textArray.count == 3) {
        text.tokens = @{ @"￥25" : @{
                                 NSForegroundColorAttributeName :
                                                              [UIColor colorWithRed:1 green:70/255.0 blue:131/255.0 alpha:1.0],
                                 NSFontAttributeName:[UIFont systemFontOfSize:15]
                                 },
                         [textArray objectAtIndex:1] : @{
                                 NSForegroundColorAttributeName :
                                                              [UIColor lightGrayColor],
                                 NSStrikethroughStyleAttributeName:[NSNumber numberWithInt:2],
                                 NSStrikethroughColorAttributeName:[UIColor lightGrayColor],
                                 NSFontAttributeName:[UIFont systemFontOfSize:20]
                                 },
                         @"全城热卖" : @{
                                 NSForegroundColorAttributeName :
                                                              [UIColor colorWithRed:1 green:126/255.0 blue:0 alpha:1.0],
                                PTLHighlightColorAttributeName :
                                                              [UIColor colorWithRed:1 green:126/255.0 blue:0 alpha:1.0],
                                 NSFontAttributeName:[UIFont systemFontOfSize:10]
                                 },
                         
                         PTLDefaultTokenName : @{
                                 NSParagraphStyleAttributeName: style,
                                 NSFontAttributeName:
                                     [UIFont
                                      systemFontOfSize:15]
                                 }
                         };
    }
    if (textArray.count == 1) {
        text.tokens = @{ (NSString *)[textArray objectAtIndex:0] : @{
                                 NSForegroundColorAttributeName :
                                     [UIColor colorWithRed:1 green:70/255.0 blue:131/255.0 alpha:1.0],
                                 NSFontAttributeName:[UIFont systemFontOfSize:15]
                                 },
                         
                         
                         PTLDefaultTokenName : @{
                                 NSParagraphStyleAttributeName: style,
                                 NSFontAttributeName:
                                     [UIFont
                                      systemFontOfSize:15]
                                 }
                         };
    }

    
    [text setAttributedString:attributedString];
    
    // Create the layout manager
    LMLayoutManager *layoutManager = [LMLayoutManager new];
    [text addLayoutManager:layoutManager];
    
    // Create the text container
    CGRect textViewFrame = CGRectMake(self.listDetailLabel.frame.origin.x, self.listDetailLabel.frame.origin.y + self.listDetailLabel.frame.size.height, self.listDetailLabel.frame.size.width, 30);
    NSTextContainer *
    textContainer = [[NSTextContainer alloc] initWithSize:textViewFrame.size];
    [layoutManager addTextContainer:textContainer];
    
    // Create the text view
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame
                                               textContainer:textContainer];
    textView.editable = NO;
    textView.scrollEnabled = NO;
    [self addSubview:textView];

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setGroupByListModal:(GroupByListModal *)modal{
    self.imageView.image = modal.image;
    self.listDetailLabel.text = modal.listDetail;
    self.listPriceTextView.text = modal.listPrice;
    self.listTitleLabel.text = modal.listTitle;
    [self.imageView addBookImageView];
}

@end
