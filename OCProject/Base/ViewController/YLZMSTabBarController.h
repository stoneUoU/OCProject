//
//  YLZMSTabBarController.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <UIKit/UIKit.h>

@class YLZMSTabBarController;

typedef NS_ENUM(NSInteger, YLZMSTabIndex) {
    YLZMSTabIndexHome = 0,
    YLZMSTabIndexPersonal
};

@protocol YLZMSTabBarControllerDelegate <NSObject>

@optional
- (BOOL)ylzTabBarController:(YLZMSTabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController isCenterTab:(BOOL)isCenterTab;

- (void)ylzTabBarController:(YLZMSTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface YLZMSTabBarController : UITabBarController

@property (nonatomic, weak) id<YLZMSTabBarControllerDelegate> tabbarDelegate;

/**
 设置Tab元素

 @param vcArr Tab 对应 VC数组
 @param imageNameArr Tab 图片默认数组
 @param selectedImageNameArr Tab 图片选中数组
 @param titleArr Tab 标题数组
 @param titleColor Tab 标题颜色
 @param selecedTitleColor Tab 标题选中颜色
 */
- (void)setupTabWithVCArr:(NSArray *)vcArr imageNameArr:(NSArray *)imageNameArr selectedImageNameArr:(NSArray *)selectedImageNameArr titleArr:(NSArray *)titleArr titleColor:(UIColor *)titleColor selecedTitleColor:(UIColor *)selecedTitleColor ;

/**
 设置中间Tab
 需要先调用setupTabWithVCArr 设置其他Tab元素，在调用此方法设置中间Tab
 @param centerImage 中间Tab图片
 @param middleVC 中间Tab对应VC
 @param isPresentVC 中间Tab 是否Present
 */
- (void)setupCenterTabWithCenterImage:(NSString *)centerImage  middleVC:(UIViewController *)middleVC isPresentVC:(BOOL)isPresentVC;

- (void)setTabbarCenterImage:(UIImage *)image;

@end


