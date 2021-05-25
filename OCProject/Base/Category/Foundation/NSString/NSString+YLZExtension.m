//
//  NSString+YLZExtension.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import "NSString+YLZExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YLZExtension)

#pragma mark -
#pragma mark - MD5

- (NSString *)ylz_stringFromMD5 {
    if (self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++) {
        [outputString appendFormat:@"%02x", outputBuffer[count]];
    }
    
    return outputString;
}

- (NSString *)ylz_md5HexDigest {
    const char    *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++) {
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash uppercaseString];
}

+ (NSString *)ylz_md5:(NSString *)str {
    const char    *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark -
#pragma mark - Char

- (BOOL)ylz_myContainsString:(NSString *)other {
    if (self == nil) {
        return NO;
    }
    if (![other ylz_isNotEmptyOrNil]) {
        return NO;
    }
    NSRange range = [self rangeOfString:other];
    return range.length != 0;
}

/**
 *  字符串 不 为空字符或者为nil
 *
 *  @return bool
 */
- (BOOL)ylz_isNotEmptyOrNil {
    if (self == nil) {
        return NO;
    }
    return self.length > 0 ? YES : NO;
}

- (BOOL)ylz_hasHttpSceme {
    return [self hasPrefix:@"http:"] || [self hasPrefix:@"https:"];
}

#pragma mark -
#pragma mark - Unicode

+ (NSString *)ylz_stringConvertUnicode:(NSString *)str {
    NSData *data        = [str dataUsingEncoding:NSUnicodeStringEncoding];
    char   *unicodeChar = (char *)[data bytes];
    //1.跳过unicode前面的FF-FE两个字节。
    unicodeChar += 2;
    [self convertToBigEndian:unicodeChar Length:data.length-2];
    return [self httpUrlEncode:unicodeChar Length:data.length-2];
}

+ (void)convertToBigEndian:(char *)src Length:(int)len {
    if (len%2 != 0) {
        return;
    }
    char tmp;
    for (int i = 0; i < len; i += 2) {
        tmp      = src [i];
        src[i]   = src[i+1];
        src[i+1] = tmp;
    }
}

+ (NSString *)httpUrlEncode:(char *)srcUrl Length:(int)len {
    
    if (len == 0) {
        return @"";
    }
    NSString *buf = @"";
    for (int i = 0; i < len; i++) {
        char oneChar = srcUrl[i];
        buf = [buf stringByAppendingString:[self urlEncodeFormat:oneChar]];
        if (i != len-1) {
            buf = [buf stringByAppendingString:@","];
        }
    }
    
    return buf;
}

+ (NSString *)urlEncodeFormat:(u_char)cValue {
    NSString *buf = @"";
    
    uint nDiv = cValue/16;
    uint nMod = cValue%16;
    
    buf = [buf stringByAppendingString:[self decimalToHexString:nDiv]];
    buf = [buf stringByAppendingString:[self decimalToHexString:nMod]];
    return buf;
}

+ (NSString *)decimalToHexString:(u_char)nValue {
    NSString *tmp = @"";
    switch (nValue) {
        case 0: tmp  = @"0"; break;
        case 1: tmp  = @"1"; break;
        case 2: tmp  = @"2"; break;
        case 3: tmp  = @"3"; break;
        case 4: tmp  = @"4"; break;
        case 5: tmp  = @"5"; break;
        case 6: tmp  = @"6"; break;
        case 7: tmp  = @"7"; break;
        case 8: tmp  = @"8"; break;
        case 9: tmp  = @"9"; break;
        case 10: tmp = @"A"; break;
        case 11: tmp = @"B"; break;
        case 12: tmp = @"C"; break;
        case 13: tmp = @"D"; break;
        case 14: tmp = @"E"; break;
        case 15: tmp = @"F"; break;
        default: tmp = @"X";
            break;
    }
    return tmp;
}

+ (NSString *)ylz_urlencodeString:(NSString *)str {
    NSString       *charactersToEscape = @"?!@#$^&%*~_+-,:.;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters  = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    return [str stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
}

#pragma mark - Remove Emoji

- (BOOL)isEmoji {
    const unichar high = [self characterAtIndex:0];
    
    // Surrogate pair (U+1D000-1F77F)
    if (0xD800 <= high && high <= 0xDBFF) {
        const unichar low       = [self characterAtIndex:1];
        const int     codepoint = ((high - 0xD800) * 0x400) + (low - 0xDC00) + 0x10000;
        
        return (0x1D000 <= codepoint && codepoint <= 0x1F9FF);
        
        // Not surrogate pair (U+2100-27BF)
    } else {
        return (0x2100 <= high && high <= 0x27BF);
    }
}

- (BOOL)ylz_isIncludingEmoji {
    BOOL __block result = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              if ([substring isEmoji]) {
                                  *stop = YES;
                                  result = YES;
                              }
                          }];
    
    return result;
}

- (instancetype)ylz_stringByRemovingEmoji {
    NSMutableString *__block buffer = [NSMutableString stringWithCapacity:[self length]];
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                              [buffer appendString:([substring isEmoji]) ? @"" : substring];
                          }];
    
    return buffer;
}

#pragma mark -
#pragma mark String Function
- (NSString *)ylz_trimString {
    NSString *cleanString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return cleanString;
}

- (NSString *)ylz_cleanSpace {
    NSString       *result         = @"";
    NSCharacterSet *whitespaces    = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSPredicate    *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    
    NSArray *parts         = [self componentsSeparatedByCharactersInSet:whitespaces];
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
    result = [filteredArray componentsJoinedByString:@""];
    return result;
}

- (BOOL)ylz_containsString:(NSString *)string
                  options:(NSStringCompareOptions)options {
    NSRange rng = [self rangeOfString:string options:options];
    return rng.location != NSNotFound;
}

- (BOOL)ylz_containsString:(NSString *)string {
    return [self ylz_containsString:string options:0];
}

- (CGSize)ylz_textSizeWithContentSize:(CGSize)size font:(UIFont *)font {
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
}

- (CGFloat)ylz_textHeightWithContentWidth:(CGFloat)width font:(UIFont *)font {
    CGSize size = CGSizeMake(width, MAXFLOAT);
    return ceilf([self ylz_textSizeWithContentSize:size font:font].height);
}

- (CGFloat)ylz_textWidthWithContentHeight:(CGFloat)height font:(UIFont *)font {
    CGSize size = CGSizeMake(MAXFLOAT, height);
    return ceilf([self ylz_textSizeWithContentSize:size font:font].width);
}

+ (NSString *)ylz_intString:(NSInteger)i {
    return [NSString stringWithFormat:@"%ld", (long)i];
}


/**
 * 判断是否为空
 */
+ (BOOL)ylz_isBlank:(NSString *)string {
    
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
}

/**
 *  返回随机字符串
 */
+ (NSString *)ylz_randomStringWithLength:(NSUInteger)length
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *s = [NSMutableString stringWithCapacity:length];
    for (NSUInteger i = 0; i < length; i++) {
        u_int32_t r = arc4random() % [letters length];
        unichar c = [letters characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return s.copy;
}

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)ylz_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    CGSize size= [self ylz_sizeWithFont:font constrainedToWidth:width];
    return size.height;
}

/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)ylz_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height
{
    CGSize size= [self ylz_sizeWithFont:font constrainedToHeight:height];
    return size.width;
}

/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGSize)ylz_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width
{
    NSDictionary *attr=@{NSFontAttributeName:font};
    CGSize size=[self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    return size;
}

/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGSize)ylz_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height
{
    NSDictionary *attr=@{NSFontAttributeName:font};
    CGSize size=[self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    return size;
}

/**
 *  掩饰;掩藏；脱敏字符串
 * 姓名脱敏:前一*、前一*后一
 * 身份证号 || 手机号 || 社保卡号 || 营业执照 前三后四
 */
- (NSString *)ylz_mask
{
    if (self.length <= 0) {
        return self;
    }
    
    NSInteger pre = self.length > 7 ? 3 : 1;
    NSInteger len = self.length > 7 ? (self.length - 7) : (self.length > 2 ? (self.length - 2) : self.length - 1);
    
    NSMutableString *resultStr= [NSMutableString stringWithString:self];
    NSMutableString * maskStr = [NSMutableString string];
    for (int i =0; i < len; i++) {
        [maskStr appendString:@"*"];
    }
    [resultStr replaceCharactersInRange:NSMakeRange(pre,len) withString:maskStr];
    
    return resultStr;
}

+ (NSInteger )ylz_randomNumber:(int )fromIndex endIndex:(int )endIndex {
    
    return (int)(fromIndex + (arc4random() % (endIndex - fromIndex + 1)));
}

/**
 *  根据出生日期计算年龄
 */
- (NSString *)ylz_calculateAgeStr {
    
    if (self.length < 14) {
        return @"";
    }
    
    NSMutableString *resultStr = [NSMutableString stringWithCapacity:0];
    NSString *dateStr = [self substringWithRange:NSMakeRange(6, 8)];
    NSString  *year = [dateStr substringWithRange:NSMakeRange(0, 4)];
    NSString  *month = [dateStr substringWithRange:NSMakeRange(4, 2)];
    NSString  *day = [dateStr substringWithRange:NSMakeRange(6,2)];
    
    [resultStr appendString:year];
    [resultStr appendString:@"-"];
    [resultStr appendString:month];
    [resultStr appendString:@"-"];
    [resultStr appendString:day];
    
    //截取身份证的出生日期并转换为日期格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [formatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    NSDate *birthDate =  [formatter dateFromString:resultStr];
    
    // 计算年龄
    NSString *totalStr = [self ylz_dateToDetailOld:birthDate];
    NSRange range = [totalStr rangeOfString:@"年"];
    if (range.location != NSNotFound) {
        NSString *ageStr = [totalStr substringToIndex:range.location];
        return ageStr;
    } else {
        return @"0";
    }
}

- (NSString *)ylz_dateToDetailOld:(NSDate *)bornDate {
    //获得当前系统时间
    NSDate *currentDate = [NSDate date];
    //创建日历(格里高利历)
    NSCalendar *calendar = [NSCalendar currentCalendar];
    //设置component的组成部分
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ;
    //按照组成部分格式计算出生日期与现在时间的时间间隔
    NSDateComponents *date = [calendar components:unitFlags fromDate:bornDate toDate:currentDate options:0];
    //判断年龄大小,以确定返回格式
    if ([date year] > 0) {
        return [NSString stringWithFormat:(@"%ld年%ld月%ld天"),(long)[date year],(long)[date month],(long)[date day]];
    } else if([date month] >0) {
        return [NSString stringWithFormat:(@"%ld月%ld天"),(long)[date month],(long)[date day]];
    } else if([date day]>0) {
        return [NSString stringWithFormat:(@"%ld天"),(long)[date day]];
    } else {
        return @"0天";
    }
}


@end



