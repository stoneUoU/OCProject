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
#import "YLZProcessResultViewController.h"
//#import "UIView+YLZCore.h"

@interface YLZProcessSearchViewController ()<UIScrollViewDelegate>
    
@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIView *operateView;

@property (nonatomic, strong) UIView *separatorView;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UIButton *shutButton;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UILabel *logoLabel;

@property (nonatomic, strong) YLZProcessCardView *processCardView;

@property (strong, nonatomic) UILabel *serviceLabel;

@property (strong, nonatomic) UIImageView *leftLineImageView;

@property (strong, nonatomic) UIImageView *rightLineImageView;

@property (strong, nonatomic) UIImageView *logosImageView;

@property (strong, nonatomic) UILabel *telLabel;

@property (strong, nonatomic) UILabel *appLabel;

@property (strong, nonatomic) UIView *bottomView;

@property (strong, nonatomic) UIView *bottomLeftView;

@property (strong, nonatomic) UIView *bottomRightView;

@property (strong, nonatomic) UIImageView *bottomImageView;

@property (strong, nonatomic) UILabel *protectLabel;

@property (strong, nonatomic) UIView *bottomLineView;

@property (strong, nonatomic) UILabel *insertLabel;

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
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.logoImageView];
    [self.scrollView addSubview:self.logoLabel];
    [self.scrollView addSubview:self.processCardView];
    
    [self.scrollView addSubview:self.serviceLabel];
    [self.scrollView addSubview:self.leftLineImageView];
    [self.scrollView addSubview:self.rightLineImageView];
    
    [self.scrollView addSubview:self.logosImageView];
    [self.scrollView addSubview:self.telLabel];
    [self.scrollView addSubview:self.appLabel];
    
    [self.scrollView addSubview:self.bottomView];
    [self.scrollView addSubview:self.bottomLeftView];
    [self.scrollView addSubview:self.bottomRightView];
    [self.bottomLeftView addSubview:self.bottomImageView];
    [self.bottomLeftView addSubview:self.protectLabel];
    [self.bottomRightView addSubview:self.bottomLineView];
    [self.bottomRightView addSubview:self.insertLabel];
    
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
        make.centerX.equalTo(self.scrollView);
        make.top.equalTo(self.scrollView.mas_top).offset(16);
    }];
    [self.logoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView);
        make.top.equalTo(self.logoImageView.mas_bottom).offset(12);
    }];
    [self.processCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.scrollView);
        make.width.equalTo(@(SCREENWIDTH - 32));
        make.top.equalTo(self.logoLabel.mas_bottom).offset(16);
    }];
    [self.serviceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processCardView.mas_bottom).offset(24);
        make.centerX.equalTo(self.scrollView);
    }];
    
    [self.leftLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.serviceLabel.mas_left).offset(-16);
        make.centerY.equalTo(self.serviceLabel);
        make.left.equalTo(self.scrollView.mas_left).offset(16);
        make.height.equalTo(@(0.5));
    }];
    
    [self.rightLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.serviceLabel.mas_right).offset(16);
        make.centerY.equalTo(self.serviceLabel);
        make.right.equalTo(self.scrollView.mas_right).offset(-16);
        make.height.equalTo(@(0.5));
    }];
    
    [self.logosImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.serviceLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self.scrollView);
    }];
    
    [self.telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logosImageView.mas_bottom).offset(12);
        make.centerX.equalTo(self.scrollView);
        make.width.equalTo(@(SCREENWIDTH - 32));
    }];
    
    [self.appLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.telLabel.mas_bottom).offset(12);
        make.centerX.equalTo(self.scrollView);
        make.width.equalTo(@(SCREENWIDTH - 32));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appLabel.mas_bottom).offset(16);
        make.centerX.equalTo(self.scrollView);
        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 32, 72)));
    }];
    [self.bottomLeftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self.bottomView);
        make.width.equalTo(@((SCREENWIDTH - 32)*2/3));
    }];
    [self.bottomRightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(self.bottomView);
        make.width.equalTo(@((SCREENWIDTH - 32)/3));
    }];
    [self.bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomLeftView.mas_top).offset(16);
        make.centerX.equalTo(self.bottomLeftView);
    }];
    [self.protectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.bottomLeftView.mas_bottom).offset(-16);
        make.centerX.equalTo(self.bottomLeftView);
    }];
    
    [self.insertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.bottomRightView);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomRightView.mas_left).offset(12);
        make.centerY.equalTo(self.bottomRightView);
        make.size.equalTo(@(CGSizeMake(0.5, 24)));
    }];
    
    [self.view layoutIfNeeded];
//    [self.processCardView ylz_addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight  withRadii:CGSizeMake(12, 12) viewRect:self.processCardView.bounds];
    self.scrollView.contentSize = CGSizeMake(SCREENWIDTH, CGRectGetMaxY(self.bottomView.frame)+36);
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
//        _processCardView.layer.cornerRadius = 3.0;
//        _processCardView.clipsToBounds = YES;
        _processCardView.layer.cornerRadius = 12;
        _processCardView.layer.shadowColor = [UIColor colorWithRed:56/255.0 green:136/255.0 blue:221/255.0 alpha:0.1].CGColor;
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
                    [YLZProgressHUDHelper showSuccessSvg:@"发送成功"];
                });
            } else {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
                //纯文本模式
                hud.mode = MBProgressHUDModeIndeterminate;
                //设置提示标题
                hud.label.text = @"加载中...";
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hideAnimated:YES];
                    YLZProcessResultViewController *vc = [[YLZProcessResultViewController alloc] init];
                    [weakSelf.navigationController pushViewController:vc animated:YES];
                });
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

- (UIImageView *)logosImageView {
    if (!_logosImageView) {
        _logosImageView = [UIImageView new];
        _logosImageView.image = [UIImage imageNamed:@"ylz_process_product_logos"];
    }
    return _logosImageView;
}

- (UILabel *)telLabel {
    if (!_telLabel) {
        _telLabel = [UILabel new];
        _telLabel.font = [YLZFont regular:12];
        _telLabel.textColor = [UIColor colorWithHexString:@"#3f7aed"];
        _telLabel.textAlignment = NSTextAlignmentCenter;
        NSString *infoString = @"客服热线：10000/ 10086/ 10010/ 10099";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 2.0;
        paragraphStyle.alignment = NSTextAlignmentCenter;
        NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraphStyle, NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)};
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:infoString attributes:dic];
        NSDictionary *attributes = @{NSFontAttributeName:[YLZFont regular:12], NSForegroundColorAttributeName: YLZColorTitleThree};
        [attributeStr addAttributes:attributes range:NSMakeRange(0,5)];
        _telLabel.attributedText = attributeStr;
    }
    return _telLabel;
}

- (UILabel *)appLabel {
    if (!_appLabel) {
        _appLabel = [UILabel new];
        _appLabel.font = [YLZFont regular:12];
        _appLabel.textColor = [UIColor colorWithHexString:@"#3f7aed"];
        _appLabel.textAlignment = NSTextAlignmentCenter;
        _appLabel.text = @"使用\"通信行程卡\"小程序或手机APP，不用每次输验证码";
        _appLabel.numberOfLines = 0;
    }
    return _appLabel;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor colorWithHexString:@"#5f87ed"];
        _bottomView.layer.cornerRadius = 4.0;
        _bottomView.layer.masksToBounds = YES;
        _bottomView.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
            YLZLOG(@"AAAA");
        }];
        [_bottomView addGestureRecognizer:ges];
    }
    return _bottomView;
}

- (UIView *)bottomLeftView {
    if (!_bottomLeftView) {
        _bottomLeftView = [[UIView alloc] init];
//        _bottomLeftView.backgroundColor = YLZColorRed;
    }
    return _bottomLeftView;
}

- (UIView *)bottomRightView {
    if (!_bottomRightView) {
        _bottomRightView = [[UIView alloc] init];
//        _bottomRightView.backgroundColor = YLZColorBlue;
    }
    return _bottomRightView;
}

- (UIImageView *)bottomImageView {
    if (!_bottomImageView) {
        _bottomImageView = [UIImageView new];
        _bottomImageView.image = [UIImage imageNamed:@"ylz_process_bottom_tip"];
    }
    return _bottomImageView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = [UIColor colorWithHexString:@"0xcecece"];
    }
    return _bottomLineView;
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
  
- (UILabel *)insertLabel {
    if (!_insertLabel) {
        _insertLabel = [UILabel new];
        _insertLabel.font = [YLZFont regular:12];
        _insertLabel.textColor = YLZColorWhite;
        _insertLabel.textAlignment = NSTextAlignmentCenter;
        _insertLabel.text = @"点击进入";
        _insertLabel.numberOfLines = 0;
    }
    return _insertLabel;
}
  
@end
