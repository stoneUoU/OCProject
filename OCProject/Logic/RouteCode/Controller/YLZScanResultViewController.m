//
//  YLZScanResultViewController.m
//  OCProject
//
//  Created by stone on 2022/9/2.
//

#import "YLZScanResultView.h"
#import "YLZScanResultViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

#import "YLZ3DESEncryptHelper.h"
#import "YLZPluginModel.h"
#import "YLZRSAHelper.h"
#import "YLZNetWork.h"

#import <HSAPlugin/HSAPlugin.h>
#import "YLZScanViewController.h"
#import "YLZAcidCheckViewController.h"
#import "YLZProcessSearchViewController.h"

@interface YLZScanResultViewController () <YLZScanResultViewDelegate>
    
@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *operateView;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIButton *shutButton;

@property (nonatomic, strong) YLZScanResultView *scanResultView;

@end

@implementation YLZScanResultViewController
    
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
    [self.scanResultView.tableView reloadData];
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
    [self.operateView addSubview:self.moreButton];
    [self.operateView addSubview:self.separatorView];
    [self.operateView addSubview:self.shutButton];
    
    [self.view addSubview:self.scanResultView];
    
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
    [self.scanResultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationView.mas_bottom);
        make.left.equalTo(self.view);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, SCREENHEIGHT - (StatusBarHeight+NavBarHeight))));
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
    
//    NSString *modelStr = [@{@"isOpen":@(YES),@"modelName":@"iOS开发工程师"} modelToJSONString];
//
//    NSString *encryptStr = [YLZRSAHelper encryptString:modelStr privateKey:privateKeyString];
//
//    NSString *decryptStr = [YLZRSAHelper decryptString:encryptStr publicKey:publicKeyString];
//
//    YLZLOG(@"加密_____%@",encryptStr);
//
//    YLZLOG(@"解密_____%@",decryptStr);
//
//    [YLZNetWork requestWithType:YLZHttpRequestTypeGet withUrlString:@"/FaceObject/hsaFaceObject.php" withParaments:@{@"encData":encryptStr} withShowLoading:YES withShowError:YES withSuccessBlock:^(NSDictionary * _Nonnull object) {
//        YLZLOG(@"object______%@",[object modelToJSONString]);
//
//        NSString *decryptStr = [YLZRSAHelper decryptString:[object objectForKey:@"encData"] publicKey:publicKeyString];
//
//        YLZLOG(@"decryptStr______%@",decryptStr);
//
//    } withFailureBlock:^(NSError * _Nonnull error) {
//    }];
    
//    [HSAPlugins fetchSwitch:^(BOOL isSwitch) {
//
//    }];
    
//    [HSAPlugins excuteURL:^(NSString * _Nonnull str) {
//
//        YLZPluginModel *model = [YLZPluginModel modelWithJSON:str];
//
//        YLZLOG(@"str_____%d",model.isOpen);
//        YLZLOG(@"str_____%@",model.modelName);
//    }];

}

- (void)toScan {
    YLZLOG(@"扫一扫");
    YLZScanViewController *vc = [[YLZScanViewController alloc] init];
    vc.scanHandle = ^(NSString * _Nonnull scanResult) {
        YLZLOG(@"扫码成功_____%@",scanResult);
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        //纯文本模式
        hud.mode = MBProgressHUDModeIndeterminate;
        //设置提示标题
        hud.label.text = @"加载中...";
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    };
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toProcess {
    YLZLOG(@"点击查询行程卡");
    YLZProcessSearchViewController *vc = [[YLZProcessSearchViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toRecord:(NSInteger)index {
    if (index == 0) {
        YLZAcidCheckViewController *vc = [[YLZAcidCheckViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        YLZLOG(@"疫苗接种");
    }
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
        _titleLabel.text = @"张贴码";
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

- (YLZScanResultView *)scanResultView {
    if (!_scanResultView){
        _scanResultView = [[YLZScanResultView alloc] init];
        _scanResultView.delegate = self; //将YLZScanResultViewController自己的实例作为委托对象
    }
    return _scanResultView;
}
    
@end

