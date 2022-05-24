//
//  YLZLoginViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZLoginViewController.h"
#import "YLZRegisterViewController.h"
#import "YLZForgetPasswordViewController.h"
#import "YLZAlertForceView.h"
#import "YLZSetIdentityViewController.h"

#import "YLZEnlargeButton.h"

static CGFloat const kLoginMargin = 32.0;

@interface YLZLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *topImageView;

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UIView *phoneView;

@property (nonatomic, strong) UIImageView *phoneImageView;

@property (nonatomic, strong) UITextField *phoneTextField;

@property (nonatomic, strong) UIView *passwordView;

@property (nonatomic, strong) UIImageView *passwordImageView;

@property (nonatomic, strong) UITextField *passwordTextField;

@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, strong) UIButton *forgetButton;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) YLZEnlargeButton *agreementButton;

@property (nonatomic, strong) YYLabel *secretLabel;

@property (nonatomic, strong) UILabel *thirdLoginLabel;

@property (nonatomic, strong) UIView *thirdLoginView;

@property (nonatomic, strong) UIButton *qqButton;

@property (nonatomic, strong) UIButton *wxButton;

@property (nonatomic, strong) UIButton *sinaButton;

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
    [self.phoneView addSubview:self.phoneImageView];
    [self.phoneView addSubview:self.phoneTextField];
    
    [self.view addSubview:self.passwordView];
    [self.passwordView addSubview:self.passwordImageView];
    [self.passwordView addSubview:self.passwordTextField];
    
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.forgetButton];
    [self.view addSubview:self.loginButton];
    
    [self.view addSubview:self.secretLabel];
    [self.view addSubview:self.agreementButton];
    
    [self.view addSubview:self.thirdLoginView];
    [self.view addSubview:self.thirdLoginLabel];
    
    [self.thirdLoginView addSubview:self.qqButton];
    [self.thirdLoginView addSubview:self.wxButton];
    [self.thirdLoginView addSubview:self.sinaButton];
    
    [self setMas];
}

- (void)setMas {
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, StatusBarHeight+NavBarHeight+140)));
    }];
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topImageView.mas_bottom).offset(34);
        make.left.equalTo(self.view.mas_left).offset(kLoginMargin);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 2*kLoginMargin, 20)));
    }];
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(kLoginMargin);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 2*kLoginMargin, 40)));
    }];
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneView);
        make.right.equalTo(self.phoneView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(22, 22)));
    }];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.phoneView);
        make.left.equalTo(self.phoneView.mas_left).offset(16);
        make.right.equalTo(self.phoneImageView.mas_left).offset(16);
        make.height.equalTo(@(30));
    }];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(24);
        make.left.equalTo(self.view.mas_left).offset(kLoginMargin);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 2*kLoginMargin, 40)));
    }];
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordView);
        make.right.equalTo(self.passwordView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(22, 22)));
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.passwordView);
        make.left.equalTo(self.passwordView.mas_left).offset(16);
        make.right.equalTo(self.passwordImageView.mas_left).offset(16);
        make.height.equalTo(@(30));
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordView.mas_bottom).offset(24);
        make.left.equalTo(self.passwordView.mas_left);
    }];
    [self.forgetButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordView.mas_bottom).offset(24);
        make.right.equalTo(self.passwordView.mas_right);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forgetButton.mas_bottom).offset(32);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 2*kLoginMargin, 40)));
    }];
    [self.secretLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(16);
        make.centerX.equalTo(self.view);
    }];
    [self.agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.secretLabel.mas_left).offset(-16);
        make.centerY.equalTo(self.secretLabel);
    }];
    [self.thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight + 24));
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 88)));
    }];
    [self.thirdLoginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.thirdLoginView.mas_top).offset(-(16));
        make.centerX.equalTo(self.view);
    }];
    [self.qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdLoginView);
        make.left.equalTo(self.thirdLoginView.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-32-52)/3, 64)));
    }];
    [self.wxButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdLoginView);
        make.left.equalTo(self.qqButton.mas_right).offset(10);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-32-52)/3, 64)));
    }];
    [self.sinaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.thirdLoginView);
        make.left.equalTo(self.wxButton.mas_right).offset(10);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-32-52)/3, 64)));
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
        YLZLOG(@"立即注册");
        YLZRegisterViewController *vc = [[YLZRegisterViewController alloc] init];
        [[YLZPageHelper sharedInstance] pushExistingViewController:vc];
    } else if (sender.tag == 1) {
        YLZLOG(@"忘记密码？");
        YLZForgetPasswordViewController *vc = [[YLZForgetPasswordViewController alloc] init];
        [[YLZPageHelper sharedInstance] pushExistingViewController:vc];
    } else {
        YLZLOG(@"立即登录");
        YLZAlertForceView *alertView = [[YLZAlertForceView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        YLZAlertForceModel *model = [[YLZAlertForceModel alloc] init];
        model.titleString = @"是否分享当天空闲时间？";
        model.okString = @"分享";
        model.cancelString = @"取消";
        alertView.model = model;
        alertView.handle = ^(NSInteger index) {
            YLZSetIdentityViewController *vc = [[YLZSetIdentityViewController alloc] init];
            [[YLZPageHelper sharedInstance] pushExistingViewController:vc];
        };
        [alertView showAlert];
    }
}

- (void)toFastLogin:(UIButton *)sender {
    if (sender.tag == 0) {
        YLZLOG(@"qq");
    } else if (sender.tag == 1) {
        YLZLOG(@"wx");
    } else {
        YLZLOG(@"sina");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)btnAgreeMentClick
{
    self.agreementButton.selected = !self.agreementButton.selected;
    if (self.agreementButton.selected) {
//        self.protocolLabel.textColor = HSAColorBlueView;
    } else {
//        self.protocolLabel.textColor = HSAColorTitleThree;
    }
}

- (void)textFieldChange:(UITextField *)textField {
    
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
        _topImageView.image = [UIImage imageNamed:@"ylz_login_top_bg"];
    }
    return _topImageView;
}

- (UILabel *)fontLabel {
    if (!_fontLabel) {
        _fontLabel = [UILabel new];
        _fontLabel.font = [YLZFont bold:20];
        _fontLabel.textColor = YLZColorTitleOne;
        _fontLabel.text = @"登录/注册";
    }
    return _fontLabel;
}

- (UIView *)phoneView {
    if (!_phoneView) {
        _phoneView = [UIView new];
        _phoneView.layer.borderColor = [YLZColorLine CGColor];
        _phoneView.layer.cornerRadius = 20;
        _phoneView.layer.borderWidth = 1.0;
        _phoneView.layer.masksToBounds = YES;
    }
    return _phoneView;
}

- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [[UITextField alloc] init];
        _phoneTextField.font = [YLZFont medium:14.f];
        _phoneTextField.textColor = YLZColorTitleOne;
        _phoneTextField.delegate = self;
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.tag = 0;
        NSDictionary *attributes = @{NSFontAttributeName: [YLZFont regular:14], NSForegroundColorAttributeName: YLZColorTitleFour};
        _phoneTextField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"请输入手机号" attributes:attributes];
        _phoneTextField.keyboardType = UIKeyboardTypePhonePad;
        [_phoneTextField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _phoneTextField;
}

- (UIImageView *)phoneImageView {
    if (!_phoneImageView) {
        _phoneImageView = [UIImageView new];
        _phoneImageView.image = [UIImage imageNamed:@"ylz_login_phone"];
    }
    return _phoneImageView;
}

- (UIView *)passwordView {
    if (!_passwordView) {
        _passwordView = [UIView new];
        _passwordView.layer.borderColor = [YLZColorLine CGColor];
        _passwordView.layer.cornerRadius = 20;
        _passwordView.layer.borderWidth = 1.0;
        _passwordView.layer.masksToBounds = YES;
    }
    return _passwordView;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.font = [YLZFont medium:14.f];
        _passwordTextField.textColor = YLZColorTitleOne;
        _passwordTextField.delegate = self;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.tag = 1;
        NSDictionary *attributes = @{NSFontAttributeName: [YLZFont regular:14], NSForegroundColorAttributeName: YLZColorTitleFour};
        _passwordTextField.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"请输入密码" attributes:attributes];
        [_passwordTextField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passwordTextField;
}

- (UIImageView *)passwordImageView {
    if (!_passwordImageView) {
        _passwordImageView = [UIImageView new];
        _passwordImageView.image = [UIImage imageNamed:@"ylz_login_password"];
    }
    return _passwordImageView;
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
        _loginButton.layer.cornerRadius = 20;
        _loginButton.layer.masksToBounds = YES;
        _loginButton.backgroundColor = YLZColorOrangeView;
        [_loginButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_loginButton setTitle:@"立即登录" forState:UIControlStateNormal];
        _loginButton.tag = 2;
        [_loginButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UILabel *)thirdLoginLabel {
    if (!_thirdLoginLabel) {
        _thirdLoginLabel = [UILabel new];
        _thirdLoginLabel.font = [YLZFont regular:14];
        _thirdLoginLabel.textColor = YLZColorTitleThree;
        _thirdLoginLabel.text = @"你也可以用以下方式登录";
    }
    return _thirdLoginLabel;
}

- (UIView *)thirdLoginView {
    if (!_thirdLoginView) {
        _thirdLoginView = [UIView new];
//        _thirdLoginView.backgroundColor = YLZColorRedView;
//        _thirdLoginView.layer.cornerRadius = 18;
//        _thirdLoginView.layer.masksToBounds = YES;
    }
    return _thirdLoginView;
}

- (UIButton *)qqButton {
    if (!_qqButton) {
        _qqButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _qqButton.tag = 0;
        [_qqButton setImage:[UIImage imageNamed:@"ylz_login_qq"] forState:UIControlStateNormal];
        [_qqButton addTarget:self action:@selector(toFastLogin:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqButton;
}

- (UIButton *)wxButton {
    if (!_wxButton) {
        _wxButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _wxButton.tag = 1;
        [_wxButton setImage:[UIImage imageNamed:@"ylz_login_wx"] forState:UIControlStateNormal];
        [_wxButton addTarget:self action:@selector(toFastLogin:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wxButton;
}

- (UIButton *)sinaButton {
    if (!_sinaButton) {
        _sinaButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sinaButton.tag = 2;
        [_sinaButton setImage:[UIImage imageNamed:@"ylz_login_sina"] forState:UIControlStateNormal];
        [_sinaButton addTarget:self action:@selector(toFastLogin:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sinaButton;
}

- (YYLabel *)secretLabel {
    if(_secretLabel == nil) {
        _secretLabel = [[YYLabel alloc] init];
        _secretLabel.textAlignment = NSTextAlignmentCenter;
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont regular:14], NSForegroundColorAttributeName: YLZColorTitleThree};
        NSMutableAttributedString *agreementAttr = [[NSMutableAttributedString alloc] initWithString:@"我已阅读并同意《用户协议》" attributes:attributes];
        [agreementAttr setTextHighlightRange:[[agreementAttr string] rangeOfString:@"《用户协议》"] color:YLZColorOrangeView backgroundColor:UIColor.clearColor tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            YLZLOG(@"用户协议");
        }];
        _secretLabel.attributedText = agreementAttr;
//        _secretLabel.numberOfLines = 0;
//        _secretLabel.preferredMaxLayoutWidth = SCREENWIDTH-72;//YYLabel要换行需要设置最大宽度
    }
    return _secretLabel;
}

- (YLZEnlargeButton *)agreementButton
{
    if (!_agreementButton) {
        _agreementButton = [YLZEnlargeButton buttonWithType:UIButtonTypeCustom];
        [_agreementButton setImage:[UIImage imageNamed:@"ylz_agreement_select"] forState:UIControlStateNormal];
        [_agreementButton setImage:[UIImage imageNamed:@"ylz_agreement_selected"] forState:UIControlStateSelected];
        _agreementButton.enlargeEdge_ylz = UIEdgeInsetsMake(5, 5, 5, 5);
        [_agreementButton addTarget:self action:@selector(btnAgreeMentClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreementButton;
}


@end


