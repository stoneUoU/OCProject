//
//  YLZRouteCodeViewController.m
//  OCProject
//
//  Created by stone on 2022/4/26.
//

#import "YLZRouteCodeView.h"
#import "YLZRouteCodeViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface YLZRouteCodeViewController () <YLZRouteCodeViewDelegate>
    
@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *operateView;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIButton *shutButton;

@property (nonatomic, strong) YLZRouteCodeView *routeCodeView;

@end

@implementation YLZRouteCodeViewController
    
#pragma mark - LifeCycle
#pragma mark-

- (void)dealloc
{
    NSLog(@"界面销毁");
}
    
- (instancetype)init  {
    self = [super init ];//当前对象self
    if (self !=nil) {//如果对象初始化成功，才有必要进行接下来的初始化
    }
    return self;//返回一个已经初始化完毕的对象；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
//    [SVProgressHUD showWithStatus:@"加载中..."];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    //纯文本模式
    hud.mode = MBProgressHUDModeIndeterminate;
//        hud.bezelView.backgroundColor = YLZColorTitleTwo;
    //设置提示标题
    hud.label.text = @"加载中...";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [SVProgressHUD dismiss];
        [hud hideAnimated:YES];
        self.routeCodeView.isLoading = NO;
        [self.routeCodeView.tableView reloadData];
    });
}
    
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true];
    self.navigationController.navigationBarHidden = true;
}
    
- (void)viewDidDisappear:(BOOL)animated {
     [super viewDidDisappear:animated];
}
    
#pragma mark - Public Method
#pragma mark -
    
#pragma mark - Private Method
#pragma mark -
    
- (void)setUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.statusView];
    [self.view addSubview:self.navigationView];
    [self.navigationView addSubview:self.titleLabel];
    [self.navigationView addSubview:self.operateView];
    [self.operateView addSubview:self.moreButton];
    [self.operateView addSubview:self.separatorView];
    [self.operateView addSubview:self.shutButton];
    
    [self.view addSubview:self.routeCodeView];
    
    [self setMas];
}
    
- (void)setMas {
    [self.statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, StatusBarHeight)));
    }];
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusView.mas_bottom);
        make.left.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, NavBarHeight)));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigationView);
    }];
    [self.operateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.right.equalTo(self.navigationView.mas_right).offset(-16);
        make.size.equalTo(@(CGSizeMake(80, 30)));
    }];
    [self.separatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.operateView);
        make.size.equalTo(@(CGSizeMake(0.5, 16)));
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.right.equalTo(self.separatorView.mas_left).offset(-8);
    }];
    [self.shutButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.left.equalTo(self.separatorView.mas_right).offset(8);
    }];
    [self.routeCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationView.mas_bottom);
        make.left.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, SCREENHEIGHT - (StatusBarHeight+NavBarHeight))));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toOperate:(UIButton *)sender {
    
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
        _statusView.backgroundColor = YLZColorWhite;
    }
    return _statusView;
}

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc] init];
        _navigationView.backgroundColor = YLZColorWhite;
    }
    return _navigationView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:18];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"福建八闽健康码";
    }
    return _titleLabel;
}

- (UIView *)operateView {
    if (!_operateView) {
        _operateView = [[UIView alloc] init];
        _operateView.layer.cornerRadius = 15.0;
        _operateView.layer.masksToBounds = YES;
        _operateView.layer.borderWidth = 0.5;
        _operateView.layer.borderColor = YLZColorTitleThree.CGColor;
    }
    return _operateView;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreButton.tag = 0;
        [_moreButton setImage:[UIImage imageNamed:@"ylz_mirco_more"] forState:UIControlStateNormal];
        [_moreButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (UIView *)separatorView {
    if (!_separatorView) {
        _separatorView = [[UIView alloc] init];
        _separatorView.backgroundColor = YLZColorTitleThree;
    }
    return _separatorView;
}

- (UIButton *)shutButton {
    if (!_shutButton) {
        _shutButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shutButton.tag = 0;
        [_shutButton setImage:[UIImage imageNamed:@"ylz_mirco_shut"] forState:UIControlStateNormal];
        [_shutButton setTitleColor:YLZColorTitleTwo forState:UIControlStateNormal];
        [_shutButton addTarget:self action:@selector(toOperate:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shutButton;
}

- (YLZRouteCodeView *)routeCodeView {
    if (!_routeCodeView){
        _routeCodeView = [[YLZRouteCodeView alloc] init];
        _routeCodeView.delegate = self; //将YLZRouteCodeViewController自己的实例作为委托对象
    }
    return _routeCodeView;
}
    
@end

