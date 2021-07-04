//
//  YLZHomeViewController.m
//  OCProject
//
//  Created by stone on 2021/7/2.
//

#import "YLZHomeViewController.h"

#import "YLZSettingViewController.h"
#import "YLZSecretSettingViewController.h"
#import "YLZAddMeMethodViewController.h"
#import "YLZBlacklistViewController.h"
#import "YLZChangePasswordViewController.h"
#import "YLZSwitchAccountViewController.h"
#import "YLZAddAccountViewController.h"
#import "YLZFeedBackViewController.h"
#import "YLZBindPhoneViewController.h"
#import "YLZChangePhoneViewController.h"
#import "YLZLoginViewController.h"

#import "YLZKitCategory.h"
#import "YLZNetWork.h"

@interface YLZHomeViewController ()

@property (nonatomic, strong) NSMutableArray *homeModelArrays;

@property (nonatomic, strong) UIButton *btnOk;

@end

@implementation YLZHomeViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)dealloc {
    YLZLOG(@"界面销毁");
}

- (instancetype)init
{
    self = [super init ];//当前对象self
    if (self !=nil) {//如果对象初始化成功，才有必要进行接下来的初始化
    }
    return self;//返回一个已经初始化完毕的对象；
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBaseUI:YLZColorBlue withTitleString:@"首页" withTitleColor:YLZColorWhite withLeftImageViewString:@"" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    
    [self setUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.btnOk];
    [self setMas];
}

- (void)setMas {
    [self.btnOk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 40)));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)btnOKClick {
//    YLZLOG(@"YYYYYYYYY");
//    self.view.backgroundColor = [UIColor redColor];
//    [YLZNetWork requestWithType:YLZHttpRequestTypeGet withUrlString:@"/provide/home_data" withParaments:@{} withShowLoading:YES withShowError:YES withSuccessBlock:^(NSDictionary * _Nonnull object) {
//        YLZLOG(@"object______%@",[object modelToJSONString]);
//    } withFailureBlock:^(NSError * _Nonnull error) {
////        YLZLOG();
//    }];
    
    //设置：
//    YLZSettingViewController *vc = [[YLZSettingViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
//    //隐私设置：
//    YLZSecretSettingViewController *vc = [[YLZSecretSettingViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //添加我的方式：
//    YLZAddMeMethodViewController *vc = [[YLZAddMeMethodViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //黑名单：
//    YLZBlacklistViewController *vc = [[YLZBlacklistViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //密码修改：
//    YLZChangePasswordViewController *vc = [[YLZChangePasswordViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //切换帐号：
//    YLZSwitchAccountViewController *vc = [[YLZSwitchAccountViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //添加帐号：
//    YLZAddAccountViewController *vc = [[YLZAddAccountViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
//    //意见反馈
//    YLZFeedBackViewController *vc = [[YLZFeedBackViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //更改绑定手机号
//    YLZChangePhoneViewController *vc = [[YLZChangePhoneViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //绑定手机号：
//    YLZBindPhoneViewController *vc = [[YLZBindPhoneViewController alloc] init];
//    [[YLZPageExtent sharedInstance] pushExistingViewController:vc];
    
    //登录：
    YLZLoginViewController *vc = [[YLZLoginViewController alloc] init];
    [[YLZPageExtent sharedInstance] presentExistingViewController:vc];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.view.backgroundColor = [UIColor greenColor];
}

#pragma mark - Notice
#pragma mark -


#pragma mark - Delegate
#pragma mark -

#pragma mark - lazy load
#pragma mark -

- (NSMutableArray *)homeModelArrays {
    if (!_homeModelArrays) {
        _homeModelArrays = [NSMutableArray array];
    }
    return _homeModelArrays;
}

- (UIButton *)btnOk
{
    if (!_btnOk) {
        _btnOk = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnOk setTitle:@"首页" forState:UIControlStateNormal];
        [_btnOk setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
        _btnOk.titleLabel.font = [YLZFont medium:16.f];
        _btnOk.layer.cornerRadius = 20.f;
        _btnOk.layer.masksToBounds = YES;
        _btnOk.layer.borderColor = [YLZColorBlue CGColor];
        _btnOk.layer.borderWidth = 0.5;
        [_btnOk addTarget:self action:@selector(btnOKClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnOk;
}


@end
