//
//  YLZChangePasswordViewController.m
//  OCProject
//
//  Created by stone on 2021/7/3.
//

#import "YLZChangePasswordViewController.h"

#import "YLZConstTextFieldView.h"

@interface YLZChangePasswordViewController()

@property (nonatomic, strong) YLZConstTextFieldView *oldPwdView;

@property (nonatomic, strong) YLZConstTextFieldView *newPwdView;

@property (nonatomic, strong) YLZConstTextFieldView *confirmPwdView;

@property (nonatomic, strong) UIButton *doneButton;

@end

@implementation YLZChangePasswordViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"密码修改" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back" withRightString:@"" withRightColor:YLZColorWhite];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.oldPwdView];
    [self.view addSubview:self.newPwdView];
    [self.view addSubview:self.confirmPwdView];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.oldPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+24);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 64)));
    }];
    [self.newPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldPwdView.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 64)));
    }];
    [self.confirmPwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newPwdView.mas_bottom).offset(12);
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH- 32, 64)));
    }];
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.confirmPwdView.mas_bottom).offset(120);
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
        _doneButton.backgroundColor = [UIColor whiteColor];
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
