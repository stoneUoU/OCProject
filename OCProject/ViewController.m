//
//  ViewController.m
//  OCProject
//
//  Created by stone on 2021/5/24.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *homeModelArrays;

@property (nonatomic, strong) UIButton *btnOk;

@end

@implementation ViewController

#pragma mark - LifeCycle
#pragma mark -

- (void)dealloc
{
    STLog(@"界面销毁");
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
        [_btnOk setTitle:@"我知道了" forState:UIControlStateNormal];
        [_btnOk setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
        _btnOk.titleLabel.font = [YLZFont medium:16.f];
        _btnOk.layer.cornerRadius = 20.f;
        _btnOk.layer.masksToBounds = YES;
        _btnOk.layer.borderColor = [YLZColorBlue CGColor];
        _btnOk.layer.borderWidth = 0.5;
        _btnOk.enabled = NO;
        [_btnOk addTarget:self action:@selector(btnOKClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnOk;
}


@end
