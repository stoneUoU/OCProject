//
//  UIButton+YLZExtension.h
//  CommerceBaseModule
//
//  Created by yuan on 2019/6/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UIButtonEdgeInsetsStyle) {
    UIButtonEdgeInsetsStyleTop,     // image在上，label在下
    UIButtonEdgeInsetsStyleLeft,    // image在左，label在右
    UIButtonEdgeInsetsStyleBottom,  // image在下，label在上
    UIButtonEdgeInsetsStyleRight    // image在右，label在左
};

@interface UIButton (YLZExtension)

/// 设置按钮布局类型
- (void)setButtonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style margin:(CGFloat)margin;

/// 设置按钮标题
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle;
- (void)setNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle;
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle selectedTitle:(NSString *)selectedTitle;

/// 设置按钮颜色
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor;
- (void)setTitleNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor selectedColor:(UIColor *)selectedColor;

/// 设置按钮图片
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;
- (void)setImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage;

/// 设置按钮背景图片
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage;
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage;
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage;


@end

NS_ASSUME_NONNULL_END
