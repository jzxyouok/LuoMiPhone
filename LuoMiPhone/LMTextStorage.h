//
//  LMTextStorage.h
//  LuoMiPhone
//
//  Created by Tim Geng on 4/2/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString * const PTLDefaultTokenName;

NSString * const PTLRedactStyleAttributeName;
NSString * const PTLHighlightColorAttributeName;

@interface LMTextStorage : NSTextStorage

@property (nonatomic, readwrite, copy) NSDictionary *tokens; // maps tokens -> attributes

@end
