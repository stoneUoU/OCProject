//
//  YLZMineHeaderView.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YLZMineHeaderViewDelegate <NSObject>

- (void)toHeaderViewDelegate;

@end

@interface YLZMineHeaderView : UIView

@property (nonatomic, weak) id<YLZMineHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
