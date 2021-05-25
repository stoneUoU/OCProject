//
//  NSError+YLZMS.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/12/3.
//

#import "NSError+YLZMS.h"

/// 请求错误时 error.userInfo[kHECNetworkErrorMsg] 取出错误信息
static NSString *const kYLZMSNetworkErrorMsg = @"hsa.network.request.errorMsg";

@implementation NSError (YLZMS)

- (NSString *)message
{
    NSString *msg = nil;
    if (self.userInfo) {
        for (NSString *key in self.userInfo.allKeys) {
            if ([key rangeOfString:kYLZMSNetworkErrorMsg].location != NSNotFound) {
                msg = [self.userInfo objectForKey:key];
                break;
            }
        }
    }
    if (!msg) {
        if (self.localizedFailureReason) {
            msg = self.localizedFailureReason;
        }else{
            msg = self.localizedDescription;
        }
    }
    return msg;
}

@end
