//
//  YLZMSTabBarController.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "YLZMSTabBarController.h"
#import "YLZImageExtent.h"
#import "YLZMSTabBar.h"

#import <YYKit/YYKit.h>

@interface YLZMSTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, strong) NSArray *vcArr;

@property (nonatomic, strong) YLZMSTabBar *ylzTabBar;

@end

@implementation YLZMSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)setTabbarCenterImage:(UIImage *)image {
    self.ylzTabBar.qrImageView.image = image;
};

#pragma mark - 设置Tab元素
- (void)setupTabWithVCArr:(NSArray *)vcArr imageNameArr:(NSArray *)imageNameArr selectedImageNameArr:(NSArray *)selectedImageNameArr titleArr:(NSArray *)titleArr titleColor:(UIColor *)titleColor selecedTitleColor:(UIColor *)selecedTitleColor {
    _vcArr = vcArr;
    for (int i = 0; i< vcArr.count; i++) {
        [self addChildVC:[vcArr objectAtIndex:i]
               imageName:[imageNameArr objectAtIndex:i]
       selectedImageName:[selectedImageNameArr objectAtIndex:i]
                   title:[titleArr objectAtIndex:i] titleColor:titleColor
       selecedTitleColor:selecedTitleColor];
    }
}

- (void)addChildVC:(UIViewController *)childVc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title titleColor:(UIColor *)titleColor selecedTitleColor:(UIColor *)selecedTitleColor {
    if (!childVc) {
        return;
    }
    childVc.title = title;
    childVc.tabBarItem.image = [YLZImageExtent imageWithOriRenderingImage:imageName];
    childVc.tabBarItem.selectedImage = [YLZImageExtent imageWithOriRenderingImage:selectedImageName];
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(3, 0, -3, 0);
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navi];
}

#pragma mark - 设置中间Tab
- (void)setupCenterTabWithCenterImage:(NSString *)centerImage middleVC:(UIViewController *)middleVC isPresentVC:(BOOL)isPresentVC {
    
    if (!isPresentVC && middleVC) {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:middleVC];
        [self addChildViewController:navi];
    }
    self.ylzTabBar.qrImageView.image = [UIImage imageNamed:centerImage];
    [self setValue:self.ylzTabBar forKey:@"tabBar"];
    __weak __typeof(self)weakSelf = self;
    self.ylzTabBar.didTabBarMiddleBtn = ^{
        [weakSelf didTabBarMiddleBtnWithMiddleVC:middleVC isPresentVC:isPresentVC];
    };
}

- (void)didTabBarMiddleBtnWithMiddleVC:(UIViewController *)middleVC isPresentVC:(BOOL)isPresentVC {
    BOOL isShouldSelect = NO;
    if ([self.tabbarDelegate respondsToSelector:@selector(ylzTabBarController:shouldSelectViewController:isCenterTab:)]) {
        isShouldSelect = [self.tabbarDelegate ylzTabBarController:self shouldSelectViewController:nil isCenterTab:YES];
    } else {
        isShouldSelect = YES;
    }
    if (!isShouldSelect) {
        return;
    }
    if (isPresentVC) {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:middleVC];
        navi.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navi animated:YES completion:nil];
    } else {
        self.selectedIndex = self.childViewControllers.count-1;
    }
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([self.tabbarDelegate respondsToSelector:@selector(ylzTabBarController:shouldSelectViewController:isCenterTab:)]) {
        return [self.tabbarDelegate ylzTabBarController:self shouldSelectViewController:viewController isCenterTab:NO];
    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([self.tabbarDelegate respondsToSelector:@selector(ylzTabBarController:didSelectViewController:)]) {
        [self.tabbarDelegate ylzTabBarController:self didSelectViewController:viewController];
    }
}

- (YLZMSTabBar *)ylzTabBar {
    if(_ylzTabBar == nil) {
        _ylzTabBar = [[YLZMSTabBar alloc] initWithTabbarBtnNum:(self.vcArr.count+1)];
    }
    return _ylzTabBar;
}

@end


