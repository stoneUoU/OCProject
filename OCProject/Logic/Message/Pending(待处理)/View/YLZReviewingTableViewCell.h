//
//  YLZReviewingTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//


#import <UIKit/UIKit.h>
@class YLZReviewingModel;
NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZReviewingTableViewCellHandle)(NSInteger index);

@interface YLZReviewingTableViewCell : UITableViewCell

@property (nonatomic, strong) YLZReviewingModel *model;

@property (nonatomic, strong) YLZReviewingTableViewCellHandle handle;

@end

NS_ASSUME_NONNULL_END
