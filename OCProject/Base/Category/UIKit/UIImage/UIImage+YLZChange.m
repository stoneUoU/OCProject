//
//  UIImage+YLZChange.m
//  GCDTest
//
//  Created by test on 2018/6/25.
//  Copyright © 2018年 com.youlu. All rights reserved.
//

#import "UIImage+YLZChange.h"
#import <objc/runtime.h>
@implementation UIImage(YLZChange)

+ (void)load {
    Method m1 = class_getClassMethod([self class], @selector(imageNamed:));
    Method m2 = class_getClassMethod([self class], @selector(ylz_imageNamed:));
    method_exchangeImplementations(m1, m2);
}

+ (UIImage *)ylz_imageNamed:(NSString *)name {
    //凭实力自定义社保卡sdk的导航栏：  ----modify:林磊   2020-04-29
    if ([name isEqualToString:@"EsscResource.bundle/关闭"]) {
        return [UIImage ylz_imageNamed:@"ylz_close_black"];
    } else if ([name isEqualToString:@"EsscResource.bundle/返回"]) {
        return [UIImage ylz_imageNamed:@"ylz_back_black"];
    }
    return [UIImage ylz_imageNamed:name];
}


@end

