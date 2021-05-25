//
//  UIImage+YLZCompress.m
//  YLZ-Kit-iOS
//
//  Created by xiecj1 on 2019/10/24.
//

#import "UIImage+YLZCompress.h"

@implementation UIImage (YLZCompress)

#pragma mark - Public method

- (NSData *)ylz_imageCompressTargetPx:(NSInteger)targetPx maxFileSize:(uint64_t)maxFileSize {
    return [self ylz_imageCompressTargetPx:targetPx maxFileSize:maxFileSize shortSideLimit:false];
}

- (NSData *)ylz_imageCompressTargetPx:(NSInteger)targetPx maxFileSize:(uint64_t)maxFileSize shortSideLimit:(BOOL)shortSideLimit {
    UIImage *newImage = nil;
    CGSize newSize = [self ylz_compressImageSizeFromOriginSize:self.size maxSide:targetPx shortSideLimit:shortSideLimit];
    // 如果图片需要重绘 就按照新的宽高压缩重绘图片
    if (!CGSizeEqualToSize(newSize, self.size)) {
        newImage = [self ylz_scaleToSize:self size:newSize];
    }
    if (newImage == nil) {
        newImage = self;
    }
    if (maxFileSize <= 0) {
        maxFileSize = 2 * 1000 * 1000;
    }
    // 如果图片大小大于2M 再进行质量上压缩
    NSData * scaledImageData = nil;
    if (UIImageJPEGRepresentation(newImage, 1) == nil) {
        scaledImageData = UIImagePNGRepresentation(newImage);
    } else{
        scaledImageData = UIImageJPEGRepresentation(newImage, 1.0);
        if (scaledImageData.length >= maxFileSize) {
            scaledImageData = [newImage ylz_compressToJPEGFormatDataWithFactor:0.01 maxFileSize:maxFileSize];
        }
    }
    return scaledImageData;
}


#pragma mark - Private method

- (CGSize)ylz_compressImageSizeFromOriginSize:(CGSize)originSize
                                      maxSide:(CGFloat)maxSide
                               shortSideLimit:(BOOL)shortSideLimit {
    CGFloat width = originSize.width;
    CGFloat height = originSize.height;
    if (shortSideLimit) {
        // 短边为限制边
        if (width <= maxSide || height <= maxSide || maxSide <= 0) {
            return originSize;
        } else {
            if (width > height) {
                width = width * maxSide/height;
                height = maxSide;
            }else {
                height = height * maxSide/width;
                width = maxSide;
            }
        }
    } else {
        // 长边为限制边
        if ((width <= maxSide && height <= maxSide) || maxSide <= 0) {
            return originSize;
        } else {
            if (width > height) {
                height = height * maxSide/width;
                width = maxSide;
            } else {
                width = width * maxSide/height;
                height = maxSide;
            }
        }
    }
    return CGSizeMake(width, height);
}

// 根据压缩精度系数及文件大小，获取压缩后的JPEG格式的图片数据
- (NSData *)ylz_compressToJPEGFormatDataWithFactor:(CGFloat)factor maxFileSize:(u_int64_t)fileSize {
    if (!self) return nil;
    NSData *tempImageData = UIImageJPEGRepresentation(self, 1.0);
    if ([tempImageData length] <= fileSize) return tempImageData;
    NSData *targetImageData = nil;
    CGFloat minFactor = 0;
    CGFloat maxFactor = 1.0;
    CGFloat midFactor = 0;
    while (fabs(maxFactor-minFactor) > factor)
    {
        @autoreleasepool
        {
            midFactor = minFactor + (maxFactor - minFactor)/2;
            tempImageData = UIImageJPEGRepresentation(self, midFactor);
            
            if ([tempImageData length] > fileSize)
            {
                maxFactor = midFactor;
            }
            else
            {
                minFactor = midFactor;
                targetImageData = tempImageData;
            }
        }
    }
    return targetImageData ?: tempImageData;
}

- (UIImage *)ylz_scaleToSize:(UIImage *)img size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

+ (UIImage *)ylz_createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
