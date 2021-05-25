//
//  UIImage+YLZGif.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLZGif)

+ (UIImage *)ylz_gifName:(NSString *)name scaledToSize:(CGSize)newSize;

+ (UIImage *)ylz_setAnimatedGIFWithGifName:(NSString *)name;

+ (UIImage *)ylz_setAnimatedGIFWithData:(NSData *)data;

+ (float)ylz_setFrameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source;

@end

NS_ASSUME_NONNULL_END
