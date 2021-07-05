//
//  YLZForgetPasswordViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//

#import "YLZForgetPasswordViewController.h"

#import "YLZConstTextFieldView.h"
#import "YLZSmsCodeTextFieldView.h"

#import "YLZCategory.h"

static CGFloat const kRegisterMargin = 16.0;

@interface YLZForgetPasswordViewController()

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) YLZConstTextFieldView *oldPwdView;

@property (nonatomic, strong) YLZSmsCodeTextFieldView *smsCodeView;

@property (nonatomic, strong) YLZConstTextFieldView *newPwdView;

@property (nonatomic, strong) YLZConstTextFieldView *confirmPwdView;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZForgetPasswordViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self.view addSubview:self.fontLabel];
    
    [self.view addSubview:self.oldPwdView];
    [self.view addSubview:self.smsCodeView];
    [self.view addSubview:self.newPwdView];
    [self.view addSubview:self.confirmPwdView];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+6);
        make.left.equalTo(self.view.mas_left).offset(36);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 20)));
    }];
    [self.oldPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom).offset(18);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 2*kRegisterMargin, 66)));
    }];
    [self.smsCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldPwdView.mas_bottom).offset(8);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 2*kRegisterMargin, 66)));
    }];
    [self.newPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.smsCodeView.mas_bottom).offset(8);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 2*kRegisterMargin, 66)));
    }];
    [self.confirmPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newPwdView.mas_bottom).offset(8);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 2*kRegisterMargin, 66)));
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.confirmPwdView.mas_bottom).offset(120);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 2*kRegisterMargin, 40)));
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

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont regular:20];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"忘记密码";
    }
    return _fontLabel;
}

- (YLZConstTextFieldView *)oldPwdView {
    if (!_oldPwdView) {
        _oldPwdView = [[YLZConstTextFieldView alloc] init];
        _oldPwdView.nameString = @"旧密码";
        _oldPwdView.textFieldString = @"请输入旧密码";
        _oldPwdView.layer.cornerRadius = 10;
        _oldPwdView.layer.masksToBounds = YES;
        _oldPwdView.backgroundColor = YLZColorCellBackGround;
    }
    return _oldPwdView;
}

- (YLZSmsCodeTextFieldView *)smsCodeView {
    if (!_smsCodeView) {
        _smsCodeView = [[YLZSmsCodeTextFieldView alloc] init];
        _smsCodeView.nameString = @"验证码";
        _smsCodeView.textFieldString = @"请输入手机验证码";
        _smsCodeView.keyboardType = UIKeyboardTypeNumberPad;
        _smsCodeView.layer.cornerRadius = 10;
        _smsCodeView.layer.masksToBounds = YES;
        _smsCodeView.backgroundColor = YLZColorCellBackGround;
        _smsCodeView.textFieldHandle = ^(UITextField *textField) {
            YLZLOG(@"_______%@",textField.text);
        };
        _smsCodeView.smsHandle = ^(UIButton *sender) {
            YLZLOG(@"_______");
            [sender ylz_startWithTime:60 title:@"获取验证码" countDownTitle:@"s" bgingColor:YLZColorCellBackGround bgcolor:YLZColorCellBackGround titlingColor:YLZColorOrangeView titleColor:YLZColorOrangeView];
        };
    }
    return _smsCodeView;
}

- (YLZConstTextFieldView *)newPwdView {
    if (!_newPwdView) {
        _newPwdView = [[YLZConstTextFieldView alloc] init];
        _newPwdView.nameString = @"新密码";
        _newPwdView.textFieldString = @"请输入新密码";
        _newPwdView.layer.cornerRadius = 10;
        _newPwdView.layer.masksToBounds = YES;
        _newPwdView.backgroundColor = YLZColorCellBackGround;
    }
    return _newPwdView;
}

- (YLZConstTextFieldView *)confirmPwdView {
    if (!_confirmPwdView) {
        _confirmPwdView = [[YLZConstTextFieldView alloc] init];
        _confirmPwdView.nameString = @"确认密码";
        _confirmPwdView.textFieldString = @"请再次输入新密码";
        _confirmPwdView.layer.cornerRadius = 10;
        _confirmPwdView.layer.masksToBounds = YES;
        _confirmPwdView.backgroundColor = YLZColorCellBackGround;
    }
    return _confirmPwdView;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:14];
        _doneButton.layer.cornerRadius = 18;
        _doneButton.layer.masksToBounds = YES;
        _doneButton.backgroundColor = YLZColorOrangeView;
        [_doneButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_doneButton setTitle:@"完成" forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end

