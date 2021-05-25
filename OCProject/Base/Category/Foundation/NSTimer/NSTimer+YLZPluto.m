//
//  NSTimer+YLZPluto.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.s
//

#import "NSTimer+YLZPluto.h"

@interface StTimerTarget : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

@end

@implementation StTimerTarget

- (void)stTimerTargetAction:(NSTimer *)timer
{
    if (self.target) {
        [self.target performSelector:self.selector withObject:timer afterDelay:0.0];
    } else {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end

@implementation NSTimer (YLZPluto)

+ (instancetype)ylz_ScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo
{
    StTimerTarget *timerTarget = [[StTimerTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    NSTimer *timer = [NSTimer timerWithTimeInterval:ti target:timerTarget selector:@selector(stTimerTargetAction:) userInfo:userInfo repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    timerTarget.timer = timer;
    return timerTarget.timer;
}

+ (NSTimer *)ylz_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block {
    if ([self respondsToSelector:@selector(timerWithTimeInterval:repeats:block:)]) {
        if (@available(iOS 10.0, *)) {
            return [self timerWithTimeInterval:interval repeats:repeats block:block];
        } else {
            // Fallback on earlier versions
        }
    }
    return [self timerWithTimeInterval:interval target:self selector:@selector(timerAction:) userInfo:block repeats:repeats];
}

+ (void)timerAction:(NSTimer *)timer {
    void (^block)(NSTimer *timer) = timer.userInfo;
    if (block) block(timer);
}

@end
