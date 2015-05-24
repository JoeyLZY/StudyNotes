//
//  ViewController.m
//  MutithreadingDemo
//
//  Created by 林志颖 on 15/5/12.
//  Copyright (c) 2015年 Joey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 10; ++i) {
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        NSOperation *opA = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"A,%@", [NSThread currentThread]);
        }];
        NSOperation *opB = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"B,%@", [NSThread currentThread]);
        }];
        NSOperation *opC = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"C,%@", [NSThread currentThread]);
        }];
        
        [opB addDependency:opA];
        [opC addDependency:opB];
        
        
        [queue addOperations:@[opA, opB, opC] waitUntilFinished:YES];
    }
}



@end
