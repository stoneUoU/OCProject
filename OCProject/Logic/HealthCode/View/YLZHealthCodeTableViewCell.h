//
//  YLZHealthCodeTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZHealthCodeTableViewCell : UITableViewCell

/**
 * 0 : 绿码
 * 1 : 橙码
 * 2 : 红码
 */
@property (nonatomic, assign) NSInteger clickNum;

@end

NS_ASSUME_NONNULL_END
