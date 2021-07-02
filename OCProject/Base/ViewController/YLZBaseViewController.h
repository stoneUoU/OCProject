//
//  YLZBaseViewController.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZBaseViewController : UIViewController

- (void)setBaseUI:(UIColor *)navigationViewColor withTitleString:(NSString *)titleString withTitleColor:(UIColor *)titleColor withLeftImageViewString:(NSString *)leftImageViewString withRightString:(NSString *)rightString withRightColor:(UIColor *)rightColor;

@end

NS_ASSUME_NONNULL_END
