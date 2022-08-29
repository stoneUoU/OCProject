//
//  YLZ3DESEncryptHelper
//  3DES研究
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface YLZ3DESEncryptHelper : NSObject

/**字符串加密 */
+ (NSString *)doEncryptStr:(NSString *)originalStr withEncryptKey:(NSString *)encryptKey withEncryptIv:(NSString *)encryptIv;

/**字符串解密 */
+ (NSString*)doDecEncryptStr:(NSString *)encryptStr withEncryptKey:(NSString *)encryptKey withEncryptIv:(NSString *)encryptIv;

/**十六进制解密 */
+ (NSString *)doEncryptHex:(NSString *)originalStr withEncryptKey:(NSString *)encryptKey withEncryptIv:(NSString *)encryptIv;

/**十六进制加密 */
+ (NSString*)doDecEncryptHex:(NSString *)encryptStr withEncryptKey:(NSString *)encryptKey withEncryptIv:(NSString *)encryptIv;

+ (NSString *)encryptWithText:(NSString *)sText;

+ (NSString *)decryptWithText:(NSString *)sText;

@end
