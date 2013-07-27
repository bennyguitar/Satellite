//
//  TabScrollView.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/27/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "TabScrollView.h"

#define kPad 10

@implementation TabScrollView

- (id)initWithFrame:(CGRect)frame tabs:(NSArray *)tabs
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setWithTabs:tabs];
    }
    
    
    
    return self;
}

-(void)setWithTabs:(NSArray *)tabs {
    // Remove all Subviews
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    
    // Add Tabs
    for (int xx = 0; xx < tabs.count; xx++) {
        Tab *tab = tabs[xx];
        TabView *tabView = [TabView tabViewFromTab:tab frame:CGRectMake((xx*kTabViewWidth) + 2*kPad*(xx+1), 30, kTabViewWidth, kTabViewHeight)];
        [self addSubview:tabView];
    }
    
    // Set ContentSize
    self.contentSize = CGSizeMake(MAX((tabs.count*kTabViewWidth) + 2*kPad*(tabs.count + 1), 320), self.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
