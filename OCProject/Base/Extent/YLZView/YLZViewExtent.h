//
//  YLZViewExtent.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZViewExtent : NSObject

//放大
+ (void)showScaleView:(UIView *)scaleView withAlphaView:(UIView *)alphaView withDuration:(NSTimeInterval)duration withFinishBlock:(void(^)(void))finishBlock;

//缩小
+ (void)hiddenScaleView:(UIView *)scaleView withAlphaView:(UIView *)alphaView withDuration:(NSTimeInterval)duration withFinishBlock:(void(^)(void))finishBlock;

@end

NS_ASSUME_NONNULL_END
