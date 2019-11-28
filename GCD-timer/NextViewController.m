//
//  NextViewController.m
//  GCD-timer
//
//  Created by 中创 on 2019/11/28.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "NextViewController.h"
#import "LSTimer.h"
@interface NextViewController ()

@property (nonatomic, strong) LSTimer * timer;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];

    UIButton * startBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:startBtn];
    startBtn.backgroundColor = [UIColor redColor];
    startBtn.frame = CGRectMake(100, 100, 100, 100);
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
}
- (void)startAction{
    // 开启定时器
    [self.timer start];
}
- (LSTimer *)timer{
    if (_timer == nil) {
        _timer = [[LSTimer alloc] initWithTimeInterval:1 andWaitTime:0 eventHandler:^{
            NSLog(@"1.");
        }];
    }
    return _timer;
}

- (void)dealloc{
    NSLog(@"销毁了...");
}
@end
