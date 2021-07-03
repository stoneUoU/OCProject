//
//  YLZSettingTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//  背景+图片+文字+箭头

#import "YLZSettingTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZSettingTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation YLZSettingTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)setSettingModel:(YLZSettingModel *)settingModel {
    _settingModel = settingModel;
    self.picImageView.image = [UIImage imageNamed:settingModel.picString];
    self.titleLabel.text = settingModel.titleString;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.picImageView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.arrowImageView];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.bgView.mas_left).offset(24);
        make.size.equalTo(@(CGSizeMake(24, 24)));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.picImageView.mas_right).offset(15);
    }];
    
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
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
    }
    return _bgView;
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [UIImageView new];
        _picImageView.backgroundColor = YLZColorRed;
    }
    return _picImageView;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:14];
        _titleLabel.textColor = YLZColorTitleOne;
    }
    return _titleLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [UIImageView new];
        _arrowImageView.image = [UIImage imageNamed:@"ylz_mine_arrow"];
    }
    return _arrowImageView;
}

@end

