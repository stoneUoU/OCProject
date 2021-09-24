//
//  YLZHealthCodeInfoTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^YLZHealthCodeInfoTableViewCellHandle)(NSInteger clickNum);

@interface YLZHealthCodeInfoTableViewCell : UITableViewCell

@property (nonatomic, copy) YLZHealthCodeInfoTableViewCellHandle handle;

@end

NS_ASSUME_NONNULL_END
