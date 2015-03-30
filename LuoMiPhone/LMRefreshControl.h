//
//  LMRefreshControl.h
//  LMPullToRefresh
//
//  Created by Tim Geng on 3/25/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMRefreshControl : UIView<UIScrollViewDelegate>

+(LMRefreshControl *)initRefreshControl:(id)target targetAction:(SEL)targetAction scrollView:(UIScrollView *)scrollView;

- (void)endRefresh;
@end
