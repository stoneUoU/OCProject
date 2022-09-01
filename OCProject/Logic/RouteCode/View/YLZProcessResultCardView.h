//
//  YLZProcessResultCardView.h
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZProcessResultCardView : UIView

@property (nonatomic, copy) void(^tapHandle)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
