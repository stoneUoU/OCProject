//
//  UIViewController+YLZChange.m
//  YLZ-BottomModule-iOS
//
//  Created by stone on 2020/4/18.
//

#import "UIViewController+YLZChange.h"
#import <objc/runtime.h>

@implementation UIViewController (YLZChange)

+ (void)load {
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method viewDidLoadMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method swizzlingViewDidLoadMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(swizzlingViewDidLoad), method_getImplementation(swizzlingViewDidLoadMethod), method_getTypeEncoding(swizzlingViewDidLoadMethod))) {
        method_exchangeImplementations(viewDidLoadMethod, swizzlingViewDidLoadMethod);
    }
    
    
    // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
    Method viewWillAppearMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    Method swizzlingViewWillAppearMethod = class_getInstanceMethod([self class], @selector(swizzlingViewWillAppear:));
    /**
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
     */
    if (!class_addMethod([self class], @selector(swizzlingViewWillAppear:), method_getImplementation(swizzlingViewWillAppearMethod), method_getTypeEncoding(swizzlingViewWillAppearMethod))) {
        method_exchangeImplementations(viewWillAppearMethod, swizzlingViewWillAppearMethod);
    }
}

// 我们自己实现的方法，也就是和self的viewDidLoad方法进行交换的方法。
- (void)swizzlingViewDidLoad {
    
//    @weakify(self);
//    [self addColorChangedBlock:^{
//        @strongify(self);
////        self.view.nightBackgroundColor = YLZColorDarkBackGround;
//    }];
    
    [self swizzlingViewDidLoad];
}

// 我们自己实现的方法，也就是和self的viewDidLoad方法进行交换的方法。
- (void)swizzlingViewWillAppear:(BOOL)animated {
    
    [self swizzlingViewWillAppear:animated];
    NSString *str = [NSString stringWithFormat:@"%@", self.class];
    // 我们在这里加一个判断，将系统的UIViewController的对象剔除掉
    if(![str containsString:@"UI"]){
        STLog(@"统计打点 : %@", self.class);
    }
}

@end
