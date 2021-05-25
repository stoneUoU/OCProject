//
//  NSString+YLZExtension.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLZExtension)

#pragma mark - MD5
#pragma mark -

/**
 字符串MD5加密
 
 @return 加密后的字符串
 */
- (NSString *)ylz_stringFromMD5;

/**
 字符串转16进制
 
 @return 转16进制后的字符串
 */
- (NSString *)ylz_md5HexDigest;

/**
 指定字符串MD5加密
 
 @param str 要加密的字符串
 @return 加密后的字符串
 */
+ (NSString *)ylz_md5:(NSString *)str;

#pragma mark - Char
#pragma mark -

/**
 字符串是否包含另外一个字符串
 
 @param other 另外一个字符串
 @return YES/NO
 */
- (BOOL)ylz_myContainsString:(NSString *)other;

/**
 字符串是否为空
 
 @return YES/NO
 */
- (BOOL)ylz_isNotEmptyOrNil;

/**
 字符串是否包含http/https
 
 @return YES/NO
 */
- (BOOL)ylz_hasHttpSceme;

#pragma mark - Unicode
#pragma mark -

+ (NSString *)ylz_stringConvertUnicode:(NSString *)str;

+ (NSString *)ylz_urlencodeString:(NSString *)str;

#pragma mark - Emoji
#pragma mark -

/**
 是否包含Emoji
 
 @return YES/NO
 */
- (BOOL)ylz_isIncludingEmoji;

/**
 移除Emoji
 
 @return YES/NO
 */
- (instancetype)ylz_stringByRemovingEmoji;

#pragma mark -
#pragma mark String Function

-(NSString *)ylz_trimString;

-(NSString *)ylz_cleanSpace;

#pragma mark - 字符串的比较
/**
 *  是否包含字符串
 *
 *  @param string  查找
 *  @param options options
 *
 *  @return bool
 */
- (BOOL)ylz_containsString:(NSString *)string options:(NSStringCompareOptions)options;
/**
 *  是否包含字符串
 *
 *  @param string 查找
 *
 *  @return bool
 */
- (BOOL)ylz_containsString:(NSString *)string;

/**
 *  @brief 根据字数的不同,返回UILabel中的text文字需要占用多少Size
 *  @param size 约束的尺寸
 *  @param font 文本字体
 *  @return 文本的实际尺寸
 */
- (CGSize)ylz_textSizeWithContentSize:(CGSize)size font:(UIFont *)font;

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param width 宽度约束
 *  @param font  文本字体
 *  @return 文本的实际高度
 */
- (CGFloat)ylz_textHeightWithContentWidth:(CGFloat)width font:(UIFont *)font;

/**
 *  @brief  根据文本字数/文本宽度约束/文本字体 求得text的Size
 *  @param height 宽度约束
 *  @param font  文本字体
 *  @return 文本的实际长度
 */
- (CGFloat)ylz_textWidthWithContentHeight:(CGFloat)height font:(UIFont *)font;

/**
 *  int转string
 *  @param  i   int
 */
+ (NSString *)ylz_intString:(NSInteger)i;

/**
 * 判断是否为空
 */
+ (BOOL)ylz_isBlank:(NSString *)str;

/**
 *  返回随机字符串
 */
+ (NSString *)ylz_randomStringWithLength:(NSUInteger)length;

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)ylz_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)ylz_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGSize)ylz_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGSize)ylz_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  掩饰;掩藏；脱敏字符串
 */
- (NSString *)ylz_mask;

/**
 *  返回随机数字
 */
+ (NSInteger )ylz_randomNumber:(int )fromIndex endIndex:(int )endIndex;

/**
 *  根据出生日期计算年龄
 */
- (NSString *)ylz_calculateAgeStr;

@end

NS_ASSUME_NONNULL_END
