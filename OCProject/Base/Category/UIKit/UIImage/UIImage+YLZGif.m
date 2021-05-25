//
//  UIImage+YLZGif.m
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import "UIImage+YLZGif.h"

@implementation UIImage (YLZGif)

+ (UIImage *)ylz_gifName:(NSString *)name scaledToSize:(CGSize)newSize
{
    int scale = (int)[UIScreen mainScreen].scale;
    
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", name, scale] ofType:@"gif"];
    
    if (!imagePath) {
        
        (scale + 1 > 3) ? (scale -= 1) : (scale += 1);
        imagePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", name, scale] ofType:@"gif"];
    }
    
    if (imagePath) {
        
        // 传入图片名(不包含@Nx)
        NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
        return [UIImage ylz_imageWithGIFData:imageData scaledToSize:newSize];
        
    } else {
        
        imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
        if (imagePath) {
            
            // 传入的图片名已包含@Nx or 传入图片只有一张 不分@Nx
            NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
            return [UIImage ylz_imageWithGIFData:imageData  scaledToSize:newSize];
        } else {
            
            // 不是一张GIF图片(后缀不是gif)
            return [UIImage imageNamed:name];
        }
    }
}

+ (UIImage *)ylz_imageWithGIFData:(NSData *)data scaledToSize:(CGSize)newSize
{
    if (!data) return nil;
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    size_t count = CGImageSourceGetCount(source);
    
    UIImage *animatedImage;
    
    if (count <= 1) {
        animatedImage = [self imageWithImageSimple:[[UIImage alloc] initWithData:data] scaledToSize:newSize];
    } else {
        
        NSMutableArray *images = [NSMutableArray array];
        NSTimeInterval duration = 0.0f;
        
        for (size_t i = 0; i < count; i++) {
            
            // 拿出了Gif的每一帧图片
            CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
            
            //Learning... 设置动画时长 算出每一帧显示的时长（帧时长）
            NSTimeInterval frameDuration = [UIImage sd_frameDurationAtIndex:i source:source];
            duration += frameDuration;
            
            // 将每帧图片添加到数组中
            [images addObject:[self imageWithImageSimple:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp] scaledToSize:newSize]];
            
            // 释放真图片对象
            CFRelease(image);
        }
        //加快gif的播放速度:
        duration = duration;
        // 设置动画时长
        if (!duration) {
            duration = (1.0f / 10.0f) * count;
        }
        
        animatedImage = [UIImage animatedImageWithImages:images duration:duration];
    }
    
    // 释放源Gif图片
    CFRelease(source);
    
    return animatedImage;
    
}

//缩放图片
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize {
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0);
    [image drawInRect:CGRectIntegral(CGRectMake(0, 0, newSize.width, newSize.height))];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImage *newImage = [scaledImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return newImage;
}

+ (float)sd_frameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source {
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary *frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary *gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    
    NSNumber *delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if (delayTimeUnclampedProp) {
        frameDuration = [delayTimeUnclampedProp floatValue];
    }
    else {
        
        NSNumber *delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if (delayTimeProp) {
            frameDuration = [delayTimeProp floatValue];
        }
    }
    
    // Many annoying ads specify a 0 duration to make an image flash as quickly as possible.
    // We follow Firefox's behavior and use a duration of 100 ms for any frames that specify
    // a duration of <= 10 ms. See <rdar://problem/7689300> and <http://webkit.org/b/36082>
    // for more information.
    
    if (frameDuration < 0.011f) {
        frameDuration = 0.100f;
    }
    
    CFRelease(cfFrameProperties);
    return frameDuration;
}

+ (UIImage *)ylz_setAnimatedGIFWithData:(NSData *)data {
    if(!data){
        return nil;
    }
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    size_t count = CGImageSourceGetCount(source);
    UIImage * animatedImg;
    if(count <= 1){
        animatedImg = [[UIImage alloc]initWithData:data];
    }else{
        NSMutableArray * imgsArr = [NSMutableArray array];
        NSTimeInterval duration = 0.0f;
        for(size_t i = 0; i < count;i++){
            CGImageRef img = CGImageSourceCreateImageAtIndex(source, i, NULL);
            if(!img){
                continue;
            }
            duration += [self ylz_setFrameDurationAtIndex:i source:source];
            [imgsArr addObject:[UIImage imageWithCGImage:img scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
            CGImageRelease(img);
        }
        if(!duration){
            duration = (1.0f/10.0f) * count;
        }
        animatedImg = [UIImage animatedImageWithImages:imgsArr duration:duration];
    }
    CFRelease(source);
    return animatedImg;
}

+ (UIImage *)ylz_setAnimatedGIFWithGifName:(NSString *)name{
    CGFloat ylzScale = [UIScreen mainScreen].scale;
    if(ylzScale >1.0f){
        NSString * retinaPath = [[NSBundle mainBundle] pathForResource:[name stringByAppendingString:@"@2x"] ofType:@"gif"];
        NSData * data = [NSData dataWithContentsOfFile:retinaPath];
        if(data){
            return [UIImage ylz_setAnimatedGIFWithData:data];
        }
        NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
        data = [NSData dataWithContentsOfFile:path];
        if(data){
            return [UIImage ylz_setAnimatedGIFWithData:data];
        }
        return [UIImage imageNamed:name];
    }else{
        NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"gif"];
        NSData * data = [NSData dataWithContentsOfFile:path];
        if(data){
            return [UIImage ylz_setAnimatedGIFWithData:data];
        }
        return [UIImage imageNamed:name];
    }
}

+ (float)ylz_setFrameDurationAtIndex:(NSUInteger)index source:(CGImageSourceRef)source{
    float frameDuration = 0.1f;
    CFDictionaryRef cfFrameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil);
    NSDictionary * frameProperties = (__bridge NSDictionary *)cfFrameProperties;
    NSDictionary * gifProperties = frameProperties[(NSString *)kCGImagePropertyGIFDictionary];
    NSNumber * delayTimeUnclampedProp = gifProperties[(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
    if(delayTimeUnclampedProp){
        frameDuration = [delayTimeUnclampedProp floatValue];
    }else{
        NSNumber * delayTimeProp = gifProperties[(NSString *)kCGImagePropertyGIFDelayTime];
        if(delayTimeProp){
            frameDuration = [delayTimeProp floatValue];
        }
    }
    if(frameDuration < 0.011f){
        frameDuration = 0.100f;
    }
    CFRelease(cfFrameProperties);
    return frameDuration;
}

@end

