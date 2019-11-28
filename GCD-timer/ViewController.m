//
//  ViewController.m
//  GCD-timer
//
//  Created by 中创 on 2019/11/28.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NextViewController * nextVC = [NextViewController new];
    nextVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:nextVC animated:YES completion:nil];
}
@end
