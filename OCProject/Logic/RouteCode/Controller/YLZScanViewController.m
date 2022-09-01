//
//  YLZScanViewController.m
//  OCProject
//
//  Created by stone on 2022/9/1.
//

#import "YLZScanView.h"
#import "YLZScanViewController.h"

#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <SVProgressHUD/SVProgressHUD.h>

//国家医保开放平台程序包二维码生成规则：
//opc（国家医保开放平台）+ 17位随机唯一数 + 2位随机数+2位省级行政区划代码+4位扩展码（0000）
//示例：opc 36695090840408960 99 33 0000
//
//医保电子凭证二维码生成规则：
//424（国家医保局标识）+ 17位随机唯一数 + 2位随机数+2位省级行政区划代码+4位扩展码（0000）
//示例：424 36695090840408960 99 33 0000

/** 扫描内容的 W 值 */
#define scanBorderW 0.65 * self.view.frame.size.width
/** 扫描内容的 x 值 */
#define scanBorderX 0.5 * (1 - 0.65) * self.view.frame.size.width
/** 扫描内容的 Y 值 */
#define scanBorderY 0.5 * (self.view.frame.size.height - scanBorderW)

@interface YLZScanViewController ()<YLZScanViewDelegate,UIAlertViewDelegate> {
    
}


@property (nonatomic, strong) YLZScanView *scanView;

@property (nonatomic, strong) HSAQRCodeObtain *codeObtain;

@property (nonatomic, assign) BOOL isTouched;

@end

@implementation YLZScanViewController

#pragma mark - LifeCycle
#pragma mark -

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)dealloc {
    NSLog(@"二维码扫描界面已销毁");
    [self removeScanViewTimer];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isTouched = NO;
    }
    return self;
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
    
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self reStartScan];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    //parent == nil 当父视图为空（iOS8.0之后提供的api,用来管理子视图的生命周期）
    if (!parent) {
        [self removeScanViewTimer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Public Method
#pragma mark -

#pragma mark - Private Method
#pragma mark -

- (void)setUI {
    [self.view addSubview:self.scanView];
    [self.scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    @weakify(self);
    //获取访问相机权限时，弹窗的点击事件获取
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL authos) {
        if (!authos) {
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"" message:@"请在iPhone的“设置-隐私-相机”选项中，允许国家医保服务平台访问你的相机" preferredStyle:  UIAlertControllerStyleAlert];
                [alertView addAction:[UIAlertAction actionWithTitle:@"前往设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                }]];
                [weak_self presentViewController:alertView animated:YES completion:nil];
            });
        }
    }];
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"" message:@"请在iPhone的“设置-隐私-相机”选项中，允许国家医保服务平台访问你的相机" preferredStyle:  UIAlertControllerStyleAlert];
            [alertView addAction:[UIAlertAction actionWithTitle:@"前往设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }]];
            [weak_self presentViewController:alertView animated:YES completion:nil];
        });
    } else {
        [self setupQRCodeScan];
    }
}

- (void)setupQRCodeScan {
    CGSize size = self.view.bounds.size;
    HSAQRCodeObtainConfigure *configure = [HSAQRCodeObtainConfigure QRCodeObtainConfigure];
    configure.sampleBufferDelegate = YES;
    configure.rectOfInterest = CGRectMake(scanBorderY/SCREENHEIGHT,
                                          scanBorderX/size.width,
                                          scanBorderW/size.height,
                                          scanBorderW/size.width);
    [self.codeObtain establishQRCodeObtainScanWithController:self configure:configure];
    [self.codeObtain startRunningWithBefore:^{
    } completion:^{
    }];
    @weakify(self);
    [self.codeObtain setBlockWithQRCodeObtainScanBrightness:^(HSAQRCodeObtain *obtain, CGFloat brightness) {
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        //是否具备闪光灯：
        BOOL result = [captureDevice hasTorch];
        if (result) {
            //是否闪光灯打开：
            if (captureDevice.torchMode == AVCaptureTorchModeOn) {
                weak_self.scanView.flashlightButtonHidden = NO;
                weak_self.scanView.flashlightButtonStr = @"轻触关闭";
            } else {
                weak_self.scanView.flashlightButtonHidden = brightness > 0;
                if (!(brightness > 0)) {
                   weak_self.scanView.flashlightButtonStr = @"轻触点亮";
                }
            }
        } else {
           weak_self.scanView.flashlightButtonHidden = YES;
        }
    }];
    [self.codeObtain setBlockWithQRCodeObtainScanResult:^(HSAQRCodeObtain *obtain, NSString *resultStr) {
        if (resultStr) {
            [weak_self.codeObtain playSoundName:@"scanSound.caf"];
            [weak_self.codeObtain stopRunning];
            [weak_self removeScanViewTimer];
            [weak_self toScanResult:resultStr];
        } else {
            [weak_self.view makeToast:@"扫描失败" duration:1.0 position:CSToastPositionCenter];
        }
    }];
}

- (void)reStartScan {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.codeObtain startRunningWithBefore:^{
        } completion:^{
        }];
        [self.scanView.codeScanView addTimer];
    });
}

- (void)toScanResult:(NSString *)codeStr {
//    YLZLOG(@"扫码成功！！！");
}

- (void)removeScanViewTimer {
    [self.scanView.codeScanView removeTimer];
}

//隐藏底部导航栏:
- (BOOL)hidesBottomBarWhenPushed {
    return (self.navigationController.topViewController == self);
}

#pragma mark - IB-Action
#pragma mark -

#pragma mark - Notice
#pragma mark -

#pragma mark - Delegate
#pragma mark -

- (void)toOpenFlashlight {
    self.isTouched = !self.isTouched;
    if (self.isTouched) {
        [self.codeObtain openFlashlight];
    } else {
        [self.codeObtain closeFlashlight];
    }
}

#pragma mark - lazy load
#pragma mark -

- (YLZScanView *)scanView
{
    if (!_scanView) {
        _scanView = [[YLZScanView alloc] init];
        _scanView.delegate = self; //将YLZScanViewController自己的实例作为委托对象
    }
    return _scanView;
}

- (HSAQRCodeObtain *)codeObtain
{
    if (!_codeObtain) {
        _codeObtain = [HSAQRCodeObtain QRCodeObtain];
    }
    return _codeObtain;
}

@end
