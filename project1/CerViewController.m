//
//  CerViewController.m
//  project1
//
//  Created by OKYO_bk on 8/14/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import "CerViewController.h"
#import "singlepoint.h"
#import "ViewController.h"

@interface CerViewController ()
{
    UIView *ViewCer1;
    UIView *ViewCer2;
    UIView *ViewCer3;
    UIView *ViewCer4;
    UIView *ViewCer5;
    UIView *ViewCer0;
    ViewController *mainVC;
    NSInteger dem;
}

@end

@implementation CerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    dem=0;
    
}

-(void) viewWillAppear:(BOOL)animated
{
    UIScrollView *scrollCer = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 55, 320, 700)];
    [scrollCer setScrollEnabled:YES];
    [scrollCer setContentSize:CGSizeMake(320, 780)];
//    scrollCer.layer.borderWidth = 2.0f;
    
    UIImageView *viewBar = [[UIImageView alloc] initWithFrame:CGRectMake(10, 25, 300, 50)];
    UIImage *image = [UIImage imageNamed:@"cer2.png"];
    UIImage *imageback1 = [UIImage imageNamed:@"back1"];
    UIImage *imageback2 = [UIImage imageNamed:@"back2"];
    viewBar.image = image;
    
    UIButton *back1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    back1.frame = CGRectMake(27, 37, imageback1.size.width, imageback1.size.height);
    [back1 setBackgroundImage:imageback1 forState:UIControlStateNormal];
    [back1 setBackgroundImage:imageback2 forState:UIControlStateHighlighted];
    [back1 addTarget:self action:@selector(buttonback ) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *ViewImage0 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"muc6.png"]];
    ViewCer0 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 70)];
    
    UITextView *TextCer0 = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, 230, 40)];
    [TextCer0 setBackgroundColor:[UIColor clearColor]];
    UILabel *LabelCer0 = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 40)];
    
    LabelCer0.text = @"Got 200 points in Cary Math";
    TextCer0.text = @"Exper";
    [TextCer0 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [TextCer0 setFont:[UIFont boldSystemFontOfSize: 25]];
    [LabelCer0 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [LabelCer0 setFont:[UIFont boldSystemFontOfSize:12]];
    LabelCer0.textColor = [UIColor whiteColor];
    TextCer0.textColor = [UIColor whiteColor];
    NSInteger limit0 = 200;
    ViewCer0.layer.cornerRadius = 4;
    ViewCer0.layer.borderWidth = 0.5;
    [ViewCer0 addSubview:ViewImage0];
    [ViewCer0 addSubview:TextCer0];
    [ViewCer0 addSubview:LabelCer0];
    
    
    UIImageView *ViewImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"muc5.png"]];
    ViewCer1 = [[UIView alloc] initWithFrame:CGRectMake(10, 85, 300, 70)];
    
    UITextView *TextCer1 = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, 230, 40)];
    [TextCer1 setBackgroundColor:[UIColor clearColor]];
    UILabel *LabelCer1 = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 40)];
    
    LabelCer1.text = @"Got 200 points in Cary Math";
    TextCer1.text = @"Exper";
    [TextCer1 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [TextCer1 setFont:[UIFont boldSystemFontOfSize: 25]];
    [LabelCer1 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [LabelCer1 setFont:[UIFont boldSystemFontOfSize:12]];
    LabelCer1.textColor = [UIColor whiteColor];
    TextCer1.textColor = [UIColor whiteColor];
    NSInteger limit1 = 200;
    ViewCer1.layer.cornerRadius = 4;
    ViewCer1.layer.borderWidth = 0.5;
    [ViewCer1 addSubview:ViewImage1];
    [ViewCer1 addSubview:TextCer1];
    [ViewCer1 addSubview:LabelCer1];
    
    
    UIImageView *ViewImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"muc4.png"]];
    ViewCer2 = [[UIView alloc] initWithFrame:CGRectMake(10, 160, 300, 70)];
    UITextView *TextCer2 = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, 230, 40)];
    UILabel *LabelCer2 = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 40)];
    
    [TextCer2 setBackgroundColor:[UIColor clearColor]];
    LabelCer2.text = @"Got 100 points in Cary Math";
    TextCer2.text = @"Professional";
    [TextCer2 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [TextCer2 setFont:[UIFont boldSystemFontOfSize: 25]];
    [LabelCer2 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [LabelCer2 setFont:[UIFont boldSystemFontOfSize:12]];
    LabelCer2.textColor = [UIColor whiteColor];
    TextCer2.textColor = [UIColor whiteColor];
    
    
    NSInteger limit2 = 100;
    ViewCer2.layer.cornerRadius = 4;
    ViewCer2.layer.borderWidth = 0.5;
    [ViewCer2 addSubview:ViewImage2];
    [ViewCer2 addSubview:TextCer2];
    [ViewCer2 addSubview:LabelCer2];
    
    
    UIImageView *ViewImage3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"muc3.png"]];
    ViewCer3 = [[UIView alloc] initWithFrame:CGRectMake(10, 235, 300, 70)];
    UITextView *TextCer3 = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, 230, 40)];
    UILabel *LabelCer3 = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 40)];
    
    [TextCer3 setBackgroundColor:[UIColor clearColor]];
    LabelCer3.text = @"Got 50 points in Cary Math";
    TextCer3.text = @"Amateur";
    [TextCer3 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [TextCer3 setFont:[UIFont boldSystemFontOfSize: 25]];
    [LabelCer3 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [LabelCer3 setFont:[UIFont boldSystemFontOfSize:12]];
    LabelCer3.textColor = [UIColor whiteColor];
    TextCer3.textColor = [UIColor whiteColor];
    
    
    NSInteger limit3 = 50;
    ViewCer3.layer.cornerRadius = 4;
    ViewCer3.layer.borderWidth = 0.5;
    [ViewCer3 addSubview:ViewImage3];
    [ViewCer3 addSubview:TextCer3];
    [ViewCer3 addSubview:LabelCer3];
    
    
    UIImageView *ViewImage4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"muc2.png"]];
    ViewCer4 = [[UIView alloc] initWithFrame:CGRectMake(10, 310, 300, 70)];
    UITextView *TextCer4 = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, 230, 40)];
    UILabel *LabelCer4 = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 40)];
    
    [TextCer4 setBackgroundColor:[UIColor clearColor]];
    LabelCer4.text = @"Got 10 points in Cary Math";
    TextCer4.text = @"Beginner";
    [TextCer4 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [TextCer4 setFont:[UIFont boldSystemFontOfSize: 25]];
    [LabelCer4 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [LabelCer4 setFont:[UIFont boldSystemFontOfSize:12]];
    LabelCer4.textColor = [UIColor whiteColor];
    TextCer4.textColor = [UIColor whiteColor];
    
    
    NSInteger limit4 = 10;
    ViewCer4.layer.cornerRadius = 4;
    ViewCer4.layer.borderWidth = 0.5;
    [ViewCer4 addSubview:ViewImage4];
    [ViewCer4 addSubview:TextCer4];
    [ViewCer4 addSubview:LabelCer4];
    
    
    UIImageView *ViewImage5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"muc1.png"]];
    ViewCer5 = [[UIView alloc] initWithFrame:CGRectMake(10, 385, 300, 70)];
    UITextView *TextCer5 = [[UITextView alloc] initWithFrame:CGRectMake(80, 5, 230, 40)];
    UILabel *LabelCer5 = [[UILabel alloc] initWithFrame:CGRectMake(85, 30, 200, 40)];
    
    [TextCer5 setBackgroundColor:[UIColor clearColor]];
    LabelCer5.text = @"Got 1 points in Cary Math";
    TextCer5.text = @"First play";
    [TextCer5 setFont:[UIFont fontWithName:@"Myriad Pro" size:10]];
    [TextCer5 setFont:[UIFont boldSystemFontOfSize: 25]];
    [LabelCer5 setFont:[UIFont fontWithName:@"Myriad Pro" size:25]];
    [LabelCer5 setFont:[UIFont boldSystemFontOfSize:12]];
    LabelCer5.textColor = [UIColor whiteColor];
    TextCer5.textColor = [UIColor whiteColor];
    
    NSInteger limit5 = 1;
    ViewCer5.layer.cornerRadius = 4;
    ViewCer5.layer.borderWidth = 0.5;
    [ViewCer5 addSubview:ViewImage5];
    [ViewCer5 addSubview:TextCer5];
    [ViewCer5 addSubview:LabelCer5];
    
    
    [self boundlayerMask:ViewCer1];
    [self boundlayerMask:ViewCer2];
    [self boundlayerMask:ViewCer3];
    [self boundlayerMask:ViewCer4];
    [self boundlayerMask:ViewCer5];
    [self boundlayerMask:ViewCer0];
    
    TextCer1.delegate = self;
    TextCer2.delegate = self;
    TextCer3.delegate = self;
    TextCer4.delegate = self;
    TextCer5.delegate = self;
    TextCer0.delegate = self;
    
    
    [self textViewShouldBeginEditing:TextCer1];
    [self textViewShouldBeginEditing:TextCer2];
    [self textViewShouldBeginEditing:TextCer3];
    [self textViewShouldBeginEditing:TextCer4];
    [self textViewShouldBeginEditing:TextCer5];
    [self textViewShouldBeginEditing:TextCer0];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger theHighScore = [defaults integerForKey:@"HightScore"];
    
    [self checkPointCertificate:limit1 compare:theHighScore UIview:ViewCer1];
    [self checkPointCertificate:limit2 compare:theHighScore UIview:ViewCer2];
    [self checkPointCertificate:limit3 compare:theHighScore UIview:ViewCer3];
    [self checkPointCertificate:limit4 compare:theHighScore UIview:ViewCer4];
    [self checkPointCertificate:limit5 compare:theHighScore UIview:ViewCer5];
    [self checkPointCertificate:limit0 compare:theHighScore UIview:ViewCer0];
    
    UILabel *labelPoint = [[UILabel alloc] initWithFrame:CGRectMake(170, 10, 120, 40)];
    labelPoint.text = [NSString stringWithFormat:@"%d/5 Unlocker",dem];
    [labelPoint setFont:[UIFont fontWithName:@"Myriad Pro"  size:10]];
    [labelPoint setFont:[UIFont boldSystemFontOfSize:20]];
    
    [viewBar addSubview:labelPoint];
    
    
    [scrollCer addSubview:ViewCer1];
    [scrollCer addSubview:ViewCer2];
    [scrollCer addSubview:ViewCer3];
    [scrollCer addSubview:ViewCer4];
    [scrollCer addSubview:ViewCer5];
    [scrollCer addSubview:ViewCer0];
    
    [self.view addSubview:scrollCer];
    [self.view addSubview:viewBar];
    [self.view addSubview:back1];
    
}

-(void)buttonback
{
    mainVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:mainVC animated:YES];
}

#pragma create masklayer on UIView Certificate
-(void)boundlayerMask : (UIView *)view
{
    maskLayer = [CAGradientLayer layer];
    
    maskLayer.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:1 alpha:0] CGColor], (id)[[UIColor colorWithWhite:1 alpha:1] CGColor], nil];
    maskLayer.locations = [NSArray arrayWithObjects:[NSNumber numberWithFloat:-2.0], [NSNumber numberWithFloat:2.0], nil];
    
    maskLayer.bounds = CGRectMake(0, 0,
                                  ViewCer1.frame.size.width,
                                  ViewCer1.frame.size.height);
    maskLayer.anchorPoint = CGPointZero;
    
    view.layer.mask = maskLayer;
}


#pragma hidden masklayer when not use
-(void) checkPointCertificate: (NSInteger) limited compare: (NSInteger) pointCurrent UIview: (UIView *) viewcer
{
    if (pointCurrent >= limited) {
        dem = dem+1;
        viewcer.layer.mask = nil;
    }
}

#pragma prohibition use textview
-(BOOL) textViewShouldBeginEditing:(UITextView *)textView{
    [textView resignFirstResponder];
    return NO;
    
}

#pragma hidden tabbar
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
