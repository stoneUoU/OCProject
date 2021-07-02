//
//  UIViewController+YLZMediator.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YLZMediatorTopViewControllerProtocol <NSObject>

- (UIViewController*)topViewController;

@end

@interface UIViewController (YLZMediator)

/*
 存在嵌套UITabbarViewController等情况，需要实现MediatorTopViewControllerProtocol协议的topViewController方法
 */
- (UIViewController*)ylz_topmostViewController;
/*
 最近的NavigationController
 */
- (UINavigationController*)ylz_nearestNavigationController;

@end

NS_ASSUME_NONNULL_END
