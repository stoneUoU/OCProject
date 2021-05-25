//
//  UIImage+YLZCompress.h
//  YLZ-Kit-iOS
//
//  Created by xiecj1 on 2019/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLZCompress)

/*
 *  图片压缩到指定最大尺寸，最大体积
 *  @param targetPx 图片最大尺寸，长边最大尺寸
 *  @param maxFileSize 图片最大体积
 *  @return 压缩后的图片data
 */
- (NSData *)ylz_imageCompressTargetPx:(NSInteger)targetPx maxFileSize:(uint64_t)maxFileSize;

//将color转为UIImage:
+ (UIImage *)ylz_createImageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
