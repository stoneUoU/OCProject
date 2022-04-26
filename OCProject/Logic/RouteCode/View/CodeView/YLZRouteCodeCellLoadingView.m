//
//  YLZRouteCodeCellLoadingView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeCellLoadingView.h"

@interface YLZRouteCodeCellLoadingView()

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YLZRouteCodeCellLoadingView

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
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self setMas];
}
    
 - (void)setMas {
     [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(54);
         make.centerX.equalTo(self);
         make.size.equalTo(@(CGSizeMake(54, 54)));
     }];
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.iconImageView.mas_bottom).offset(24);
         make.centerX.equalTo(self);
     }];
}
    
#pragma mark - IB-Action
#pragma mark -
    
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIImageView *)iconImageView {
    if(_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"ylz_qrcode_m_logo"];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont bold:24];
        _titleLabel.textColor = YLZColorCodeBlue;
        _titleLabel.text = @"点击出示健康码";
    }
    return _titleLabel;
}

@end

