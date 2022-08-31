//
//  YLZProcessCardView.h
//  OCProject
//
//  Created by stone on 2022/8/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZProcessCardView : UIView

@property (nonatomic, copy) void(^tapHandle)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
