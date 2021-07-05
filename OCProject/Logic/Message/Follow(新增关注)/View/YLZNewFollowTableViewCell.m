//
//  YLZNewFollowTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//  用作Row

#import "YLZNewFollowTableViewCell.h"
#import "YLZNewFollowModel.h"
#import "YLZKitCategory.h"

#import "YLZCategory.h"

@interface YLZNewFollowTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *avaterImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, strong) UILabel *clockLabel;

@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation YLZNewFollowTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(YLZNewFollowModel *)model {
    _model = model;
    self.avaterImageView.image = [UIImage imageNamed:model.picString];
    self.titleLabel.text = model.titleString;
    self.contentLabel.text = model.contentString;
    self.clockLabel.text = model.timeString;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.avaterImageView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.contentLabel];
    [self.bgView addSubview:self.clockLabel];
    [self.bgView addSubview:self.rightImageView];
    
    [self setMas];
}

- (void)setMas {
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(16);
        make.centerY.equalTo(self.bgView);
        make.size.equalTo(@(CGSizeMake(60, 60)));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avaterImageView.mas_top);
        make.left.equalTo(self.avaterImageView.mas_right).offset(8);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.avaterImageView.mas_right).offset(8);
    }];
    [self.clockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avaterImageView.mas_bottom).offset(3);
        make.left.equalTo(self.avaterImageView.mas_right).offset(8);
    }];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right).offset(-16);
        make.centerY.equalTo(self.bgView);
        make.size.equalTo(@(CGSizeMake(54, 54)));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
//    !self.handle ?: self.handle(sender.tag);
}

#pragma mark - getter


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = YLZColorCellBackGround;
        _bgView.layer.cornerRadius = 21;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}

- (UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [UIImageView new];
        _avaterImageView.layer.masksToBounds = YES;
        _avaterImageView.layer.cornerRadius = 30;
    }
    return _avaterImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:16];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [YLZFont regular:12];
        _contentLabel.textColor = YLZColorTitleTwo;
        _contentLabel.numberOfLines = 1;
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UILabel *)clockLabel {
    if (!_clockLabel) {
        _clockLabel = [UILabel new];
        _clockLabel.font = [YLZFont regular:11];
        _clockLabel.textColor = YLZColorTitleThree;
    }
    return _clockLabel;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        _rightImageView = [UIImageView new];
        _rightImageView.backgroundColor = YLZColorRed;
        _rightImageView.layer.masksToBounds = YES;
        _rightImageView.layer.cornerRadius = 6;
    }
    return _rightImageView;
}

@end

