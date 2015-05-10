//
//  ViewController.m
//  SingletonDemo
//
//  Created by 林志颖 on 15/5/10.
//  Copyright (c) 2015年 Joey. All rights reserved.
//

#import "ViewController.h"
#import "SoundTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SoundTools *s1 = [SoundTools sharedSoundTools];
    SoundTools *s2 = [SoundTools sharedSoundTools];
    SoundTools *s3 = [SoundTools sharedSoundTools];
    SoundTools *s4 = [s3 copy];
    NSLog(@"%@ %@ %@ %@", s1, s2, s3, s4);
}


@end
