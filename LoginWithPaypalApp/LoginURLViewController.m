//
//  LoginURLViewController.m
//  LoginWithPaypalApp
//
//  Created by Mermache, Abdull(AWF) on 8/4/14.
//  Copyright (c) 2014 Ebay.com. All rights reserved.
//

#import "LoginURLViewController.h"

@interface LoginURLViewController ()

@end

@implementation LoginURLViewController

static NSString const *PAYPAL_LOGIN_SCHEME  = @"https://";
static NSString const *PAYPAL_HOST = @"www.paypal.com";
static NSString const *PAYPAL_QUERY =  @"/webapps/auth/protocol/openidconnect/v1/authorize?";
static NSString const *CLIENT_ID =  @"client_id=Ae-KaxBkBkbGjIUtDP4YP9S5ARTx17ErIYw6JF7_Go1pozHxiSU4MyDWR_uk";
static NSString const *RESPONSE_TYPE = @"&response_type=code&";

static NSString const *SCOPE = @"scope=openid%20profile%20email%20address%20phone%20https%3A%2F%2Furi.paypal.com%2Fservices%2Fpaypalattributes%20https%3A%2F%2Fapi.paypal.com%2Fv1%2Fvault%2Fcredit-card%20https%3A%2F%2Fapi.paypal.com%2Fv1%2Fvault%2Fcredit-card%2F.*%20https%3A%2F%2Fapi.paypal.com%2Fv1%2Fpayments%2F.*&redirect_uri=";


static NSString const *REDIRECT_URI_PART1 =  @"https://api.sandbox.checkout.ecn.ebay.com/inlinexoweb/v1/authenticate?state=";

static NSString const *REDIRECT_URI_PART2 = @"&nonce=16711309&newUI=Y";


+ (NSString*) enterUserID {
    
    NSString *USER_IDENTITY = @"User1007";
    
    return USER_IDENTITY;
    
}


+ (NSString*) returnCustomURLString {
    
    NSString *customURLString = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@",PAYPAL_LOGIN_SCHEME, PAYPAL_HOST, PAYPAL_QUERY,CLIENT_ID, RESPONSE_TYPE, SCOPE, REDIRECT_URI_PART1, [[self class] enterUserID], REDIRECT_URI_PART2];
    
    return customURLString;
}

@end
