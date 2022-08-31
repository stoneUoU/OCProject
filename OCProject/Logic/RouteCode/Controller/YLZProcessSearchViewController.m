//
//  YLZProcessSearchViewController.m
//  OCProject
//
//  Created by stone on 2022/8/30.
//

#import <MBProgressHUD/MBProgressHUD.h>

#import "YLZProcessSearchViewController.h"
#import "YLZProcessCardView.h"
#import "YLZProgressHUDHelper.h"

@interface YLZProcessSearchViewController ()
    
@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIView *operateView;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIButton *shutButton;

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *logoLabel;

@property (nonatomic, strong) YLZProcessCardView *processCardView;

@property (strong, nonatomic) UILabel *serviceLabel;

@property (strong, nonatomic) UIImageView *leftLineImageView;

@property (strong, nonatomic) UIImageView *rightLineImageView;

@end

@implementation YLZProcessSearchViewController
    
#pragma mark - LifeCycle
#pragma mark-

- (void)dealloc
{
    NSLog(@"界面销毁");
}
    
- (instancetype)init  {
    self = [super init];//当前对象self
    if (self !=nil) {//如果对象初始化成功，才有必要进行接下来的初始化
    }
    return self;//返回一个已经初始化完毕的对象；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
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
    [self.navigationView addSubview:self.backButton];
    [self.navigationView addSubview:self.titleLabel];
    [self.navigationView addSubview:self.operateView];
    [self.navigationView addSubview:self.lineView];
    [self.operateView addSubview:self.moreButton];
    [self.operateView addSubview:self.separatorView];
    [self.operateView addSubview:self.shutButton];
    
    [self.view addSubview:self.logoImageView];
    [self.view addSubview:self.logoLabel];
    [self.view addSubview:self.processCardView];
    
    [self.view addSubview:self.serviceLabel];
    [self.view addSubview:self.leftLineImageView];
    [self.view addSubview:self.rightLineImageView];
    
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
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.left.equalTo(self.navigationView.mas_left).offset(16);
        make.height.mas_equalTo(NavBarHeight);
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
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.navigationView);
        make.left.equalTo(self.navigationView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, 0.5)));
    }];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.navigationView.mas_bottom).offset(16);
    }];
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.logoImageView.mas_bottom).offset(12);
    }];
    [self.processCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.width.equalTo(@(SCREENWIDTH - 32));
        make.top.equalTo(self.logoLabel.mas_bottom).offset(16);
    }];
    [self.serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processCardView.mas_bottom).offset(24);
        make.centerX.equalTo(self.view);
    }];
    
    [self.leftLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.serviceLabel.mas_left).offset(-16);
        make.centerY.equalTo(self.serviceLabel);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.height.equalTo(@(0.5));
    }];
    
    [self.rightLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.serviceLabel.mas_right).offset(16);
        make.centerY.equalTo(self.serviceLabel);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.equalTo(@(0.5));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toOperate:(UIButton *)sender {

}

- (void)toBack {
    [self.navigationController popViewControllerAnimated:YES];
}
 
#pragma mark - Notice
#pragma mark -
    
#pragma mark - Delegate
#pragma mark -

- (void)toExcute:(NSInteger )index {
}
    
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

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = YLZColorTitleFour;
    }
    return _lineView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [[UIButton alloc] init];
        [_backButton setImage:[UIImage imageNamed:@"ylz_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(toBack)forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [YLZFont regular:18];
        _titleLabel.textColor = YLZColorTitleOne;
        _titleLabel.text = @"福建健康码";
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

- (UILabel *)logoLabel {
    if (!_logoLabel) {
        _logoLabel = [UILabel new];
        _logoLabel.font = [YLZFont regular:18];
        _logoLabel.textColor = [UIColor  colorWithHexString:@"#254194"];
        _logoLabel.text = @"疫情防控，人人有责";
    }
    return _logoLabel;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [UIImageView new];
        _logoImageView.image = [UIImage imageNamed:@"ylz_process_logo"];
    }
    return _logoImageView;
}

- (YLZProcessCardView *)processCardView {
    if(_processCardView == nil) {
        _processCardView = [[YLZProcessCardView alloc] init];
        _processCardView.backgroundColor = [UIColor whiteColor];
        _processCardView.layer.cornerRadius = 3.0;
//        _processCardView.clipsToBounds = YES;
        _processCardView.layer.shadowColor = YLZColorTitleFour.CGColor;
        _processCardView.layer.shadowOffset = CGSizeMake(0,6);
        _processCardView.layer.shadowOpacity = 1;
        _processCardView.layer.shadowRadius = 12;
        __weak typeof(self) weakSelf = self;
        _processCardView.tapHandle = ^(NSInteger index) {
            if (index == 0) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
                //纯文本模式
                hud.mode = MBProgressHUDModeIndeterminate;
                //设置提示标题
                hud.label.text = @"加载中...";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hideAnimated:YES];
                    [YLZProgressHUDHelper showSuccessSvg:@"发送成功!"];
                });
            } else {
                
            }
        };
    }
    return _processCardView;
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel new];
        _serviceLabel.font = [YLZFont regular:14];
        _serviceLabel.textColor = YLZColorTitleThree;
        _serviceLabel.text = @"本服务联合提供";
    }
    return _serviceLabel;
}

- (UIImageView *)leftLineImageView
{
    if (!_leftLineImageView) {
        _leftLineImageView = [[UIImageView alloc]init];
        _leftLineImageView.backgroundColor = [UIColor colorWithHexString:@"0xcecece"];
    }
    return _leftLineImageView;
}

- (UIImageView *)rightLineImageView
{
    if (!_rightLineImageView) {
        _rightLineImageView = [[UIImageView alloc]init];
        _rightLineImageView.backgroundColor = [UIColor colorWithHexString:@"0xcecece"];
    }
    return _rightLineImageView;
}
    
@end
