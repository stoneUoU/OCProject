//
//  YLZRouteCodeTableFooterView.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeTableFooterView.h"

@interface YLZRouteCodeTableFooterView()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *sourceLeftLabel;

@property (nonatomic, strong) UILabel *sourceRightLabel;

@property (nonatomic, strong) UILabel *mindLeftLabel;

@property (nonatomic, strong) UILabel *mindRightLabel;

@property (nonatomic, strong) UILabel *rangeLeftLabel;

@property (nonatomic, strong) UILabel *rangeRightLabel;

@property (nonatomic, strong) UILabel *telLeftLabel;

@property (nonatomic, strong) UILabel *telRightLabel;

@property (nonatomic, strong) UILabel *mainOrgLeftLabel;

@property (nonatomic, strong) UILabel *mainOrgRightLabel;

@property (nonatomic, strong) UILabel *subOrgLeftLabel;

@property (nonatomic, strong) UILabel *subOrgRightLabel;

@end

@implementation YLZRouteCodeTableFooterView

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
    
    [self addSubview:self.sourceLeftLabel];
    [self addSubview:self.sourceRightLabel];
    [self addSubview:self.mindLeftLabel];
    [self addSubview:self.mindRightLabel];
    [self addSubview:self.rangeLeftLabel];
    [self addSubview:self.rangeRightLabel];
    
    [self addSubview:self.telLeftLabel];
    [self addSubview:self.telRightLabel];
    [self addSubview:self.mainOrgLeftLabel];
    [self addSubview:self.mainOrgRightLabel];
    [self addSubview:self.subOrgLeftLabel];
    [self addSubview:self.subOrgRightLabel];
    [self setMas];
}
    
 - (void)setMas {
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mas_top).offset(24);
         make.centerX.equalTo(self);
     }];
     [self.sourceLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(24);
     }];
     [self.sourceRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(104);
         make.right.equalTo(self.mas_right).offset(-24);
     }];
     [self.mindLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.sourceRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(24);
     }];
     [self.mindRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.sourceRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(104);
         make.right.equalTo(self.mas_right).offset(-24);
     }];
     [self.rangeLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mindRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(24);
     }];
     [self.rangeRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mindRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(104);
         make.right.equalTo(self.mas_right).offset(-24);
     }];
     
     [self.telLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.rangeRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(24);
     }];
     [self.telRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.rangeRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(104);
         make.right.equalTo(self.mas_right).offset(-24);
     }];
     [self.mainOrgLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.telRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(24);
     }];
     [self.mainOrgRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.telRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(104);
         make.right.equalTo(self.mas_right).offset(-24);
     }];
     [self.subOrgLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mainOrgRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(24);
     }];
     [self.subOrgRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.mainOrgRightLabel.mas_bottom).offset(8);
         make.left.equalTo(self.mas_left).offset(104);
         make.right.equalTo(self.mas_right).offset(-24);
         make.bottom.equalTo(self.mas_bottom).offset(-24);
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
        _titleLabel.font = [YLZFont regular:18];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"信息说明";
    }
    return _titleLabel;
}

- (UILabel *)sourceLeftLabel {
    if (!_sourceLeftLabel) {
        _sourceLeftLabel = [UILabel new];
        _sourceLeftLabel.font = [YLZFont regular:16];
        _sourceLeftLabel.numberOfLines = 0;
        _sourceLeftLabel.textAlignment = NSTextAlignmentLeft;
        _sourceLeftLabel.textColor = YLZColorTitleTwo;
        _sourceLeftLabel.text = @"数据来源：";
    }
    return _sourceLeftLabel;
}

- (UILabel *)sourceRightLabel {
    if (!_sourceRightLabel) {
        _sourceRightLabel = [UILabel new];
        _sourceRightLabel.font = [YLZFont regular:16];
        _sourceRightLabel.numberOfLines = 0;
        _sourceRightLabel.textAlignment = NSTextAlignmentLeft;
        _sourceRightLabel.textColor = YLZColorTitleTwo;
        _sourceRightLabel.text = @"全国一体化政务服务平台和福建省相关部门";
    }
    return _sourceRightLabel;
}

- (UILabel *)mindLeftLabel {
    if (!_mindLeftLabel) {
        _mindLeftLabel = [UILabel new];
        _mindLeftLabel.font = [YLZFont regular:16];
        _mindLeftLabel.numberOfLines = 0;
        _mindLeftLabel.textAlignment = NSTextAlignmentLeft;
        _mindLeftLabel.textColor = YLZColorTitleTwo;
        _mindLeftLabel.text = @"注意事项：";
    }
    return _mindLeftLabel;
}

- (UILabel *)mindRightLabel {
    if (!_mindRightLabel) {
        _mindRightLabel = [UILabel new];
        _mindRightLabel.font = [YLZFont regular:16];
        _mindRightLabel.numberOfLines = 0;
        _mindRightLabel.textAlignment = NSTextAlignmentLeft;
        _mindRightLabel.textColor = YLZColorTitleTwo;
        _mindRightLabel.text = @"使用健康码时不要离开本页面且需本人操作确认";
    }
    return _mindRightLabel;
}

- (UILabel *)rangeLeftLabel {
    if (!_rangeLeftLabel) {
        _rangeLeftLabel = [UILabel new];
        _rangeLeftLabel.font = [YLZFont regular:16];
        _rangeLeftLabel.numberOfLines = 0;
        _rangeLeftLabel.textAlignment = NSTextAlignmentLeft;
        _rangeLeftLabel.textColor = YLZColorTitleTwo;
        _rangeLeftLabel.text = @"使用范围：";
    }
    return _rangeLeftLabel;
}

- (UILabel *)rangeRightLabel {
    if (!_rangeRightLabel) {
        _rangeRightLabel = [UILabel new];
        _rangeRightLabel.font = [YLZFont regular:14];
        _rangeRightLabel.numberOfLines = 0;
        _rangeRightLabel.textAlignment = NSTextAlignmentLeft;
        _rangeRightLabel.textColor = YLZColorTitleTwo;
        _rangeRightLabel.text = @"依托全国一体化政务政务服务平台，实现跨省（区、市）数据共享和互通互认";
    }
    return _rangeRightLabel;
}

- (UILabel *)telLeftLabel {
    if (!_telLeftLabel) {
        _telLeftLabel = [UILabel new];
        _telLeftLabel.font = [YLZFont regular:16];
        _telLeftLabel.numberOfLines = 0;
        _telLeftLabel.textAlignment = NSTextAlignmentLeft;
        _telLeftLabel.textColor = YLZColorTitleTwo;
        _telLeftLabel.text = @"客服电话：";
    }
    return _telLeftLabel;
}

- (UILabel *)telRightLabel {
    if (!_telRightLabel) {
        _telRightLabel = [UILabel new];
        _telRightLabel.font = [YLZFont regular:16];
        _telRightLabel.numberOfLines = 0;
        _telRightLabel.textAlignment = NSTextAlignmentLeft;
        _telRightLabel.textColor = YLZColorTitleTwo;
        _telRightLabel.text = @"400-666-1331 （7*24小时）";
    }
    return _telRightLabel;
}

- (UILabel *)mainOrgLeftLabel {
    if (!_mainOrgLeftLabel) {
        _mainOrgLeftLabel = [UILabel new];
        _mainOrgLeftLabel.font = [YLZFont regular:16];
        _mainOrgLeftLabel.numberOfLines = 0;
        _mainOrgLeftLabel.textAlignment = NSTextAlignmentLeft;
        _mainOrgLeftLabel.textColor = YLZColorTitleTwo;
        _mainOrgLeftLabel.text = @"主办机构：";
    }
    return _mainOrgLeftLabel;
}

- (UILabel *)mainOrgRightLabel {
    if (!_mainOrgRightLabel) {
        _mainOrgRightLabel = [UILabel new];
        _mainOrgRightLabel.font = [YLZFont regular:16];
        _mainOrgRightLabel.numberOfLines = 0;
        _mainOrgRightLabel.textAlignment = NSTextAlignmentLeft;
        _mainOrgRightLabel.textColor = YLZColorTitleTwo;
        _mainOrgRightLabel.text = @"福建省数字办 卫健委 医保局";
    }
    return _mainOrgRightLabel;
}

- (UILabel *)subOrgLeftLabel {
    if (!_subOrgLeftLabel) {
        _subOrgLeftLabel = [UILabel new];
        _subOrgLeftLabel.font = [YLZFont regular:16];
        _subOrgLeftLabel.numberOfLines = 0;
        _subOrgLeftLabel.textAlignment = NSTextAlignmentLeft;
        _subOrgLeftLabel.textColor = YLZColorTitleTwo;
        _subOrgLeftLabel.text = @"承办机构：";
    }
    return _subOrgLeftLabel;
}

- (UILabel *)subOrgRightLabel {
    if (!_subOrgRightLabel) {
        _subOrgRightLabel = [UILabel new];
        _subOrgRightLabel.font = [YLZFont regular:16];
        _subOrgRightLabel.numberOfLines = 0;
        _subOrgRightLabel.textAlignment = NSTextAlignmentLeft;
        _subOrgRightLabel.textColor = YLZColorTitleTwo;
        _subOrgRightLabel.text = @"福建省大数据集团有限公司";
    }
    return _subOrgRightLabel;
}



@end
