//
//  JSCollectionViewCell.h
//  JSDropDownMenuDemo
//
//  Created by Tim Geng on 4/21/15.
//  Copyright (c) 2015 jsfu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSCollectionViewCell:UICollectionViewCell

@property(nonatomic,strong) UILabel *textLabel;
@property(nonatomic,strong) UIImageView *accessoryView;

-(void)removeAccessoryView;

@end
