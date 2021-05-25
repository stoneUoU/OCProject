//
//  YLZMSTabBar.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <UIKit/UIKit.h>

typedef void (^YLZMSDidTabBarMiddleBtn)(void);

@interface YLZMSTabBar : UITabBar

@property (nonatomic, copy) YLZMSDidTabBarMiddleBtn didTabBarMiddleBtn;

@property (nonatomic, strong) UIImageView *qrImageView;

- (instancetype)initWithTabbarBtnNum:(NSInteger)tabbarBtnNum;

@end

