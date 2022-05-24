//
//  YLZSettingModel.h
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLZSettingModel : YLZBaseModel

@property (nonatomic, copy) NSString *titleString;

@property (nonatomic, assign) NSInteger indexTag;

@property (nonatomic, copy) NSString *picString;

@end

NS_ASSUME_NONNULL_END
