//
//  TabPresenter.h
//  Satellite
//
//  Created by Benjamin Gordon on 7/28/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabView.h"

@interface TabPresenter : UIView <UIGestureRecognizerDelegate>

@property (nonatomic, retain) NSMutableArray *TabViews;
@property (nonatomic, assign) int index;
@property (nonatomic, retain) TabView *currentTabView;
@property (nonatomic, retain) TabView *nextTabView;
@property (nonatomic, assign) CGPoint panPoint;

@end
