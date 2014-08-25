//
//  singlepoint.h
//  project1
//
//  Created by OKYO_bk on 8/13/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface singlepoint : NSObject

+(singlepoint *)getInstance;

-(void) doSomethingWithString: (NSString *)parameter;
-(NSString *)getinfo;

@property (nonatomic, strong) NSNumber *point;
@property BOOL statusSound;
@end
