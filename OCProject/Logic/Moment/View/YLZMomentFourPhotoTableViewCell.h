//
//  YLZMomentFourPhotoTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import <UIKit/UIKit.h>
@class YLZMomentModel;
NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZMomentFourPhotoTableViewCellFollowHandle)(void);

typedef void (^YLZMomentFourPhotoTableViewCellOperateHandle)(NSInteger index);

@interface YLZMomentFourPhotoTableViewCell : UITableViewCell

@property (nonatomic, strong) YLZMomentModel *model;

@property (nonatomic, copy) YLZMomentFourPhotoTableViewCellFollowHandle followHandle;

@property (nonatomic, copy) YLZMomentFourPhotoTableViewCellOperateHandle operateHandle;

@end

NS_ASSUME_NONNULL_END
