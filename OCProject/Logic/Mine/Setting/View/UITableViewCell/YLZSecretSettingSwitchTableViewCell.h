//
//  YLZSecretSettingSwitchTableViewCell.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import <UIKit/UIKit.h>
#import "YLZSettingModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol YLZSecretSettingSwitchTableViewCellDelegate <NSObject>

@optional

- (void)toSwitchClick:(UISwitch *)ylzSwitch;

@end

@interface YLZSecretSettingSwitchTableViewCell : UITableViewCell

@property (nonatomic, weak) id<YLZSecretSettingSwitchTableViewCellDelegate> delegate;

@property (nonatomic, strong) YLZSettingModel *settingModel;

@end

NS_ASSUME_NONNULL_END
