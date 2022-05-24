//
//  YLZImageHelper.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/6/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZImageHelper : NSObject

+ (NSData*)ylz_getDataFromImage:(UIImage*)image;

+ (UIImage *)ylz_toConvertViewToImage:(UIView *)view;

//添加虚线：
+ (void)drawLineByImageView:(UIImageView *)imageView withDashColor:(UIColor *)dashColor;
//置灰按钮显示：
+ (UIImage *)ylz_darkImage:(UIImage *)sourceImage;

//裁剪图片：
+ (UIImage *)cutCenterImage:(UIImage *)image left:(NSInteger)left top:(NSInteger)top width:(NSInteger)width height:(NSInteger)height;

+ (UIImage *)imageWithOriRenderingImage:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
