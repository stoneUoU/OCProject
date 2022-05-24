//
//  YLZPageHelper.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef DEBUG
#   define PMLOG(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

#define PMLOG(...)

#endif

@interface YLZPageHelper : NSObject

// Current view controller showing on the screen
@property (weak, nonatomic) UIViewController *currentViewController;
@property (weak, nonatomic) UIViewController *currentLoadedViewController;

@property (strong, nonatomic) NSString *baseViewControllerClassName;
@property (strong, nonatomic) NSString *errorViewControllerClassName;

+ (instancetype)sharedInstance;

- (UIViewController*)pushViewController:(NSString *)viewControllerName;
- (UIViewController*)pushViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param;
- (UIViewController*)pushViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param animated:(BOOL)animated;


- (UIViewController*)popViewControllerWithParam:(NSDictionary*)param;
- (NSArray*)popToViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param;

- (NSArray*)popToLastViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param;


- (NSArray *)popToRootViewController:(NSDictionary *)param;
- (NSArray *)popToRootViewController:(NSDictionary *)param animated:(BOOL)animated;
- (UIViewController*)getCurrentShowViewController;

//..xiehx begin
- (void)popThenPushViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param animated:(BOOL)animated;

- (void)popToRootThenPushViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param animated:(BOOL)animated;

/*Discussion:
 1,The navigation pop to the nearest viewController whose className isEqual to popToViewControllerName. That means if there's two viewControllers in the navigation. it will pop to the one whose index is bigger in the navigation's viewControllers.
 2,if there's no viewController that it's class isEqual to popToViewControllerName. the method won't pop any viewController but will push newViewController.
 */
- (void)popToViewControllerThenPushViewController:(NSString *)popToViewControllerName
                                  pushedViewController:(NSString *)pushedViewControllerName
                                             withParam:(NSDictionary *)param
                                              animated:(BOOL)animated;
- (void)popCtrlsThenPushWithName:(NSArray *)popedViewControllers
              pushedViewCtrlName:(NSString *)pushedViewCtrlName
                           param:(NSDictionary *)param
                        animated:(BOOL)animated;
- (void)popCtrlsThenPushCtrls:(NSArray *)popedViewControllers
         pushedViewController:(NSArray *)pushedViewControllers
                     animated:(BOOL)animated;

//..xiehx end

- (UIViewController *)createViewControllerFromName:(NSString *)name param:(NSDictionary *)param;
- (NSString*)nibFileName:(Class)theClass;

- (void)presentViewController:(NSString *)viewControllerName;
- (void)presentViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param;
- (void)presentViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param inNavigationController:(BOOL)isInNavigationController;
- (void)presentViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param inNavigationController:(BOOL)isInNavigationController animated:(BOOL)animated;

- (void)presentExistingViewController:(UIViewController *)viewController;

- (void)presentExistingViewController:(UIViewController *)viewController withParam:(NSDictionary *)param;

- (void)presentExistingViewController:(UIViewController *)viewController withParam:(NSDictionary *)param animated:(BOOL)animated;

- (void)fadeInViewController:(NSString *)viewControllerName withParam:(NSDictionary *)param;
- (UIViewController *)fadeOutViewControllerWithParam:(NSDictionary *)param;

- (void)pushExistingViewController:(UIViewController *)viewController;
- (void)pushExistingViewController:(UIViewController *)viewController withParam:(NSDictionary *)param;
- (void)pushExistingViewController:(UIViewController *)viewController withParam:(NSDictionary *)param animated:(BOOL)animated;

//present普通视图
- (void)presentToCommVC:(UIViewController *)selfVC destVC:(UIViewController *)destVC animate:(BOOL )animateBool;

//present导航栏视图
- (void)presentToNaviVC:(UIViewController *)selfVC destVC:(UIViewController *)destVC animate:(BOOL )animateBool;

//dissmiss 被present的视图
- (void)dismissCurrVC:(UIViewController *)selfVC animate:(BOOL )animateBool;

//push导航栏视图
- (void)pushToNextVC:(UIViewController *)selfVC destVC:(UIViewController *)destVC;

//pop到前一个视图
- (void)popToPrevVC:(UIViewController *)selfVC;

//pop到特定的视图
- (void)popToSpecialVC:(UIViewController *)selfVC specialVC:(id )specialVC;

//pop到根视图
- (void)popToRootVC:(UIViewController *)selfVC;

//获取当前屏幕显示的视图
- (UIViewController *)getCurrVC;
//获取当前屏幕中present出来的viewcontroller
- (UIViewController *)getPresentedVC;

@end

@interface UINavigationController (popToBeforeClass)
- (void)popToBeforeClass:(Class)theClass animated:(BOOL)animated;
@end

@interface NSArray (YLZPageHelper)

- (NSArray *)filterViewControllersWithClassName:(NSString*)className;
- (NSArray *)filterArrayForRightOfClassName:(NSString *)className containSeparator:(BOOL)containSeparator;

@end

