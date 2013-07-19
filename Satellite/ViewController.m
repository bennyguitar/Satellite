//
//  ViewController.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/19/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
}

-(void)viewDidAppear:(BOOL)animated {
    [self performSelector:@selector(dropInURLBar) withObject:nil afterDelay:0.25];
}

#pragma mark - UI
-(void)buildUI {
    // StarField
    [bgStarField addStars:(self.view.frame.size.width*1.25)];
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - URL Bar Animations/Actions
-(void)dropInURLBar {
    urlBarView.frame = CGRectMake(0, -1*urlBarView.frame.size.height, urlBarView.frame.size.width, urlBarView.frame.size.height);
    [self.view addSubview:urlBarView];
    [UIView animateWithDuration:0.2 animations:^{
        urlBarView.frame = CGRectMake(0, 0, urlBarView.frame.size.width, urlBarView.frame.size.height);
    }];
}

#pragma mark - UITextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    NSURL *url = [URLHelpers urlFromURLBarText:textField.text];
    NSLog(@"%@", url.absoluteString);
    return YES;
}

@end
