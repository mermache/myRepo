//
//  UserIdentityViewController.m
//  LoginWithPaypalApp
//
//  Created by Mermache, Abdull(AWF) on 8/4/14.
//  Copyright (c) 2014 Ebay.com. All rights reserved.
//

#import "UserIdentityViewController.h"
#import "LoginURLViewController.h"
#import "RepeatUserViewController.h"
#import "PayPalViewController.h"
//#import <MBProgressHUD/MBProgressHUD.h>
#import "CheckReachability.h"
#import "LoginURLViewController.h"
#import "UserIdentityViewController.h"
#import "PayPalGuestLoginViewController.h"
#import "RepeatUserViewController.h"

@interface UserIdentityViewController ()
@end

@implementation UserIdentityViewController{
    
    UIViewController *theController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",[self sendHTTPGet]);
}


-(NSString *) sendHTTPGet
{
    __block NSString * dictionaryLayer4=nil;
    NSString *myString = [LoginURLViewController enterUserID];
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    [defaultConfigObject setHTTPAdditionalHeaders:@{@"Partner-Id":@"7000610",
                                                    @"Partner-Key":@"134256,78b0db8a-0ee1-4939-a2f9-d3cd95ec0fcc",
                                                    @"Session-Id":@"mermache101@gmail.com",
                                                    @"User-Identity":@"mermache101@gmail.com",
                                                    @"Device-Fingerprint":@"device-fingerprint",
                                                    @"Device-Type":@"device-type",
                                                    @"Content-Type":@"application/json"
                                                    }];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject
                                                                 delegate:(id<NSURLSessionDataDelegate>)self // was getting error with self
                                                            delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL * url = [NSURL URLWithString:@"http://api.checkout.ecn.ebay.com:8080/inlinexoweb/v1/identity"];
    
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession]
                                          dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              NSDictionary *dictionaryLayer1 = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                                              
                                              //for (id key in JSONdata) {
                                              //NSLog(@"key: %@   value:%@", key, [JSONdata objectForKey:key]); }
                                              
                                              NSDictionary *dictionaryLayer2 = [dictionaryLayer1 objectForKey:@"response_data"];
                                              NSDictionary *dictionaryLayer3 = [dictionaryLayer2 objectForKey:@"user_identity"];
                                              dictionaryLayer4 = [dictionaryLayer3 objectForKey:@"user_type"];
                                              
                                              if ([dictionaryLayer4  isEqual: @"paypal_login"]) {
                                                  
                                                  NSLog(@"%@",dictionaryLayer4);
                                                  NSLog(@"You are already logged in!");
                                                  RepeatUserViewController *myView=[[RepeatUserViewController alloc]init];
                                                  UINavigationController *nav=[[UINavigationController alloc]init];
                                                  [nav pushViewController:myView animated:YES];
                                                  
                                                  
                                              }
                                              // 4: Handle response here
                                          }];
    
    // 3
    [downloadTask resume];
    
    return dictionaryLayer4;
}

@end
