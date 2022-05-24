//
//  YLZLocalData+Store.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZLocalData+Store.h"

static NSString *kHSAAppLaunchFileData = @"hsaAppLaunchFileData";

static NSString *kHSAUmengOperate = @"hsaUmengOperate";

static NSString *kHSANeedFirstSetPwdType = @"hsaNeedFirstSetPwdType";

static NSString *kHSACertDateFlag = @"hsaCertDateFlag";

@implementation YLZLocalData (Store)

/**
 *  存闪屏页后台下发的fileUrl转成NSData -> base64String
 */

+ (void)saveLaunchFileData:(NSData *)launchFileData {
    [self setObject:launchFileData forKey:kHSAAppLaunchFileData];
};

+ (NSData *)launchFileData {
    return [self objectForKey:kHSAAppLaunchFileData];
};

/**
 *  在App杀死的情况下，用户点击了U盟通知进来，此操作不能和app闪屏页共存:
 */
+ (void)saveUmengOperate:(BOOL )umengOperate {
    [self setObject:@(umengOperate) forKey:kHSAUmengOperate];
};

+ (BOOL )umengOperate {
    BOOL umengOperate = [self boolForKey:kHSAUmengOperate];
    return umengOperate;
};

/**
 *  存是否设置了账户&&密码类型:
 */
+ (void)saveNeedFirstSetPwdType:(NSInteger )pwdFlag {
    [self setObject:@(pwdFlag) forKey:kHSANeedFirstSetPwdType];
};

+ (NSInteger )needFirstSetPwdType {
    NSInteger pwdFlag = [self integerForKey:kHSANeedFirstSetPwdType];
    return pwdFlag;
};


+ (void)saveCertDateFlag:(NSString *)certDateFlag {
    [self setObject:certDateFlag forKey:kHSACertDateFlag];
};

+ (NSString *)certDateFlag {
    return [self objectForKey:kHSACertDateFlag];
};


@end
