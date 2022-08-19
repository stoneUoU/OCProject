//
//  YLZMSBaseTableViewCell.h
//  OCProject
//
//  Created by stone on 2022/8/17.
//

#import <Foundation/Foundation.h>
#import "YLZMSBasePresenter.h"

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT CGFloat const YLZCellLeftPadding;

FOUNDATION_EXPORT CGFloat const YLZCellHeight;

@interface YLZMSBaseTableViewCell : UITableViewCell <YLZMSViewDataProtocol>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, strong) UILabel *leftTitleLabel;

@property (nonatomic, strong) UILabel *rightTitleLabel;

@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, strong) UIView *topCornerView;

@property (nonatomic, strong) UIView *bottomCornerView;

- (void)initData;

- (void)setUI;

- (void)setMas;

- (void)layoutSubViews;

- (void)setBgViewCorner;

- (void)setBgViewCornerWithRowIndex:(NSInteger )rowIndex withSectionNum:(NSInteger)num;

#pragma mark default presenter
- (id<YLZMSPresenterProtocol>)getPresenter;

+ (CGFloat)getCellHeight;

@end

NS_ASSUME_NONNULL_END


