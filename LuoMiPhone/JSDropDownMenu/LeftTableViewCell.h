//
//  LeftTableViewCell.h
//  JSDropDownMenuDemo
//
//  Created by Tim Geng on 4/21/15.
//  Copyright (c) 2015 jsfu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LeftCountDefaultColor [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1.0]
#define LeftSelectColor [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1.0]

@interface LeftTableViewCell : UITableViewCell

@property(nonatomic,weak) IBOutlet UILabel *menuTitle;
@property(nonatomic,weak) IBOutlet UILabel *subMenuCount;
@property(nonatomic,weak) IBOutlet UIImageView *iconImageView;

@end
