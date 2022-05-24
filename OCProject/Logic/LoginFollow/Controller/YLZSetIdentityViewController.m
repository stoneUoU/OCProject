//
//  YLZSetIdentityViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//  选择身份：

// 选中的logo切图

#import "YLZSetIdentityViewController.h"
#import "YLZSetGenderViewController.h"
#import "YLZSetOrganizationNameViewController.h"
#import "YLZSetCollegeViewController.h"

#import "YLZCategory.h"

@interface YLZSetIdentityViewController()

@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, strong) UILabel *chooseLabel;

@property (nonatomic, strong) UIButton *personalView;

@property (nonatomic, strong) UIImageView *personalImageView;

@property (nonatomic, strong) UIImageView *personalCheckedImageView;

@property (nonatomic, strong) UILabel *personalLabel;

@property (nonatomic, strong) UIButton *organizationView;

@property (nonatomic, strong) UIImageView *organizationImageView;

@property (nonatomic, strong) UIImageView *organizationCheckedImageView;

@property (nonatomic, strong) UILabel *organizationLabel;

@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, assign) NSInteger isOrganization;

@end

@implementation YLZSetIdentityViewController

#pragma mark - LifeCycle
#pragma mark -

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.isOrganization = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
//    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self.view addSubview:self.fontLabel];
    [self.view addSubview:self.chooseLabel];
    
    [self.view addSubview:self.personalView];
    [self.personalView addSubview:self.personalImageView];
    [self.personalView addSubview:self.personalCheckedImageView];
    [self.personalView addSubview:self.personalLabel];
    
    [self.view addSubview:self.organizationView];
    [self.organizationView addSubview:self.organizationImageView];
    [self.organizationView addSubview:self.organizationCheckedImageView];
    [self.organizationView addSubview:self.organizationLabel];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.fontLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+54);
        make.left.equalTo(self.view.mas_left).offset(32);
        make.right.equalTo(self.view.mas_right).offset(-32);
    }];
    [self.chooseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fontLabel.mas_bottom).offset(64);
        make.centerX.equalTo(self.view);
    }];
    //个人：
    [self.personalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chooseLabel.mas_bottom).offset(36);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-54)/2, 160)));
    }];
    [self.personalImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.personalView.mas_top).offset(16);
        make.centerX.equalTo(self.personalView);
    }];
    [self.personalCheckedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.personalImageView.mas_bottom);
        make.right.equalTo(self.personalImageView.mas_right);
    }];
    [self.personalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.personalView.mas_bottom);
        make.centerX.equalTo(self.personalView);
    }];
    //组织：
    [self.organizationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chooseLabel.mas_bottom).offset(36);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-54)/2, 160)));
    }];
    [self.organizationImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.organizationView.mas_top).offset(16);
        make.centerX.equalTo(self.organizationView);
    }];
    [self.organizationCheckedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.organizationImageView.mas_bottom);
        make.right.equalTo(self.organizationImageView.mas_right);
    }];
    [self.organizationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.organizationView.mas_bottom);
        make.centerX.equalTo(self.organizationView);
    }];
    
    [self.doneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight+24));
        make.centerX.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH-32, 44)));
    }];
    [self.doneButton setButtonEdgeInsetsStyle:UIButtonEdgeInsetsStyleRight margin:5];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toDone:(UIButton *)sender {
    if (self.isOrganization == 0) {
        //[self.view makeToast:@"请选择性别" duration:1.0 position:CSToastPositionCenter];
        YLZSetCollegeViewController *vc = [[YLZSetCollegeViewController alloc] init];
        [[YLZPageHelper sharedInstance] pushExistingViewController:vc];
        return;
    }
    if (self.isOrganization == 1) {
        YLZSetGenderViewController *vc = [[YLZSetGenderViewController alloc] init];
        [[YLZPageHelper sharedInstance] pushExistingViewController:vc];
    } else {
        YLZSetOrganizationNameViewController *vc = [[YLZSetOrganizationNameViewController alloc] init];
        [[YLZPageHelper sharedInstance] pushExistingViewController:vc];
    }
}

- (void)toChecked:(UIButton *)sender {
    if (sender.tag == 0) {
        self.isOrganization = 1;
        self.personalCheckedImageView.image = [UIImage imageNamed:@"ylz_agreement_selected"];
        self.organizationCheckedImageView.image = [UIImage imageNamed:@""];
    } else {
        self.isOrganization = 2;
        self.personalCheckedImageView.image = [UIImage imageNamed:@""];
        self.organizationCheckedImageView.image = [UIImage imageNamed:@"ylz_agreement_selected"];
    }
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)fontLabel {
    if(_fontLabel == nil) {
        _fontLabel = [[UILabel alloc] init];
        _fontLabel.textAlignment = NSTextAlignmentCenter;
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing= 3.0;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont regular:14], NSForegroundColorAttributeName: YLZColorTitleOne,NSParagraphStyleAttributeName:paragraphStyle};
        NSMutableAttributedString *agreementAttr = [[NSMutableAttributedString alloc] initWithString:@"HI! 你好！我是小逗，你的智能管家！很高兴终于等到你来！为了给你提供更好、更安全的交友环境，请你放心填写以下信息" attributes:attributes];
        [agreementAttr addAttribute:NSFontAttributeName value:[YLZFont regular:22] range:NSMakeRange(0,6)];
        _fontLabel.attributedText = agreementAttr;
        _fontLabel.numberOfLines = 0;
    }
    return _fontLabel;
}

- (UILabel *)chooseLabel {
    if (!_chooseLabel) {
        _chooseLabel = [UILabel new];
        _chooseLabel.font = [YLZFont regular:22];
        _chooseLabel.textColor = YLZColorTitleOne;
        _chooseLabel.text = @"请选择你的身份";
    }
    return _chooseLabel;
}

- (UIButton *)personalView {
    if (!_personalView) {
        _personalView = [UIButton new];
        _personalView.tag = 0;
        [_personalView addTarget:self action:@selector(toChecked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _personalView;
}

- (UIImageView *)personalImageView {
    if (!_personalImageView) {
        _personalImageView = [UIImageView new];
        _personalImageView.image = [UIImage imageNamed:@"ylz_follow_personal"];
    }
    return _personalImageView;
}

- (UIImageView *)personalCheckedImageView {
    if (!_personalCheckedImageView) {
        _personalCheckedImageView = [UIImageView new];
    }
    return _personalCheckedImageView;
}

- (UILabel *)personalLabel {
    if (!_personalLabel) {
        _personalLabel = [UILabel new];
        _personalLabel.font = [YLZFont regular:19];
        _personalLabel.textColor = YLZColorTitleOne;
        _personalLabel.text = @"个人";
    }
    return _personalLabel;
}

- (UIButton *)organizationView {
    if (!_organizationView) {
        _organizationView = [UIButton new];
        _organizationView.tag = 1;
        [_organizationView addTarget:self action:@selector(toChecked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _organizationView;
}

- (UIImageView *)organizationImageView {
    if (!_organizationImageView) {
        _organizationImageView = [UIImageView new];
        _organizationImageView.image = [UIImage imageNamed:@"ylz_follow_organization"];
    }
    return _organizationImageView;
}

- (UIImageView *)organizationCheckedImageView {
    if (!_organizationCheckedImageView) {
        _organizationCheckedImageView = [UIImageView new];
    }
    return _organizationCheckedImageView;
}

- (UILabel *)organizationLabel {
    if (!_organizationLabel) {
        _organizationLabel = [UILabel new];
        _organizationLabel.font = [YLZFont regular:19];
        _organizationLabel.textColor = YLZColorTitleOne;
        _organizationLabel.text = @"组织";
    }
    return _organizationLabel;
}

- (UIButton *)doneButton {
    if (!_doneButton) {
        _doneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _doneButton.titleLabel.font = [YLZFont regular:16];
        [_doneButton setTitleColor:YLZColorOrangeView forState:UIControlStateNormal];
        [_doneButton setTitle:@"下一步  " forState:UIControlStateNormal];
        [_doneButton setImage:[UIImage imageNamed:@"ylz_follow_next"] forState:UIControlStateNormal];
        [_doneButton addTarget:self action:@selector(toDone:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneButton;
}

@end

