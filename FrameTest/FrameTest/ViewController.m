//
//  ViewController.m
//  FrameTest
//
//  Created by mac on 15/5/24.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) UIView *innerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    testView.backgroundColor = [UIColor blueColor];
    self.myView = testView;
    [self.view insertSubview:testView atIndex:0];
    UIView* innerView = [[UIView alloc] initWithFrame:CGRectMake(20 ,20, 10, 10)];
    innerView.backgroundColor = [UIColor redColor];
    [testView addSubview:innerView];
    self.innerView = innerView;
    [self Log:self.myView];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self test3];
}

- (void)test3 {
    // 放大两倍
//    self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
//    NSLog(@"------------------------------------");
//    [self Log:self.myView];
//    NSLog(@"------------------------------------");
//    [self Log:self.innerView];
    
    // anchorPoint 变化，frame也会变化
    self.myView.layer.anchorPoint = CGPointMake(0, 0);
    self.myView.transform = CGAffineTransformMakeScale(2.0, 2.0);
    NSLog(@"------------------------------------");
    [self Log:self.myView];
    NSLog(@"------------------------------------");
    [self Log:self.innerView];

}

- (void)test2 {
    // 改变 bound 的 origin，会将红点移动到左上角,
    // 原因：子视图的位置是相对于 bounds 的 origin 的, 而子视图的 frame 并没有改变
    self.myView.bounds = CGRectMake(25, 25, 50, 50);
    NSLog(@"------------------------------------");
    [self Log:self.myView];
    NSLog(@"------------------------------------");
    [self Log:self.innerView];
}

- (void)test1 {
    // 改变frame，center属性会变化，从 (125, 125) 变成 (20, 20)
    self.myView.frame = CGRectMake(0, 0, 40, 40);
    NSLog(@"------------------------------------");
    [self Log:self.myView];
    
    // 改变center，frame属性也会变化，但是不会影响bounds属性
    self.myView.center = CGPointMake(125.0, 125.0);
    NSLog(@"------------------------------------");
    [self Log:self.myView];
    
    NSLog(@"------------------------------------");
    [self Log:self.innerView];
}

- (void)Log:(UIView *)view {
    NSLog(@"frame=%@", NSStringFromCGRect(view.frame));
    NSLog(@"bounds=%@", NSStringFromCGRect(view.bounds));
    NSLog(@"center=%@", NSStringFromCGPoint(view.center));
    NSLog(@"layer.anchorPoint=%@", NSStringFromCGPoint(view.layer.anchorPoint));
    NSLog(@"layer.position=%@", NSStringFromCGPoint(view.layer.position));
    
}

//- (CGRect)frame  {
//    float x = center.x - 1/2 * bounds.width;
//    float y = center.y - 1/2 * bounds.height;
//    float width = bounds.width;
//    float height = bounds.height;
//    return CGRectMake(x, y, width, height);
//}
//
//- (void) setFrame:(CGRect)rect{
//    center.x = rect.x + 1/2 * rect.width;
//    center.y = rect.y + 1/2 * rect.height;
//    bounds.width = rect.width;
//    bounds.height = rect.height;
//}
@end
