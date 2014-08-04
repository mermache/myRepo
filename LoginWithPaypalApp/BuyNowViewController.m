//
//  BuyNowViewController.m
//  LoginWithPaypalApp
//
//  Created by Mermache, Abdull(AWF) on 8/4/14.
//  Copyright (c) 2014 Ebay.com. All rights reserved.
//

#import "BuyNowViewController.h"

@interface BuyNowViewController ()

@end

@implementation BuyNowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.buy_now_button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 600)];
    [self.buy_now_button setFrame:CGRectMake(110, 360, 100, 50)];
    [self.buy_now_button setImage:[UIImage imageNamed:@"buy_now_button.png"] forState:UIControlStateNormal];
    [self.view addSubview:self.buy_now_button];
    
    
    [self.buy_now_button addTarget:self action:@selector(goToLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)goToLogin
{
    PayPalViewController *controller = [[PayPalViewController alloc] init];
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:controller];
    [self setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:navigation animated:YES completion:nil];
    
}


-(void) goToGuestUserLogin {
    
    PayPalGuestLoginViewController *guestController = [[PayPalGuestLoginViewController alloc] init];
    
    [self presentViewController:guestController animated:YES completion:nil];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    UILabel *lbl1 = [[UILabel alloc] init];
    [lbl1 setFrame:CGRectMake(20,260,400,20)];
    lbl1.font = [UIFont fontWithName:@"ArialHebrew" size:14];
    lbl1.text= @"Login with PayPal";
    [self.view addSubview:lbl1];
    
    UILabel *lbl2 = [[UILabel alloc] init];
    [lbl2 setFrame:CGRectMake(180,260,400,20)];
    lbl2.font = [UIFont fontWithName:@"ArialHebrew" size:14];
    lbl2.text= @"Login as guest";
    [self.view addSubview:lbl2];
    
    //radio buttons
    self.radiobutton1 = [[UIButton alloc] initWithFrame:CGRectMake(80, 300, 18, 18)];
    [self.radiobutton1 setTag:0];
    self.radiobutton1.selected=YES;
    [self.radiobutton1 setBackgroundImage:[UIImage imageNamed:@"RBOff.png"] forState:UIControlStateNormal];
    [self.radiobutton1 setBackgroundImage:[UIImage imageNamed:@"RBOn.png"] forState:UIControlStateSelected];
    [self.radiobutton1 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    self.radiobutton2 = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 18, 18)];
    [self.radiobutton2 setTag:1];
    [self.radiobutton2 setBackgroundImage:[UIImage imageNamed:@"RBOff.png"] forState:UIControlStateNormal];
    [self.radiobutton2 setBackgroundImage:[UIImage imageNamed:@"RBOn.png"] forState:UIControlStateSelected];
    [self.radiobutton2 addTarget:self action:@selector(radiobuttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.radiobutton1];
    [self.view addSubview:self.radiobutton2];
    
}


-(void)radiobuttonSelected:(id)sender{
    switch ([sender tag]) {
        case 0:
            if([self.radiobutton1 isSelected]==YES)
            {
                [self.radiobutton1 setSelected:NO];
                [self.radiobutton2 setSelected:YES];
            }
            else{
                [self.radiobutton1 setSelected:YES];
                [self.radiobutton2 setSelected:NO];
            }
            
            break;
        case 1:
            if([self.radiobutton2 isSelected]==YES)
            {
                [self.radiobutton2 setSelected:NO];
                [self.radiobutton1 setSelected:YES];
            }
            else{
                [self.radiobutton2 setSelected:YES];
                [self.radiobutton1 setSelected:NO];
            }
            
            break;
        default:
            break;
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
