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

static int testint = 0;

@implementation GroupByListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    [style setAlignment:NSTextAlignmentJustified];
    
    NSString *priceString1 = @"￥25 30 全城热卖";
    
    int randomInt = testint++ % 5;
    switch (randomInt) {
        case 0:
            priceString1 = @"￥21.2";
            break;
        case 1:
            priceString1 = @"￥0.8 低";
            break;
        case 2:
            priceString1 = @"￥25 30 全城热卖";
            break;
        case 3:
            priceString1 = @"￥8 22 非常实惠 赞";
            break;
        case 4:
            priceString1 = @"￥12 40 好 牛 赞";
            break;
            
        default:
            break;
    }
    //NSString *priceString = [NSString stringWithCString:[priceString1 UTF8String] encoding:NSUTF8StringEncoding];
      NSString *priceString = [NSString stringWithString:[priceString1 stringByReplacingPercentEscapesUsingEncoding:NSJapaneseEUCStringEncoding]];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:priceString];
    NSArray *textArray = [priceString componentsSeparatedByString:@" "];
    LMTextStorage *text = [[LMTextStorage alloc] init];
    NSDictionary *nowPriceAttri = @{
                                    NSForegroundColorAttributeName :
                                        [UIColor colorWithRed:1 green:70/255.0 blue:131/255.0 alpha:1.0],
                                    NSFontAttributeName:[UIFont systemFontOfSize:20]
                                    };
    NSDictionary *priviousPriceAttri = @{
                                         NSForegroundColorAttributeName :
                                             [UIColor lightGrayColor],
                                         NSStrikethroughStyleAttributeName:[NSNumber numberWithInt:2],
                                         NSStrikethroughColorAttributeName:[UIColor lightGrayColor],
                                         NSFontAttributeName:[UIFont systemFontOfSize:11]
                                         };
    NSDictionary *yellowBoundsAttri = @{
                                      NSForegroundColorAttributeName :
                                          [UIColor colorWithRed:1 green:126/255.0 blue:0 alpha:1.0],
                                      PTLHighlightColorAttributeName :
                                          [UIColor colorWithRed:1 green:126/255.0 blue:0 alpha:1.0],
                                      NSFontAttributeName:[UIFont systemFontOfSize:11]
                                      };
    NSDictionary *redBoundsAttri = @{
                                        NSForegroundColorAttributeName :
                                            [UIColor colorWithRed:1 green:70/255.0 blue:131/255.0 alpha:1.0],
                                        PTLHighlightColorAttributeName :
                                            [UIColor colorWithRed:1 green:70/255.0 blue:131/255.0 alpha:1.0],
                                        NSFontAttributeName:[UIFont systemFontOfSize:15]
                                        };
    NSDictionary *defaultAttri = @{
                                   NSParagraphStyleAttributeName: style,
                                   NSFontAttributeName:
                                       [UIFont
                                        systemFontOfSize:15]
                                   };
    if (textArray.count == 1) {
        text.tokens = @{ [textArray objectAtIndex:0] : nowPriceAttri,
                         PTLDefaultTokenName : defaultAttri
                         };
    }
    if (textArray.count == 2) {
        text.tokens = @{ [textArray objectAtIndex:0] : nowPriceAttri,
                         [textArray objectAtIndex:1] : redBoundsAttri,
                         PTLDefaultTokenName : defaultAttri
                         };
    }
    
    if (textArray.count == 3) {
        text.tokens = @{ [textArray objectAtIndex:0] : nowPriceAttri,
                        [textArray objectAtIndex:1] : priviousPriceAttri,
                         [textArray objectAtIndex:2]: yellowBoundsAttri,
                         PTLDefaultTokenName : defaultAttri
                         };
    }
    
    if (textArray.count == 4) {
        text.tokens = @{ [textArray objectAtIndex:0] : nowPriceAttri,
                         [textArray objectAtIndex:1] : priviousPriceAttri,
                         [textArray objectAtIndex:2]: yellowBoundsAttri,
                         [textArray objectAtIndex:3]: redBoundsAttri,

                         PTLDefaultTokenName : defaultAttri
                         };
    }

    if (textArray.count == 5) {
        text.tokens = @{ [textArray objectAtIndex:0] : nowPriceAttri,
                         [textArray objectAtIndex:1] : priviousPriceAttri,
                         [textArray objectAtIndex:2]: redBoundsAttri,
                         [textArray objectAtIndex:3]: redBoundsAttri,
                         [textArray objectAtIndex:4]: redBoundsAttri,

                         PTLDefaultTokenName : defaultAttri
                         };
    }
    
    [text setAttributedString:attributedString];
    
    // Create the layout manager
    LMLayoutManager *layoutManager = [LMLayoutManager new];
    [text addLayoutManager:layoutManager];
    
    // Create the text container
    CGRect textViewFrame = CGRectMake(self.listDetailLabel.frame.origin.x - 7, self.listDetailLabel.frame.origin.y + self.listDetailLabel.frame.size.height , self.listDetailLabel.frame.size.width, self.listSalesLabel.frame.origin.y - self.listDetailLabel.frame.origin.y - self.listDetailLabel.frame.size.height);
    NSTextContainer *
    textContainer = [[NSTextContainer alloc] initWithSize:textViewFrame.size];
    [layoutManager addTextContainer:textContainer];
    
    // Create the text view
    UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame
                                               textContainer:textContainer];
    textView.editable = NO;
    textView.scrollEnabled = NO;
    textView.textAlignment = NSTextAlignmentLeft;
    [self addSubview:textView];
    self.textView.backgroundColor = [UIColor redColor];
    [textView setTextContainerInset:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setGroupByListModal:(GroupByListModal *)modal{
    self.imageView.image = modal.image;
   // self.listDetailLabel.text = modal.listDetail;
    self.listPriceTextView.text = modal.listPrice;
    self.listTitleLabel.text = modal.listTitle;
    [self.imageView addBookImageView];
}

@end
