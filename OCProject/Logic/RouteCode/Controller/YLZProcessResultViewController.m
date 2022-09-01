//
//  YLZProcessResultViewController.m
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import "YLZProcessResultViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

#import "YLZProcessResultCardView.h"
#import "YLZProgressHUDHelper.h"

@interface YLZProcessResultViewController ()<UIScrollViewDelegate>
    
@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIView *operateView;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIButton *shutButton;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *greenView;

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *logoLabel;

@property (nonatomic, strong) YLZProcessResultCardView *processCardView;

@property (strong, nonatomic) UILabel *tipLabel;

@property (strong, nonatomic) UILabel *underTipLabel;

@property (strong, nonatomic) UILabel *serviceLabel;

@property (strong, nonatomic) UIImageView *leftLineImageView;

@property (strong, nonatomic) UIImageView *rightLineImageView;

@property (strong, nonatomic) UIImageView *logosImageView;

@property (strong, nonatomic) UILabel *telLabel;

@property (nonatomic, strong) UIView *grayView;

@property (strong, nonatomic) UIView *bottomLeftView;

@property (strong, nonatomic) UIView *bottomRightView;

@property (strong, nonatomic) UILabel *fromLabel;

@property (strong, nonatomic) UILabel *insertLabel;

@property (strong, nonatomic) UIView *blackView;

@property (strong, nonatomic) UILabel *searchLabel;

@property (strong, nonatomic) UILabel *protectLabel;

@end

@implementation YLZProcessResultViewController
    
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
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.greenView];
    [self.greenView addSubview:self.logoImageView];
    [self.greenView addSubview:self.logoLabel];
    [self.greenView addSubview:self.processCardView];
    
    [self.greenView addSubview:self.tipLabel];
    [self.greenView addSubview:self.underTipLabel];
    
    [self.greenView addSubview:self.serviceLabel];
    [self.greenView addSubview:self.leftLineImageView];
    [self.greenView addSubview:self.rightLineImageView];
    [self.greenView addSubview:self.logosImageView];
    [self.greenView addSubview:self.telLabel];
    
    [self.scrollView addSubview:self.grayView];
    [self.grayView addSubview:self.bottomLeftView];
    [self.grayView addSubview:self.bottomRightView];
    
    [self.bottomLeftView addSubview:self.fromLabel];
    [self.bottomLeftView addSubview:self.insertLabel];
    [self.bottomRightView addSubview:self.blackView];
    [self.blackView addSubview:self.searchLabel];
    [self.blackView addSubview:self.protectLabel];
    
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
    [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollView);
        make.width.equalTo(@(SCREENWIDTH));
        make.top.equalTo(self.scrollView.mas_top);
    }];
    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.greenView);
        make.top.equalTo(self.greenView.mas_top).offset(16);
    }];
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.greenView);
        make.top.equalTo(self.logoImageView.mas_bottom).offset(12);
    }];
    [self.processCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.greenView);
        make.width.equalTo(@(SCREENWIDTH - 32));
        make.top.equalTo(self.logoLabel.mas_bottom).offset(16);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processCardView.mas_bottom).offset(16);
        make.centerX.equalTo(self.greenView);
        make.width.equalTo(@(SCREENWIDTH - 32));
    }];
    
    [self.underTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self.greenView);
        make.width.equalTo(@(SCREENWIDTH - 32));
    }];
    
    [self.serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.underTipLabel.mas_bottom).offset(16);
        make.centerX.equalTo(self.greenView);
    }];
    [self.leftLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.serviceLabel.mas_left).offset(-16);
        make.centerY.equalTo(self.serviceLabel);
        make.left.equalTo(self.greenView.mas_left).offset(16);
        make.height.equalTo(@(0.5));
    }];
    
    [self.rightLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.serviceLabel.mas_right).offset(16);
        make.centerY.equalTo(self.serviceLabel);
        make.right.equalTo(self.greenView.mas_right).offset(-16);
        make.height.equalTo(@(0.5));
    }];
    
    [self.logosImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.serviceLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self.greenView);
        make.width.mas_equalTo(SCREENWIDTH - 32);
    }];
    
    [self.telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logosImageView.mas_bottom).offset(12);
        make.centerX.equalTo(self.greenView);
        make.width.equalTo(@(SCREENWIDTH - 32));
        make.bottom.equalTo(self.greenView.mas_bottom).offset(-16);
    }];
    
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.greenView.mas_bottom);
        make.centerX.equalTo(self.scrollView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH, 72)));
    }];
    [self.bottomLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.grayView);
        make.width.equalTo(@((SCREENWIDTH)/2));
    }];
    [self.bottomRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.grayView);
        make.width.equalTo(@((SCREENWIDTH)/2));
    }];

    [self.fromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomLeftView.mas_top).offset(16);
        make.centerX.equalTo(self.bottomLeftView);
    }];
    [self.insertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomLeftView.mas_bottom).offset(-16);
        make.centerX.equalTo(self.bottomLeftView);
    }];
    
    [self.blackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH/2-20, 60)));
        make.center.equalTo(self.bottomRightView);
    }];
    
    [self.searchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.blackView.mas_top).offset(6);
        make.width.equalTo(@(SCREENWIDTH/2-20));
        make.centerX.equalTo(self.blackView);
    }];
    [self.protectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomRightView.mas_bottom).offset(-6);
        make.centerX.equalTo(self.bottomRightView);
    }];
    
    [self.view layoutIfNeeded];
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, CGRectGetMaxY(self.grayView.frame)+36);
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

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, StatusBarHeight+NavBarHeight, SCREENWIDTH, SCREENHEIGHT - (StatusBarHeight+NavBarHeight+BottomDangerAreaHeight))];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIView *)greenView {
    if (!_greenView) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor = [UIColor colorWithHexString:@"#67a171"];
        _greenView.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        }];
        [_greenView addGestureRecognizer:ges];
    }
    return _greenView;
}

- (UILabel *)logoLabel {
    if (!_logoLabel) {
        _logoLabel = [UILabel new];
        _logoLabel.font = [YLZFont regular:18];
        _logoLabel.textColor = [UIColor whiteColor];
        _logoLabel.text = @"疫情防控，人人有责";
    }
    return _logoLabel;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [UIImageView new];
        _logoImageView.image = [UIImage imageNamed:@"ylz_process_result_logo"];
    }
    return _logoImageView;
}

- (YLZProcessResultCardView *)processCardView {
    if(_processCardView == nil) {
        _processCardView = [[YLZProcessResultCardView alloc] init];
        _processCardView.backgroundColor = [UIColor whiteColor];
        _processCardView.layer.cornerRadius = 12;
        _processCardView.layer.masksToBounds = YES;
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
                    [YLZProgressHUDHelper showSuccessSvg:@"发送成功"];
                });
            } else {
                
            }
        };
    }
    return _processCardView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [UILabel new];
        _tipLabel.font = [YLZFont regular:10];
        _tipLabel.textColor = YLZColorWhite;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.text = @"结果包含您在前7天内到访的国家（地区）与停留4小时以上的国内城市";
        _tipLabel.numberOfLines = 0;
    }
    return _tipLabel;
}

- (UILabel *)underTipLabel {
    if (!_underTipLabel) {
        _underTipLabel = [UILabel new];
        _underTipLabel.font = [YLZFont regular:10];
        _underTipLabel.textColor = YLZColorWhite;
        _underTipLabel.textAlignment = NSTextAlignmentCenter;
        _underTipLabel.text = @"色卡仅对到访地作提醒，不关联健康状态";
        _underTipLabel.numberOfLines = 0;
    }
    return _underTipLabel;
}

- (UILabel *)serviceLabel {
    if (!_serviceLabel) {
        _serviceLabel = [UILabel new];
        _serviceLabel.font = [YLZFont regular:14];
        _serviceLabel.textColor = YLZColorWhite;
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

- (UIImageView *)logosImageView {
    if (!_logosImageView) {
        _logosImageView = [UIImageView new];
        _logosImageView.image = [UIImage imageNamed:@"ylz_process_result_logos"];
    }
    return _logosImageView;
}

- (UILabel *)telLabel {
    if (!_telLabel) {
        _telLabel = [UILabel new];
        _telLabel.font = [YLZFont regular:12];
        _telLabel.textColor = YLZColorWhite;
        _telLabel.textAlignment = NSTextAlignmentCenter;
        _telLabel.text = @"客服热线：10000/ 10086/ 10010/ 10099";
    }
    return _telLabel;
}

- (UIView *)grayView {
    if (!_grayView) {
        _grayView = [[UIView alloc] init];
        _grayView.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
        _grayView.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            YLZLOG(@"AAAA");
        }];
        [_grayView addGestureRecognizer:ges];
    }
    return _grayView;
}

- (UIView *)bottomLeftView {
    if (!_bottomLeftView) {
        _bottomLeftView = [[UIView alloc] init];
    }
    return _bottomLeftView;
}

- (UIView *)bottomRightView {
    if (!_bottomRightView) {
        _bottomRightView = [[UIView alloc] init];
    }
    return _bottomRightView;
}

- (UILabel *)fromLabel {
    if (!_fromLabel) {
        _fromLabel = [UILabel new];
        _fromLabel.font = [YLZFont medium:14];
        _fromLabel.textColor = YLZColorTitleOne;
        _fromLabel.textAlignment = NSTextAlignmentCenter;
        _fromLabel.text = @"一证通查来了!";
        _fromLabel.numberOfLines = 0;
    }
    return _fromLabel;
}

- (UILabel *)insertLabel {
    if (!_insertLabel) {
        _insertLabel = [UILabel new];
        _insertLabel.font = [YLZFont regular:12];
        _insertLabel.textColor = YLZColorTitleTwo;
        _insertLabel.textAlignment = NSTextAlignmentCenter;
        _insertLabel.text = @"立即点击进入";
        _insertLabel.numberOfLines = 0;
    }
    return _insertLabel;
}

- (UIView *)blackView {
    if (!_blackView) {
        _blackView = [[UIView alloc] init];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.layer.cornerRadius = 5.0;
        _blackView.layer.masksToBounds = YES;
    }
    return _blackView;
}

- (UILabel *)searchLabel {
    if (!_searchLabel) {
        _searchLabel = [UILabel new];
        _searchLabel.font = [YLZFont medium:14];
        _searchLabel.textColor = YLZColorWhite;
        _searchLabel.textAlignment = NSTextAlignmentCenter;
        _searchLabel.text = @"全国移动电话卡\"一证通查\"";
        _searchLabel.numberOfLines = 0;
    }
    return _searchLabel;
}

- (UILabel *)protectLabel {
    if (!_protectLabel) {
        _protectLabel = [UILabel new];
        _protectLabel.font = [YLZFont regular:12];
        _protectLabel.textColor = YLZColorWhite;
        _protectLabel.textAlignment = NSTextAlignmentCenter;
        _protectLabel.text = @"防范诈骗，保护你我";
        _protectLabel.numberOfLines = 0;
    }
    return _protectLabel;
}
  
@end
