//
//  YLZBlacklistTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//  黑名单

#import <UIKit/UIKit.h>
#import "YLZBlacklistModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YLZBlacklistTableViewCell : UITableViewCell

@property (nonatomic, strong) YLZBlacklistModel *blacklistModel;

@property (nonatomic, copy) void(^blacklistTableViewCellHandle)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
