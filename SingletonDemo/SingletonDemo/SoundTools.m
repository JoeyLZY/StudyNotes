//
//  SoundTools.m
//  Singleton
//
//  Created by 林志颖 on 15/5/8.
//  Copyright (c) 2015年 林志颖. All rights reserved.
//

#import "SoundTools.h"

@implementation SoundTools

static SoundTools *instance;
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+ (instancetype)sharedSoundTools {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return instance;
}
@end
