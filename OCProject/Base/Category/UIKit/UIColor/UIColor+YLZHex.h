//
//  UIColor+YLZHex.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YLZHex)

+ (UIColor *)ylz_HexStr: (NSString *)hexString;

+ (CGFloat)colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;

+ (UIColor*)ylz_randomColor;

@end

NS_ASSUME_NONNULL_END
