//
//  YLZFormat.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "YLZFormat.h"

@implementation YLZFormat

//设置带有图片的富文本
+ (NSAttributedString *)strWithUIImage:(NSString *) contentStr andImage:(NSString *) imageStr andBounds:(CGRect ) rects {
    // 创建一个富文本
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    /**
     添加图片到指定的位置
     */
    NSTextAttachment *attchImage = [[NSTextAttachment alloc] init];
    // 表情图片
    attchImage.image = [UIImage imageNamed:imageStr];
    // 设置图片大小
    attchImage.bounds = rects;
    NSAttributedString *stringImage = [NSAttributedString attributedStringWithAttachment:attchImage];
    [attriStr insertAttributedString:stringImage atIndex:0];

    return attriStr;
}
//合计￥68.00  合计的颜色:startIdxC   合计的字体大小:startIdxSize  ￥的颜色:$C   ￥的字体大小:$Size  startIdx,length 变小范围
+ (NSAttributedString *)strWithSymbolsS:(NSString *) contentStr andStartIdxC:(UIColor *)startIdxC   andStartIdxSize:(UIFont *)startIdxSize and$C:(UIColor *)$C and$Size:(UIFont *)$Size andStartIdx:(NSInteger )startIdx andlength:(NSInteger )length{
    // 创建一个富文本  andSymbolsC的颜色
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:contentStr];
    [attriStr addAttribute:NSForegroundColorAttributeName value:startIdxC range:NSMakeRange(0, startIdx)];
    [attriStr addAttribute:NSForegroundColorAttributeName value:$C range:NSMakeRange(startIdx, length)];
    [attriStr addAttribute:NSForegroundColorAttributeName value:$C range:NSMakeRange(startIdx, contentStr.length - startIdx)];
    [attriStr addAttribute:NSFontAttributeName value:$Size range:NSMakeRange(startIdx, length)];
    [attriStr addAttribute:NSFontAttributeName value:startIdxSize range:NSMakeRange(0, startIdx)];
    return attriStr;
}

+ (NSAttributedString *)strWithSymbolsSingleLine:(NSString *) contentStr andSymbolsC:(UIColor *)symbolsC and$Size:(UIFont *)$Size andStartIdx:(NSInteger )startIdx andlength:(NSInteger )length{
    // 创建一个富文本  andSymbolsC的颜色
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:contentStr attributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle], NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)}];
    [attriStr addAttribute:NSForegroundColorAttributeName value:symbolsC range:NSMakeRange(startIdx, length)];
    [attriStr addAttribute:NSFontAttributeName value:$Size range:NSMakeRange(startIdx, length)];
    [attriStr addAttribute:NSFontAttributeName value:$Size range:NSMakeRange(startIdx, length)];
    return attriStr;
}
//设置正则匹配数字
+ (NSAttributedString *)strWithNumberFont:(NSString *) contentStr{
    //首选初始化对象，正则表达式选取0到9的数字范围

    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^0-9]" options:0 error:nil];

    //获取查询结果，得到的数组里面有一行文本中数字的范围

    NSArray *numArr = [regex matchesInString:contentStr options:0 range:NSMakeRange(0, [contentStr length])];

    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:contentStr attributes:@{NSForegroundColorAttributeName:YLZColorBlue}];

    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0,[contentStr length])];

    //循环找到数字的范围用富文本来给这行文本赋值

    for (NSTextCheckingResult *attirbute in numArr) {
        [attributedStr setAttributes:@{NSForegroundColorAttributeName:YLZColorTitleOne} range:attirbute.range];
    }
    return attributedStr;
}
//计算时间差
+ (NSString *)caluTimerDiffer:(NSString *) startTimer andStopTimer:(NSString *) stopTimer{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //计算时间间隔（单位是秒）
    NSTimeInterval time = [[dateFormatter dateFromString:stopTimer] timeIntervalSinceDate:[dateFormatter dateFromString:startTimer]];
    return [[NSString alloc] initWithFormat:@"%i",(int)time];
}

+(NSString *)retainPoint:(NSString *)format floatV:(double)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV/100]];
}

+ (NSDate *)strToDate:(NSString *)dateString withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];

    NSDate *date = [dateFormatter dateFromString:dateString];
    return [YLZFormat worldTimeToChina:date];
}

+ (NSString *)dateToStr:(NSDate *)dateString withDateFormat:(NSString *)format
{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSString *returnStr = [dateFormatter stringFromDate:date];
    return returnStr;
}
+ (NSDate *)worldTimeToChina:(NSDate *)date
{
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:date];
    NSDate *localeDate = [date  dateByAddingTimeInterval:interval];
    return localeDate;
}

+ (NSString *)formatTimer:(NSString *)timeStr{
    NSDate * mydate = [YLZFormat strToDate:timeStr withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSString *returnStr = [dateFormatter stringFromDate:mydate];
    return [returnStr substringWithRange:NSMakeRange(5,12)];
};

+(NSString *)caluSuperTimer:(NSString *)timeStr{
    NSDate * mydate = [YLZFormat strToDate:timeStr withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDateComponents *comps = nil;
    //comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:0];
    [adcomps setDay:7];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    return [beforDate substringWithRange:NSMakeRange(5,6)];
}

+(NSString *)caluFiftheenMin:(NSString *)timeStr{
    NSDate * mydate = [YLZFormat strToDate:timeStr withDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDateComponents *comps = nil;
    //comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setMinute:15];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    NSString *returnStr = [dateFormatter stringFromDate:newdate];
    return returnStr;
}


@end
