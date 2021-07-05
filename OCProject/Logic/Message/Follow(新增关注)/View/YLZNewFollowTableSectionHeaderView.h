//
//  YLZNewFollowTableHeaderView.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZNewFollowTableSectionHeaderViewHandle)(NSInteger index);

@interface YLZNewFollowTableSectionHeaderView : UIView

@property (nonatomic, copy) YLZNewFollowTableSectionHeaderViewHandle handle;

@end

NS_ASSUME_NONNULL_END
