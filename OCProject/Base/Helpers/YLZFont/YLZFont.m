//
//  YLZFont.m
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import "YLZFont.h"

@implementation YLZFont

+ (UIFont *)regular:(CGFloat)size {
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Regular" size: size];
    if (font) {
        return font;
    }
    return [self defaultFont:size];
}

+ (UIFont *)bold:(CGFloat)size {
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Semibold" size: size];
    if (font) {
        return font;
    }
    return [self defaultFont:size];
}

+ (UIFont *)light:(CGFloat)size {
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Light" size: size];
    if (font) {
        return font;
    }
    return [self defaultFont:size];
    
}

+ (UIFont *)medium:(CGFloat)size {
    UIFont* font = [UIFont fontWithName:@"PingFangSC-Medium" size: size];
    if (font) {
        return font;
    }
    return [self defaultFont:size];
}

+ (UIFont *)blackNumber:(CGFloat)size {
    UIFont* font = [UIFont fontWithName:@"Avenir-Black" size: size];
    if (font) {
        return font;
    }
    return [self defaultFont:size];
}

+ (UIFont *)lightNumber:(CGFloat)size {
    UIFont* font = [UIFont fontWithName:@"Avenir-Book" size: size];
    if (font) {
        return font;
    }
    return [self defaultFont:size];
}

+ (UIFont *)defaultFont:(CGFloat)size {
    return [UIFont systemFontOfSize:size];
}


@end
