//
//  ISECUtil.h
//  ISECUtil
//
//  Created by illa on 2020/3/3.
//  Copyright © 2020. All rights reserved.
//

/**
 NOTE：
    -   若archive出现非IOS应用，需要将工程bitcode关掉。
 */

#import <Foundation/Foundation.h>

#define ISECUtil_VERSION "v1.0.2f"

/** 错误码
 |注入崩溃码|1025|
 |调试崩溃码|1026|
 |HOOK崩溃|1027|
 */

/** 屏蔽日志功能
 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif  

/** 函数混淆
 */
#ifndef ISECUtil_OBF
#define ISECUtil_OBF
//#define ISECUtil sub_1000003002303
#define antiDbg sub_1000003002304
#define antiDyld sub_1000003003212
#define antiSign sub_1000003008821
#define myexit  sub_1000003008822
#define antiHook    sub_1000003008823
#define antiProxy   sub_1000003008830
#define antiProxyWith   sub_1000003008831
#define antiFrida   sub_1000003008940
#define antiEnv     sub_1000003008953
#define isec_flag   varr_1000003108823


#endif //ISECUtil_OBF

/** 风险标识
 */
#define ISEC_ROOT_FLAG      0x1 << 1    //越狱标识
#define ISEC_DEBUG_FLAG     0x1 << 2    //调试标识
#define ISEC_DYLD_FLAG      0x1 << 3    //注入标识
#define ISEC_SIGN_FLAG      0x1 << 4    //签名标识
#define ISEC_PROXY_FLAG     0x1 << 5    //代理标识
#define ISEC_FRIDA_FLAG     0x1 << 6    //frida标识
#define ISEC_ENV_MOBILE_FLAG    0x1 << 9    //移动环境标识
extern int isec_flag;

/** ISECUtil
*/
@interface ISECUtil : NSObject
+ (void) antiDbg;
+ (void) antiDyld;
+ (void) antiHook :(NSString *)withClass method:(NSString *)method imp:(IMP)imp;
+ (void) antiSign: (NSString *)sign;
+ (void) antiProxy;
+ (void) antiProxyWith:(NSArray *)param;
+ (void) antiFrida;
+ (void) antiEnv;
+ (void) myexit;
- (void)antiScreenShot;  //检测截图
+ (instancetype)instance;
@end
