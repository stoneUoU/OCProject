//
//  YLZViewFactory.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZViewFactory : NSObject

//创建UIView
+ (UIView *)createVWithFrame:(CGRect)frame
                       color:(UIColor *)color;

//创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame
                             text:(NSString *)text
                            color:(UIColor *)color
                             font:(UIFont *)font
                    textAlignment:(NSTextAlignment)textAlignment;

//创建UITextField
+ (UITextField *)createTextFieldWithFrame:(CGRect)frame
                              placeholder:(NSString *)placeholder
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                          secureTextEntry:(BOOL)secureTextEntry
                                 delegate:(id)delegate;

//创建UITextView
+ (UITextView *)createTextVWithFrame:(CGRect)frame
                                text:(NSString *)text
                               color:(UIColor *)color
                                font:(UIFont *)font
                       textAlignment:(NSTextAlignment)textAlignment;

//创建UIButton
+ (UIButton *)createBtnWithFrame:(CGRect)frame
                           title:(NSString *)title
                           color:(UIColor *)color
                            font:(UIFont *)font
                          target:(id)target
                          action:(SEL)action;

//创建图片
+ (UIImageView*) createImageVWithFrame:(CGRect)frame
                                 image:(UIImage*)image;



@end

NS_ASSUME_NONNULL_END
