//
//  UIButton+YLZFixMultiClick.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import "UIButton+YLZFixMultiClick.h"

#import <objc/runtime.h>

@implementation UIButton (YLZFixMultiClick)

// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

- (NSTimeInterval)ylz_acceptEventInterval {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setYlz_acceptEventInterval:(NSTimeInterval)ylz_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(ylz_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)ylz_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setYlz_acceptEventTime:(NSTimeInterval)ylz_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(ylz_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(ylz_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)ylz_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSDate date].timeIntervalSince1970 - self.ylz_acceptEventTime < self.ylz_acceptEventInterval) {
        return;
    }
    
    if (self.ylz_acceptEventInterval > 0) {
        self.ylz_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self ylz_sendAction:action to:target forEvent:event];
}

@end

