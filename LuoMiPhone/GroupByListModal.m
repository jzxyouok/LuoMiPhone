//
//  GroupByListModal.m
//  LuoMiPhone
//
//  Created by Tim Geng on 3/31/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "GroupByListModal.h"

@implementation GroupByListModal

-(instancetype)initWith:(NSDictionary *)dic{
    self = [self init];
    if (self) {
        self.image  = [dic objectForKey:@"image"];
        self.listTitle = [dic objectForKey:@"listTitle"];
        self.listDetail = [dic objectForKey:@"listDetail"];
        self.listPrice = [dic objectForKey:@"istPrice"];
        self.listSales = [dic objectForKey:@"listSales"];
    }
    return self;
}

@end
