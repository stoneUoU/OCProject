//
//  AppDelegate+Tarbar.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "AppDelegate+Tarbar.h"
#import "YLZHomeViewController.h"
#import "YLZMineViewController.h"
#import "YLZMessageViewController.h"
#import "YLZMomentViewController.h"
#import "YLZHealthCodeViewController.h"
#import "YLZRouteCodeViewController.h"
#import "ViewController.h"
#import "ISECUtil.h"

#import <YYKit/YYKit.h>

#import "YLZLoginViewController.h"
#import "YLZSetIdentityViewController.h"

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
    
    UIViewController *homeVC =  [[YLZHomeViewController alloc] init];
    UIViewController *messageVC = [[YLZMessageViewController alloc] init];
    UIViewController *momentVC = [[YLZMomentViewController alloc] init];
    UIViewController *mineVC = [[YLZMineViewController alloc] init];
    
    NSArray *vcArr = @[homeVC,messageVC,momentVC,mineVC];
    NSArray *imageNameArr = @[@"ylz_tabbar_home",@"ylz_tabbar_message",@"ylz_tabbar_moment",@"ylz_tabbar_me"];
    NSArray *selectedImageNameArr = @[@"ylz_tabbar_home_selected",@"ylz_tabbar_message_selected",@"ylz_tabbar_moment_selected",@"ylz_tabbar_me_selected"];
    
    [self.tabbarVC setupTabWithVCArr:vcArr imageNameArr:imageNameArr selectedImageNameArr:selectedImageNameArr titleColor:YLZColorTitleTwo selecedTitleColor:YLZColorBlueView];
    [self.tabbarVC setupCenterTabWithCenterImage:@"ylz_tabbar_plus" middleVC:nil isPresentVC:YES];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[YLZLoginViewController alloc] init]];
//    self.window.rootViewController = self.tabbarVC;
//    self.window.rootViewController = [[YLZHealthCodeViewController alloc] init];
//    self.window.rootViewController = [[YLZRouteCodeViewController alloc] init];
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[YLZSetIdentityViewController alloc] init]];
    [self initProtectSDK];
//    self.window.rootViewController = self.tabbarVC;
}


- (void)initProtectSDK {
    //防截屏机制
    [[ISECUtil instance] antiScreenShot];
    [ISECUtil antiDbg];  //防调式
    [ISECUtil antiDyld]; //防注入
    [ISECUtil antiSign:@"2SRTBWK6P4"];//公司苹果开发者账号的teamid， 防二次打包
    [ISECUtil antiProxy]; //防wifi代理
    [ISECUtil antiFrida]; //防frida
    [ISECUtil antiEnv];   //防越狱环境
    if (isec_flag & ISEC_DEBUG_FLAG) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前应用被调试，操作可能存在风险。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        [alertController addAction:action];
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if (isec_flag & ISEC_SIGN_FLAG) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前应用被篡改，操作可能存在风险。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        [alertController addAction:action];
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if(isec_flag & ISEC_ROOT_FLAG) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前应用被越狱，操作可能存在风险。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        [alertController addAction:action];
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
    }

    if(isec_flag & ISEC_PROXY_FLAG) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前设备设置了代理，操作可能存在风险。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        [alertController addAction:action];
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
     }
    if(isec_flag & ISEC_FRIDA_FLAG) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前应用被注入，操作可能存在风险。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        [alertController addAction:action];
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if (isec_flag & ISEC_ENV_MOBILE_FLAG) {
        UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前应用环境，是越狱环境。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            exit(0);
        }];
        [alertController addAction:action];
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
    }
    if (isec_flag & ISEC_DYLD_FLAG) {
       UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"安全提醒" message:@"当前应用环境，操作可能存在风险。" preferredStyle:UIAlertControllerStyleAlert];
       UIAlertAction * action = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           exit(0);
       }];
       [alertController addAction:action];
       [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
        return;
    }
    self.window.rootViewController = self.tabbarVC;
}

#pragma mark - Private Method
#pragma mark -

- (void)toRouterWithExsitTopController {
    UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:[[YLZLoginViewController alloc] init]];
    [[YLZPageHelper sharedInstance] presentExistingViewController:vc];
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
    return YES;
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

