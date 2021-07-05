//
//  YLZNewFollowTableHeaderView.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZNewFollowTableSectionHeaderView.h"

@interface YLZNewFollowTableSectionHeaderView()

@property (nonatomic, strong) UILabel *headerLabel;

@property (nonatomic, strong) UIButton *clearButton;

@end

@implementation YLZNewFollowTableSectionHeaderView

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
    [self addSubview:self.headerLabel];
    [self addSubview:self.clearButton];
    
    [self setMas];
}

- (void)setMas {
    [self.headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.centerY.equalTo(self);
    }];
    [self.clearButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-16);
        make.centerY.equalTo(self);
    }];
}

- (void)toOperate:(UIButton *)sender {
    !self.handle ?: self.handle(0);
}

#pragma mark - IB-Action
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)headerLabel {
    if(_headerLabel == nil) {
        _headerLabel = [[UILabel alloc] init];
        _headerLabel.font = [YLZFont medium:16];
        _headerLabel.textColor = YLZColorTitleOne;
        _headerLabel.text = @"历史点赞(120)";
    }
    return _headerLabel;
}

- (UIButton *)clearButton {
    if (!_clearButton) {
        _clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _clearButton.titleLabel.font = [YLZFont regular:16];
        [_clearButton setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
        [_clearButton setTitle:@"清空" forState:UIControlStateNormal];
        [_clearButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearButton;
}


@end


