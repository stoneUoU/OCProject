//
//  YLZScanResultStatusCell.h
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZScanResultStatusCell : UITableViewCell

@property (nonatomic, copy) void(^statusHandle)(void);

@property (nonatomic, copy) void(^processHandle)(void);

@end

NS_ASSUME_NONNULL_END
