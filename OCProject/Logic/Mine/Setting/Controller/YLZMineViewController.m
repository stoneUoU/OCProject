//
//  YLZMineViewController.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZMineViewController.h"
#import "YLZKitCategory.h"

#import <JXPagingView/JXPagerView.h>
#import "JXCategoryView.h"
#import "YLZMineHeaderView.h"
#import "YLZMineBaseTableView.h"
#import "YLZMineMomentTableView.h"
#import "JXCategoryIndicatorSpringBackgroundView.h"

#import "YLZSettingViewController.h"

@interface YLZMineViewController () <JXPagerViewDelegate, JXCategoryViewDelegate,YLZMineHeaderViewDelegate>
@property (nonatomic, strong) JXPagerView *pagingView;
@property (nonatomic, strong) YLZMineHeaderView *headerView;

@property (nonatomic, strong) JXCategoryTitleImageView *categoryView;
@property (nonatomic, strong) NSArray <NSString *> *titles;
@end

@implementation YLZMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YLZColorView;
//    [self setBaseUI:YLZColorWhite withTitleString:@"设置" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    
    [self.view addSubview:self.pagingView];

    self.categoryView.listContainer = (id<JXCategoryViewListContainer>)self.pagingView.listContainerView;

    JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
    backgroundView.indicatorHeight = 40;
    backgroundView.indicatorCornerRadius = 5;
    backgroundView.indicatorColor = YLZColorOrangeView;
    backgroundView.indicatorWidthIncrement = 32;
    self.categoryView.indicators = @[backgroundView];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.pagingView.frame = self.view.bounds;
}

#pragma mark - JXPagingViewDelegate

- (void)toHeaderViewDelegate {
    YLZSettingViewController *vc = [[YLZSettingViewController alloc] init];
    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
};

- (UIView *)tableHeaderViewInPagerView:(JXPagerView *)pagerView {
    return self.headerView;
}

- (NSUInteger)tableHeaderViewHeightInPagerView:(JXPagerView *)pagerView {
    return StatusBarHeight+16+246;
}

- (NSUInteger)heightForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return StatusBarHeight+NavBarHeight;
}

- (UIView *)viewForPinSectionHeaderInPagerView:(JXPagerView *)pagerView {
    return self.categoryView;
}

- (NSInteger)numberOfListsInPagerView:(JXPagerView *)pagerView {
    return self.titles.count;
}

- (id<JXPagerViewListViewDelegate>)pagerView:(JXPagerView *)pagerView initListAtIndex:(NSInteger)index {
    YLZMineMomentTableView *list = [[YLZMineMomentTableView alloc] init];
    return list;
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

- (NSArray <NSString *> *)titles {
    if (!_titles) {
        _titles = @[@"能力", @"活动", @"我的日历"];
    }
    return _titles;
}

- (JXPagerView *)pagingView {
    if (!_pagingView) {
        _pagingView = [[JXPagerView alloc] initWithDelegate:self];
    }
    return _pagingView;
}

- (YLZMineHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[YLZMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, StatusBarHeight+16+246)];
        _headerView.backgroundColor = YLZColorView;
        _headerView.delegate = self;
    }
    return _headerView;
}

- (JXCategoryTitleImageView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleImageView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, StatusBarHeight+NavBarHeight)];
        _categoryView.backgroundColor = YLZColorView;
        _categoryView.titles = self.titles;
        NSArray *imageNames = @[@"tabbar_home", @"tabbar_mine", @"tabbar_home"];
        NSArray *selectedImageNames = @[@"tabbar_home_selected", @"tabbar_mine_selected", @"tabbar_home_selected"];
        _categoryView.imageNames = imageNames;
        _categoryView.selectedImageNames = selectedImageNames;
        _categoryView.delegate = self;
        _categoryView.titleSelectedColor = YLZColorWhite;
        _categoryView.titleColor = YLZColorTitleOne;
        _categoryView.titleFont = [YLZFont regular:12];
        _categoryView.titleSelectedFont = [YLZFont medium:14];
        _categoryView.titleColorGradientEnabled = YES;
        _categoryView.titleLabelZoomEnabled = YES;
        _categoryView.averageCellSpacingEnabled = NO;
        _categoryView.cellSpacing = 36;
    }
    return _categoryView;
}

@end



