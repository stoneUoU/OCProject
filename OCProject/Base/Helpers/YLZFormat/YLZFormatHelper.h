//
//  YLZFormatHelper.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZFormatHelper : NSObject

//设置带有图片的富文本
+ (NSAttributedString *)strWithUIImage:(NSString *) contentStr andImage:(NSString *) imageStr andBounds:(CGRect ) rects;

//设置符号变小的富文本￥0.01
+ (NSAttributedString *)strWithSymbolsS:(NSString *) contentStr andStartIdxC:(UIColor *)startIdxC  andStartIdxSize:(UIFont *)startIdxSize and$C:(UIColor *)$C and$Size:(UIFont *)$Size andStartIdx:(NSInteger )startIdx andlength:(NSInteger )length;  //NSMakeRange(NSUInteger loc, NSUInteger len)

//设置符号变小的富文本￥0.01  +  中滑线
+ (NSAttributedString *)strWithSymbolsSingleLine:(NSString *) contentStr andSymbolsC:(UIColor *)symbolsC and$Size:(UIFont *)$Size andStartIdx:(NSInteger )startIdx andlength:(NSInteger )length;

//设置正则匹配数字
+ (NSAttributedString *)strWithNumberFont:(NSString *) contentStr;

+ (NSString *)caluTimerDiffer:(NSString *) startTimer andStopTimer:(NSString *) stopTimer;

+ (NSString *)retainPoint:(NSString *)format floatV:(double)floatV;
//字符串转日期格式
+ (NSDate *)strToDate:(NSString *)dateString withDateFormat:(NSString *)format;
//日期格式转字符串
+ (NSString *)dateToStr:(NSDate *)dateString withDateFormat:(NSString *)format;
//将世界时间转化为中国区时间
+ (NSDate *)worldTimeToChina:(NSDate *)date;
//将2018-06-06 09:46:48 转成 06月06日 09:46
+ (NSString *)formatTimer:(NSString *)timeStr;
//将2018-06-06 09:46:48 转成 2018-06-13 09:46:48
+(NSString *)caluSuperTimer:(NSString *)timeStr;
//将2018-06-06 16:41:02 转成 2018-06-06 16:56:02
+(NSString *)caluFiftheenMin:(NSString *)timeStr;

@end

NS_ASSUME_NONNULL_END
