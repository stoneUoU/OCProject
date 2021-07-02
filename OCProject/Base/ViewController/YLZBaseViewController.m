//
//  YLZBaseViewController.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZBaseViewController.h"

@interface YLZBaseViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic ,strong)UIView *statusView;

@property (nonatomic ,strong)UIView *navigationView;

@property (nonatomic ,strong)UILabel *titleLabel;

@property (nonatomic ,strong)UIButton *leftButton;

@property (nonatomic ,strong)UIButton *rightButton;

@end

@implementation YLZBaseViewController

#pragma mark - LifeCycle
#pragma mark -

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    pan.delegate = self;
    [self.view addGestureRecognizer:pan];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    [self setBaseUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
    self.navigationController.navigationBarHidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Method
#pragma mark -

- (void)setBaseUI:(UIColor *)navigationViewColor withTitleString:(NSString *)titleString withTitleColor:(UIColor *)titleColor withLeftImageViewString:(NSString *)leftImageViewString withRightString:(NSString *)rightString withRightColor:(UIColor *)rightColor {
    
    self.statusView.backgroundColor = navigationViewColor;
    self.navigationView.backgroundColor = navigationViewColor;
    
    [self.leftButton setImage:[UIImage imageNamed:leftImageViewString]forState:UIControlStateNormal];
    
    self.titleLabel.text = titleString;
    self.titleLabel.textColor = titleColor;
    
    [self.rightButton setTitle:rightString forState:UIControlStateNormal];
    [self.rightButton setTitleColor:rightColor  forState:UIControlStateNormal];
}

#pragma mark - Private Method
#pragma mark -

- (void)setBaseUI {
    [self.view addSubview:self.statusView];
    [self.view addSubview:self.navigationView];
    
    [self.navigationView addSubview:self.leftButton];
    [self.navigationView addSubview:self.rightButton];
    [self.navigationView addSubview:self.titleLabel];
    
    [self setBaseMas];
}

- (void)setBaseMas {
    // mas_makeConstraints 就是 Masonry 的 autolayout 添加函数，将所需的约束添加到block中就行。
    [self.statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(StatusBarHeight);
    }];
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusView.mas_bottom);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(NavBarHeight);
    }];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.left.equalTo(self.navigationView.mas_left);
        make.height.mas_equalTo(NavBarHeight);
    }];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.right.equalTo(self.navigationView.mas_right);
        make.height.mas_equalTo(NavBarHeight);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigationView);
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

#pragma mark - IB-Action
#pragma mark -

- (void)toBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)toSide {
    YLZLOG(@"toSide");
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (UIView *)statusView {
    if (!_statusView) {
        _statusView = [[UIView alloc] init];
    }
    return _statusView;
}

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] init];
    }
    return _navigationView;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] init];
        [_leftButton addTarget:self action:@selector(toBack)forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] init];
        _rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
        _rightButton.contentHorizontalAlignment = NSTextAlignmentRight;
        [_rightButton addTarget:self action:@selector(toSide)forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font=[UIFont systemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

