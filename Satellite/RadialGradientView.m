//
//  GradientView.m
//  JSONFormCreation
//
//  Created by Ben Gordon on 1/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import "RadialGradientView.h"

@implementation RadialGradientView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.lightColor = kStartColor;
        self.darkColor = kEndColor;
    }
    return self;
}


-(void)drawWithCenterColor:(UIColor *)cColor endColor:(UIColor *)eColor {
    self.lightColor = cColor;
    self.darkColor = eColor;
    [self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    if (!(self.lightColor)) {
        self.lightColor = kStartColor;
    }
    if (!(self.darkColor)) {
        self.darkColor = kEndColor;
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    float r1=0, r2=0, g1=0, g2=0, b1=0, b2=0, a1=0, a2=0;
    
    // Get Light Color floats
    if ([self.lightColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self.lightColor getRed:&r1 green:&g1 blue:&b1 alpha:&a1];
    }
    else {
        const CGFloat *components = CGColorGetComponents(self.lightColor.CGColor);
        r1 = components[0];
        g1 = components[1];
        b1 = components[2];
        a1 = components[3];
    }
    
    // Get Dark Color floats
    if ([self.darkColor respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [self.darkColor getRed:&r2 green:&g2 blue:&b2 alpha:&a2];
    }
    else {
        const CGFloat *components = CGColorGetComponents(self.darkColor.CGColor);
        r2 = components[0];
        g2 = components[1];
        b2 = components[2];
        a2 = components[3];
    }

    
    
    //Draw the Gradient
    CGFloat BGLocations[2] = { 0.0, 1.0 };
    CGFloat BgComponents[8] = { r1, g1, b1, a1,  // Start color
        r2, g2, b2, a2}; // Mid color and End color
    CGColorSpaceRef BgRGBColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef bgRadialGradient = CGGradientCreateWithColorComponents(BgRGBColorspace, BgComponents, BGLocations, 2);
    
    
    CGPoint startBg = CGPointMake(self.center.x, self.center.y);
    CGFloat endRadius= self.frame.size.width/2;
    
    
    CGContextDrawRadialGradient(ctx, bgRadialGradient, startBg, 0, startBg, endRadius, kCGGradientDrawsAfterEndLocation);
    CGColorSpaceRelease(BgRGBColorspace);
    CGGradientRelease(bgRadialGradient);
}


@end
