//
//  UIImage+YLZEncoding.h
//  YLZ-Kit-iOS
//
//  Created by xiecj1 on 2019/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLZEncoding)

+ (UIImage *)ylz_imageWithBase64String:(NSString *)base64String;

@end

NS_ASSUME_NONNULL_END
