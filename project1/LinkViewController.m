//
//  LinkViewController.m
//  project1
//
//  Created by OKYO_bk on 8/14/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import "LinkViewController.h"
#import "ViewController.h"

@interface LinkViewController ()
{
    ViewController *mainVC;
    
}

@end

@implementation LinkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIView *viewLink = [[UIView alloc]initWithFrame:CGRectMake(40, 130, 240, 200)];
    [viewLink setBackgroundColor:[UIColor yellowColor]];
    viewLink.layer.cornerRadius = 6;
    UIButton *cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, 240, 50)];
    [cancel setBackgroundColor:[UIColor whiteColor]];
    [cancel setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancel.titleLabel setFont:[UIFont fontWithName:@"Marker Felt" size:30]];
    [cancel setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    
    cancel.layer.borderWidth = 1.0;
    cancel.layer.cornerRadius = 6;
    
    
    UIScrollView *ScrollLink = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 240, 180)];
    [ScrollLink setBackgroundColor:[UIColor whiteColor]];
    [ScrollLink setScrollEnabled:YES];
    [ScrollLink setContentSize:CGSizeMake(240, 200)];
    ScrollLink.layer.borderWidth = 0.5f;
    ScrollLink.layer.cornerRadius = 6;
    
    UIImage *ImgApple= [UIImage imageNamed:@"iconapple.png"];
    UIButton *buttonApple = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonApple.frame = CGRectMake(6, 10, ImgApple.size.width, ImgApple.size.height);
    [buttonApple setBackgroundImage:ImgApple forState:UIControlStateNormal];
    buttonApple.layer.borderWidth = 1.0f;
    buttonApple.layer.cornerRadius = 6;
    [buttonApple addTarget:self action:@selector(clickApplestore ) forControlEvents:UIControlEventTouchUpInside];
    [ScrollLink addSubview:buttonApple];
    
    UIImage *ImgSafari = [UIImage imageNamed:@"iconsafari.png"];
    UIButton *buttonSafari = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonSafari.frame = CGRectMake(6, 80, ImgSafari.size.width, ImgSafari.size.height);
    [buttonSafari setBackgroundImage:ImgSafari forState:UIControlStateNormal];
    buttonSafari.layer.borderWidth = 1.0f;
    buttonSafari.layer.cornerRadius = 6;
    [buttonSafari addTarget:self action:@selector(clickSafari) forControlEvents:UIControlEventTouchUpInside];
    [ScrollLink addSubview:buttonSafari];
    
    [viewLink addSubview:ScrollLink];
    [viewLink addSubview:cancel];
    [self.view addSubview:viewLink];
    
    
}

-(void) clickSafari
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.apple.com/"]];
    
}

-(void) clickApplestore
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/"]];
    
}

-(void) clickCancel
{
    [self.view removeFromSuperview];
    
}

@end
