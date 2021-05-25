//
//  UIButton+YLZCountDown.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/5/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YLZCountDown)

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param bgingColor   倒计时中的颜色
 *  @param bgcolor  还没倒计时的颜色
 *  @param titlingColor    倒计时中的颜色
 *  @param titleColor    还倒计时的颜色
 */
- (void)ylz_startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle bgingColor:(UIColor *)bgingColor bgcolor:(UIColor *)bgcolor titlingColor:(UIColor *)titlingColor titleColor:(UIColor *)titleColor;

@end

NS_ASSUME_NONNULL_END

