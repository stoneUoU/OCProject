//
//  YLZMessageCollectionViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZMessageCollectionViewCell.h"
#import "YLZOperateModel.h"

@interface YLZMessageCollectionViewCell()

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *orangeDotView;

@property (nonatomic, strong) UILabel *orangeDotLabel;

@end

@implementation YLZMessageCollectionViewCell

#pragma mark - Init
#pragma mark -

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

#pragma mark - Public
#pragma mark -

- (void)setModel:(YLZOperateModel *)model {
    _model = model;
    self.picImageView.image = [UIImage imageNamed:model.picString];
    self.titleLabel.text = model.titleString;
    self.orangeDotView.hidden = model.count == 0;
    self.orangeDotLabel.text = [NSString stringWithFormat:@"%ld",(long)model.count];
}

#pragma mark - Private
#pragma mark -

- (void)setUI {
    [self.contentView addSubview:self.picImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.orangeDotView];
    [self.orangeDotView addSubview:self.orangeDotLabel];
    
    [self setMas];
}

- (void)setMas {
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_top).offset(20);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.picImageView.mas_bottom).offset(12);
    }];
    [self.orangeDotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picImageView.mas_top);
        make.right.equalTo(self.picImageView.mas_right);
        make.size.equalTo(@(CGSizeMake(16, 16)));
    }];
    [self.orangeDotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.orangeDotView);
    }];
}

- (UIImageView *)picImageView {
    if(_picImageView == nil) {
        _picImageView = [[UIImageView alloc] init];
    }
    return _picImageView;
}

- (UILabel *)titleLabel {
    if(_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [YLZFont regular:14];
        _titleLabel.textColor = YLZColorTitleTwo;
    }
    return _titleLabel;
}

- (UIView *)orangeDotView {
    if(_orangeDotView == nil) {
        _orangeDotView = [[UIView alloc] init];
        _orangeDotView.backgroundColor = YLZColorOrangeView;
        _orangeDotView.layer.cornerRadius = 3.0;
        _orangeDotView.layer.masksToBounds = YES;
    }
    return _orangeDotView;
}

- (UILabel *)orangeDotLabel {
    if(_orangeDotLabel == nil) {
        _orangeDotLabel = [[UILabel alloc] init];
        _orangeDotLabel.font = [YLZFont regular:14];
        _orangeDotLabel.textColor = YLZColorWhite;
    }
    return _orangeDotLabel;
}

@end

