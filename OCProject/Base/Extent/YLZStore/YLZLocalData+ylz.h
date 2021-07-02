//
//  YLZLocalData+ylz.h
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZLocalData.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLZLocalData (ylz)

/**
 *  存闪屏页后台下发的fileUrl转成NSData
 */
+ (void)saveLaunchFileData:(NSData *)launchFileData;

+ (NSData *)launchFileData;

/**
 *  在App杀死的情况下，用户点击了U盟通知进来，此操作不能和app闪屏页共存:
 */
+ (void)saveUmengOperate:(BOOL )umengOperate;

+ (BOOL )umengOperate;

/**
 *  存是否设置了账户&&密码类型:
 */
+ (void)saveNeedFirstSetPwdType:(NSInteger )pwdFlag;

+ (NSInteger )needFirstSetPwdType;

/**
 *  certDateFlag：0或者空不用补充，1需要补充
 */
+ (void)saveCertDateFlag:(NSString *)certDateFlag;

+ (NSString *)certDateFlag;

@end

NS_ASSUME_NONNULL_END
