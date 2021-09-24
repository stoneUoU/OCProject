//
//  YLZHealthCodeTableFooterView.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeTableFooterView.h"

@interface YLZHealthCodeTableFooterView()

@property (nonatomic, strong) UILabel *telLabel;

@property (nonatomic, strong) UILabel *copyRightLabel;

@end

@implementation YLZHealthCodeTableFooterView

- (id)init {
    self = [super init ];//当前对象self
    if (self !=nil) {
        [self setUI];
    }
    return self;//返回一个已经初始化完毕的对象；
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self addSubview:self.telLabel];
    [self addSubview:self.copyRightLabel];
    
    [self setMas];
}

- (void)setMas {
    [self.telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(16);
        make.centerX.equalTo(self);
    }];
    [self.copyRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.telLabel.mas_bottom).offset(8);
        make.centerX.equalTo(self);
    }];
}

#pragma mark - IB-Action
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)telLabel {
    if (!_telLabel) {
        _telLabel = [UILabel new];
        _telLabel.font = [YLZFont regular:12];
        _telLabel.textAlignment = NSTextAlignmentCenter;
        _telLabel.numberOfLines = 0;
        _telLabel.textColor = YLZColorWhite;
        _telLabel.text = @"客服电话：12320 0591-62623959 8:00-12:00 14:00-18:00";
    }
    return _telLabel;
}

- (UILabel *)copyRightLabel {
    if (!_copyRightLabel) {
        _copyRightLabel = [UILabel new];
        _copyRightLabel.font = [YLZFont regular:12];
        _copyRightLabel.textAlignment = NSTextAlignmentCenter;
        _copyRightLabel.numberOfLines = 0;
        _copyRightLabel.textColor = YLZColorWhite;
        _copyRightLabel.text = @"本应用由福建省数字办 卫健委 医保局主办 福建省经济信息中心承办";
    }
    return _copyRightLabel;
}

@end



