//
//  ViewController.m
//  OCProject
//
//  Created by stone on 2021/5/24.
//

#import "ViewController.h"
#import "YLZKitCategory.h"
#import <MJExtension/MJExtension.h>

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *homeModelArrays;

@property (nonatomic, strong) UIButton *btnOk;

@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) UILabel *productLabel;

@property (nonatomic, strong) UILabel *bottomLabel;

@end

@implementation ViewController

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
    [self setBaseUI:YLZColorWhite withTitleString:@"" withTitleColor:YLZColorWhite withLeftImageViewString:@"" withRightString:@"" withRightColor:YLZColorWhite withRightFontSize:14];
    
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
//    [self.view addSubview:self.btnOk];
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.productLabel];
    [self.view addSubview:self.bottomLabel];
    [self setMas];
}

- (void)setMas {
//    [self.btnOk mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.size.equalTo(@(CGSizeMake(SCREENWIDTH - 64, 40)));
//    }];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-64);
        make.size.equalTo(@(CGSizeMake(64, 64)));
    }];
    [self.productLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(32);
    }];
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-(BottomDangerAreaHeight+16));
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)btnOKClick {
    YLZLOG(@"YYYYYYYYY_____%@",[@{@"homeModel":@"stone"} mj_JSONString]);
//    self.view.backgroundColor = [UIColor redColor];
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
        [_btnOk setTitle:@"我知道" forState:UIControlStateNormal];
        [_btnOk setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
        _btnOk.titleLabel.font = [YLZFont medium:16.f];
        _btnOk.layer.cornerRadius = 20.f;
        _btnOk.layer.masksToBounds = YES;
        _btnOk.layer.borderColor = [YLZColorBlue CGColor];
        _btnOk.layer.borderWidth = 0.5;
//        _btnOk.userInteractionEnabled = NO;
        [_btnOk addTarget:self action:@selector(btnOKClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnOk;
}

- (UIImageView *)iconImageView {
    if(_iconImageView == nil) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = YLZColorLightBlueView;
        _iconImageView.layer.cornerRadius = 4.0;
        _iconImageView.layer.masksToBounds = YES;
    }
    return _iconImageView;
}

- (UILabel *)productLabel {
    if (!_productLabel) {
        _productLabel = [UILabel new];
        _productLabel.font = [YLZFont regular:14];
        _productLabel.textColor = YLZColorTitleOne;
        _productLabel.text = @"易联众（民生）框架";
    }
    return _productLabel;
}

- (UILabel *)bottomLabel {
    if (!_bottomLabel) {
        _bottomLabel = [UILabel new];
        _bottomLabel.font = [YLZFont regular:14];
        _bottomLabel.textColor = YLZColorTitleThree;
        _bottomLabel.text = @"Power By 许久_";
    }
    return _bottomLabel;
}

@end
