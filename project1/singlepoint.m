//
//  singlepoint.m
//  project1
//
//  Created by OKYO_bk on 8/13/14.
//  Copyright (c) 2014 Okyobk. All rights reserved.
//

#import "singlepoint.h"

@implementation singlepoint{
    NSString *info;
}
@synthesize statusSound;

static singlepoint *singlepointInstance = nil;

+(singlepoint *)getInstance{
    if (singlepointInstance == nil) {
        singlepointInstance = [[super alloc] init];
    }
    return singlepointInstance;
}

-(void) doSomethingWithString:(NSString *)parameter{
    info = parameter;
}

-(NSString *)getinfo{
    return info;
}

@end
