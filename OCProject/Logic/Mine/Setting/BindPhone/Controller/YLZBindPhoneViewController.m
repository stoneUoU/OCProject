//
//  YLZBindPhoneViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZBindPhoneViewController.h"

#import "YLZConstTextFieldView.h"
#import "YLZSmsCodeTextFieldView.h"

#import "YLZCategory.h"

@interface YLZBindPhoneViewController()

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZBindPhoneViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"绑定手机号" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.picImageView];
    [self.view addSubview:self.fontLabel];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+72);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(72, 72)));
    }];
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.picImageView.mas_bottom).offset(36);
        make.centerX.equalTo(self.view);
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom).offset(120);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 44)));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.layer.cornerRadius = 36;
        _picImageView.layer.masksToBounds = YES;
        _picImageView.backgroundColor = YLZColorRedView;
    }
    return _picImageView;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont regular:16];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"已绑定手机号：15717914505";
    }
    return _fontLabel;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:14];
        _doneButton.layer.cornerRadius = 18;
        _doneButton.layer.masksToBounds = YES;
        _doneButton.backgroundColor = YLZColorOrangeView;
        [_doneButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_doneButton setTitle:@"确定" forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end

