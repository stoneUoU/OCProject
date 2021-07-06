
//
//  YLZMomentViewController.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

//
//  BaseViewController.m
//  JXCategoryView
//
//  Created by jiaxin on 2018/8/9.
//  Copyright © 2018年 jiaxin. All rights reserved.
//

#import "YLZMomentViewController.h"
#import "YLZMomentFollowViewController.h"
#import "YLZMomentRecommendViewController.h"
#import "JXCategoryTitleImageView.h"

@interface YLZMomentViewController () <JXCategoryViewDelegate>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) JXCategoryTitleImageView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@property (nonatomic, strong) UIButton *plusButton;

@end

@implementation YLZMomentViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = YLZColorView;
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.plusButton];
    [self.view addSubview:self.listContainerView];
    
    JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
    backgroundView.indicatorHeight = 40;
    backgroundView.indicatorCornerRadius = 5;
    backgroundView.indicatorColor = YLZColorOrangeView;
    backgroundView.indicatorWidthIncrement = 32;
    self.categoryView.indicators = @[backgroundView];
    
    [self.plusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.categoryView.mas_right).offset(-16);
        make.centerY.equalTo(self.categoryView);
        make.size.equalTo(@(CGSizeMake(36, 36)));
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    // 处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    // 离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)toOperate:(UIButton *)sender {
    YLZLOG(@"发不发不");
}

#pragma mark - Custom Accessors

- (JXCategoryTitleImageView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleImageView alloc] initWithFrame:CGRectMake(0, StatusBarHeight, SCREENWIDTH, NavBarHeight)];
        _categoryView.backgroundColor = YLZColorView;
        _categoryView.titles = @[@"关注", @"推荐"];
        NSArray *imageNames = @[@"tabbar_home", @"tabbar_mine"];
        NSArray *selectedImageNames = @[@"tabbar_home_selected", @"tabbar_mine_selected"];
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
        _categoryView.listContainer = self.listContainerView;
    }
    return _categoryView;
}

// 列表容器视图
- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
        _listContainerView.frame = CGRectMake(0, StatusBarHeight+NavBarHeight, SCREENWIDTH, SCREENHEIGHT);
    }
    return _listContainerView;
}

- (UIButton *)plusButton {
    if (!_plusButton) {
        _plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_plusButton setImage:[UIImage imageNamed:@"ylz_moment_send"] forState:UIControlStateNormal];
        [_plusButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
        _plusButton.layer.cornerRadius = 6.0;
        _plusButton.layer.masksToBounds = YES;
        _plusButton.backgroundColor = YLZColorOrangeView;
    }
    return _plusButton;
}


#pragma mark - Public

#pragma mark - JXCategoryViewDelegate

// 点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

// 滚动选中的情况才会调用该方法
- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - JXCategoryListContainerViewDelegate

// 返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return 2;
}

// 返回各个列表菜单下的实例，该实例需要遵守并实现 <JXCategoryListContentViewDelegate> 协议
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    if (index == 0) {
        YLZMomentFollowViewController *followVC = [[YLZMomentFollowViewController alloc] init];
        return followVC;
    } else {
        YLZMomentRecommendViewController *recommendVC = [[YLZMomentRecommendViewController alloc] init];
        return recommendVC;
    }
}

@end


