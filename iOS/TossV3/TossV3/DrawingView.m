//
//  DrawingView.m
//  TossV3
//
//  Created by Blade on 6/6/14.
//  Copyright (c) 2014 Blade Chapman. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];

    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.x + bounds.size.height/2.0;

    NSString *str = @"Placeholder: Drawing will be done on this view";
    UIFont *font = [UIFont boldSystemFontOfSize:12];
    CGRect textRect;
    textRect.size = [str sizeWithFont:font];

    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;

    [[UIColor blackColor] setFill];

    [str drawInRect:textRect withFont:font];
}

@end
