//
//  ViewController.m
//  ijkDemo
//
//  Created by ALIN on 2016/9/22.
//  Copyright © 2016年 ALIN. All rights reserved.
//

#import "ViewController.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface ViewController ()
@property (atomic, strong) IJKFFMoviePlayerController <IJKMediaPlayback> *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    
    // 成员属性强引用
    _player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    [_player setScalingMode:IJKMPMovieScalingModeAspectFill];
    
    UIView *playerView = [self.player view];
    playerView.backgroundColor = [UIColor blackColor];
    
    playerView.frame = self.view.bounds;
    
    // 使视频自适应屏幕的宽高
    playerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view insertSubview:playerView atIndex:1];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_player prepareToPlay];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.player play];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
