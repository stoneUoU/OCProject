//
//  YLZSetGenderViewController.m
//  OCProject
//
//  Created by stone on 2021/7/4.
//  设置性别：

#import "YLZSetGenderViewController.h"
#import "YLZSetNameViewController.h"

#import "YLZCategory.h"

@interface YLZSetGenderViewController()

@property (nonatomic, strong) UILabel *chooseLabel;

@property (nonatomic, strong) UIButton *femaleView;

@property (nonatomic, strong) UIImageView *femaleImageView;

@property (nonatomic, strong) UIImageView *femaleCheckedImageView;

@property (nonatomic, strong) UILabel *femaleLabel;

@property (nonatomic, strong) UIButton *maleView;

@property (nonatomic, strong) UIImageView *maleImageView;

@property (nonatomic, strong) UIImageView *maleCheckedImageView;

@property (nonatomic, strong) UILabel *maleLabel;

@property (nonatomic, strong) UIButton *doneButton;

@property (nonatomic, assign) NSInteger gender;

@end

@implementation YLZSetGenderViewController

#pragma mark - LifeCycle
#pragma mark -

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gender = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = YLZColorWhite;
    
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorTitleOne withLeftImageViewString:@"ylz_back_circle" withRightString:@"步骤1/4" withRightColor:YLZColorTitleThree withRightFontSize:14];
    [self setUI];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self.view addSubview:self.chooseLabel];
    
    [self.view addSubview:self.femaleView];
    [self.femaleView addSubview:self.femaleImageView];
    [self.femaleView addSubview:self.femaleCheckedImageView];
    [self.femaleView addSubview:self.femaleLabel];
    
    [self.view addSubview:self.maleView];
    [self.maleView addSubview:self.maleImageView];
    [self.maleView addSubview:self.maleCheckedImageView];
    [self.maleView addSubview:self.maleLabel];
    
    [self.view addSubview:self.doneButton];
    [self setMas];
}

- (void)setMas {
    [self.chooseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(StatusBarHeight+NavBarHeight+72);
        make.centerX.equalTo(self.view);
    }];
    //个人：
    [self.femaleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chooseLabel.mas_bottom).offset(54);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-54)/2, 160)));
    }];
    [self.femaleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.femaleView.mas_top).offset(16);
        make.centerX.equalTo(self.femaleView);
    }];
    [self.femaleCheckedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.femaleImageView.mas_bottom);
        make.right.equalTo(self.femaleImageView.mas_right);
    }];
    [self.femaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.femaleView.mas_bottom);
        make.centerX.equalTo(self.femaleView);
    }];
    //组织：
    [self.maleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chooseLabel.mas_bottom).offset(54);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake((SCREENWIDTH-54)/2, 160)));
    }];
    [self.maleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.maleView.mas_top).offset(16);
        make.centerX.equalTo(self.maleView);
    }];
    [self.maleCheckedImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.maleImageView.mas_bottom);
        make.right.equalTo(self.maleImageView.mas_right);
    }];
    [self.maleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.maleView.mas_bottom);
        make.centerX.equalTo(self.maleView);
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
    
    if (self.gender == 0) {
        [self.view makeToast:@"请选择性别" duration:1.0 position:CSToastPositionCenter];
        return;
    }
    
    YLZSetNameViewController *vc = [[YLZSetNameViewController alloc] init];
    [[YLZPageHelper sharedInstance] pushExistingViewController:vc withParam:@{@"gender":@(self.gender)}];
}

- (void)toChecked:(UIButton *)sender {
    if (sender.tag == 0) {
        self.femaleCheckedImageView.image = [UIImage imageNamed:@"ylz_agreement_selected"];
        self.maleCheckedImageView.image = [UIImage imageNamed:@""];
        self.gender = 2;
    } else {
        self.femaleCheckedImageView.image = [UIImage imageNamed:@""];
        self.maleCheckedImageView.image = [UIImage imageNamed:@"ylz_agreement_selected"];
        self.gender = 1;
    }
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UILabel *)chooseLabel {
    if (!_chooseLabel) {
        _chooseLabel = [UILabel new];
        _chooseLabel.font = [YLZFont regular:22];
        _chooseLabel.textColor = YLZColorTitleOne;
        _chooseLabel.text = @"你的性别是？";
    }
    return _chooseLabel;
}

- (UIButton *)femaleView {
    if (!_femaleView) {
        _femaleView = [UIButton new];
        _femaleView.tag = 0;
        [_femaleView addTarget:self action:@selector(toChecked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _femaleView;
}

- (UIImageView *)femaleImageView {
    if (!_femaleImageView) {
        _femaleImageView = [UIImageView new];
        _femaleImageView.image = [UIImage imageNamed:@"ylz_follow_female"];
    }
    return _femaleImageView;
}

- (UIImageView *)femaleCheckedImageView {
    if (!_femaleCheckedImageView) {
        _femaleCheckedImageView = [UIImageView new];
    }
    return _femaleCheckedImageView;
}

- (UILabel *)femaleLabel {
    if (!_femaleLabel) {
        _femaleLabel = [UILabel new];
        _femaleLabel.font = [YLZFont regular:14];
        _femaleLabel.textColor = YLZColorTitleOne;
        _femaleLabel.text = @"小姐姐";
    }
    return _femaleLabel;
}

- (UIButton *)maleView {
    if (!_maleView) {
        _maleView = [UIButton new];
        _maleView.tag = 1;
        [_maleView addTarget:self action:@selector(toChecked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _maleView;
}

- (UIImageView *)maleImageView {
    if (!_maleImageView) {
        _maleImageView = [UIImageView new];
        _maleImageView.image = [UIImage imageNamed:@"ylz_follow_male"];
    }
    return _maleImageView;
}

- (UIImageView *)maleCheckedImageView {
    if (!_maleCheckedImageView) {
        _maleCheckedImageView = [UIImageView new];
    }
    return _maleCheckedImageView;
}

- (UILabel *)maleLabel {
    if (!_maleLabel) {
        _maleLabel = [UILabel new];
        _maleLabel.font = [YLZFont regular:14];
        _maleLabel.textColor = YLZColorTitleOne;
        _maleLabel.text = @"小哥哥";
    }
    return _maleLabel;
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

