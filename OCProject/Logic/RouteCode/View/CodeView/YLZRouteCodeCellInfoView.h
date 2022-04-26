//
//  YLZRouteCodeCellInfoView.h
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import <UIKit/UIKit.h>

typedef void(^YLZRouteCodeCellInfoViewHandle)(void);

NS_ASSUME_NONNULL_BEGIN

@interface YLZRouteCodeCellInfoView : UIView

@property (nonatomic, copy) YLZRouteCodeCellInfoViewHandle handle;

@end

NS_ASSUME_NONNULL_END
