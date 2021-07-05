//
//  YLZInvitedTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import <UIKit/UIKit.h>
@class YLZInvitedModel;
NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZInvitedTableViewCellHandle)(NSInteger index);

@interface YLZInvitedTableViewCell : UITableViewCell

@property (nonatomic, strong) YLZInvitedModel *model;

@property (nonatomic, strong) YLZInvitedTableViewCellHandle handle;

@end

NS_ASSUME_NONNULL_END
