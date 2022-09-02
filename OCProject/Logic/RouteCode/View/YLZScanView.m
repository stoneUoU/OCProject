//
//  YLZScanView.m
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import "YLZScanView.h"
#import "YLZCategory.h"
#import "YLZScanViewController.h"

@interface YLZScanView() {
    
}

@property (nonatomic, strong) UIView *statusView;

@property (nonatomic, strong) UIView *navigationView;

@property (nonatomic, strong) UIButton *backButton;

@property (nonatomic, strong) UIButton *albumButton;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIButton *flashlightButton;

@property (nonatomic, strong) UILabel *flashlightStrLabel;

@end

@implementation YLZScanView

#pragma mark - LifeCycle
#pragma mark -

- (id)init {
    self = [super init ];
    if (self !=nil) {
        [self setUI];
    }
    return self;
}

#pragma mark - Public Method
#pragma mark -

- (void)setFlashlightButtonHidden:(BOOL)flashlightButtonHidden {
    _flashlightButtonHidden = flashlightButtonHidden;
    self.flashlightButton.hidden = flashlightButtonHidden;
    self.flashlightStrLabel.hidden = flashlightButtonHidden;
}

- (void)setFlashlightButtonStr:(NSString *)flashlightButtonStr {
    _flashlightButtonStr = flashlightButtonStr;
    self.flashlightStrLabel.text = flashlightButtonStr;
    [self.flashlightButton setImage:[UIImage imageNamed:[flashlightButtonStr isEqualToString:@"轻触关闭"] ? @"hsa_flashlight_on" : @"hsa_flashlight"] forState:UIControlStateNormal];
}

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    
    [self addSubview:self.codeScanView];
    [self addSubview:self.flashlightStrLabel];
    [self addSubview:self.flashlightButton];
    [self addSubview:self.promptLabel];
    
    self.statusView = [[UIView alloc] init];
    self.statusView.backgroundColor = YLZColorWhite;
    [self addSubview:self.statusView];
    
    self.navigationView = [[UIView alloc] init];
    self.navigationView.backgroundColor = YLZColorWhite;
    [self addSubview:self.navigationView];
    
    self.backButton = [[UIButton alloc] init];
    [self.backButton setImage:[UIImage imageNamed:@"ylz_back"]forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(toBack)forControlEvents:UIControlEventTouchUpInside];
    [self.backButton ylz_fitSizeToButton:CGSizeMake(30,0)];
    [self.navigationView addSubview:self.backButton];
    
    self.albumButton = [[UIButton alloc] init];
    self.albumButton.titleLabel.font = [YLZFont regular:16];
    [self.albumButton setTitle:@"相册" forState:UIControlStateNormal];
    [self.albumButton setTitleColor:YLZColorTitleOne forState:UIControlStateNormal];
    [self.albumButton addTarget:self action:@selector(toAlbum)forControlEvents:UIControlEventTouchUpInside];
    [self.navigationView addSubview:self.albumButton];
    
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"扫描二维码";
    self.titleLabel.font=[YLZFont medium:18];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = YLZColorTitleOne;
    [self.navigationView addSubview:self.titleLabel];
    
    [self setMas];
}

- (void)setMas {
    
    [self.codeScanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(0.5*(SCREENHEIGHT - 0.65 * SCREENWIDTH)+0.65 * SCREENWIDTH + 19);
    }];
    [self.flashlightStrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).offset(-48);
        make.centerX.equalTo(self);
    }];
    [self.flashlightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.flashlightStrLabel.mas_top).offset(-5);
        make.centerX.equalTo(self);
    }];
    [self.statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self);
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(StatusBarHeight);
    }];
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusView.mas_bottom);
        make.left.equalTo(self);
        make.width.mas_equalTo(SCREENWIDTH);
        make.height.mas_equalTo(NavBarHeight);
    }];
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.left.equalTo(self.navigationView.mas_left).offset(0);
        make.height.mas_equalTo(NavBarHeight);
    }];
    [self.albumButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.navigationView);
        make.right.equalTo(self.navigationView.mas_right).offset(-16);
        make.height.mas_equalTo(NavBarHeight);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.navigationView);
    }];
}

#pragma mark - IB-Action
#pragma mark -

- (void)toAlbum {
    
}

- (void)toOpenFlashlight:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(toOpenFlashlight)]) {
        [_delegate toOpenFlashlight];
    }
}

- (void)toTouchForOpenFlashlight:(UITapGestureRecognizer *)recognizer {
    if (_delegate && [_delegate respondsToSelector:@selector(toOpenFlashlight)]) {
        [_delegate toOpenFlashlight];
    }
}

- (void)toBack {
    YLZScanViewController *scanView = (YLZScanViewController *)self.delegate;
    [scanView.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Notice
#pragma mark -

#pragma mark - Delegate
#pragma mark -


#pragma mark - lazy load
#pragma mark -

- (HSAQRCodeScanView *)codeScanView {
    if (!_codeScanView) {
        _codeScanView = [[HSAQRCodeScanView alloc] init];
        _codeScanView.scanImageName = @"hsa_scan_line";
        _codeScanView.scanAnimationStyle = ScanAnimationStyleDefault;
        _codeScanView.cornerLocation = CornerLoactionInside;
        _codeScanView.cornerColor = [UIColor colorWithHexString:@"#3CA0F6"];
        _codeScanView.cornerWidth = 4.0;
    }
    return _codeScanView;
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.backgroundColor = [UIColor clearColor];
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.font = [YLZFont regular:16];
        _promptLabel.textColor = YLZColorWhite;//[[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _promptLabel.text = @"请对准要扫描的二维码/条码";
    }
    return _promptLabel;
}

- (UIButton *)flashlightButton {
    if (!_flashlightButton) {
        _flashlightButton = [[UIButton alloc] init];
        _flashlightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _flashlightButton.hidden = YES;
        [_flashlightButton addTarget:self action:@selector(toOpenFlashlight:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashlightButton;
}

- (UILabel *)flashlightStrLabel {
    if (!_flashlightStrLabel) {
        _flashlightStrLabel = [[UILabel alloc] init];
        _flashlightStrLabel.textAlignment = NSTextAlignmentCenter;
        _flashlightStrLabel.font = [YLZFont regular:14];
        _flashlightStrLabel.hidden = YES;
        _flashlightStrLabel.textColor = [UIColor whiteColor];
        _flashlightStrLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *touchRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toTouchForOpenFlashlight:)];
        [_flashlightStrLabel addGestureRecognizer:touchRecognizer];
    }
    return _flashlightStrLabel;
}

@end


