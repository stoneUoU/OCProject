//
//  YLZRouteCodeRecordCell.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeRecordCell.h"
#import "YLZKitCategory.h"
#import "YLZCategory.h"

@interface YLZRouteCodeRecordCell()

@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIImageView *iconLeftImageView;
@property (nonatomic, strong) UILabel *titleLeftLabel;
@property (nonatomic, strong) UILabel *subTitleLeftLabel;
@property (nonatomic, strong) UIView *leftSeparatorView;

@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UIImageView *iconRightImageView;
@property (nonatomic, strong) UILabel *titleRightLabel;
@property (nonatomic, strong) UILabel *subTitleRightLabel;
@property (nonatomic, strong) UIView *rightSeparatorView;

@end

@implementation YLZRouteCodeRecordCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = YLZColorRouteCode;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.leftView];
    [self.leftView addSubview:self.iconLeftImageView];
    [self.leftView addSubview:self.titleLeftLabel];
    [self.leftView addSubview:self.subTitleLeftLabel];
    [self.leftView addSubview:self.leftSeparatorView];
    
    [self.contentView addSubview:self.rightView];
    [self.rightView addSubview:self.iconRightImageView];
    [self.rightView addSubview:self.titleRightLabel];
    [self.rightView addSubview:self.subTitleRightLabel];
    [self.rightView addSubview:self.rightSeparatorView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(24);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 48 - 16)/2, 96)));
    }];
    [self.titleLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leftView.mas_top).offset(8);
        make.left.equalTo(self.leftView.mas_left).offset(16);
    }];
    [self.leftSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.leftView);
        make.left.equalTo(self.leftView.mas_left).offset(12);
        make.size.equalTo(@(CGSizeMake(48, 0.5)));
    }];
    [self.subTitleLeftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.leftView.mas_bottom).offset(-12);
        make.left.equalTo(self.leftView.mas_left).offset(16);
    }];
    [self.iconLeftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.leftView.mas_bottom);
        make.right.equalTo(self.leftView.mas_right);
    }];
    
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-24);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 48 - 16)/2, 96)));
    }];
    [self.titleRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightView.mas_top).offset(8);
        make.left.equalTo(self.rightView.mas_left).offset(16);
    }];
    [self.rightSeparatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rightView);
        make.left.equalTo(self.rightView.mas_left).offset(12);
        make.size.equalTo(@(CGSizeMake(48, 0.5)));
    }];
    [self.subTitleRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.rightView.mas_bottom).offset(-12);
        make.left.equalTo(self.rightView.mas_left).offset(16);
    }];
    [self.iconRightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.rightView.mas_bottom);
        make.right.equalTo(self.rightView.mas_right);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    
}

#pragma mark - getter

- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [UIView new];
        _leftView.backgroundColor = YLZColorWhite;
        _leftView.layer.cornerRadius = 12.0;
        _leftView.layer.masksToBounds = YES;
    }
    return _leftView;
}

- (UIImageView *)iconLeftImageView {
    if (!_iconLeftImageView) {
        _iconLeftImageView = [UIImageView new];
        _iconLeftImageView.image = [UIImage imageNamed:@"ylz_record_fresh"];
    }
    return _iconLeftImageView;
}

- (UILabel *)titleLeftLabel {
    if (!_titleLeftLabel) {
        _titleLeftLabel = [UILabel new];
        _titleLeftLabel.font = [YLZFont medium:20];
        _titleLeftLabel.textColor = YLZColorTitleOne;
        _titleLeftLabel.text = @"无14天内记录";
    }
    return _titleLeftLabel;
}

- (UILabel *)subTitleLeftLabel {
    if (!_subTitleLeftLabel) {
        _subTitleLeftLabel = [UILabel new];
        _subTitleLeftLabel.font = [YLZFont medium:16];
        _subTitleLeftLabel.textColor = YLZColorTitleOne;
        _subTitleLeftLabel.text = @"核酸检测";
    }
    return _subTitleLeftLabel;
}

- (UIView *)leftSeparatorView {
    if (!_leftSeparatorView) {
        _leftSeparatorView = [UIView new];
        _leftSeparatorView.backgroundColor = YLZColorLine;
    }
    return _leftSeparatorView;
}

- (UIView *)rightView {
    if (!_rightView) {
        _rightView = [UIView new];
        _rightView.backgroundColor = YLZColorWhite;
        _rightView.layer.cornerRadius = 12.0;
        _rightView.layer.masksToBounds = YES;
    }
    return _rightView;
}

- (UIImageView *)iconRightImageView {
    if (!_iconRightImageView) {
        _iconRightImageView = [UIImageView new];
        _iconRightImageView.image = [UIImage imageNamed:@"ylz_jiezhong_all"];
    }
    return _iconRightImageView;
}

- (UILabel *)titleRightLabel {
    if (!_titleRightLabel) {
        _titleRightLabel = [UILabel new];
        _titleRightLabel.font = [YLZFont medium:20];
        _titleRightLabel.textColor = YLZColorTitleOne;
        _titleRightLabel.text = @"已全程接种";
    }
    return _titleRightLabel;
}

- (UILabel *)subTitleRightLabel {
    if (!_subTitleRightLabel) {
        _subTitleRightLabel = [UILabel new];
        _subTitleRightLabel.font = [YLZFont medium:16];
        _subTitleRightLabel.textColor = YLZColorTitleOne;
        _subTitleRightLabel.text = @"疫苗接种";
    }
    return _subTitleRightLabel;
}

- (UIView *)rightSeparatorView {
    if (!_rightSeparatorView) {
        _rightSeparatorView = [UIView new];
        _rightSeparatorView.backgroundColor = YLZColorLine;
    }
    return _rightSeparatorView;
}

@end





