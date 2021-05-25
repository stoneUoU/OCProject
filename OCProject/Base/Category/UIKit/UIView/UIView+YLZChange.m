//
//  UIView+YLZChange.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/30.
//

#import "UIView+YLZChange.h"
#import <objc/runtime.h>

#import "YLZFont.h"
#import <YYKit/YYKit.h>

#define YLZColorWhite           [UIColor whiteColor]
#define YLZColorBlueView        [UIColor colorWithHexString:@"1B65B9"]

@implementation UIView (YLZChange)

+ (void)load {
    //方法交换应该被保证，在程序中只会执行一次
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        //获得viewController的生命周期方法的selector
        SEL systemSel = @selector(setNeedsLayout);
        //自己实现的将要被交换的方法的selector
        SEL swizzSel = @selector(ylz_setNeedsLayout);
        //两个方法的Method
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (isAdd) {
            //如果成功，说明类中不存在这个方法的实现
            //将被交换方法的实现替换到这个并不存在的实现
            class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        } else {
            //否则，交换两个方法的实现
            method_exchangeImplementations(systemMethod, swizzMethod);
        }
    });
}

- (void)ylz_setNeedsLayout {
    
    [self ylz_setNeedsLayout];
    NSArray *views = self.subviews;
    for (UIView *view in views) {
        if ([view isKindOfClass:[UILabel class]]) {
            UILabel *label=(UILabel *)view;
            if (label.text.length>0 && [[label text] isEqualToString:@"人脸识别认证"] && (int )label.font.pointSize == 18) {
                label.textColor = YLZColorWhite;
                label.font = [YLZFont medium:17];
                label.superview.backgroundColor = YLZColorBlueView;
                NSArray *labelSuperview = label.superview.subviews;
                for (UIView *view in labelSuperview) {
                    if ([view isKindOfClass:[UIButton class]]) {
                        UIButton *uiButton=(UIButton *)view;
                        [uiButton setImage:[UIImage imageNamed:@"ylz_back_white"] forState:UIControlStateNormal];
                    }
                }
            }
        }
    }
}

@end
