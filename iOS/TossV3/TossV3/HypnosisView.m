//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Blade on 6/4/14.
//  Copyright (c) 2014 Blade Chapman. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)setCircleColor:(UIColor *)clr
{
    circleColor = clr;
    [self setNeedsDisplay];
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion == UIEventSubtypeMotionShake)
    {
        NSLog(@"Device started shaking");
        [self setCircleColor:[UIColor redColor]];
    }
}
-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"Shaking stopped");
    [self setCircleColor:[UIColor lightGrayColor]];
}
-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];

    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2.0;
    center.y = bounds.origin.x + bounds.size.height/2.0;

    //radius of circle is nearly as big as the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    //thickness of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    //The color ofthe line should be gray (red/gree/blue = 0.6, alpha = 1.0)
    [[self circleColor] setStroke];
    //Draw concentric circles from the outside in
    for(float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20)
    {
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, 2 * M_PI, YES);
        CGContextStrokePath(ctx);
    }

    NSString *text = @"You are getting sleepy.";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];

    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;

    [[UIColor blackColor] setFill];

    //shadow will move 4 points to the right and 3 points down from the text
    CGSize offset = CGSizeMake(4, 3);
    //Shadow will be dark gray in color
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    //set the shadow of the context with these parameters,
    //all subsequent drawing will be shadowed
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);

    [text drawInRect:textRect withFont:font];
}

@end
