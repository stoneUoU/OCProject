//
//  YLZMediator.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZMediator : NSObject

/*
 *  获取当前ViewController
 */
+ (UIViewController *)topmostViewController;
/*
 *  获取当前NavigationController
 */
+ (UINavigationController *)topmostNavigationController;
/*
 * 返回到RootViewController，包含dismiss所有present VC
 */
+ (void)backToRootViewControllerCompletion:(void (^ __nullable)(void))completion;
/*
 *  dismiss所有present VC
 */
+ (void)dismissAllPresentedViewControllerAnimated:(BOOL)animated completion:(void (^ __nullable)(void)) completion;

@end

NS_ASSUME_NONNULL_END
