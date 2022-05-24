//
//  YLZRouteCodeCellBottomView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeCellBottomView.h"
#import "YLZKitCategory.h"

@interface YLZRouteCodeCellBottomView()

@property (nonatomic, strong) UIImageView *leftIconImageView;

@property (nonatomic, strong) UIImageView *rightIconImageView;

@property (nonatomic, strong) UIImageView *dashImageView;

@property (nonatomic, strong) UILabel *searchLabel;

@property (nonatomic, strong) UIImageView *arrowIconImageView;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIImageView *processImageView;

@end

@implementation YLZRouteCodeCellBottomView

#pragma mark - LifeCycle
#pragma mark -
    
- (id)init {
    self = [super init];//当前对象self
    if (self !=nil) {
        [self setUI];
    }
    return self;//返回一个已经初始化完毕的对象；
}
    
- (void)drawRect:(CGRect)rect {
}
    
#pragma mark - Public Method
#pragma mark -
    
#pragma mark - Private Method
#pragma mark -
    
- (void)setUI {
    [self addSubview:self.leftIconImageView];
    [self addSubview:self.rightIconImageView];
    [self addSubview:self.dashImageView];
    [self addSubview:self.searchLabel];
    [self addSubview:self.arrowIconImageView];
    [self addSubview:self.infoLabel];
    [self addSubview:self.processImageView];
    [self setMas];
}
    
 - (void)setMas {
     [self.leftIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(8);
         make.left.equalTo(self.mas_left).offset(-4);
     }];
     [self.rightIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.leftIconImageView.mas_top);
         make.right.equalTo(self.mas_right).offset(4);
     }];
     [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.leftIconImageView.mas_bottom).offset(6);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.arrowIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.searchLabel);
         make.left.equalTo(self.searchLabel.mas_right).offset(6);
     }];
     [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.searchLabel.mas_bottom).offset(6);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.processImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.right.equalTo(self);
     }];
     [YLZImageHelper drawLineByImageView:self.dashImageView withDashColor:YLZColorTitleThree];
}
    
#pragma mark - IB-Action
#pragma mark -
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIImageView *)leftIconImageView {
    if(_leftIconImageView == nil) {
        _leftIconImageView = [[UIImageView alloc] init];
        _leftIconImageView.image = [UIImage imageNamed:@"ylz_left_jiantou"];
    }
    return _leftIconImageView;
}

- (UIImageView *)rightIconImageView {
    if(_rightIconImageView == nil) {
        _rightIconImageView = [[UIImageView alloc] init];
        _rightIconImageView.image = [UIImage imageNamed:@"ylz_right_jiantou"];
    }
    return _rightIconImageView;
}

- (UILabel *)searchLabel {
    if (!_searchLabel) {
        _searchLabel = [UILabel new];
        _searchLabel.font = [YLZFont bold:18];
        _searchLabel.textColor = YLZColorTitleOne;
        _searchLabel.text = @"点击查询行程卡";
    }
    return _searchLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.font = [YLZFont regular:14];
        _infoLabel.textColor = YLZColorTitleThree;
        _infoLabel.text = @"查询14天内是否到访过中高风险地区";
    }
    return _infoLabel;
}
- (UIImageView *)arrowIconImageView {
    if(_arrowIconImageView == nil) {
        _arrowIconImageView = [[UIImageView alloc] init];
        _arrowIconImageView.image = [UIImage imageNamed:@"ylz_route_to_search"];
    }
    return _arrowIconImageView;
}

- (UIImageView *)processImageView {
    if(_processImageView == nil) {
        _processImageView = [[UIImageView alloc] init];
        _processImageView.image = [UIImage imageNamed:@"ylz_process"];
    }
    return _processImageView;
}

- (UIImageView *)dashImageView {
    if(_dashImageView == nil) {
        _dashImageView = [[UIImageView alloc] init];
        _dashImageView.frame = CGRectMake(16, 16, SCREENWIDTH - (48+32), 2);
    }
    return _dashImageView;
}

@end

