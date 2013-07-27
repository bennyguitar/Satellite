//
//  TabView.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/27/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "TabView.h"
#import "UIHelpers.h"

@implementation TabView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(TabView *)tabViewFromTab:(Tab *)tab frame:(CGRect)frame {
    NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"TabView" owner:nil options:nil];
    TabView *tabView = [[TabView alloc] init];
    tabView = views[0];
    tabView.frame = frame;
    /*
    UIGraphicsBeginImageContext(webView.frame.size);
    [webView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(viewImage, self, nil, nil);
     */
    
    [tabView.tabWebView loadRequest:[NSURLRequest requestWithURL:tab.Url]];
    [tabView.navBar.items[0] setTitle:tab.Title];
    //tabView.titleLabel.text = tab.Title;
    [UIHelpers makeShadowForView:tabView withRadius:0];
    
    return tabView;
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
