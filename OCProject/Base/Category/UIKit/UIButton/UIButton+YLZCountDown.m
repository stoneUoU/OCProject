//
//  UIButton+YLZCountDown.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/5/13.
//

#import "UIButton+YLZCountDown.h"

@implementation UIButton (YLZCountDown)

- (void)ylz_startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle bgingColor:(UIColor *)bgingColor bgcolor:(UIColor *)bgcolor titlingColor:(UIColor *)titlingColor titleColor:(UIColor *)titleColor {

    __weak typeof(self) weakSelf = self;
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{

        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = bgcolor;
                [weakSelf setTitle:title forState:UIControlStateNormal];
                [weakSelf setTitleColor:titleColor forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = YES;
            });
        } else {
            int allTime = (int)timeLine + 1;
            int seconds = timeOut % allTime;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.backgroundColor = bgingColor;
                [weakSelf setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                [weakSelf setTitleColor:titlingColor forState:UIControlStateNormal];
                weakSelf.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}

@end
