//
//  YLZLoginViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZLoginViewController.h"

@interface YLZLoginViewController ()

@property (nonatomic, strong) UIImageView *topImageView;

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIView *phoneView;

@property (nonatomic, strong) UIView *passwordView;

@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, strong) UIButton *forgetButton;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation YLZLoginViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.topImageView];
    [self.view addSubview:self.fontLabel];
    
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.passwordView];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.forgetButton];
    [self.view addSubview:self.loginButton];
    [self setMas];
}

- (void)setMas {
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, StatusBarHeight+NavBarHeight+72)));
    }];
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 44)));
    }];
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 36)));
    }];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(16);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 36)));
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordView.mas_bottom).offset(16);
        make.left.equalTo(self.passwordView.mas_left);
    }];
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordView.mas_bottom).offset(16);
        make.right.equalTo(self.passwordView.mas_right);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forgetButton.mas_bottom).offset(16);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 44)));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    YLZLOG(@"AAA");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)toDone:(UIButton *)sender {
    if (sender.tag == 0) {
        
    }
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -


#pragma mark - lazy load
#pragma mark -

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [UIImageView new];
        _topImageView.backgroundColor = YLZColorRedView;
    }
    return _topImageView;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont bold:18];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"登录/注册";
    }
    return _fontLabel;
}

- (UIView *)phoneView {
    if (!_phoneView) {
        _phoneView = [UIView new];
        _phoneView.layer.borderColor = [YLZColorLine CGColor];
        _phoneView.layer.cornerRadius = 18;
        _phoneView.layer.borderWidth = 1.0;
        _phoneView.layer.masksToBounds = YES;
    }
    return _phoneView;
}

- (UIView *)passwordView {
    if (!_passwordView) {
        _passwordView = [UIView new];
        _passwordView.layer.borderColor = [YLZColorLine CGColor];
        _passwordView.layer.cornerRadius = 18;
        _passwordView.layer.borderWidth = 1.0;
        _passwordView.layer.masksToBounds = YES;
    }
    return _passwordView;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.titleLabel.font = [YLZFont regular:14];
        [_registerButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_registerButton setTitle:@"立即注册" forState:UIControlStateNormal];
        _registerButton.tag = 0;
        [_registerButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

- (UIButton *)forgetButton {
    if (!_forgetButton) {
        _forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetButton.titleLabel.font = [YLZFont regular:14];
        [_forgetButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_forgetButton setTitle:@"忘记密码？" forState:UIControlStateNormal];
        _forgetButton.tag = 1;
        [_forgetButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetButton;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.titleLabel.font = [YLZFont regular:14];
        _loginButton.layer.cornerRadius = 18;
        _loginButton.layer.masksToBounds = YES;
        _loginButton.backgroundColor = YLZColorOrangeView;
        [_loginButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
        _loginButton.tag = 2;
        [_loginButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

@end


