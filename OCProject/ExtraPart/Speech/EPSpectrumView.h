//
//  EPSpectrumView.m
//  OldServe
//
//  Created by Mac on 2020/11/20.
//  Copyright © 2020 YLZ Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

// 语音录音 动效
@interface EPSpectrumView : UIView

@property (nonatomic, copy) void (^itemLevelCallback)(void);

//

@property (nonatomic) NSUInteger numberOfItems;

@property (nonatomic) UIColor * itemColor;

@property (nonatomic) CGFloat level;

@property (nonatomic) UILabel *timeLabel;

@property (nonatomic) NSString *text;

/// 左右两边的间距
@property (nonatomic) CGFloat middleInterval;

- (void)start;
- (void)stop;

@end
