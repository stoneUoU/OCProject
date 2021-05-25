//
//  UIButton+YLZExtension.m
//  CommerceBaseModule
//
//  Created by yuan on 2019/6/27.
//

#import "UIButton+YLZExtension.h"

@implementation UIButton (YLZExtension)

#pragma mark - 修改布局
- (void)setButtonEdgeInsetsStyle:(UIButtonEdgeInsetsStyle)style margin:(CGFloat)margin {
    
    CGSize imageSize = self.imageView.intrinsicContentSize;
    CGSize titleSize = self.titleLabel.intrinsicContentSize;
    CGSize selfSize = self.bounds.size;
    CGFloat halfMargin = margin*0.5;
    //如果没有文字/图片的时候不做处理
    if (imageSize.width == 0 || titleSize.width == 0) return;
    
    CGFloat widthErr = (imageSize.width + titleSize.width - selfSize.width);
    if (widthErr < - margin - 3) {
        widthErr = 0;
    }
    switch (style) {
        case UIButtonEdgeInsetsStyleTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-titleSize.height*0.5 - halfMargin, titleSize.width * 0.5 + widthErr, titleSize.height*0.5 + halfMargin, -titleSize.width * 0.5 - widthErr);
            self.titleEdgeInsets = UIEdgeInsetsMake(imageSize.height*0.5 + halfMargin, -imageSize.width, -imageSize.height*0.5 - halfMargin, 0);
            break;
            
        case UIButtonEdgeInsetsStyleLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, margin, 0, 0);
            break;
            
        case UIButtonEdgeInsetsStyleBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(titleSize.height*0.5 + halfMargin, titleSize.width * 0.5 + widthErr, -titleSize.height*0.5 - halfMargin, -titleSize.width * 0.5 - widthErr);
            self.titleEdgeInsets = UIEdgeInsetsMake(-imageSize.height*0.5 - halfMargin, -imageSize.width, imageSize.height*0.5 + halfMargin, 0);
            break;
            
        case UIButtonEdgeInsetsStyleRight:
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width + margin);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width - widthErr, 0, -titleSize.width + widthErr);
            break;
            
        default:
            break;
    }
    [self.layer setMasksToBounds:YES];
}

#pragma mark - 设置按钮标题
- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitle:highlightTitle forState:UIControlStateHighlighted];
}

- (void)setNormalTitle:(NSString *)normalTitle selectedTitle:(NSString *)selectedTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

- (void)setNormalTitle:(NSString *)normalTitle highlightTitle:(NSString *)highlightTitle selectedTitle:(NSString *)selectedTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
    [self setTitle:highlightTitle forState:UIControlStateHighlighted];
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

#pragma mark - 设置按钮颜色
- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor {
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:highlightColor forState:UIControlStateHighlighted];
}

- (void)setTitleNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

- (void)setTitleNormalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor selectedColor:(UIColor *)selectedColor {
    [self setTitleColor:normalColor forState:UIControlStateNormal];
    [self setTitleColor:highlightColor forState:UIControlStateHighlighted];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

#pragma mark - 设置按钮图片
- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
}

- (void)setImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:selectedImage forState:UIControlStateSelected];
}

- (void)setImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    [self setImage:selectedImage forState:UIControlStateSelected];
}

#pragma mark - 设置按钮背景图片
- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
}

- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

- (void)setBackgroundImageWithNormalImage:(UIImage *)normalImage highlightImage:(UIImage *)highlightImage selectedImage:(UIImage *)selectedImage {
    [self setBackgroundImage:normalImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

@end
