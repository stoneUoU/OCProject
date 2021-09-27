//
//  YLZHealthCodeInfoTableViewCell.m
//  OCProject
//
//  Created by stone on 2021/9/24.
//

#import "YLZHealthCodeInfoTableViewCell.h"
#import "YLZKitCategory.h"

@interface YLZHealthCodeInfoTableViewCell()

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *senderButton;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *certNoLabel;

@property (nonatomic, strong) UIButton *excuteButton;

@property (nonatomic, assign) BOOL isOn;

@property (nonatomic, assign) NSInteger clickNum;

@end

@implementation YLZHealthCodeInfoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clickNum = 0;
        self.backgroundColor = YLZColorMZTBlueView;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView addSubview:self.picImageView];
    [self.bgView addSubview:self.titleLabel];
    [self.bgView addSubview:self.senderButton];
    
    [self.bgView addSubview:self.nameLabel];
    [self.bgView addSubview:self.certNoLabel];
    [self.bgView addSubview:self.excuteButton];
    
    [self setMas];
}

- (void)setMas {
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(16);
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-16);
    }];
    
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView);
        make.left.equalTo(self.bgView);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.picImageView);
        make.left.equalTo(self.picImageView.mas_right).offset(12);
    }];
    
    [self.senderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.picImageView);
        make.left.equalTo(self.titleLabel.mas_right).offset(12);
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picImageView.mas_bottom).offset(12);
        make.left.equalTo(self.picImageView.mas_left);
    }];
    [self.certNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        make.left.equalTo(self.picImageView.mas_left);
    }];
    [self.excuteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.right.equalTo(self.bgView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(96, 36)));
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)toOperate:(UIButton *)sender {
    self.isOn = !self.isOn;
    if (self.isOn) {
        [self.senderButton setImage:[UIImage imageNamed:@"ylz_eye_show"] forState:UIControlStateNormal];
        self.nameLabel.text = @"姓名： 彭于晏";
        self.certNoLabel.text = @"身份证号： 362324199509185186";
    } else {
        [self.senderButton setImage:[UIImage imageNamed:@"ylz_eye_hide"] forState:UIControlStateNormal];
        self.nameLabel.text = @"姓名： 彭*晏";
        self.certNoLabel.text = @"身份证号： 362324********5186";
    }
}

- (void)toExcute:(UIButton *)sender {
    self.clickNum = self.clickNum+1;
    if (self.clickNum>2) {
        self.clickNum = 0;
    }
    !self.handle ?: self.handle(self.clickNum);
}

#pragma mark - getter

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [UIImageView new];
        _picImageView.image = [UIImage imageNamed:@"ylz_mzt_logo_blue"];
    }
    return _picImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont medium:18];
        _titleLabel.textColor = YLZColorWhite;
        _titleLabel.text = @"福建八闽健康码";
    }
    return _titleLabel;
}

- (UIButton *)senderButton {
    if (!_senderButton) {
        _senderButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _senderButton.tag = 0;
        [_senderButton setImage:[UIImage imageNamed:@"ylz_eye_hide"] forState:UIControlStateNormal];
        [_senderButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_senderButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _senderButton;
}

- (UILabel *)nameLabel {
    if(_nameLabel == nil) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [YLZFont regular:16];
        _nameLabel.textColor = YLZColorWhite;
        _nameLabel.text = @"姓名： 彭*晏";
    }
    return _nameLabel;
}

- (UILabel *)certNoLabel {
    if(_certNoLabel == nil) {
        _certNoLabel = [[UILabel alloc] init];
        _certNoLabel.font = [YLZFont regular:16];
        _certNoLabel.textColor = YLZColorWhite;
        _certNoLabel.text = @"身份证号： 362324********5186";
    }
    return _certNoLabel;
}

- (UIButton *)excuteButton {
    if (!_excuteButton) {
        _excuteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _excuteButton.titleLabel.font = [YLZFont regular:14];
        _excuteButton.layer.cornerRadius = 18;
        _excuteButton.layer.masksToBounds = YES;
        _excuteButton.backgroundColor = YLZColorWhite;
        [_excuteButton setTitleColor:YLZColorMZTBlueView forState:UIControlStateNormal];
        _excuteButton.tag = 0;
        [_excuteButton setTitle:@"改变颜色" forState:UIControlStateNormal];
        [_excuteButton addTarget:self action:@selector(toExcute:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _excuteButton;
}

@end




