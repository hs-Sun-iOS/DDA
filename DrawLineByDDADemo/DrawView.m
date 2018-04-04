//
//  DrawView.m
//  DrawLineByDDADemo
//
//  Created by sunhaosheng on 2017/10/18.
//  Copyright © 2017年 hs sun. All rights reserved.
//

#import "DrawView.h"

@interface DrawView()

@property (nonatomic, strong) NSMutableArray *points;

@end

@implementation DrawView

- (NSMutableArray *)points {
    if (!_points) {
        _points = [NSMutableArray array];
    }
    return _points;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    
    CGFloat length = 15;
    CGFloat width = rect.size.width - length;
    CGFloat height = rect.size.height - length;
    
    NSInteger count = width/length+1;
    
    for (int row = 0; row < count; row++) {
        CGContextMoveToPoint(ctx, length/2, row*length + length/2);
        CGContextAddLineToPoint(ctx, width + length/2, row*length + length/2);
        
        CGContextMoveToPoint(ctx, row*length + length/2, length/2);
        CGContextAddLineToPoint(ctx, row*length + length/2, height + length/2);
        
        if (row < count - 1) {
            [[NSString stringWithFormat:@"%d",row] drawAtPoint:CGPointMake(0, row*length+length - 3) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:7],NSForegroundColorAttributeName:[UIColor redColor]}];
        }
        
        if (row < count - 1) {
            [[NSString stringWithFormat:@"%d",row] drawAtPoint:CGPointMake(row*length + length - 3, 0) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:7],NSForegroundColorAttributeName:[UIColor redColor]}];
        }
    }
    CGContextStrokePath(ctx);
    
    for (NSValue *value in self.points) {
        CGPoint point = [value CGPointValue];
        CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
        CGContextFillRect(ctx, CGRectMake(length/2 + point.x * length, length/2 + point.y * length, length, length));
    }
    
}

- (void)beginDrawWithPoint1:(CGPoint)p1 andPoint2:(CGPoint)p2 {
    [self.points removeAllObjects];
    float x = p1.x;
    float y = p1.y;
    
    float dx = p2.x - p1.x;
    float dy = p2.y - p1.y;
    
    float steps = MAX(fabsf(dx), fabsf(dy));
    
    float xIncrement = dx / steps;
    float yIncrement = dy / steps;
    
    [self.points addObject:[NSValue valueWithCGPoint:p1]];
    for (int i = 0; i < steps; i++) {
        x += xIncrement;
        y += yIncrement;
        [self.points addObject:[NSValue valueWithCGPoint:CGPointMake(round(x), round(y))]];
    }
    [self setNeedsDisplay];
}

@end
