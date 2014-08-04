//
//  PayPalViewController.h
//  LoginWithPaypalApp
//
//  Created by Mermache, Abdull(AWF) on 8/4/14.
//  Copyright (c) 2014 Ebay.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayPalViewController : UIViewController<UIWebViewDelegate, NSURLSessionDataDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIWebView *webView;

- (void)barCloseButtonPressed;

@end
