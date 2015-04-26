//
//  ListFooterView.m
//  LuoMiPhone
//
//  Created by Tim Geng on 4/25/15.
//  Copyright (c) 2015 GF. All rights reserved.
//

#import "ListFooterView.h"

@interface ListFooterView   ()

@property(nonatomic,assign)CGRect titleRect;

@end

@implementation ListFooterView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    // Draw top line
    
    bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:CGPointMake(0, self.frame.size.height -11)];
    
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height-11)];

    
    [[UIColor lightGrayColor] setStroke];
    
    [bezierPath setLineWidth:.5];
    
    [bezierPath stroke];

}

- (CAShapeLayer *)createIndicatorWithColor:(UIColor *)color andPosition:(CGPoint)point {
    CAShapeLayer *layer = [CAShapeLayer new];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(5, 5)];
    [path addLineToPoint:CGPointMake(10, 0)];
    
    //[path closePath];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = path.CGPath;
    layer.lineWidth = 1.0;
    layer.strokeColor = color.CGColor;
    [path stroke];
    
    CGPathRef bound = CGPathCreateCopyByStrokingPath(layer.path, nil, layer.lineWidth, kCGLineCapButt, kCGLineJoinMiter, layer.miterLimit);
    layer.bounds = CGPathGetBoundingBox(bound);
    
    CGPathRelease(bound);
    
    layer.frame = CGRectMake(self.titleRect.origin.x + self.titleRect.size.width + 5, self.titleRect.origin.y + 8,  10, 5);
    
    
    return layer;
}

- (CATextLayer *)createTextLayerWithNSString:(NSString *)string withColor:(UIColor *)color andPosition:(CGPoint)point {
    
    CGSize size = [self calculateTitleSizeWithString:string];
    
    CATextLayer *layer = [CATextLayer new];
    
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    layer.string = string;
    layer.fontSize = 14.0;
    layer.alignmentMode = kCAAlignmentCenter;
    layer.foregroundColor = color.CGColor;
    layer.contentsScale = [[UIScreen mainScreen] scale];
    CGFloat y = (40/2 - size.height / 2);
    CGFloat x = self.frame.size.width/2 - (10 + size.width)/2;
    //layer.position = CGPointMake(x, y);

    layer.frame = CGRectMake(x, y, size.width, size.height);
    self.titleRect = layer.frame;
    return layer;
}


-(void)awakeFromNib{
    [super awakeFromNib];
 
    CATextLayer *title = [self createTextLayerWithNSString:@"查看其他2个团购" withColor:    [UIColor blackColor]
 andPosition:CGPointMake(0, 0)];
    [self.layer addSublayer:title];
    
    //indicator
    CAShapeLayer *indicator = [self createIndicatorWithColor:[UIColor lightGrayColor] andPosition:CGPointMake(100,10)];
    [self.layer addSublayer:indicator];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFooterView)];
    [self addGestureRecognizer:tap];
}


-(void)tapFooterView{
    if (self.footerViewClicked) {
        self.footerViewClicked(self.section);
    }
}


- (CGSize)calculateTitleSizeWithString:(NSString *)string
{
    CGFloat fontSize = 14.0;
    NSDictionary *dic = @{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(280, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return size;
}
@end
