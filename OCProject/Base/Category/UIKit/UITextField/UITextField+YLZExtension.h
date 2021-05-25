//
//  UITextField+YLZExtension.h
//  YLZ-NetEncryption-iOS
//
//  Created by yuan on 2019/10/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (YLZExtension)

@property (nonatomic, assign) NSUInteger maxLength;

@property (nonatomic, copy) void(^valueChangedBlock)(NSString *content, NSInteger length);

@end

NS_ASSUME_NONNULL_END
