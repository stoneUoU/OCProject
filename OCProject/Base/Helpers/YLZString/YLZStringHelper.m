//
//  YLZStringHelper.m
//  OCProject
//
//  Created by stone on 2022/9/30.
//

#import "YLZStringHelper.h"

@implementation YLZStringHelper

/**
 判断是不是空值
 @return 结果
 */
+ (BOOL)ylz_isNull:(NSString *)str {
    if (str == nil || str == NULL || [str isKindOfClass:[NSNull class]] || [str length] == 0 || [str isEqualToString: @"(null)"] || [str isEqualToString: @"null"]) {
        return YES;
    }
    return NO;
}


@end
