//
//  YLZViewExtent.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/7/24.
//

#import "YLZViewExtent.h"

@implementation YLZViewExtent

//放大
+ (void)showScaleView:(UIView *)scaleView withAlphaView:(UIView *)alphaView withDuration:(NSTimeInterval)duration withFinishBlock:(void(^)(void))finishBlock {
    
    //缩小创建好的视图
    CGAffineTransform newTransform = CGAffineTransformScale(scaleView.transform, 0.1, 0.1);
    [scaleView setTransform:newTransform];
    alphaView.alpha = 0;
    //第一次显示的时候放大它
    [UIView animateWithDuration:duration animations:^{
        CGAffineTransform newTransform = CGAffineTransformConcat(scaleView.transform,  CGAffineTransformInvert(scaleView.transform));
        [scaleView setTransform:newTransform];
        alphaView.alpha = 1.0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
};

//缩小
+ (void)hiddenScaleView:(UIView *)scaleView withAlphaView:(UIView *)alphaView withDuration:(NSTimeInterval)duration withFinishBlock:(void(^)(void))finishBlock {
    CGAffineTransform newTransform =  CGAffineTransformScale(scaleView.transform, 1.0, 1.0);
    [scaleView setTransform:newTransform];
    alphaView.alpha = 1;
    [UIView animateWithDuration:duration animations:^{
        CGAffineTransform newTransform =  CGAffineTransformScale(scaleView.transform, 0.1, 0.1);
        [scaleView setTransform:newTransform];
        alphaView.alpha = 0;
    } completion:^(BOOL finished) {
        if(finishBlock != nil){
            finishBlock();
        }
    }];
};

@end
