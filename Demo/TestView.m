//
//  TestView.m
//  Demo
//
//  Created by Kenny on 2015/6/30.
//  Copyright (c) 2015年 Demo. All rights reserved.
//

#import "TestView.h"

@implementation TestView

-(instancetype)initWithColor:(UIColor *)color
{
    self = [super init];
    if(self){
        self.color = color;
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSMutableArray *valueArray = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:30], [NSNumber numberWithInt:60], [NSNumber numberWithInt:70], [NSNumber numberWithInt:20], [NSNumber numberWithInt:33], [NSNumber numberWithInt:48], [NSNumber numberWithInt:89], [NSNumber numberWithInt:12], [NSNumber numberWithInt:25], [NSNumber numberWithInt:28], [NSNumber numberWithInt:92], nil];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, (self.frame.size.width - 30) / [valueArray count]);
    [_color set];
    for (int i = 0; i < [valueArray count]; i++){
        double value = [[valueArray objectAtIndex:i] doubleValue];
        double height = self.frame.size.height / 100;
        CGContextSetLineWidth(context, (self.frame.size.width - 30) / [valueArray count]);
        CGContextMoveToPoint(context, i * (self.frame.size.width / [valueArray count]) + 5 + ((self.frame.size.width - 30) / [valueArray count] / 2), self.frame.size.height);
        CGContextAddLineToPoint(context, i * (self.frame.size.width / [valueArray count]) + 5 + ((self.frame.size.width - 30) / [valueArray count] / 2), self.frame.size.height -height * value);
    }
    CGContextStrokePath(context);
}


@end
