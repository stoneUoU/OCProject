//
//  YLZAccountTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZAccountTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZAccountTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *avaterImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *phoneLabel;

@property (nonatomic, strong) UIImageView *checkImageView;

@end

@implementation YLZAccountTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setModel:(YLZAccountModel *)model {
    _model = model;
    self.nameLabel.text = model.nameString;
    self.phoneLabel.text = model.phoneString;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    
    [self.bgView addSubview:self.avaterImageView];
    [self.bgView addSubview:self.nameLabel];
    [self.bgView addSubview:self.phoneLabel];
    [self.bgView addSubview:self.checkImageView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).offset(24);
        make.centerY.equalTo(self.bgView);
        make.size.equalTo(@(CGSizeMake(36, 36)));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avaterImageView.mas_top).offset(-2);
        make.left.equalTo(self.avaterImageView.mas_right).offset(16);
    }];
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avaterImageView.mas_bottom).offset(2);
        make.left.equalTo(self.avaterImageView.mas_right).offset(16);
    }];
    [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView.mas_right).offset(-24);
        make.centerY.equalTo(self.bgView);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
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

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [YLZFont regular:14];
        _nameLabel.textColor = YLZColorTitleOne;
    }
    return _nameLabel;
}

- (UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [UIImageView new];
        _avaterImageView.backgroundColor = YLZColorOrangeView;
        _avaterImageView.layer.masksToBounds = YES;
        _avaterImageView.layer.cornerRadius = 18.0;
    }
    return _avaterImageView;
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [UILabel new];
        _phoneLabel.font = [YLZFont regular:14];
        _phoneLabel.textColor = YLZColorTitleThree;
    }
    return _phoneLabel;
}

- (UIImageView *)checkImageView {
    if (!_checkImageView) {
        _checkImageView = [UIImageView new];
    }
    return _checkImageView;
}



@end





