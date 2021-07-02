//
//  YLZMediator.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZMediator.h"
#import "UIViewController+YLZMediator.h"

@implementation YLZMediator

+ (void)pushViewController:(nonnull UIViewController *)controller
        baseViewController:(nullable UIViewController *)baseViewController
{
    if (baseViewController == nil) {
        baseViewController = [YLZMediator topmostNavigationController];
    }
    if(baseViewController == nil) return;
    controller.hidesBottomBarWhenPushed = YES;
    if ([baseViewController isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController*)baseViewController pushViewController:controller animated:YES];
    }else if(baseViewController.navigationController){
        [baseViewController.navigationController pushViewController:controller animated:YES];
    }else{
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
        [baseViewController presentViewController:navController animated:YES completion:NULL];
    }
}

+ (void)presentedViewController:(nonnull UIViewController *)controller
             baseViewController:(nullable UIViewController *)baseViewController animated:(BOOL )animated {
    if(baseViewController == nil){
        baseViewController = [self topmostViewController];
    }
    
    if(baseViewController == nil) return;
    
    if (baseViewController.presentedViewController) {
        [baseViewController dismissViewControllerAnimated:NO completion:nil];
    }
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller];
    navController.transitioningDelegate = navController.transitioningDelegate;
    [baseViewController presentViewController:navController animated:animated completion:NULL];
}

#pragma mark -
+ (UIViewController *)topmostViewController
{
    //rootViewController需要是TabBarController,排除正在显示FirstPage的情况
    UIViewController *rootViewContoller = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [rootViewContoller ylz_topmostViewController];
}

+ (UINavigationController *)topmostNavigationController
{
    return [[YLZMediator topmostViewController] ylz_nearestNavigationController];
}

+ (void)backToRootViewControllerCompletion:(void (^ __nullable)(void))completion {
    UIViewController *currentTopViewController = [YLZMediator topmostViewController];
    UINavigationController *currentNav = currentTopViewController.navigationController;
    if (currentNav) {
        [currentNav setViewControllers:@[currentNav.viewControllers.firstObject] animated:NO];
    }
    [YLZMediator dismissAllPresentedViewControllerAnimated:NO completion:^{
        if ([YLZMediator topmostViewController].navigationController.viewControllers.count>1) {
            [YLZMediator backToRootViewControllerCompletion:completion];
        } else {
            if (completion) {
                completion();
            }
        }
    }];
}

+ (void)dismissAllPresentedViewControllerAnimated:(BOOL)animated completion:(void (^ __nullable)(void))completion {
    UIViewController *currentTopViewController = [YLZMediator topmostViewController];
    if (currentTopViewController.presentingViewController) {
        currentTopViewController = currentTopViewController.presentingViewController;
        [currentTopViewController dismissViewControllerAnimated:animated completion:^{
            if (currentTopViewController == [YLZMediator topmostViewController].presentingViewController) {
                //如果在dismiss完成时，又新present出一个VC，则中止避免循环present和dismiss
                if (completion) {
                    completion();
                }
            } else {
                [YLZMediator dismissAllPresentedViewControllerAnimated:animated completion:completion];
            }
        }];
    } else if (currentTopViewController.presentedViewController) {
        [currentTopViewController dismissViewControllerAnimated:animated completion:^{
            [YLZMediator dismissAllPresentedViewControllerAnimated:animated completion:completion];
        }];
    } else {
        if (completion) {
            completion();
        }
    }
}

@end
