//
//  samplelib.m
//  samplelib
//
//  Created by DLGames on 13/07/23.
//  Copyright (c) 2013年 DLGames. All rights reserved.
//

#import "Samplelib.h"

@implementation Samplelib{
}

-(id) init
{
    if(self = [super init]) {
        // do initialization here after super init nil check!
    }
    
    return self;
}

-(void) dealloc
{
    // this is an ARC project so we don't have to dealloc
    // we dont even have to call [super dealloc];
    // old habits die hard, Yippee-ki-yay!
}

-(NSString*)helloWorld3
{
    return @"HELLO WORLD 3";
}

+(void) helloWorld2
{
}

+(NSString*)helloWorld4
{
    return @"HELLO WORLD 4";
}

@end
