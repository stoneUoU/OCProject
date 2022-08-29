//
//  YLZRouteCodeCellView.h
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLZRouteCodeCellView : UIView

@property (nonatomic, assign) NSInteger clickNum;

@property (nonatomic, copy) void(^logicHandle)(NSInteger index);

@end

NS_ASSUME_NONNULL_END
