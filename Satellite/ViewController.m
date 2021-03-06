//
//  ViewController.m
//  Satellite
//
//  Created by Benjamin Gordon on 7/19/13.
//  Copyright (c) 2013 Benjamin Gordon. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
    
    // Set StatusBar to Light Color (iOS7)
    [self setNeedsStatusBarAppearanceUpdate];
    
    // Set Delegates
    mainWebView.scrollView.delegate = self;
    
    /*
    // Register for Notifications
    // Only used with urlBar on bottom of screen
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
     */
}

-(void)viewDidAppear:(BOOL)animated {
    [self performSelector:@selector(dropInURLBar) withObject:nil afterDelay:0.25];
}


#pragma mark - StatusBar
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


#pragma mark - Keybaord Notifications
// Test with urlBar on bottom of screen
-(void)keyboardWasShown:(NSNotification *)notification {
    CGSize keyboardSize = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    [self animateURLBarWithKeyboardHeight:keyboardSize.height];
}

-(void)keyboardDidHide:(NSNotification *)notification {
    [self animateURLBarWithKeyboardHeight:0];
}


#pragma mark - UI
-(void)buildUI {
    // StarField
    [bgStarField addStars:(self.view.frame.size.width*1.25)];
    //[bgStarField startStarField];
    
    // Shadows
    //[UIHelpers makeShadowForView:urlBarView withRadius:0];
    
    // URL Bar
    [self resetWebViewUI];
    textFieldContainer.layer.cornerRadius = 3;
}


#pragma mark - Memory
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - URL Bar Animations/Actions
-(void)dropInURLBar {
    urlBarView.frame = CGRectMake(0, -1*urlBarView.frame.size.height, self.view.frame.size.width, urlBarView.frame.size.height);
    [self.view addSubview:urlBarView];
    [UIView animateWithDuration:0.2 animations:^{
        urlBarView.frame = CGRectMake(0, 0, urlBarView.frame.size.width, urlBarView.frame.size.height);
    }];
}

// Test with urlBar on bottom of screen
-(void)animateURLBarWithKeyboardHeight:(float)height {
    [UIView animateWithDuration:0.25 animations:^{
        urlBarView.frame = CGRectMake(0, self.view.frame.size.height - urlBarView.frame.size.height - height, urlBarView.frame.size.width, urlBarView.frame.size.height);
    }];
}

- (IBAction)didPressBack:(id)sender {
    [mainWebView goBack];
}

- (IBAction)didPressForward:(id)sender {
    [mainWebView goForward];
}

- (IBAction)didPressTabs:(id)sender {
    if (tabScrollView.superview == self.view) {
        [self hideTabView];
        [self showWebViewWithTab:[TabManager currentTab]];
    }
    else {
        [self hideWebView];
        [self launchTabView];
    }
}


#pragma mark - UITextField Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [TabManager currentTab].Url = [URLHelpers urlFromURLBarText:textField.text];
    [self showWebViewWithTab:[TabManager currentTab]];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    textField.keyboardAppearance = UIKeyboardAppearanceDark;
    return YES;
}


#pragma mark - Tab Scroll View
-(void)launchTabView {
    tabScrollView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - urlBarView.frame.size.height);
    [tabScrollView setWithTabs:[TabManager allTabs]];
    //[tabScrollView setWithTabs:@[[TabManager currentTab],[TabManager currentTab],[TabManager currentTab],[TabManager currentTab],[TabManager currentTab]]];
    [self.view addSubview:tabScrollView];
    [UIView animateWithDuration:0.3 animations:^{
        tabScrollView.frame = CGRectMake(0, urlBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - urlBarView.frame.size.height);
    }];
}

-(void)hideTabView {
    [UIView animateWithDuration:0.3 animations:^{
        tabScrollView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - urlBarView.frame.size.height);
    } completion:^(BOOL fin){
        [tabScrollView removeFromSuperview];
    }];
}

#pragma mark - Web View Actions/Animations
-(void)showWebViewWithTab:(Tab *)tab {
    if ([mainWebView superview] != self.view) {
        mainWebView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - urlBarView.frame.size.height);
        [self.view insertSubview:mainWebView belowSubview:urlBarView];
        [self hideTabView];
        [UIView animateWithDuration:0.3 animations:^{
            mainWebView.frame = CGRectMake(0, urlBarView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - urlBarView.frame.size.height);
        }];
    }
    
    [mainWebView loadRequest:[NSURLRequest requestWithURL:tab.Url cachePolicy:NSURLCacheStorageNotAllowed timeoutInterval:15]];
}

-(void)hideWebView {
    [UIView animateWithDuration:0.3 animations:^{
        mainWebView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - urlBarView.frame.size.height);
    } completion:^(BOOL fin){
        [mainWebView removeFromSuperview];
    }];
}

-(void)resetWebViewUI {
    BOOL canGoBack = [mainWebView canGoBack];
    BOOL canGoForward = [mainWebView canGoForward];
    [UIView animateWithDuration:0.2 animations:^{
        if (canGoBack && canGoForward) {
            backButton.frame = CGRectMake(4, backButton.frame.origin.y, backButton.frame.size.width, backButton.frame.size.height);
            forwardButton.frame = CGRectMake(backButton.frame.origin.x + backButton.frame.size.width + 10, backButton.frame.origin.y, backButton.frame.size.width, backButton.frame.size.height);
            textFieldContainer.frame = CGRectMake(forwardButton.frame.origin.x + forwardButton.frame.size.width + 10, backButton.frame.origin.y, (self.view.frame.size.width - 40) - (forwardButton.frame.origin.x + forwardButton.frame.size.width + 10), backButton.frame.size.height);
            
            backButton.alpha = 0.5;
            forwardButton.alpha = 0.5;
        }
        else if (canGoForward && !canGoBack) {
            forwardButton.frame = CGRectMake(4, forwardButton.frame.origin.y, forwardButton.frame.size.width, forwardButton.frame.size.height);
            textFieldContainer.frame = CGRectMake(forwardButton.frame.origin.x + forwardButton.frame.size.width + 10, backButton.frame.origin.y, (self.view.frame.size.width - 40) - (forwardButton.frame.origin.x + forwardButton.frame.size.width + 10), backButton.frame.size.height);
            
            backButton.alpha = 0;
            forwardButton.alpha = 0.5;
        }
        else if (canGoBack && !canGoForward) {
            backButton.frame = CGRectMake(4, backButton.frame.origin.y, backButton.frame.size.width, backButton.frame.size.height);
            textFieldContainer.frame = CGRectMake(backButton.frame.origin.x + backButton.frame.size.width + 10, backButton.frame.origin.y, (self.view.frame.size.width - 40) - (backButton.frame.origin.x + backButton.frame.size.width + 10), backButton.frame.size.height);
            
            backButton.alpha = 0.5;
            forwardButton.alpha = 0;
        }
        else {
            textFieldContainer.frame = CGRectMake(4, backButton.frame.origin.y, self.view.frame.size.width - 45, backButton.frame.size.height);
            
            backButton.alpha = 0;
            forwardButton.alpha = 0;
        }
    }];
}


#pragma mark - Web View Delegate
-(void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self resetWebViewUI];
    [TabManager currentTab].Title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}



#pragma mark - ScrollView Delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [urlTextField resignFirstResponder];
}

@end
