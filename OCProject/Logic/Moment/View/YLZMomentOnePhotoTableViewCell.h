//
//  YLZMomentOnePhotoTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import <UIKit/UIKit.h>
@class YLZMomentModel;
NS_ASSUME_NONNULL_BEGIN

typedef void (^YLZMomentOnePhotoTableViewCellFollowHandle)(void);

typedef void (^YLZMomentOnePhotoTableViewCellOperateHandle)(NSInteger index);

@interface YLZMomentOnePhotoTableViewCell : UITableViewCell

@property (nonatomic, strong) YLZMomentModel *model;

@property (nonatomic, copy) YLZMomentOnePhotoTableViewCellFollowHandle followHandle;

@property (nonatomic, copy) YLZMomentOnePhotoTableViewCellOperateHandle operateHandle;

@end

NS_ASSUME_NONNULL_END
