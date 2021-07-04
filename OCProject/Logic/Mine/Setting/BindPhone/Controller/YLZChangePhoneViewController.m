//
//  YLZChangePhoneViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZChangePhoneViewController.h"

#import "YLZConstTextFieldView.h"
#import "YLZSmsCodeTextFieldView.h"

#import "YLZCategory.h"

@interface YLZChangePhoneViewController()

@property (nonatomic, strong) YLZConstTextFieldView *phoneView;

@property (nonatomic, strong) YLZSmsCodeTextFieldView *smsCodeView;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZChangePhoneViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"更改绑定手机号" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.phoneView];
    [self.view addSubview:self.smsCodeView];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+24);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 66)));
    }];
    [self.smsCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom).offset(8);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 66)));
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.smsCodeView.mas_bottom).offset(120);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 40)));
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

- (YLZConstTextFieldView *)phoneView {
    if (!_phoneView) {
        _phoneView = [[YLZConstTextFieldView alloc] init];
        _phoneView.nameString = @"手机号码";
        _phoneView.textFieldString = @"请输入手机号码";
        _phoneView.keyboardType = UIKeyboardTypePhonePad;
        _phoneView.layer.cornerRadius = 21;
        _phoneView.layer.masksToBounds = YES;
        _phoneView.backgroundColor = YLZColorCellBackGround;
        _phoneView.textFieldHandle = ^(UITextField * _Nonnull textField) {
            YLZLOG(@"_______%@",textField.text);
        };
    }
    return _phoneView;
}

- (YLZSmsCodeTextFieldView *)smsCodeView {
    if (!_smsCodeView) {
        _smsCodeView = [[YLZSmsCodeTextFieldView alloc] init];
        _smsCodeView.nameString = @"验证码";
        _smsCodeView.textFieldString = @"请输入手机验证码";
        _smsCodeView.keyboardType = UIKeyboardTypeNumberPad;
        _smsCodeView.layer.cornerRadius = 21;
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

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:14];
        _doneButton.layer.cornerRadius = 20;
        _doneButton.layer.masksToBounds = YES;
        _doneButton.backgroundColor = YLZColorOrangeView;
        [_doneButton setTitleColor:YLZColorWhite forState:UIControlStateNormal];
        [_doneButton setTitle:@"确定" forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end

