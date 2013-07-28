//
//  TabPresenter.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/28/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "TabPresenter.h"

@implementation TabPresenter

- (id)initWithFrame:(CGRect)frame tabViews:(NSArray *)tabViews
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.index = 0;
        self.TabViews = [tabViews mutableCopy];
        
        // Gestures
        UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandler:)];
        swipeGesture.delegate = self;
        [self addGestureRecognizer:swipeGesture];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
        panGesture.delegate = self;
        [self addGestureRecognizer:panGesture];
    }
    return self;
}

-(void)swipeHandler:(UISwipeGestureRecognizer *)recognizer {
    
}

-(void)panHandler:(UIPanGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        self.panPoint = [recognizer locationInView:self];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded) {
        // Determine if it needs to swipe to next Tab or not
    }
    else {
        CGPoint newPoint = [recognizer locationInView:self];
        float deltaX = newPoint.x - self.panPoint.x;
        BOOL panningRightToLeft = deltaX < 0 ? YES : NO;
        deltaX = abs(deltaX);
        
        CGAffineTransform transform = CGAffineTransformMakeRotation(deltaX);
        self.currentTabView.transform = transform;
    }
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
