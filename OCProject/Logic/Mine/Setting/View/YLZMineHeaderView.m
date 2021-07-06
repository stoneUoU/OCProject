//
//  YLZMineHeaderView.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZMineHeaderView.h"
#import "YLZPaddingLabel.h"

@interface YLZMineHeaderView()

@property (nonatomic, strong) UIView *wrapView;

@property (nonatomic, strong) UILabel *avaterLabel;

@property (nonatomic, strong) UIImageView *genderImageView;

@property (nonatomic, strong) UIImageView *editImageView;

@property (nonatomic, strong) UIImageView *avaterImageView;

@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) YLZPaddingLabel *collegeLabel;

@property (nonatomic, strong) YLZPaddingLabel *constellationLabel;

@property (nonatomic, strong) YLZPaddingLabel *areaLabel;

@property (nonatomic, strong) UIButton *settingButton;

@property (nonatomic, strong) UIView *followView;

@property (nonatomic, strong) UILabel *followLabel;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIView *fansView;

@property (nonatomic, strong) UILabel *fansLabel;


@end

@implementation YLZMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = YLZColorView;
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    [self addSubview:self.wrapView];
    [self.wrapView addSubview:self.avaterLabel];
    [self.wrapView addSubview:self.genderImageView];
    [self.wrapView addSubview:self.editImageView];
    [self.wrapView addSubview:self.avaterImageView];
    [self.wrapView addSubview:self.infoLabel];
    
    [self.wrapView addSubview:self.collegeLabel];
    [self.wrapView addSubview:self.constellationLabel];
    [self.wrapView addSubview:self.areaLabel];
    [self.wrapView addSubview:self.settingButton];
    
    [self.wrapView addSubview:self.followView];
    [self.followView addSubview:self.followLabel];
    [self.followView addSubview:self.separatorView];
    [self.wrapView addSubview:self.fansView];
    [self.fansView addSubview:self.fansLabel];
    
    [self setMas];
}

- (void)setMas {
    [self.wrapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(StatusBarHeight+16);
        make.left.equalTo(self.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 246)));
    }];
    [self.avaterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wrapView.mas_top).offset(32);
        make.left.equalTo(self.wrapView.mas_left).offset(16);
    }];
    [self.genderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avaterLabel);
        make.left.equalTo(self.avaterLabel.mas_right).offset(10);
        make.size.equalTo(@(CGSizeMake(16, 32)));
    }];
    [self.editImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avaterLabel);
        make.left.equalTo(self.genderImageView.mas_right).offset(10);
        make.size.equalTo(@(CGSizeMake(16, 32)));
    }];
    [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wrapView.mas_top).offset(16);
        make.right.equalTo(self.wrapView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(60, 60)));
    }];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avaterLabel.mas_bottom).offset(12);
        make.left.equalTo(self.wrapView.mas_left).offset(16);
    }];
    [self.avaterImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.wrapView.mas_top).offset(16);
        make.right.equalTo(self.wrapView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(60, 60)));
    }];
    [self.collegeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLabel.mas_bottom).offset(12);
        make.left.equalTo(self.wrapView.mas_left).offset(16);
        make.height.equalTo(@(24));
    }];
    [self.constellationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.collegeLabel);
        make.left.equalTo(self.collegeLabel.mas_right).offset(10);
        make.height.equalTo(@(24));
    }];
    [self.areaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collegeLabel.mas_bottom).offset(10);
        make.left.equalTo(self.wrapView.mas_left).offset(16);
        make.height.equalTo(@(24));
    }];
    [self.settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avaterImageView.mas_bottom).offset(48);
        make.right.equalTo(self.wrapView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(88, 36)));
    }];
    
    [self.followView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.wrapView.mas_bottom);
        make.left.equalTo(self.wrapView.mas_left);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 32)/2, 60)));
    }];
    [self.followLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.followView);
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.followView);
        make.right.equalTo(self.followView.mas_right);
        make.size.equalTo(@(CGSizeMake(1, 32)));
    }];
    [self.fansView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.wrapView.mas_bottom);
        make.right.equalTo(self.wrapView.mas_right);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH - 32)/2, 60)));
    }];
    [self.fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.fansView);
    }];
}

- (void)toSetting:(UIButton *)sender {
    
}

- (UIView *)wrapView {
    if (!_wrapView) {
        _wrapView = [UIView new];
        _wrapView.backgroundColor = YLZColorWhite;
        _wrapView.layer.cornerRadius = 12;
        _wrapView.layer.shadowColor = [UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1].CGColor;
        _wrapView.layer.shadowOffset = CGSizeMake(0,6);
        _wrapView.layer.shadowOpacity = 1;
        _wrapView.layer.shadowRadius = 12;
    }
    return _wrapView;
}

- (UILabel *)avaterLabel {
    if (!_avaterLabel) {
        _avaterLabel = [UILabel new];
        _avaterLabel.font = [YLZFont regular:14];
        _avaterLabel.textColor = YLZColorTitleOne;
        _avaterLabel.text = @"小辣椒";
    }
    return _avaterLabel;
}

- (UIImageView *)genderImageView {
    if (!_genderImageView) {
        _genderImageView = [UIImageView new];
        _genderImageView.backgroundColor = YLZColorRed;
    }
    return _genderImageView;
}

- (UIImageView *)editImageView {
    if (!_editImageView) {
        _editImageView = [UIImageView new];
        _editImageView.backgroundColor = YLZColorRed;
    }
    return _editImageView;
}

- (UIImageView *)avaterImageView {
    if (!_avaterImageView) {
        _avaterImageView = [UIImageView new];
        _avaterImageView.backgroundColor = YLZColorRed;
        _avaterImageView.layer.borderColor = YLZColorWhite.CGColor;
        _avaterImageView.layer.borderWidth = 2.0;
        _avaterImageView.layer.masksToBounds = YES;
        _avaterImageView.layer.cornerRadius = 30;
    }
    return _avaterImageView;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel new];
        _infoLabel.font = [YLZFont regular:14];
        _infoLabel.textColor = YLZColorTitleOne;
        _infoLabel.text = @"平平静静、简简单单";
    }
    return _infoLabel;
}

- (YLZPaddingLabel *)collegeLabel {
    if(_collegeLabel == nil) {
        _collegeLabel = [[YLZPaddingLabel alloc] init];
        _collegeLabel.font = [YLZFont regular:10];
        _collegeLabel.layer.borderWidth = 1.0;
        _collegeLabel.layer.cornerRadius = 12;
        _collegeLabel.layer.masksToBounds = YES;
        _collegeLabel.layer.borderColor = YLZColorTitleFour.CGColor;
        _collegeLabel.leftEdge = 16;
        _collegeLabel.rightEdge = 16;
        _collegeLabel.text = @"南昌工程学院";
    }
    return _collegeLabel;
}

- (YLZPaddingLabel *)constellationLabel {
    if(_constellationLabel == nil) {
        _constellationLabel = [[YLZPaddingLabel alloc] init];
        _constellationLabel.font = [YLZFont regular:10];
        _constellationLabel.layer.borderWidth = 1.0;
        _constellationLabel.layer.cornerRadius = 12;
        _constellationLabel.layer.masksToBounds = YES;
        _constellationLabel.layer.borderColor = YLZColorTitleFour.CGColor;
        _constellationLabel.leftEdge = 16;
        _constellationLabel.rightEdge = 16;
        _constellationLabel.text = @"天平座";
    }
    return _constellationLabel;
}

- (YLZPaddingLabel *)areaLabel {
    if(_areaLabel == nil) {
        _areaLabel = [[YLZPaddingLabel alloc] init];
        _areaLabel.font = [YLZFont regular:10];
        _areaLabel.layer.borderWidth = 1.0;
        _areaLabel.layer.cornerRadius = 12;
        _areaLabel.layer.masksToBounds = YES;
        _areaLabel.layer.borderColor = YLZColorTitleFour.CGColor;
        _areaLabel.leftEdge = 16;
        _areaLabel.rightEdge = 16;
        _areaLabel.text = @"福建省 · 厦门市";
    }
    return _areaLabel;
}

- (UIButton *)settingButton {
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _settingButton.layer.cornerRadius = 18.0;
        _settingButton.layer.masksToBounds = YES;
        _settingButton.layer.borderColor = [YLZColorLine CGColor];
        _settingButton.layer.borderWidth = 1.0;
        _settingButton.titleLabel.font = [YLZFont regular:14];
        [_settingButton setImage:[UIImage imageNamed:@"ylz_follow_next"] forState:UIControlStateNormal];
        [_settingButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_settingButton setTitle:@"  设置" forState:UIControlStateNormal];
        [_settingButton addTarget:self action:@selector(toSetting:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingButton;
}

- (UIView *)followView {
    if (!_followView) {
        _followView = [UIView new];
    }
    return _followView;
}

- (UILabel *)followLabel {
    if (!_followLabel) {
        _followLabel = [UILabel new];
        _followLabel.font = [YLZFont regular:14];
        _followLabel.textColor = YLZColorTitleOne;
        _followLabel.text = @"100\n关注";
        _followLabel.numberOfLines = 0;
    }
    return _followLabel;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [UIView new];
        _separatorView.backgroundColor = YLZColorTitleFour;
    }
    return _separatorView;
}

- (UIView *)fansView {
    if (!_fansView) {
        _fansView = [UIView new];
    }
    return _fansView;
}

- (UILabel *)fansLabel {
    if (!_fansLabel) {
        _fansLabel = [UILabel new];
        _fansLabel.font = [YLZFont regular:14];
        _fansLabel.textColor = YLZColorTitleOne;
        _fansLabel.text = @"100\n粉丝";
        _fansLabel.numberOfLines = 0;
    }
    return _fansLabel;
}

@end

