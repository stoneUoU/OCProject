//
//  NSTimer+YLZPluto.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.s
//

#import <Foundation/Foundation.h>

@interface NSTimer (YLZPluto)
/**
 *  创建一个不会造成循环引用的循环执行的Timer
 */
+ (instancetype)ylz_ScheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo;

+ (NSTimer *)ylz_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block;

@end
