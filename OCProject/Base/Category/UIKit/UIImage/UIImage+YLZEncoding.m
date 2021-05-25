//
//  UIImage+YLZEncoding.m
//  YLZ-Kit-iOS
//
//  Created by xiecj1 on 2019/10/25.
//

#import "UIImage+YLZEncoding.h"

@implementation UIImage (YLZEncoding)

+ (UIImage *)ylz_imageWithBase64String:(NSString *)base64String {
    NSURL *url = [NSURL URLWithString:base64String];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}

@end
