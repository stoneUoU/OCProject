//
//  YLZImageHelper.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/6/16.
//

#import "YLZImageHelper.h"

@implementation YLZImageHelper

//将UIImage 转成 NSData:
+ (NSData*)ylz_getDataFromImage:(UIImage*)image {
    NSData *data;
    /*判断图片是不是png格式的文件*/
    if (UIImagePNGRepresentation(image)) {
        data = UIImagePNGRepresentation(image);
    } else {
        data = UIImageJPEGRepresentation(image,1.0);
    }
    return data;
}

//将UIView 转成 UIImage 使用该方法不会模糊，根据屏幕密度计算
+ (UIImage *)ylz_toConvertViewToImage:(UIView *)view {
    UIImage *imageRet = [[UIImage alloc]init];
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageRet;
}

+ (void)drawLineByImageView:(UIImageView *)imageView withDashColor:(UIColor *)dashColor {
    [imageView layoutIfNeeded];
    UIGraphicsBeginImageContext(imageView.frame.size);   //开始画线 划线的frame
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    //设置线条终点形状
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    CGContextRef line = UIGraphicsGetCurrentContext();
    // 设置颜色
    CGContextSetStrokeColorWithColor(line, dashColor.CGColor);
    CGFloat lengths[] = {5,2};//先画4个点再画2个点
    CGContextSetLineDash(line,0, lengths,2);//注意2(count)的值等于lengths数组的长度
    
    CGContextMoveToPoint(line, 0.0, 2.0);    //开始画线
    CGContextAddLineToPoint(line,imageView.frame.size.width,2.0);
    CGContextStrokePath(line);
    // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
    UIImage *image =   UIGraphicsGetImageFromCurrentImageContext();
    imageView.image = image;
}

+ (UIImage *)ylz_darkImage:(UIImage *)sourceImage {
    int bitmapInfo = kCGImageAlphaPremultipliedLast;
    int width = sourceImage.size.width;
    int height = sourceImage.size.height;

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    CGContextRef context = CGBitmapContextCreate (nil,width,height,8,0,colorSpace,bitmapInfo);
    CGColorSpaceRelease(colorSpace);
    if (context == NULL) {
        return nil;
    }
    CGContextDrawImage(context,CGRectMake(0,0, width, height), sourceImage.CGImage);
    UIImage *grayImage = [UIImage imageWithCGImage:CGBitmapContextCreateImage(context)];
    CGContextRelease(context);
    return grayImage;
}

+ (UIImage *)cutCenterImage:(UIImage *)image left:(NSInteger)left top:(NSInteger)top width:(NSInteger)width height:(NSInteger)height {
    if (left < 0) {
        left = 0;
    }
    if (top < 0) {
        top = 0;
    }
    CGRect rect = CGRectMake(left, top, width, height);
    CGImageRef imageRef = image.CGImage;
    CGImageRef imageRefRect = CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *cutImage = [UIImage imageWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    return cutImage;
}

+ (UIImage *)imageWithOriRenderingImage:(NSString *)imageName {
    if ([imageName containsString:@"http://"] || [imageName containsString:@"https://"]) {
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: imageName]];
        UIImage *image = [UIImage imageWithData: data];
        return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    } else {
        UIImage *image = [UIImage imageNamed:imageName];
        return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

@end
