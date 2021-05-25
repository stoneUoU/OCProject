//
//  UIButton+YLZFixMultiClick.h
//  YLZ-Kit-iOS
//
//  Created by stone on 2020/4/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YLZFixMultiClick)

@property (nonatomic, assign) NSTimeInterval ylz_acceptEventInterval; // 重复点击的间隔

@property (nonatomic, assign) NSTimeInterval ylz_acceptEventTime;

@end

NS_ASSUME_NONNULL_END
