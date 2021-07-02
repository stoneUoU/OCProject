//
//  YLZUserBaseInfo.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import <Foundation/Foundation.h>
#import "YLZBaseDefaults.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YLZUserCertState) {
    /// 未实名
    YLZUserCertStateNone = 0,
    /// 实名
    YLZUserCertStateRealName,
    /// 实人
    YLZUserCertStateRealPerson,
};

@interface YLZUserBaseInfo : YLZBaseDefaults

+ (instancetype)baseInfo;

/// 访问令牌
@property (nonatomic, copy) NSString *accessToken;

/// 用于刷新 token
@property (nonatomic, copy) NSString *refreshToken;

/// 推送 token, 需要在登录时加进来
@property (nonatomic, copy) NSString *deviceToken;

/// 账号 id
@property (nonatomic, copy) NSString *accountId;

///手机号
@property (nonatomic, copy) NSString *mobile;

/// 手机号或各种证件号
@property (nonatomic, copy) NSString *account;

//脱敏手机号：
@property (nonatomic, copy) NSString *desenMmobile;

/// 用户来源类型 个人 ，单位'
@property (nonatomic, copy) NSString *userSourceType;

/// 账号状态
@property (nonatomic, copy) NSString *accountStatus;

/// 注册渠道
@property (nonatomic, copy) NSString *registeredChannel;

/// 昵称
@property (nonatomic, copy) NSString *nickname;

/// 描述
@property (nonatomic, copy) NSString *describe;

/// 头像
@property (nonatomic, copy) NSString *icon;

/// 国籍
@property (nonatomic, copy) NSString *ntly;

///（香港特区护照/港澳居民来往内地通行证 04），（澳门特区护照/港澳居民来往内地通行证05），（台湾居民来往大陆通行证06，外国人永久居留证07） ，（居民身份证（户口簿）01）
@property (nonatomic, copy) NSString *certType;

///新的认证状态:
@property (nonatomic, copy) NSString *crtfState;

/// 姓名
@property (nonatomic, copy) NSString *name;

/// 脱敏姓名
@property (nonatomic, copy) NSString *desenName;

/// 证件号码
@property (nonatomic, copy) NSString *certNo;

/// 脱敏证件号码
@property (nonatomic, copy) NSString *desenCertNo;

/// 个人id
@property (nonatomic, copy) NSString *psnId;

///手机号
@property (nonatomic, copy) NSString *tel;

/// 居住地址
@property (nonatomic, copy) NSString *resdAddr;

/// 出生年月
@property (nonatomic, copy) NSString *brdy;

/// 民族
@property (nonatomic, copy) NSString *naty;

/// 性别
@property (nonatomic, copy) NSString *gend;

- (void)updateWithInfo:(NSDictionary *)info;

/// 用户实名/实人状态
- (YLZUserCertState)certState;

@end

NS_ASSUME_NONNULL_END
