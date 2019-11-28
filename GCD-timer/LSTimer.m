//
//  LSTimer.m
//  GCD-timer
//
//  Created by 中创 on 2019/11/28.
//  Copyright © 2019 中创慧谷. All rights reserved.
//

#import "LSTimer.h"
/*
 注意：
 1.重复调用dispatch_resume会引起崩溃
 2.暂停之后再去取消会引起崩溃
 3.直接取消会崩溃
 */

@interface LSTimer ()

/// 时间间隔
@property (nonatomic, assign) float timeInterval;
@property (nonatomic, assign) float waitTime;
@property (nonatomic, strong) void(^handler)(void);
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation LSTimer

- (instancetype)initWithTimeInterval:(float)interval andWaitTime:(float)waitTime eventHandler:(nonnull void (^)(void))handler{
    self = [super init];
    if (self) {
        _timeInterval = interval;
        _handler = handler;
        if (_waitTime <= 0) {
            _waitTime = -1;
        }
        _waitTime = waitTime;
        [self createTimerWithTimerInterval:interval handler:handler];
        
    }
    return self;
}
/// 创建定时器
- (void)createTimerWithTimerInterval:(float)interval handler:(void(^)(void))handler{
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        
        if (self.waitTime != -1) {
            if (self.waitTime == 0) {
                [self stopTimer];
                return ;
            }
            self.waitTime --;
        }
        handler();
    });
    _timer = timer;
    [self resumeTimer];
}
/// 暂停
-(void)pauseTimer{
    if(_timer){
        dispatch_suspend(_timer);
    }
}
/// 启动
-(void)resumeTimer{
    if(_timer){
        dispatch_resume(_timer);
    }
}
/// 取消
-(void)stopTimer{
    if(_timer){
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
}

@end
