//
//  LMLayoutManager.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/2/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "LMLayoutManager.h"
#import "LMTextStorage.h"

@implementation LMLayoutManager

- (void)drawBackgroundForGlyphRange:(NSRange)glyphsToShow
                            atPoint:(CGPoint)origin {
    [super drawBackgroundForGlyphRange:glyphsToShow atPoint:origin];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSRange characterRange = [self characterRangeForGlyphRange:glyphsToShow
                                              actualGlyphRange:NULL];
    [self.textStorage enumerateAttribute:PTLHighlightColorAttributeName
                                 inRange:characterRange
                                 options:0
                              usingBlock:^(id value,
                                           NSRange highlightedCharacterRange,
                                           BOOL *stop) {
                                  [self highlightCharacterRange:highlightedCharacterRange
                                                          color:value
                                                        atPoint:origin
                                                      inContext:context];
                              }];
}

- (void)highlightCharacterRange:(NSRange)highlightedCharacterRange
                          color:(UIColor *)color
                        atPoint:(CGPoint)origin
                      inContext:(CGContextRef)context {
    if (color) {
        CGContextSaveGState(context);
       // [color setFill];
        CGContextTranslateCTM(context, origin.x, origin.y);
        [color set];
        NSRange
        highlightedGlyphRange = [self glyphRangeForCharacterRange:highlightedCharacterRange
                                             actualCharacterRange:NULL];
        NSTextContainer *
        container = [self textContainerForGlyphAtIndex:highlightedGlyphRange.location
                                        effectiveRange:NULL];
        
        [self enumerateEnclosingRectsForGlyphRange:highlightedGlyphRange
                          withinSelectedGlyphRange:NSMakeRange(NSNotFound, 0)
                                   inTextContainer:container
                                        usingBlock:^(CGRect rect, BOOL *stop){
                                            
                                            CGRect highlightRect = CGRectMake(rect.origin.x, rect.origin.y + 5, rect.size.width, rect.size.height-6);
                                            if (highlightedCharacterRange.length == 4) {
                                                 highlightRect = CGRectMake(rect.origin.x, rect.origin.y + 8, rect.size.width, rect.size.height-9);
                                            }
                                            [self drawHighlightInRect:highlightRect];
                                        }];
        CGContextRestoreGState(context);
    }
}

- (void)drawHighlightInRect:(CGRect)rect {

    [[UIBezierPath bezierPathWithRect:rect] stroke];
}


@end
