//
//  GroupByListModal.h
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GroupByListModal : NSObject

@property(nonatomic,strong)  UIImage *image;
@property(nonatomic,strong)  NSString *listTitle;
@property(nonatomic,strong)  NSString *listDetail;
@property(nonatomic,strong)  NSString *listPrice;
@property(nonatomic,strong)  NSString *listSales;
-(instancetype)initWith:(NSDictionary *)dic;
@end
