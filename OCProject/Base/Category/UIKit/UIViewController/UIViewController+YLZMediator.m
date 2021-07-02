//
//  UIViewController+YLZMediator.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "UIViewController+YLZMediator.h"

@implementation UIViewController (YLZMediator)

- (UINavigationController*)ylz_nearestNavigationController {
    UIViewController *viewController = self;
    while (!viewController.navigationController) {
        if (viewController.presentingViewController) {
            viewController = viewController.presentingViewController;
            //presentingViewController是UINavigationController，则返回其topViewController
            if ([viewController isKindOfClass:[UINavigationController class]]) {
                viewController = ((UINavigationController*)viewController).topViewController;
            }
        } else {
            break;
        }
    }
    return viewController.navigationController;
}

- (UIViewController*)ylz_topmostViewController {
    if (self.presentedViewController
        &&![self.presentedViewController ylz_isExcludeTopmostViewController]) {
        return [self.presentedViewController ylz_topmostViewController];
    } else if ([self isKindOfClass:[UITabBarController class]]) {
        return [[((UITabBarController*)self) selectedViewController] ylz_topmostViewController];
    } else if ([self isKindOfClass:[UINavigationController class]]) {
        return [[((UINavigationController*)self) topViewController] ylz_topmostViewController];
    } else if ([self conformsToProtocol:@protocol(YLZMediatorTopViewControllerProtocol)]
               &&[self respondsToSelector:@selector(topViewController)]) {
        id<YLZMediatorTopViewControllerProtocol> topViewControllerProtocol = (id)self;
        return [[topViewControllerProtocol topViewController] ylz_topmostViewController];
    }
    return self;
}

- (BOOL)ylz_isExcludeTopmostViewController {
    NSArray *clsNames = @[@"UIAlertController"];
    BOOL isExclude = NO;
    for (NSString *clsName in clsNames) {
        Class cls = NSClassFromString(clsName);
        if (cls&&[self isKindOfClass:cls]) {
            isExclude = YES;
            break;
        }
    }
    return isExclude;
}

@end
