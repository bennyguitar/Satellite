//
//  ViewController.h
//  Satellite
//
//  Created by Benjamin Gordon on 7/19/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarField.h"
#import "RadialGradientView.h"
#import "URLHelpers.h"
#import "UIHelpers.h"
#import "TabManager.h"
#import "TabView.h"
#import "TabScrollView.h"

@interface ViewController : UIViewController <UITextFieldDelegate,UIWebViewDelegate, UIScrollViewDelegate> {
    __weak IBOutlet StarField *bgStarField;
    
    // URL Bar
    IBOutlet UIView *urlBarView;
    __weak IBOutlet UITextField *urlTextField;
    __weak IBOutlet UIView *textFieldContainer;
    __weak IBOutlet UIButton *backButton;
    __weak IBOutlet UIButton *forwardButton;
    __weak IBOutlet UIButton *tabsButton;
    
    // Tab Scroll View
    IBOutlet TabScrollView *tabScrollView;
    
    // Web View
    IBOutlet UIWebView *mainWebView;
}

// URL Bar Actions
- (IBAction)didPressBack:(id)sender;
- (IBAction)didPressForward:(id)sender;
- (IBAction)didPressTabs:(id)sender;


@end
