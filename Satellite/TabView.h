//
//  TabView.h
//  Satellite
//
//  Created by Benjamin Gordon on 7/27/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tab.h"

#define kTabViewHeight 230
#define kTabViewWidth 215

@interface TabView : UIView

@property (weak, nonatomic) IBOutlet UIWebView *tabWebView;
@property (weak, nonatomic) IBOutlet UIButton *mainButton;
@property (nonatomic, retain) Tab *tab;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UINavigationItem *navTitle;

+(TabView *)tabViewFromTab:(Tab *)tab frame:(CGRect)frame;

@end
