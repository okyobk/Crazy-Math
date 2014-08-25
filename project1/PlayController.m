//
//  PlayController.m
//  project1
//
//  Created by OKYO_bk on 8/13/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import "PlayController.h"
#import "ViewController.h"
#import "singlepoint.h"
//#import <FacebookSDK/FacebookSDK.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <GoogleOpenSource/GoogleOpenSource.h>

static NSString * const kClientID = @"768130654747-jo831nb04oi8e60og17h74tavb365tee.apps.googleusercontent.com";

@interface PlayController ()<UIGestureRecognizerDelegate>{
    NSInteger _a;
    NSInteger _b;
    NSInteger _c;
    NSInteger _total;
    NSInteger check;
    ViewController *mainVC;
    UIButton *tabLoa1;
    UIButton *tabLoa2;
    AVAudioPlayer *audioPlayer;
    BOOL am;
    BOOL checkover;
    NSNumber *_dem;
    UIButton *True;
    UIButton *Flase;
    NSTimer *_timer;
    NSInteger not;
    UIProgressView *_timercollum;
    unsigned int outDem;
    SLComposeViewController *fbController;
//    GPPShare *share;
//    UIButton *layGoogle;

    
}

@end

@implementation PlayController
@synthesize signInButton;
@synthesize layGoogle;

CGImageRef UIGetScreenImage(void);

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.shouldFetchGooglePlusUser = YES;
    //signIn.shouldFetchGoogleUserEmail = YES;  // Uncomment to get the user's email
    
    // You previously set kClientId in the "Initialize the Google+ client" step
    signIn.clientID = kClientID;
    
    // Your server's OAuth 2.0 client ID
    signIn.homeServerClientID = @"-rtq1Q0_27XcjlPUDi7etfTy";
    
    // Uncomment one of these two statements for the scope you chose in the previous step
    signIn.scopes = @[ kGTLAuthScopePlusLogin ];  // "https://www.googleapis.com/auth/plus.login" scope
    //signIn.scopes = @[ @"profile" ];            // "profile" scope
    
    // Optional: declare signIn.actions, see "app activities"
    signIn.delegate = self;
    [signIn trySilentAuthentication];
//    share = [GPPShare sharedInstance];
//    share.delegate = self;
    
    
    
    singlepoint *single = [singlepoint getInstance];
    single.statusSound = 1;
    checkover = 1;
    _timercollum = [[UIProgressView alloc]initWithFrame:CGRectMake(0, 1, 320, 200)];
    [_timercollum setBackgroundColor:[UIColor blackColor]];
    _total = [self stringResult];
    
}

-(void)refreshInterfaceBasedOnSignIn {
    if ([[GPPSignIn sharedInstance] authentication]) {
        // The user is signed in.
        layGoogle.hidden = YES;
        // Perform other actions here, such as showing a sign-out button
    } else {
        layGoogle.hidden = NO;
        // Perform other actions here
    }
}

//- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
//                   error: (NSError *) error {
//    NSLog(@"Received error %@ and auth object %@",error, auth);
//    if (error) {
//        // Do some error handling here.
//    } else {
//        [self refreshInterfaceBasedOnSignIn];
//    }
//}

- (void)signOut {
    [[GPPSignIn sharedInstance] signOut];
}

- (void)disconnect {
    [[GPPSignIn sharedInstance] disconnect];
}

- (void)didDisconnectWithError:(NSError *)error {
    if (error) {
        NSLog(@"Received error %@", error);
    } else {
        // The user is signed out and disconnected.
        // Clean up user data as specified by the Google+ terms.
    }
}

//- (void)finishedWithAuth: (GTMOAuth2Authentication *)auth
//                   error: (NSError *) error {
//    NSLog(@"Received error %@ and auth object %@", error, auth);
//    if (error) {
//        // Do some error handling here.
//    } else {
//        NSString *serverCode = [GPPSignIn sharedInstance].homeServerAuthorizationCode;
//    }
//}

- (void)presentSignInViewController:(UIViewController *)viewController {
    // This is an example of how you can implement it if your app is navigation-based.
    [[self navigationController] pushViewController:viewController animated:YES];
}



-(void) viewWillAppear:(BOOL)animated
{
    not=0;
    singlepoint *single = [singlepoint getInstance];
    am =single.statusSound;
    
    NSString *cor = [NSString stringWithFormat:@"%@",[self randomColor]];
    [self convertScanner:cor];
    UIView *viewScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    [viewScreen setBackgroundColor:[self colorWithRGBA:outDem]];
    
    UIImage *imageTrue = [UIImage imageNamed:@"true.png"];
    UIImage *imageTrue1 = [UIImage imageNamed:@"true1.png"];
    
    UIImage *imageFlase = [UIImage imageNamed:@"flase.png"];
    UIImage *imageFlase1 = [UIImage imageNamed:@"flase1.png"];
    
    UIImage *loa2 = [UIImage imageNamed:@"loa2.png"];
    tabLoa2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tabLoa2.frame = CGRectMake(10, 10, loa2.size.width, loa2.size.height+3);
    [tabLoa2 setBackgroundImage:loa2 forState:UIControlStateNormal];
    [tabLoa2 addTarget:self action:@selector(clicktabLoa2) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *loa1 = [UIImage imageNamed:@"loa1.png"];
    tabLoa1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tabLoa1.frame = CGRectMake(10, 10, loa1.size.width, loa1.size.height);
    [tabLoa1 setBackgroundImage:loa1 forState:UIControlStateNormal];
    [tabLoa1 addTarget:self action:@selector(clicktabLoa1) forControlEvents:UIControlEventTouchUpInside];

    True = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    True.frame = CGRectMake(20, 320, imageTrue.size.width, imageTrue.size.height);
    [True setBackgroundImage:imageTrue forState:UIControlStateNormal];
    [True setBackgroundImage:imageTrue1 forState:UIControlStateHighlighted];
    [True addTarget:self action:@selector(SelectTrue ) forControlEvents:UIControlEventTouchUpInside];
    
    Flase = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Flase.frame = CGRectMake(170, 320, imageFlase.size.width, imageFlase.size.height);
    [Flase setBackgroundImage:imageFlase forState:UIControlStateNormal];
    [Flase setBackgroundImage:imageFlase1 forState:UIControlStateHighlighted];
    [Flase addTarget:self action:@selector(SelectFlase ) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *result1 = [NSString stringWithFormat:@"%d+%d", _a, _b];
    NSString *result2 = [NSString stringWithFormat:@"= %d", _total];
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(90, 100, 230, 100);
    label1.text = result1;
    [label1 setTextColor:[UIColor whiteColor]];
    [label1 setFont:[UIFont fontWithName:@"Marker Felt" size:80]];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(110, 205, 170, 100);
    label2.text = result2;
    [label2 setTextColor:[UIColor whiteColor]];
    [label2 setFont:[UIFont fontWithName:@"Marker Felt" size:80]];
    
    _dem = [[NSNumber alloc] init];
    if (single.point==NULL) {
        _dem = 0;
    }
    else{
        _dem = single.point;
    }

    
    UILabel *labelPoint = [[UILabel alloc] initWithFrame:CGRectMake(270, 10, 50, 50)];
    NSString *point = [NSString stringWithFormat:@"%i",[_dem intValue]];
    labelPoint.text = point;
    [labelPoint setTextColor:[UIColor whiteColor]];
    [labelPoint setFont:[UIFont fontWithName:@"Marker Felt" size:40]];
    
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    [UIView setAnimationTransition:4
//                           forView:self.navigationController.view cache:NO];
//    
//    [UIView commitAnimations];
    
    [self.view addSubview:viewScreen];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:labelPoint];
    
    [self.view addSubview:True];
    [self.view addSubview:Flase];
    
    if (am==1) {
        [self.view addSubview:tabLoa1];
    }
    else{
        [self.view addSubview:tabLoa2];
    }
    
}

#pragma convert color screen
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
    [scanner scanHexInt:&outDem];
    NSLog(@"%i",outDem);
    
}
#pragma random picture screen
- (NSString *)randomColor
{
    NSArray *arraycolor = @[@"0x787877FF", @"0x8c8d26FF", @"0x57293dFF", @"0x206953FF", @"0x3c2646FF", @"0x8a416cFF", @"0x1d7b7aFF"];
    int indexColor = arc4random()%[arraycolor count];
    
    return arraycolor[indexColor];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)delaytimer
{
    not++;
    
    if (not<10) {
        _timercollum.progress = (float)not/10.0f;
        
    }
    else{
        _timercollum.progress = (float)not/10.0f;
        [_timer invalidate];
        _timer = nil;
        [self gameOver];
        
    }
    
    [self.view addSubview:_timercollum];

}
#pragma turn off sound
-(void) clicktabLoa1
{
    singlepoint *single = [singlepoint getInstance];
    single.statusSound = 0;
    am = 0;
    
    UIImage *loa2 = [UIImage imageNamed:@"loa2.png"];
    tabLoa2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tabLoa2.frame = CGRectMake(10, 10, loa2.size.width, loa2.size.height+3);
    [tabLoa2 setBackgroundImage:loa2 forState:UIControlStateNormal];
    [tabLoa2 addTarget:self action:@selector(clicktabLoa2) forControlEvents:UIControlEventTouchUpInside];
    tabLoa1.hidden = YES;
    
    [self viewWillDisappear:YES];
    [self.view addSubview:tabLoa2];
}

#pragma turn on sound
-(void) clicktabLoa2
{
    singlepoint *single = [singlepoint getInstance];
    single.statusSound = 1;
    am=1;
    
    UIImage *loa1 = [UIImage imageNamed:@"loa1.png"];
    tabLoa1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tabLoa1.frame = CGRectMake(10, 10, loa1.size.width, loa1.size.height+3);
    [tabLoa1 setBackgroundImage:loa1 forState:UIControlStateNormal];
    [tabLoa1 addTarget:self action:@selector(clicktabLoa1) forControlEvents:UIControlEventTouchUpInside];
    tabLoa2.hidden = YES;
    [self.view addSubview:tabLoa1];
}

#pragma click True
-(void) SelectTrue
{
    [self sound];
    [_timer invalidate];
    _timer = nil;
    if (_c == _total) {
        _total = [self stringResult];
        
        singlepoint *single = [singlepoint getInstance];
        int p;
        p = [single.point intValue];
        _dem = [NSNumber numberWithInteger:p+1];
        
        single.point = _dem;
        
        [self viewWillAppear:YES];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(delaytimer) userInfo:nil repeats:YES];
    }
    else{
        [self gameOver];
    }
    
}

#pragma click Flase
-(void) SelectFlase
{
    [self sound];
    [_timer invalidate];
    _timer = nil;

    if (_c == _total) {
        [self gameOver];
        
    }
    else{
        _total = [self stringResult];
        
        singlepoint *single = [singlepoint getInstance];
        int p;
        p = [single.point intValue];
        _dem = [NSNumber numberWithInteger:p+1];
        
        single.point = _dem;
        
        [self viewWillAppear:YES];
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(delaytimer) userInfo:nil repeats:YES];
    }
    
}

#pragma sound when click True or Flase
-(void) sound
{
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"speak" ofType:@"m4a" ];
    NSURL *audioURL = [NSURL fileURLWithPath:audioPath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    [audioPlayer setVolume:0.5f];
    if (am==1) {
        [audioPlayer play];
    }
    else{
        am=0;
    }
}

#pragma button Run
-(void) SelectRunOver: (id)sender
{
    checkover = 1;
    singlepoint *single = [singlepoint getInstance];
    single.Point = 0;
    
    [self viewWillAppear:YES];
    
}

#pragma button Menu
-(void) SelectMenuOver
{
    checkover = 1;
    singlepoint *single = [singlepoint getInstance];
    single.Point = 0;
    
    mainVC = [[ViewController alloc] init];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
                           forView:self.navigationController.view cache:NO];
    [self.navigationController pushViewController:mainVC animated:YES];
    [UIView commitAnimations];
    
    
}

#pragma event when gameOver
- (void) gameOver
{
    checkover = 0 ;
    UIImage *imageOver = [UIImage imageNamed:@"gameover.png"];
    if (not>=10) {
        imageOver = [UIImage imageNamed:@"gameover1.png"];
        
    }
    
    UIImageView *layoutOver = [[UIImageView alloc] init];
    layoutOver.image = imageOver;
    
    self.newpoint = [[UILabel alloc] init];
    self.newpoint.text = [NSString stringWithFormat:@"%i",[_dem intValue]];
    [self.newpoint setTextColor:[UIColor whiteColor]];
    [self.newpoint setFont:[UIFont fontWithName:@"Marker Felt" size:30]];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger theHighScore = [defaults integerForKey:@"HightScore"];
    
    self.bestpoint = [[UILabel alloc] init];
    if ([_dem intValue]>=theHighScore) {
        self.bestpoint.text = [NSString stringWithFormat:@"%d",[_dem intValue]];
    }
    else
    {
        self.bestpoint.text = [NSString stringWithFormat:@"%d",theHighScore];
    }

    [self.bestpoint setTextColor:[UIColor whiteColor]];
    [self.bestpoint setFont:[UIFont fontWithName:@"Marker Felt" size:30]];

    
    
    UIImage *imageRun = [UIImage imageNamed:@"play1.png"];
    UIImage *imageRun2 = [UIImage imageNamed:@"play2.png"];
    UIButton *layRun = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [layRun setBackgroundImage:imageRun forState:UIControlStateNormal];
    [layRun setBackgroundImage:imageRun2 forState:UIControlStateHighlighted];
    [layRun addTarget:self action:@selector(SelectRunOver: ) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImage *imageMenu = [UIImage imageNamed:@"menu.png"];
    UIImage *imageMenu2 = [UIImage imageNamed:@"menu2.png"];
    UIButton *layMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [layMenu setBackgroundImage:imageMenu forState:UIControlStateNormal];
    [layMenu setBackgroundImage:imageMenu2 forState:UIControlStateHighlighted];
    [layMenu addTarget:self action:@selector(SelectMenuOver ) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImage *imageFacebook = [UIImage imageNamed:@"facebook.png"];
    UIImage *imageFacebook1 = [UIImage imageNamed:@"facebook1.png"];
    UIButton *layFacebook = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [layFacebook setBackgroundImage:imageFacebook forState:UIControlStateNormal];
    [layFacebook setBackgroundImage:imageFacebook1 forState:UIControlStateHighlighted];
    [layFacebook addTarget:self action:@selector(SelectFacebookOver) forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *imageGoogle = [UIImage imageNamed:@"google.png"];
    UIImage *imageGoogle1 = [UIImage imageNamed:@"google1.png"];
    layGoogle = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [layGoogle setBackgroundImage:imageGoogle forState:UIControlStateNormal];
    [layGoogle setBackgroundImage:imageGoogle1 forState:UIControlStateHighlighted];
    [layGoogle addTarget:self action:@selector(SelectGoogleOver) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *GameOver = [[UIView alloc] initWithFrame:CGRectMake(0, 0, imageOver.size.width, imageOver.size.height)];
    
    [self detectionIphone:layoutOver showImage:imageOver point1:self.newpoint point2 :self.bestpoint button:layRun img:imageRun button:layMenu img:imageMenu button:layFacebook img:imageFacebook button:layGoogle img:imageGoogle];
    
    [layoutOver addSubview:self.newpoint];
    [layoutOver addSubview:self.bestpoint];
    [self fixedHightPoint];
    [GameOver addSubview:layoutOver];
    [GameOver addSubview:layRun];
    [GameOver addSubview:layMenu];
    [GameOver addSubview:layFacebook];
    [GameOver addSubview:self.layGoogle];
    [self.view addSubview:GameOver];
    
}

-(void) detectionIphone: (UIImageView *)view showImage: (UIImage *)images point1: (UILabel *)label1 point2:(UILabel *)label2 button: (UIButton *)button1 img:(UIImage *)img1 button:(UIButton *)button2 img:(UIImage *)img2 button:(UIButton *)button3 img: (UIImage *)img3 button:(UIButton *) button4 img:(UIImage *)img4
{
    if (IS_IPHONE_5) {
        view.frame=CGRectMake(0, 0, images.size.width, images.size.height);
        label1.frame = CGRectMake(180, 175, 50,30);
        label2.frame = CGRectMake(180, 255, 50,30);
        button1.frame = CGRectMake(20, 340, img1.size.width, img1.size.height);
        button2.frame = CGRectMake(170, 340, img2.size.width, img2.size.height);
        button3.frame = CGRectMake(50, 420, img3.size.width, img3.size.height);
        button4.frame = CGRectMake(175, 420, img4.size.width, img4.size.height);
        
    }
    else{
        view.frame = CGRectMake(0, 0, images.size.width, images.size.height-83);
        label1.frame = CGRectMake(180, 175-30, 50,30);
        label2.frame = CGRectMake(180, 255-40, 50,30);
        button1.frame = CGRectMake(20, 280, img1.size.width, img1.size.height);
        button2.frame = CGRectMake(170, 280, img2.size.width, img2.size.height);
        button3.frame = CGRectMake(50, 360, img3.size.width, img3.size.height);
        button4.frame = CGRectMake(175, 360, img4.size.width, img4.size.height);
        
    }
}
-(void) fixedHightPoint
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger theHighScore = [defaults integerForKey:@"HightScore"];
    NSInteger theHighScore1 = [defaults integerForKey:@"HightScore1"];
    NSInteger theHighScore2 = [defaults integerForKey:@"HightScore2"];
    
    if ([_dem intValue]>theHighScore) {
        [defaults setInteger:theHighScore1 forKey:@"HightScore2"];
        [defaults setInteger:theHighScore forKey:@"HightScore1"];
        [defaults setInteger:[_dem intValue] forKey:@"HightScore"];
    }
    
    if ([_dem intValue] >=theHighScore1 && [_dem intValue]<=theHighScore) {
        [defaults setInteger:theHighScore1 forKey:@"HightScore2"];
        [defaults setInteger:[_dem intValue] forKey:@"HightScore1"];
    }
    
    if ([_dem intValue] >=theHighScore2 && [_dem intValue] <=theHighScore1) {
        [defaults setInteger:[_dem intValue] forKey:@"HightScore2"];
    }
    
    [defaults synchronize];
}

#pragma button Share
-(void) SelectFacebookOver
{
    fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    CGImageRef screen = UIGetScreenImage();
    UIImage* image = [UIImage imageWithCGImage:screen];
    CGImageRelease(screen);
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewControllerCompletionHandler __block completionHandler=^(SLComposeViewControllerResult result){
            
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                {
                    NSLog(@"Cancelled.....");
                    
                }
                    break;
                case SLComposeViewControllerResultDone:
                {
                    NSLog(@"Posted....");
                    
                }
                    break;
            }
        };
        
        [fbController addImage:image];
        [fbController setInitialText:@"Cazy Math for Vmodev"];
        [fbController addURL:[NSURL URLWithString:@"http://vmodev.com/cazy math"]];
        [fbController setCompletionHandler:completionHandler];
        [self presentViewController:fbController animated:YES completion:nil];
    }
    else{
        [self presentViewController:fbController animated:YES completion:nil];
    }
}

-(void) SelectGoogleOver
{
    
//    NSString *shareString = @"CapTech is a great place to work.";
//    UIImage *shareImage = [UIImage imageNamed:@"captech-logo.jpg"];
//    NSURL *shareUrl = [NSURL URLWithString:@"http://www.captechconsulting.com"];
//    
//    NSArray *activityItems = [NSArray arrayWithObjects:shareString, shareImage, shareUrl, nil];
//    
//    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
//    activityViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//    
//    [self presentViewController:activityViewController animated:YES completion:nil];
    
    GPPSignIn *signIn = [GPPSignIn sharedInstance];
    signIn.clientID = kClientID;
    signIn.scopes = [NSArray arrayWithObjects: kGTLAuthScopePlusLogin, nil];
    signIn.delegate = self;
    
    [signIn authenticate];

}

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error {
//    CGImageRef screen = UIGetScreenImage();
//    UIImage* image = [UIImage imageWithCGImage:screen];
//    CGImageRelease(screen);
    
//        [GPPShare sharedInstance].delegate = self;
        id <GPPShareBuilder> shareBuilder = [[GPPShare sharedInstance] shareDialog];
        [shareBuilder setPrefillText:@"welcome to vmodev"];
        [shareBuilder setURLToShare:[NSURL URLWithString:@"http://developers.google.com/+"]];
//        [shareBuilder setTitle:@"okyobk" description:@"vmodev" thumbnailURL:[NSURL URLWithString:@"http://25.media.tumblr.com/tumblr_m9p3n1vJmZ1rexr16o1_400.jpg"]];
    
//    [(id<GPPNativeShareBuilder>)shareBuilder attachImage:image];
        [shareBuilder open];
    
}

- (void)finishedSharing: (BOOL)shared {
    if (shared) {
        NSLog(@"User successfully shared!");
    } else {
        NSLog(@"User didn't share.");
    }
}


#pragma random number when caculate
- (NSNumber *) randomNumber
{
    NSArray *arrayNumber = @[@"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20"];
    int number = arc4random() % [arrayNumber count];
    return arrayNumber[number];
}

#pragma Display result random
- (NSInteger ) stringResult
{
    _a = [[self randomNumber] integerValue];
    _b = [[self randomNumber] integerValue];
    _total = _a + _b ;
    _c = _total;
    
    check = arc4random() %4;
    switch (check) {
        case 1:
            if (_total >3) {
                NSArray *arraytest = @[@"-3", @"-2", @"-1", @"1", @"2", @"3"];
                NSInteger t = arc4random() % [arraytest count];
                _total = _total + t;
            }
            else{
                NSArray *arraytest = @[@"-1", @"1"];
                NSInteger t = arc4random() % [arraytest count];
                _total = _total + t;
            }
            break;
            
        case 2:
            if (_total >3) {
                NSArray *arraytest = @[@"-3", @"-2", @"-1", @"1", @"2", @"3"];
                NSInteger t = arc4random() % [arraytest count];
                _total = _total + t;
            }
            else{
                NSArray *arraytest = @[@"-1", @"1"];
                NSInteger t = arc4random() % [arraytest count];
                _total = _total + t;
            }
            break;
            
        case 3:
            if (_total >3) {
                NSArray *arraytest = @[@"-3", @"-2", @"-1", @"1", @"2", @"3"];
                NSInteger t = arc4random() % [arraytest count];
                _total = _total + t;
            }
            else{
                NSArray *arraytest = @[@"-1", @"1"];
                NSInteger t = arc4random() % [arraytest count];
                _total = _total + t;
            }
            break;
            
        default:
            _total = _total +0;
            break;
    }
    
    return _total;
}

@end
