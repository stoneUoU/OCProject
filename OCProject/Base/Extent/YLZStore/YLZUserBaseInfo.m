//
//  YLZUserBaseInfo.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZUserBaseInfo.h"
#import <YYKit/NSObject+YYModel.h>

static NSString *const kYLZDeviceToken = @"com.ylz.devicetoken";

@implementation YLZUserBaseInfo

+ (instancetype)baseInfo {
    return [YLZUserBaseInfo standardDefaults];
}

- (void)updateWithInfo:(NSDictionary *)info {
    if (![info isKindOfClass:[NSDictionary class]]) {
        return;
    }
    [self modelSetWithDictionary: info];
}

- (void)setDeviceToken:(NSString *)deviceToken {
    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:kYLZDeviceToken];
}

- (NSString *)deviceToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kYLZDeviceToken];
}

- (BOOL)usingCustomDefaults {
    return YES;
}

- (YLZUserCertState)certState {
    if (![self.crtfState isKindOfClass:[NSString class]]) {
        return YLZUserCertStateNone;
    }
    NSInteger value = [self.crtfState integerValue];
    if (value == 0) {
        return YLZUserCertStateNone;
    } else if (value == 1) {
        return YLZUserCertStateRealPerson;
    } else if (value == 2) {
        return YLZUserCertStateRealName;
    }
    return YLZUserCertStateNone;
}

@end

