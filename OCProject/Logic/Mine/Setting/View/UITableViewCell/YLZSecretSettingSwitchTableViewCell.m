//
//  YLZSecretSettingSwitchTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//  背景+文字+UISwitch

#import "YLZSecretSettingSwitchTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZSecretSettingSwitchTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UISwitch *ylzSwitch;

@end

@implementation YLZSecretSettingSwitchTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setSettingModel:(YLZSettingModel *)settingModel {
    _settingModel = settingModel;
    self.titleLabel.text = settingModel.titleString;
    self.ylzSwitch.tag = settingModel.indexTag;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.ylzSwitch];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.bgView.mas_left).offset(24);
    }];
    
    [self.ylzSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
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

- (void)toSwitch:(UISwitch *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(toSwitchClick:)]) {
        [self.delegate toSwitchClick:sender];
    }
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:14];
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

- (UISwitch *)ylzSwitch {
    if (!_ylzSwitch) {
        _ylzSwitch = [UISwitch new];
        _ylzSwitch.onTintColor = YLZColorOrangeView;
        [_ylzSwitch addTarget:self action:@selector(toSwitch:) forControlEvents:UIControlEventValueChanged];
    }
    return _ylzSwitch;
}

@end




