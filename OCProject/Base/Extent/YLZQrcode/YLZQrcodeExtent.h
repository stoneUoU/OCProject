//
//  YLZQrcodeExtent.h
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZQrcodeExtent : NSObject

/**
 * 生成一张普通的二维码
 *
 * @param data 二维码内容
 * @param imageViewWidth 宽
 * @return 返回二维码图片
 */
+ (UIImage *)generateWithDefaultQRCodeData:(NSString *)data imageViewWidth:(CGFloat)imageViewWidth;

/**
 * 生成一张带有logo的二维码
 *
 * @param data 二维码内容
 * @param logoImageName logo图标名称
 * @param logoScaleToSuperView 相对于父视图的缩放比取值范围0-1；0，不显示，1，代表与父视图大小相同
 * @return 返回二维码图片
 */
+ (UIImage *)generateWithLogoQRCodeData:(NSString *)data logoImage:(UIImage *)logoImage logoScaleToSuperView:(CGFloat)logoScaleToSuperView;

/**
 * 生成一张彩色的二维码
 *
 * @param data 二维码内容
 * @param backgroundColor 背景色
 * @param mainColor 二维码主色
 * @return 返回二维码图片
 */
+ (UIImage *)generateWithColorQRCodeData:(NSString *)data backgroundColor:(CIColor *)backgroundColor mainColor:(CIColor *)mainColor;

#pragma mark - 获取条形码

/**
 * 生成一张条形码
 *
 * @param data 条形码内容
 * @return 返回条形码图片
 */
+ (UIImage*)generateWithBarCodeData:(NSString*)data;

/**
 * 生成一张条形码
 *
 * @param data 条形码内容
 * @param imageViewWidth 宽
 * @return 返回条形码图片
 */
+ (UIImage*)generateWithBarCodeData:(NSString*)data imageViewWidth:(CGFloat)imageViewWidth;

/**
 * 生成一张条形码
 *
 * @param data 条形码内容
 * @param scale  比例因子 0~1.0
 * @return 返回条形码图片
 */
+ (UIImage*)generateWithBarCodeData:(NSString*)data scale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
