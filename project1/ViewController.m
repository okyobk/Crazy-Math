//
//  ViewController.m
//  project1
//
//  Created by OKYO_bk on 8/11/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import "ViewController.h"
#import "CerViewController.h"
#import "LinkViewController.h"
#import "HightViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    PlayController *_playVC;
    CerViewController *_CerVC;
    LinkViewController *_LinkVC;
    HightViewController *_HigVC;
    unsigned int outVal;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    
    UIImageView *viewBanner = [[UIImageView alloc] init];
    UIImage *Banner = [UIImage imageNamed:@"banner.png"];
    viewBanner.frame = CGRectMake(65, 80, Banner.size.width, Banner.size.height);
    viewBanner.image = Banner;
    
    UIImageView *viewlogo = [[UIImageView alloc] init];
    UIImage *logo = [UIImage imageNamed:@"vmolab.png"];
    [self detectionlogo:viewlogo showImage:logo];
    viewlogo.image = logo;
    
    
    
    UIView *viewScreen = [[UIView alloc] init];
    [self detectionIphone:viewScreen];
    NSString *cor = [NSString stringWithFormat:@"%@",[self randomColor]];
    [self convertScanner:cor];
    [viewScreen setBackgroundColor:[self colorWithRGBA:outVal]];
    
    UIImage *imageplay1 = [UIImage imageNamed:@"play1.png"];
    UIImage *imageplay2 = [UIImage imageNamed:@"play2.png"];
    
    UIImage *imagerate1 = [UIImage imageNamed:@"rate2.png"];
    UIImage *imagerate3 = [UIImage imageNamed:@"rate4.png"];
    
    UIImage *imagerate2 = [UIImage imageNamed:@"rate1.png"];
    UIImage *imagerate4 = [UIImage imageNamed:@"rate3.png"];
    
    UIImage *imagerate0 = [UIImage imageNamed:@"certificate.png"];
    UIImage *imagerate5 = [UIImage imageNamed:@"certificate1.png"];
    
    
    UIButton *play1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self buttondetectionIphone:play1 showbutton:imageplay1];
    [play1 setBackgroundImage:imageplay1 forState:UIControlStateNormal];
    [play1 setBackgroundImage:imageplay2 forState:UIControlStateHighlighted];
    
    
    [play1 addTarget:self action:@selector(playerScreen: ) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rate0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rate0.frame = CGRectMake(50, 335, imagerate0.size.width, imagerate0.size.height);
    [rate0 setBackgroundImage:imagerate0 forState:UIControlStateNormal];
    [rate0 setBackgroundImage:imagerate5 forState:UIControlStateHighlighted];
    [rate0 addTarget:self action:@selector(rate0Screen) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rate1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rate1.frame = CGRectMake(115, 400, imagerate1.size.width, imagerate1.size.height);
    [rate1 setBackgroundImage:imagerate1 forState:UIControlStateNormal];
    [rate1 setBackgroundImage:imagerate3 forState:UIControlStateHighlighted];
    [rate1 addTarget:self action:@selector(rate1Screen) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rate2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rate2.frame = CGRectMake(180, 335, imagerate2.size.width, imagerate2.size.height);
    [rate2 setBackgroundImage:imagerate2 forState:UIControlStateNormal];
    [rate2 setBackgroundImage:imagerate4 forState:UIControlStateHighlighted];
    [rate2 addTarget:self action:@selector(rate2Screen) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:viewScreen];
    [self.view addSubview:viewBanner];
    [self.view addSubview:viewlogo];
    [self.view addSubview:play1];
    [self.view addSubview:rate0];
    [self.view addSubview:rate1];
    [self.view addSubview:rate2];
}

- (UIColor *)colorWithRGBA:(NSInteger)color
{
    return [UIColor colorWithRed:((color >> 24) & 0xFF) / 255.0f
                           green:((color >> 16) & 0xFF) / 255.0f
                            blue:((color >> 8) & 0xFF) / 255.0f
                           alpha:((color) & 0xFF) / 255.0f];
}

-(void) convertScanner: (NSString *)srtring
{
    NSScanner *scanner = [NSScanner scannerWithString:srtring];
    [scanner scanHexInt:&outVal];
    NSLog(@"%i",outVal);
    
}

-(void) detectionlogo: (UIImageView *)view showImage: (UIImage *)images
{
    if (IS_IPHONE_5) {
        view.frame = CGRectMake(125, 540, images.size.width, images.size.height);
    }
    else
        view.frame = CGRectMake(125, 540-80, images.size.width, images.size.height);
}

-(void) detectionIphone: (UIView *)view
{
    if (IS_IPHONE_5) {
        view.frame = CGRectMake(0, 0, 320, 568);
    }
    else
        view.frame = CGRectMake(0, 0, 320, 568-80);
}

-(void)buttondetectionIphone: (UIButton *)button showbutton: (UIImage *)images
{
    if (IS_IPHONE_5) {
        button.frame = CGRectMake(100, 260, images.size.width, images.size.height);
    }
    else
        button.frame = CGRectMake(105, 260, images.size.width, images.size.height);
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void) playerScreen: (id) sender
{
    _playVC = [[PlayController alloc] init];
    [self.navigationController pushViewController:_playVC animated:YES];
    
}

- (void) rate0Screen
{
    _CerVC = [[CerViewController alloc] init];
    [self.navigationController pushViewController:_CerVC animated:YES];
    
}
- (void) rate1Screen
{
    _LinkVC = [[LinkViewController alloc] init];
//    _LinkVC.modalPresentationStyle = UIModalPresentationCurrentContext;
    _LinkVC.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_LinkVC.view];
    
    
}

- (void) rate2Screen
{
    _HigVC = [[HightViewController alloc] init];
    [self.navigationController pushViewController:_HigVC animated:YES];
    
}

- (NSString *)randomColor
{
    NSArray *arraycolor = @[@"0x787877FF", @"0x8c8d26FF", @"0x57293dFF", @"0x206953FF", @"0x3c2646FF", @"0x8a416cFF", @"0x1d7b7aFF"];
    int indexColor = arc4random()%[arraycolor count];

    return arraycolor[indexColor];
}

@end
