//
//  JSIndexPath.m
//  JSDropDownMenuDemo
//
//  Created by Tim Geng on 4/21/15.
//  Copyright (c) 2015 jsfu. All rights reserved.
//

#import "JSIndexPath.h"

@implementation JSIndexPath
- (instancetype)initWithColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight  leftRow:(NSInteger)leftRow row:(NSInteger)row {
    self = [super init];
    if (self) {
        _column = column;
        _leftOrRight = leftOrRight;
        _leftRow = leftRow;
        _row = row;
    }
    return self;
}

+ (instancetype)indexPathWithCol:(NSInteger)col leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row {
    JSIndexPath *indexPath = [[self alloc] initWithColumn:col leftOrRight:leftOrRight leftRow:leftRow row:row];
    return indexPath;
}
@end