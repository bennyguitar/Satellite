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

@interface ViewController : UIViewController <UITextFieldDelegate,UIWebViewDelegate> {
    __weak IBOutlet StarField *bgStarField;
    
    // URL Bar
    IBOutlet UIView *urlBarView;
    __weak IBOutlet UITextField *urlTextField;
}

@end
