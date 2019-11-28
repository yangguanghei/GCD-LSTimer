# GCD-timer

使用：
/// 创建定时器
/// @param interval 定时器的时间间隔
/// @param waitTime 定时器持续时间  当小于等于0时定时器会一直持续下去
/// @param handler 每隔一段时间回调的方法
- (instancetype)initWithTimeInterval:(float)interval andWaitTime:(float)waitTime eventHandler:(void(^)(void))handler;

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
注意：需要对LSTimer对象进行强引用。

#### 介绍


#### 软件架构
软件架构说明


#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


