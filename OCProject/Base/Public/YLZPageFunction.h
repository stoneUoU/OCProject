//
//  YLZPageFunction.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZPageFunction : NSObject

//present普通视图
+ (void)presentToCommVC:(UIViewController *)selfVC destVC:(UIViewController *)destVC animate:(BOOL )animateBool;

//present导航栏视图
+ (void)presentToNaviVC:(UIViewController *)selfVC destVC:(UIViewController *)destVC animate:(BOOL )animateBool;


//dissmiss 被present的视图
+ (void)dismissCurrVC:(UIViewController *)selfVC animate:(BOOL )animateBool;

//push导航栏视图
+ (void)pushToNextVC:(UIViewController *)selfVC destVC:(UIViewController *)destVC;

//pop到前一个视图
+ (void)popToPrevVC:(UIViewController *)selfVC;

//pop到特定的视图
+ (void)popToSpecialVC:(UIViewController *)selfVC specialVC:(id )specialVC;

//pop到根视图
+ (void)popToRootVC:(UIViewController *)selfVC;

//获取当前屏幕显示的视图
+ (UIViewController *)getCurrVC;
//获取当前屏幕中present出来的viewcontroller
+ (UIViewController *)getPresentedVC;

@end

NS_ASSUME_NONNULL_END
