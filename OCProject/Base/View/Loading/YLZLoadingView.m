//
//  YLZLoadingView.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZLoadingView.h"
#import <Lottie/Lottie.h>

@implementation YLZLoadingView {
    LOTAnimationView *_animationView;
}

- (void)hiddenLoadingWithRequest {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self->_animationView stop];
        [self->_animationView removeFromSuperview];
        self->_animationView = nil;
    });
}

- (void)showLoadingWithRequest {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self animationView] play];
    });
}

- (LOTAnimationView *)animationView {
    if (_animationView) {
        return _animationView;
    }
    UIView *superView = [UIApplication sharedApplication].delegate.window;
    _animationView = [LOTAnimationView animationNamed:@"YLZLoading"];
    _animationView.cacheEnable = NO;
    _animationView.loopAnimation = YES;
    [superView addSubview:_animationView];
    [superView bringSubviewToFront:_animationView];
    [_animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(superView);
        make.size.equalTo(@(CGSizeMake(72.f, 22.f)));
    }];
    return _animationView;
}

@end


