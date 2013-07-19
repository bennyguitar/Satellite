//
//  GradientView.h
//  JSONFormCreation
//
//  Created by Ben Gordon on 1/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStartColor [UIColor colorWithRed:40/255.0f green:40/255.0f blue:40/255.0f alpha:1.0]
#define kEndColor [UIColor colorWithRed:30/255.0f green:30/255.0f blue:30/255.0f alpha:1.0]

@interface RadialGradientView : UIView

@property (nonatomic, retain) UIColor *lightColor;
@property (nonatomic, retain) UIColor *darkColor;

-(void)drawWithCenterColor:(UIColor *)cColor endColor:(UIColor *)eColor;


@end
