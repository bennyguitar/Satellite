//
//  UIHelpers.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/19/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "UIHelpers.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIHelpers

+(void)makeShadowForView:(UIView *)s withRadius:(float)radius {
    s.layer.shadowColor = [UIColor blackColor].CGColor;
    s.layer.shadowOpacity = 0.6f;
    s.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    s.layer.shadowRadius = 1.0f;
    s.layer.masksToBounds = NO;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:s.bounds cornerRadius:radius];
    s.layer.shadowPath = path.CGPath;
}

@end
