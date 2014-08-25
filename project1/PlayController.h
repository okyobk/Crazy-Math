//
//  PlayController.h
//  project1
//
//  Created by OKYO_bk on 8/13/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import <GooglePlus/GooglePlus.h>

@class GPPSignInButton;

@interface PlayController : UIViewController<AVAudioPlayerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, GPPSignInDelegate, GPPShareDelegate>

@property (retain, nonatomic) GPPSignInButton *signInButton;
@property (retain, nonatomic) UIButton *layGoogle;
@property (nonatomic, strong) UILabel *newpoint;
@property (nonatomic, strong) UILabel *bestpoint;
//- (void)sharingStatus;
@end
