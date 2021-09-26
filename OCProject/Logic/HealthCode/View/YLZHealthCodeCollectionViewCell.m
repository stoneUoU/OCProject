//
//  YLZHealthCodeCollectionViewCell.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeCollectionViewCell.h"

@interface YLZHealthCodeCollectionViewCell()

@property (nonatomic, strong) UIImageView *starImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YLZHealthCodeCollectionViewCell

#pragma mark - Init
#pragma mark -

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = YLZColorWhite;
        [self setUI];
    }
    return self;
}

#pragma mark - Public
#pragma mark -

- (void)setModelString:(NSString *)modelString {
    _modelString = modelString;
    self.titleLabel.text = modelString;
}

#pragma mark - Private
#pragma mark -

- (void)setUI {
    [self.contentView addSubview:self.starImageView];
    [self.contentView addSubview:self.titleLabel];
    [self setMas];
}

- (void)setMas {
    [self.starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.centerY.equalTo(self.contentView);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.starImageView.mas_right).offset(4);
        make.centerY.equalTo(self.contentView);
    }];
}

- (UIImageView *)starImageView {
    if(_starImageView == nil) {
        _starImageView = [[UIImageView alloc] init];
        _starImageView.image = [UIImage imageNamed:@"ylz_mzt_star"];
    }
    return _starImageView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [YLZFont regular:16];
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

@end
