//
//  YLZMineHeaderView.m
//  OCProject
//
//  Created by stone on 2021/7/5.
//

#import "YLZMineHeaderView.h"

@interface YLZMineHeaderView()

@property (nonatomic, strong) UIView *wrapView;

@property (nonatomic, strong) UILabel *avaterLabel;

@property (nonatomic, strong) UIImageView *genderImageView;

@property (nonatomic, strong) UIImageView *editImageView;

@property (nonatomic, strong) UIImageView *avaterImageView;

@property (nonatomic, strong) UILabel *infoLabel;

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

@end

