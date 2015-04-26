//
//  ListFooterView.h
//  LuoMiPhone
//
//  Created by Tim Geng on 4/25/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListFooterView : UIView

@property(nonatomic,copy) void(^footerViewClicked)(NSInteger section);
@property(nonatomic,assign) NSInteger section;

@end
