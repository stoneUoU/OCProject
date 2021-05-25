//
//  AppDelegate+Tarbar.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "AppDelegate.h"
#import "YLZMSTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Tarbar)

@property (nonatomic, strong) YLZMSTabBarController *tabbarVC;

- (void)initRootViewControllerZero;

- (void)initRootViewController;

@end

NS_ASSUME_NONNULL_END
