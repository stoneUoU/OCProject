//
//  YLZFont.h
//  OCProject
//
//  Created by stone on 2021/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZFont : NSObject

+ (UIFont *)regular:(CGFloat)size;
+ (UIFont *)bold:(CGFloat)size;
+ (UIFont *)light:(CGFloat)size;
+ (UIFont *)medium:(CGFloat)size;

+ (UIFont *)blackNumber:(CGFloat)size;
+ (UIFont *)lightNumber:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
