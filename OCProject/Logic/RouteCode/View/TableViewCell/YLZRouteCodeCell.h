//
//  YLZRouteCodeCell.h
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZRouteCodeCell : UITableViewCell

@property (nonatomic, copy) void(^scanHandle)(void);

@property (nonatomic, copy) void(^processHandle)(void);

@end

NS_ASSUME_NONNULL_END
