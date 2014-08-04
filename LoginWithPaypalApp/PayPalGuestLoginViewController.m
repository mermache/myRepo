//
//  PayPalGuestLoginViewController.m
//  LoginWithPaypalApp
//
//  Created by Mermache, Abdull(AWF) on 8/4/14.
//  Copyright (c) 2014 Ebay.com. All rights reserved.
//

#import "PayPalGuestLoginViewController.h"

@interface PayPalGuestLoginViewController ()

@end

@implementation PayPalGuestLoginViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Credit Card";
    
    UILabel *constructionText = [[UILabel alloc] init];
    [constructionText setFrame:CGRectMake(20,260,400,20)];
    constructionText.font = [UIFont fontWithName:@"ArialHebrew" size:14];
    constructionText.text= @"Login in as a guest user is under development";
    [self.view addSubview:constructionText];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
