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

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LSTimer * timer = [[LSTimer alloc] initWithTimeInterval:1 andWaitTime:-1 eventHandler:^{
        NSLog(@"1...");
    }];
    _timer = timer;
}
- (void)dealloc{
    NSLog(@"销毁了...");
}
@end
