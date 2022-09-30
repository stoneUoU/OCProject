//
//  YLZAcidCheckTableFooterView.m
//  OCProject
//
//  Created by stone on 2022/8/29.
//

#import "YLZAcidCheckTableFooterView.h"

@interface YLZAcidCheckTableFooterView()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YLZAcidCheckTableFooterView

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
    [self addSubview:self.titleLabel];
    
    [self addSubview:self.supportLabel];
    [self addSubview:self.linkLabel];
    [self setMas];
}
    
 - (void)setMas {
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(24);
         make.left.equalTo(self.mas_left).offset(16);
     }];
     [self.supportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.titleLabel.mas_bottom).offset(16);
         make.left.equalTo(self.mas_left).offset(16);
         make.right.equalTo(self.mas_right).offset(-16);
     }];
     [self.linkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.supportLabel.mas_bottom).offset(16);
         make.left.equalTo(self.mas_left).offset(16);
         make.right.equalTo(self.mas_right).offset(-16);
         make.bottom.equalTo(self.mas_bottom).offset(-16);
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:20];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"服务说明：";
    }
    return _titleLabel;
}

- (UILabel *)supportLabel {
    if (!_supportLabel) {
        _supportLabel = [UILabel new];
        _supportLabel.font = [YLZFont medium:16];
        _supportLabel.numberOfLines = 0;
        _supportLabel.textAlignment = NSTextAlignmentLeft;
        _supportLabel.textColor = YLZColorTitleTwo;
    }
    return _supportLabel;
}

- (UILabel *)linkLabel {
    if (!_linkLabel) {
        _linkLabel = [UILabel new];
        _linkLabel.font = [YLZFont medium:16];
        _linkLabel.numberOfLines = 0;
        _linkLabel.textAlignment = NSTextAlignmentLeft;
        _linkLabel.textColor = YLZColorTitleTwo;
    }
    return _linkLabel;
}

@end

