//
//  InfiniteScrollView.h
//  InfiniteScrollView
//
//  Created by Tim Geng on 1/13/15.
//  Copyright (c) 2015 PwC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfiniteScrollView : UIView


-(id)initWithFrame:(CGRect)frame withViews:(NSArray *)views;

@property(nonatomic,strong) NSArray *views;

@property(nonatomic,assign) BOOL automaticScroll;

@property(nonatomic,copy) void(^viewTapped)(NSInteger index);

@property(nonatomic,copy) void(^closeButtonClicked)(void);

@end
