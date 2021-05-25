//
//  AppDelegate+Tarbar.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "AppDelegate+Tarbar.h"
#import "ViewController.h"

#import <YYKit/YYKit.h>

@interface AppDelegate () <YLZMSTabBarControllerDelegate>

@end

@implementation AppDelegate (Tarbar)

#pragma mark - Public Method
#pragma mark -

- (void)initRootViewControllerZero {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CATransition *animate = [[CATransition alloc] init];
    animate.type = @"rippleEffect";
    animate.duration = 1.0;
    [self.window.layer addAnimation:animate forKey:nil];
    [self.window makeKeyAndVisible];
    
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = vc;
}

- (void)initRootViewController {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    CATransition *animate = [[CATransition alloc] init];
    animate.type = @"rippleEffect";
    animate.duration = 1.0;
    [self.window.layer addAnimation:animate forKey:nil];
    [self.window makeKeyAndVisible];
    
    self.tabbarVC = [[YLZMSTabBarController alloc] init];
    self.tabbarVC.tabbarDelegate = self;
    
    UIViewController *homeVC =  [[ViewController alloc] init];
    UIViewController *mineVC = [[ViewController alloc] init];
    
    NSArray *vcArr = @[homeVC, mineVC];
    NSArray *titleArr = @[@"首页", @"我的"];
    NSArray *imageNameArr = @[@"tabbar_home",@"tabbar_mine"];
    NSArray *selectedImageNameArr = @[@"tabbar_home_selected", @"tabbar_mine_selected"];
    
    [self.tabbarVC setupTabWithVCArr:vcArr imageNameArr:imageNameArr selectedImageNameArr:selectedImageNameArr titleArr:titleArr titleColor:YLZColorTitleTwo selecedTitleColor:YLZColorBlueView];
    [self.tabbarVC setupCenterTabWithCenterImage:@"tabbar_cert_middle" middleVC:nil isPresentVC:YES];
    
    self.window.rootViewController = self.tabbarVC;
}


#pragma mark - Private Method
#pragma mark -

- (void)toRouterWithExsitTopController {
    
}

#pragma mark - Delegate
#pragma mark -

- (BOOL)ylzTabBarController:(YLZMSTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController isCenterTab:(BOOL)isCenterTab {
    // 首页和新闻页面不需要判断
    NSInteger idx = [tabBarController.viewControllers indexOfObject:viewController];
    if (idx == 0 ) {
        return YES;
    }
    // 跳转到民生二维码
    if (isCenterTab) {
        [self toRouterWithExsitTopController];
        return NO;
    }
    return NO;
}

- (void)ylzTabBarController:(YLZMSTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}

#pragma clang diagnostic pop

#pragma mark - lazy load
#pragma mark -

- (void)setTabbarVC:(YLZMSTabBarController *)tabbarVC {
    objc_setAssociatedObject(self, @"tabbarVC", tabbarVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YLZMSTabBarController *)tabbarVC {
    return objc_getAssociatedObject(self, @"tabbarVC");
}

@end

