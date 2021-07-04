//
//  YLZBlacklistTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZBlacklistTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZBlacklistTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *avaterImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIButton *removeButton;

@end

@implementation YLZBlacklistTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setBlacklistModel:(YLZBlacklistModel *)blacklistModel {
    _blacklistModel = blacklistModel;
    self.nameLabel.text = blacklistModel.nameString;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    
    [self.bgView addSubview:self.avaterImageView];
    [self.bgView addSubview:self.nameLabel];
    [self.bgView addSubview:self.removeButton];
    
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
        make.size.equalTo(@(CGSizeMake(60, 60)));
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.avaterImageView.mas_right).offset(16);
    }];
    [self.removeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.right.equalTo(self.bgView.mas_right).offset(-24);
        make.size.equalTo(@(CGSizeMake(72, 36)));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toRemove:(UIButton *)sender {
    !self.blacklistTableViewCellHandle ?: self.blacklistTableViewCellHandle(0);
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
        _nameLabel.font = [YLZFont medium:16];
        _nameLabel.textColor = YLZColorTitleOne;
    }
    return _nameLabel;
}

- (UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [UIImageView new];
        _avaterImageView.backgroundColor = YLZColorOrangeView;
        _avaterImageView.layer.masksToBounds = YES;
        _avaterImageView.layer.cornerRadius = 30.0;
    }
    return _avaterImageView;
}

- (UIButton *)removeButton {
    if (!_removeButton) {
        _removeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _removeButton.titleLabel.font = [YLZFont regular:14];
        _removeButton.backgroundColor = [UIColor whiteColor];
        _removeButton.layer.cornerRadius = 18;
        _removeButton.layer.borderWidth = 1;
        _removeButton.layer.masksToBounds = YES;
        _removeButton.layer.borderColor = [YLZColorOrangeView CGColor];
        [_removeButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_removeButton setTitle:@"移除" forState:UIControlStateNormal];
        [_removeButton addTarget:self action:@selector(toRemove:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _removeButton;
}

@end




